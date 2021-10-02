<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Store extends CI_Controller {

    public function index() {
        $data = array();
        $data['title'] = 'E-Captains';
        $data['all_categories'] = $this->Store_model->select_categories();
        $data['all_subcategories'] = $this->Store_model->select_subcategories();
        $data['all_subcategory_items'] = $this->Store_model->select_subcategory_items();
        $data['new_arrivals'] = $this->Store_model->select_new_arrivals();
        $data['best_sellers'] = $this->Store_model->select_best_sellers();
        $data['all_sliders'] = $this->Super_admin_model->select_all_slider();        
        $data['all_banners'] = $this->Super_admin_model->select_all_banner();
        $data['home'] = $this->load->view('store/home', $data, true);
        $this->load->view('store/master', $data);
    }
    
    public function add_to_cart($product_id)
    {
        $product_info = $this->Store_model->select_product_for_cart($product_id);   
        $data = array(
            'id' => $product_info->pk_product_id,
            'image' => $product_info->product_image_thumb,
            'name' => $product_info->product_name,
            'qty' => 1,
            'price' =>$product_info->product_price,
        );
        $this->cart->insert($data);
        $this->load->view('store/cartTotal');
    }
    
    public function update_cart()
    {
        $qty = $this->input->post('product_quantity', true);
        $rowid = $this->input->post('rowid', true);
        $data = array(
            'rowid' => $rowid,
            'qty' => $qty
        );
        $this->cart->update($data);
        redirect('store/shopping_cart');
    }
    
    public function remove($rowid)
    {
        $data = array(
            'rowid' => $rowid,
            'qty' => '0'
        );
        $this->cart->update($data);
        redirect('store/shopping_cart');
    }
    
    public function checkout() {
        $data = array();
        $data['title'] = 'E-Captains';
        $data['all_categories'] = $this->Store_model->select_categories();
        $data['all_subcategories'] = $this->Store_model->select_subcategories();
        $data['all_subcategory_items'] = $this->Store_model->select_subcategory_items();
        $data['home'] = $this->load->view('store/shipping_form', $data, true);
        $this->load->view('store/master', $data);
    }
    
    public function shopping_cart() {
        $data = array();
        $data['title'] = 'E-Captains';
        $data['all_categories'] = $this->Store_model->select_categories();
        $data['all_subcategories'] = $this->Store_model->select_subcategories();
        $data['all_subcategory_items'] = $this->Store_model->select_subcategory_items();
        $data['home'] = $this->load->view('store/cart_view', $data, true);
        $this->load->view('store/master', $data);
    }
    
    public function register() {
        $data = array();
        $data['title'] = 'Register';
        $data['all_categories'] = $this->Store_model->select_categories();
        $data['all_subcategories'] = $this->Store_model->select_subcategories();
        $data['all_subcategory_items'] = $this->Store_model->select_subcategory_items();
        $data['home'] = $this->load->view('store/customer_signup', $data, true);
        $this->load->view('store/master', $data);
    }
    
    public function save_customer() {
        $this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email|is_unique[tbl_users.user_email]');
        $this->form_validation->set_rules('mobile', 'Mobile', 'trim|required|numeric|exact_length[11]|is_unique[tbl_users.user_mobile]');
        if ($this->form_validation->run() == FALSE) {
            $data = array();
            $data['title'] = 'Register';
            $data['all_categories'] = $this->Store_model->select_categories();
            $data['all_subcategories'] = $this->Store_model->select_subcategories();
            $data['all_subcategory_items'] = $this->Store_model->select_subcategory_items();
            $data['home'] = $this->load->view('store/customer_signup', $data, true);
            $this->load->view('store/master', $data);
        } else {
            $data = array();
            $data['user_fullname'] = $this->input->post('name', true);
            if($_FILES['profile_picture']['tmp_name']){
                /* Initialize Image Library */
                $config['upload_path']          = 'media_library/images/user_images/';
                $config['allowed_types']        = 'gif|jpg|png|jpeg';
                $config['max_size'] = 51200;
                $config['max_width'] = 5000;
                $config['max_height'] = 5000;
                $config['remove_spaces'] = TRUE;
                $config['encrypt_name'] = TRUE;
                /* End of Initialize Image Library */
                $this->load->library('upload', $config);
                /* Start Image Upload */
                if (!$this->upload->do_upload('profile_picture'))
                {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    redirect('super_admin/add_customer');
                }
                else
                {
                    $data['user_image'] = $this->upload->data('file_name');
                }
                /* End of Image Upload */
            }
            $data['user_email'] = $this->input->post('email', true);
            $data['user_mobile'] = $this->input->post('mobile', true);
            $data['user_password'] = $this->input->post('password', true);
            $data['user_address'] = $this->input->post('address', true);
            $data['user_type'] = 3;
            $data['created_at'] = date("Y-m-d H:i:s");
            $data['created_by'] = $this->session->userdata('admin_id');
            $this->db->insert('tbl_users', $data);
            $this->session->set_flashdata('save_customer', 'Customer Saved!');
            redirect('store/register');
        }
    }
    
    public function product_details($product_id) {
        $data = array();
        $data['title'] = 'Register';
        $data['all_categories'] = $this->Store_model->select_categories();
        $data['all_subcategories'] = $this->Store_model->select_subcategories();
        $data['all_subcategory_items'] = $this->Store_model->select_subcategory_items();
        $data['best_sellers'] = $this->Store_model->select_best_sellers();
        $data['product_details'] = $this->Store_model->select_product_details_by_id($product_id);
        $data['home'] = $this->load->view('store/product_details', $data, true);
        $this->load->view('store/master', $data);
    }
    
    public function product_listing($category_id) {
        $data = array();
        $data['title'] = 'Register';
        $data['all_categories'] = $this->Store_model->select_categories();
        $data['all_subcategories'] = $this->Store_model->select_subcategories();
        $data['all_subcategory_items'] = $this->Store_model->select_subcategory_items();
        $data['product_listing'] = $this->db->where('fk_subcategory_item_id', $category_id)->get('tbl_products')->result();
        $data['category_name'] = $this->db->where('pk_category_id', $data['product_listing'][0]->fk_subcategory_item_id)->get('tbl_categories')->row();
        $data['home'] = $this->load->view('store/product_listing', $data, true);
        $this->load->view('store/master', $data);
    }
    
    public function category($category_id) {
        $data = array();
        $data['title'] = 'Category';
        $data['all_categories'] = $this->Store_model->select_categories();
        $data['all_subcategories'] = $this->Store_model->select_subcategories();
        $data['all_subcategory_items'] = $this->Store_model->select_subcategory_items();
        $data['product_listing'] = $this->db->where('fk_subcategory_id', $category_id)->get('tbl_products')->result();
        $data['category_name'] = $this->db->where('pk_category_id', $data['product_listing'][0]->fk_subcategory_id)->get('tbl_categories')->row();
        $data['home'] = $this->load->view('store/product_listing', $data, true);
        $this->load->view('store/master', $data);
    }
}