<?php

class Super_admin_model extends CI_Model {
    
    public function count_notification_for_the_user() {
        $this->db->where('view_status', 0);
        $this->db->from("tbl_notifications");
        return $this->db->count_all_results();
    }
    
    public function select_notification_for_the_user() {
        $this->db->where('view_status', 0);
        $this->db->order_by('pk_notification_id', 'DESC');
        $this->db->limit(5);
        $table_data = $this->db->get('tbl_notifications');
        return $table_data;
    }
    
    public function select_all_slider() {
        $this->db->where('setting_type', 1);
        $table_data = $this->db->get('tbl_settings')->result();
        return $table_data;
    }
    
    public function select_all_banner() {
        $this->db->where('setting_type', 2);
        $table_data = $this->db->get('tbl_settings')->result();
        return $table_data;
    }
}