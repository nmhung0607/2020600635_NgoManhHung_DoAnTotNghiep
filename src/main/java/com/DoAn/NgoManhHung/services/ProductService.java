package com.DoAn.NgoManhHung.services;

import java.io.File;

import org.springframework.util.StringUtils;
import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.DoAn.NgoManhHung.model.ProductImages;
import com.DoAn.NgoManhHung.model.Products;
import com.github.slugify.Slugify;
import com.DoAn.NgoManhHung.dto.ProductSearchModel;

@Service
public class ProductService extends BaseService<Products>{
	@Autowired
	private ProductImagesService productImagesService ;
	@Override
	protected Class<Products> clazz() {
		return Products.class;
	}
	/**
	 * dùng để kiểm tra xem admin có upload ảnh product hay không
	 * @param images
	 * @return
	 */
	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;

		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;

		return false;
	}

	/**
	 * dùng để kiểm tra xem admin có upload ảnh product hay không
	 * @param image
	 * @return
	 */
	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}
	
	/**
	 * Chú ý: trong các hàm ở tầng Service dùng để thêm mới hoặc xóa hoặc chỉnh sửa cần thêm @Transactional.
	 * Thêm mới sản phẩm.
	 * @param p
	 * @param productAvatar
	 * @param productPictures
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@Transactional
	public Products add(Products p, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws IllegalStateException, IOException {

		// kiểm tra xem admin có đẩy avatar lên không ???
		if (!isEmptyUploadFile(productAvatar)) { // có đẩy avatar lên.
			
			// tạo đường dẫn tới folder chứa avatar
			String pathToAvatar = "C:/upload/product/avatar/" + productAvatar.getOriginalFilename();

			// lưu avatar vào đường dẫn trên
			productAvatar.transferTo(new File(pathToAvatar));

			p.setAvatar("product/avatar/" + productAvatar.getOriginalFilename());
		}

		// có đẩy pictures(product_images) ???
		if (!isEmptyUploadFile(productPictures)) { // có đẩy pictures lên.

			// nếu admin đẩy lên thì duyệt tất cả file đẩy lên và lưu trên server
			for (MultipartFile pic : productPictures) {
				String fileName = getUniqueUploadFileName(productAvatar.getOriginalFilename());
				// lưu ảnh admin đẩy lên vào server
				pic.transferTo(new File("C:/upload/product/pictures/" + pic.getOriginalFilename()));

				// tạo mới 1 bản ghi product_images
				ProductImages pi = new ProductImages();
				pi.setPath("product/pictures/" + pic.getOriginalFilename());
				pi.setTitle(pic.getOriginalFilename());

				p.addProductImages(pi);
			}
		}

		// tạo seo
		p.setSeo(new Slugify().slugify(p.getTitle() + "-" + System.currentTimeMillis()));
		
		// lưu vào database
		return super.saveOrUpdate(p);
		
	}
	
	@Transactional
	public Products update(Products p, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws IllegalStateException, IOException {

		// lấy thông tin cũ của product theo id
		Products productInDb = super.getById(p.getId());

		// có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
		if (!isEmptyUploadFile(productAvatar)) {
			// xóa avatar trong folder lên
			new File("C:/upload/product/avatar" + productInDb.getAvatar()).delete();
			String fileName = getUniqueUploadFileName(productAvatar.getOriginalFilename());
			// sử dụng avatar mới
			productAvatar.transferTo(new File("C:/upload/product/avatar/" + productAvatar.getOriginalFilename()));
			p.setAvatar("product/avatar/" + productAvatar.getOriginalFilename());
		} 
		else {
			// sử dụng lại avartar cũ
			p.setAvatar(productInDb.getAvatar());
		}

		// có đẩy pictures ???
		if (!isEmptyUploadFile(productPictures)) {

			// xóa pictures cũ
			if (productInDb.getProductImages() != null && productInDb.getProductImages().size() > 0) {
				for (ProductImages opi : productInDb.getProductImages()) {
					// xóa avatar trong folder lên
					new File("C:/upload/product/pictures" + opi.getPath()).delete();

					// xóa dữ liệu trong database
					productImagesService.delete(opi);
				}
			}

			// thêm pictures mới
			for (MultipartFile pic : productPictures) {
				pic.transferTo(new File("C:/upload/product/pictures/" + pic.getOriginalFilename()));

				ProductImages pi = new ProductImages();
				pi.setPath("product/pictures/" + pic.getOriginalFilename());
				pi.setTitle(pic.getOriginalFilename());

				p.addProductImages(pi);
			}
		}

		//tạo seo
		p.setSeo(new Slugify().slugify(p.getTitle() + "-" + System.currentTimeMillis()));
		
		// lưu vào database
		return super.saveOrUpdate(p);
	}
	private String getUniqueUploadFileName(String fileName) {
		String[] splitFileName = fileName.split("\\.");
		return splitFileName[0] + System.currentTimeMillis() + "." + splitFileName[1];
	}
	public PagerData<Products>  search(ProductSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_products p WHERE p.status=1";

		if (searchModel != null) {
			
			// tìm kiếm theo category
			if(searchModel.getCategoryId()!= null && searchModel.getCategoryId()>0){
				sql += " and category_id = " + searchModel.getCategoryId();
			
			}
		
			// tìm theo seo
//			if (!StringUtils.isEmpty(searchModel.seo)) {
//				sql += " and p.seo = '" + searchModel.seo + "'";
//			}

			// tìm kiếm sản phẩm hot
//			if (searchModel.isHot != null) {
//				sql += " and p.is_hot = '" + searchModel.seo + "'";
//			}
			
			// tìm kiếm theo title và description
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (p.title like '%" + searchModel.getKeyword() + "%'" + 
						     " or p.details_des like '%" + searchModel.getKeyword() + "%'" + 
						     " or p.short_des like '%" + searchModel.getKeyword() + "%')";
			}
		}	
		return getEntitiesByNativeSQL(sql,searchModel.getPage());
		
	}
	public PagerData<Products>  sort(ProductSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_products p WHERE p.status=1";

		if (searchModel != null) {
			// tìm kiếm theo title và description
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (p.title like '%" + searchModel.getKeyword() + "%'" + 
						     " or p.details_des like '%" + searchModel.getKeyword() + "%'" + 
						     " or p.short_des like '%" + searchModel.getKeyword() + "%')";
			}
			if (searchModel.getMinValue() != null && searchModel.getMaxValue() != null) {
	            sql += " AND (p.price_sale BETWEEN " + searchModel.getMinValue() + " AND " + searchModel.getMaxValue() + ")";
	        } else if (searchModel.getMinValue() != null) {
	            sql += " AND p.price_sale >= " + searchModel.getMinValue();
	        } else if (searchModel.getMaxValue() != null) {
	            sql += " AND p.price_sale <= " + searchModel.getMaxValue();
	        }
			if (!StringUtils.isEmpty(searchModel.getSort_by())) {
				if(searchModel.getSort_by().equals("giathap")) {
					sql+=" ORDER BY p.price_sale DESC";
				}
				else if(searchModel.getSort_by().equals("giacao")) {
					sql+=" ORDER BY p.price_sale ASC";
				}
			}
		}	
		return getEntitiesByNativeSQL(sql,searchModel.getPage());
		
	}
	public PagerData<Products>  searchCategory(ProductSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_products p WHERE p.status=1";

		if (searchModel.getCategoryName()!= null) {
			// tìm kiếm theo title và description
			sql += " and category_id=(select id from  tbl_category where name = '" + searchModel.getCategoryId() + "'";
		}	
		return getEntitiesByNativeSQL(sql,searchModel.getPage());
		
	}
	public PagerData<Products>  searchbyCategory(ProductSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_products p WHERE p.status=1";

		if (searchModel.getCategoryId()!= null) {
			// tìm kiếm theo title và description
			sql += " and category_id = '" + searchModel.getCategoryId() + "'";
		}	
		if (!StringUtils.isEmpty(searchModel.getKeyword())) {
			sql += " and (p.title like '%" + searchModel.getKeyword() + "%'" + 
					     " or p.details_des like '%" + searchModel.getKeyword() + "%'" + 
					     " or p.short_des like '%" + searchModel.getKeyword() + "%')";
		}
		if (!StringUtils.isEmpty(searchModel.getSort_by())) {
			if(searchModel.getSort_by().equals("giathap")) {
				sql+=" ORDER BY p.price_sale DESC";
			}
			else if(searchModel.getSort_by().equals("giacao")) {
				sql+=" ORDER BY p.price_sale ASC";
			}
		}
		return getEntitiesByNativeSQL(sql,searchModel.getPage());
		
	}
}
