<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 *
 * Controller Konsentrasi
 *
 * This controller for ...
 *
 * @package   CodeIgniter
 * @category  Controller CI
 * @author    Jeff Maruli <jefrimaruli@gmail.coms>
 * @link      https://github.com/xietsunzao/
 * @param     ...
 * @return    ...
 *
 */

class Konsentrasi extends CI_Controller
{
    /**
     * __construct.
     *
     * @author	Jeff Maruli <jefrimaruli@gmail.com>
     * @since	v0.0.1
     * @version	v1.0.0	Monday, November 18th, 2019.
     * @access	public
     * @return	void
     */
    public function __construct()
    {
        parent::__construct();
        if (!$this->ion_auth->logged_in()) {
            redirect('auth');
        }
        $this->load->model('Konsentrasi_model', 'ksi');
    }

    /**
     * index.
     *
     * @author	Jeff Maruli <jefrimaruli@gmail.com>
     * @since	v0.0.1
     * @version	v1.0.0	Wednesday, November 20th, 2019.
     * @access	public
     * @return	void
     */
    public function index()
    {
        /**
         * @var		string	$title
         */
        $title = 'Data Kosentrasi';
        /**
         * @var		mixed	$this->ksi->get_data()
         */
        $loaddata = $this->ksi->get_data();
        /**
         * @var		mixed	$data
         */
        $data = array(
            'title' => $title,
            'konsentrasi' => $loaddata,
        );
        $this->template->load('template/template_v', 'konsentrasi/konsentrasi_v', $data);
    }

    /**
     * detail.
     *
     * @author	Jeff Maruli <jefrimaruli@gmail.com>
     * @since	v0.0.1
     * @version	v1.0.0	Sunday, November 24th, 2019.
     * @access	public
     * @param	mixed	$id	Default: NULL
     * @return	void
     */
    public function detail($id = NULL)
    {
        /**
         * @var		mixed	$this->uri->segment(3)
         */
        $id = $this->uri->segment(3);
        /**
         * @var		mixed	$this->ksi->get_row($id)
         */
        $get_row = $this->ksi->get_row($id);
        if ($get_row->num_rows() > 0) {
            // GET ROW
            /**
             * GET ROW
             *
             * @var		mixed	$get_row->row()
             */
            $row = $get_row->row();
            /**
             * @var		mixed	$get_row->result()
             */
            $konsentrasi = $get_row->result();
            /**
             * @var		mixed	$row->id_mahasiswa
             */
            $id_mahasiswa = $row->id_mahasiswa;
            /**
             * @var		mixed	$row->nim
             */
            $nim = $row->nim;
            /**
             * @var		mixed	$row->nama_mhs
             */
            $nama_mhs = $row->nama_mhs;
            /**
             * @var		mixed	$row->email
             */
            $email = $row->email;
            /**
             * @var		mixed	$row->no_telp
             */
            $no_telp = $row->no_telp;
            /**
             * @var		mixed	$row->id_prodi
             */
            $id_prodi = $row->id_prodi;
            /**
             * @var		mixed	$row->id_konsentrasi
             */
            $id_konsentrasi = $row->id_konsentrasi;
            /**
             * @var		mixed	$row->id_jenjang
             */
            $id_jenjang = $row->id_jenjang;
            /**
             * @var		mixed	$row->nama_prodi
             */
            $nama_prodi = $row->nama_prodi;
            /**
             * @var		mixed	$row->nama_konsentrasi
             */
            $nama_konsentrasi = $row->nama_konsentrasi;
            /**
             * @var		mixed	$row->nama_jenjang
             */
            $nama_jenjang = $row->nama_jenjang;
            /**
             * @var		mixed	$row->kode_prodi
             */
            $kode_prodi = $row->kode_prodi;
            /**
             * @var		mixed	$row->kode_konsentrasi
             */
            $kode_konsentrasi = $row->kode_konsentrasi;
            /**
             * @var		mixed	$row->kode_jenjang
             */
            $kode_jenjang = $row->kode_jenjang;

            /**
             * @var		string	$title
             */
            $title = "Detail {$nama_konsentrasi}";
            /**
             * @var		mixed	$data
             */
            $data = array(
                'id_mahasiswa' => $id_mahasiswa,
                'nim' => $nim,
                'nama_mhs' => $nama_mhs,
                'email' => $email,
                'no_telp' => $no_telp,
                'id_prodi' => $id_prodi,
                'id_konsentrasi' => $id_konsentrasi,
                'id_jenjang' => $id_jenjang,
                'nama_prodi' => $nama_prodi,
                'nama_konsentrasi' => $nama_konsentrasi,
                'nama_jenjang' => $nama_jenjang,
                'kode_prodi' => $kode_prodi,
                'kode_konsentrasi' => $kode_konsentrasi,
                'kode_jenjang' => $kode_jenjang,
                'title' => $title,
                'konsentrasi' => $konsentrasi,
            );
            $this->template->load('template/template_v', 'konsentrasi/konsentrasi_d', $data);
        } else {
            /**
             * @var		mixed	$this->session->set_flashdata('warning'
             */ /**
             * @var		mixed	!')
             */
            $this->session->set_flashdata('warning', 'Data masih kosong!');
            /**
             * @var		mixed	redirect('prodi')
             */
            redirect('konsentrasi');
        }
    }
}



/* End of file Konsentrasi.php */
/* Location: ./application/controllers/Konsentrasi.php */