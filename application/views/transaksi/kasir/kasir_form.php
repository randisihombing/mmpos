<section class="content-header">
  <h1>
    Sistem
    <small>Penjualan</small>
  </h1>
  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-dashboard"></i> Transaksi</a></li>
    <li class="active">Kasir</li>
  </ol>
</section>

<section class="content">
    <div class="row">
        <div class="col-lg-4">
            <div class="box box-widget">
                <div class="box-body">
                    <table width="100%">
                        <tr>
                            <td style="vertical-align:top">
                                <label for="date">Date</label>
                            </td>
                            <td>
                                <div class="form-group">
                                    <input type="date" id="date" value="<?= date('Y-m-d') ?>" class="form-control">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:top; width:30%">
                                <label for="user">Kasir</label>
                            </td>
                            <td>
                                <div class="form-group">
                                    <input type="text" id="user" value="<?= $this->fungsi->user_login()->name;?>" class="form-control" readonly>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:top">
                                <label for="customer">Customer</label>
                            </td>
                            <td>
                                <div>
                                    <select id="customer" class="form-control">
                                        <?php foreach($customer as $c => $value){
                                            echo '<option value="'.$value->customer_id.'">'.$value->name.'</option>';
                                        } ?>
                                    </select>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="box box-widget">
                <div class="box-body">
                    <table width="100%">
                        <tr>
                            <td style="vertical-align:top; width:30%">
                                <label for="barcode">Kode Item</label>
                            </td>
                            <td>
                                <div class="form-group input-group">
                                    <input type="hidden" id="item_id">
                                    <input type="hidden" id="price">
                                    <input type="hidden" id="stock">
                                    <input type="hidden" id="qty_cart">
                                    <input type="text" id="barcode" class="form-control" autofocus readonly>
                                    <span class="input-group-btn">
                                        <button type="button" class="btn btn-info btn-flat" data-toggle="modal" data-target="#modal-item">
                                        <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:top">
                                <label for="qty">Quantity</label>
                            </td>
                            <td>
                                <div class="form-group">
                                    <input type="number" id="qty" value="1" min="0" class="form-control" required>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <div>
                                    <button type="button" id="add_cart" class="btn btn-primary">
                                        <i class="fa fa-cart-plus"> Tambah</i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="box box-widget">
                <div class="box-body">
                    <div align="right">
                        <h4>Invoice <b><span id="invoice"><?= $invoice ?></span></b></h4>
                        <h1><b><span id="grand_total2" style="font-size:50pt">0</span></b></h1>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="box box-widget">
                <div class="box-body table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Kode Item</th>
                                <th>Nama Produk</th>
                                <th>Harga</th>
                                <th>Qty</th>
                                <th width="10%">Diskon</th>
                                <th width="15%">Total</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody id="cart-table">
							<?php $this->view('transaksi/kasir/cart_data')?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-3">
            <div class="box box-widget">
                <div class="box-body">
                    <table width="100%">
                        <tr>
                            <td style="vertical-align:top; width:30%">
                                <label for="sub_total">Sub Total</label>
                            </td>
                            <td>
                                <div class="form-group">
                                    <input type="number" id="sub_total" value="" class="form-control" readonly>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:top">
                                <label for="diskon">Diskon</label>
                            </td>
                            <td>
                                <div class="form-group">
                                    <input type="number" id="diskon" value="0" min="0" class="form-control">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:top">
                                <label for="">Grand Total</label>
                            </td>
                            <td>
                                <div class="form-group">
                                    <input type="number" id="grand_total" class="form-control" readonly>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="box box-widget">
                <div class="box-body">
                    <table width="100%">
                        <tr>
                            <td style="vertical-align:top; width:30%">
                                <label for="cash">Cash</label>
                            </td>
                            <td>
                                <div class="form-group">
                                    <input type="number" id="cash" value="0" min="0" class="form-control"> 
                                </div>                        
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:top ">
                                <label for="change"> Change</label>
                            </td>
                            <td>
                                <div class="form-group">
                                    <input type="number" id="change" class="form-control" readonly>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:top ">
                                <label for="no_meja"> No Meja</label>
                            </td>
                            <td>
                                <div class="form-group">
                                    <input type="text" id="no_meja" name="no_meja" class="form-control">
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="box box-widget">
                <div class="box-body">
                    <table width="100%">
                        <tr>
                            <td style="vertical-align:top; width:30%">
                                <label for="note">Note</label>
                            </td>
                            <td>
                                <div class="form-group">
                                    <textarea id="note" rows="3" class=form-control></textarea>
                                </div>                        
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div>
                <button id="batal_pembelian" class="btn btn-flat btn-warning">
                    <i class="fa fa-refresh"> Cancel</i>
                </button><br><br>
                <button id="proses_pembelian" class="btn btn-flat btn-lg btn-success">
                    <i class="fa fa-paper-plane-o"> Proses Pembayaran</i>
                </button>
            </div>
        </div>
    </div>
</section>

<!-- Modal Tambah Barang -->
<div class="modal fade" id="modal-item">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title" >Masukan Item</h4>
      </div>
      <div class="modal-body table-responsive">
        <table class="table table-bordered tabel-striped" id="table1">
            <thead>
                <tr>
                  <th>Kode Item</th>
                  <th>Nama</th>
                  <th>Unit</th>
                  <th>Harga</th>
                  <th>Stock</th>
                  <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach($item as $i => $data){ ?>
                <tr>
                    <td><?= $data->barcode?></td>
                    <td><?= $data->name ?></td>
                    <td><?= $data->unit_name?></td>
                    <td class="text-right"><?= indo_currency($data->price)?></td>
                    <td class="text-right"><?= $data->stock?></td>
                    <td class="text-right">
                      <button class="btn btn-xs btn-info" id="select" 
                      data-id="<?=$data->item_id?>"
                      data-barcode="<?=$data->barcode?>"
                      data-price="<?=$data->price?>"
                      data-stock="<?=$data->stock?>">
                        <i class="fa fa-check"> Pilih</i>
                      </button>
                    </td>
                </tr>
                <?php }?>
            </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<!-- Modal Ubah Barang -->
<div class="modal fade" id="modal-item-edit">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title" >Update Item</h4>
      </div>
      <div class="modal-body">
				<input type="hidden" id="cartid_item">
				<div class="form-group">
					<label for="">Produk Item</label>
					<div class="row">
						<div class="col-md-5">
									<input type="text" id="barcode_item" class="form-control" readonly>
						</div>
						<div class="col-md-7">
									<input type="text" id="produk_item" class="form-control" readonly>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="">Harga</label>
					<input type="number" id="harga_item" min="1000" class="form-control" readonly>
				</div>
				<div class="form-group">
                    <div class="row">
                        <div class="col-md-7">
                            <label for="">Qty</label>
                            <input type="number" id="qty_item" min="1" class="form-control">
                        </div>
                        <div class="col-md-5">
                            <label for="">Stock</label>
                            <input type="number" id="stock_item" class="form-control" readonly>
                        </div>
                    </div>
				</div>
				<div class="form-group">
					<label for="">Total Harga Sebelum Diskon</label>
					<input type="number" id="total_before" class="form-control" readonly>
				</div>
				<div class="form-group">
					<label for="">Diskon Per Item</label>
					<input type="number" id="discount_item" min="0" class="form-control">
				</div>
				<div class="form-group">
					<label for="">Total Harga Setelah Diskon</label>
					<input type="number" id="total_item" class="form-control" readonly>
				</div>
				<div class="modal-footer">
					<div class="pull-right">
						<button type="button" id="edit_cart" class="btn btn-flat btn-success">
						<i class="fa fa-paper-plane"> Save</i>
						</button>
					</div>
				</div>

      </div>
    </div>
  </div>
</div>

<script src="<?= base_url('assets/')?>dist/js/jquery-1.11.1.min.js"></script>
<script>
  $(document).on('click','#select', function(){
		$('#item_id').val($(this).data('id'))
		$('#barcode').val($(this).data('barcode'))
		$('#price').val($(this).data('price'))
		$('#stock').val($(this).data('stock'))
        $('#modal-item').modal('hide')
        
        get_cart_qty($(this).data('barcode'))
  })

    function get_cart_qty(barcode){
        $('#cart-table tr').each(function(){
            var qty_cart = $("#cart-table td.barcode:contains('"+barcode+"')").parent().find("td").eq(4).html()
            if(qty_cart != null){
                $('#qty_cart').val(qty_cart)
            }else(
                $('#qty_cart').val(0)
            )
        })
    }

	$(document).on('click','#add_cart', function(){
		var item_id = $('#item_id').val()
		var price = $('#price').val()
		var stock = $('#stock').val()
        var qty = $('#qty').val()
        var qty_cart = $('#qty_cart').val()

		if(item_id == ''){
			alert ('Product Belum Dipilih')
			$('#barcode').focus()
		}else if(stock < 1 || parseInt(stock) < (parseInt(qty_cart) + parseInt(qty)) ){
			alert('Stock Tidak Mencukupi')
			$('#qty').focus('')
        }else if(qty < 1){
            alert('Jumlah Barang Minimal 1')
            $('#qty').focus('')
		}else{
			$.ajax({
				type:'POST',
				url: '<?= site_url('kasir/proses')?>',
				data: {'add_cart' : true, 'item_id' : item_id, 'price' : price, 'qty' : qty},
				dataType: 'json',
				success: function(result){
					if(result.success == true){
						$('#cart-table').load('<?=site_url('kasir/cart_data')?>', function(){
							calculate()
						})
						$('#item_id').val('')
						$('#barcode').val('')
						$('#qty').val(1)
						$('#barcode').focus('')
					}else{
						alert('Gagal Tambah Item Ke Keranjang')
					}
				}
			})
		}
	})

	$(document).on('click','#del_cart', function(){
		if(confirm('Apakah Anda Yakin ?')){
			var cart_id = $(this).data('cartid')
			$.ajax({
				type :'POST',
				url  : '<?= site_url('kasir/cart_del')?>',
				data : {'cart_id' : cart_id},
				dataType: 'json',
				success: function(result){
					if(result.success == true){
						$('#cart-table').load('<?=site_url('kasir/cart_data')?>', function(){
							calculate()
						})
					}else{
						alert('Gagal Hapus Item')
					}
				}
			})
		}
	})

	$(document).on('click','#update_cart', function(){
		$('#cartid_item').val($(this).data('cartid'))
		$('#barcode_item').val($(this).data('barcode'))
        $('#produk_item').val($(this).data('product'))
        $('#stock_item').val($(this).data('stock'))
		$('#harga_item').val($(this).data('price'))
		$('#qty_item').val($(this).data('qty'))
		$('#total_before').val($(this).data('price') * $(this).data('qty'))
		$('#discount_item').val($(this).data('discount'))
		$('#total_item').val($(this).data('total'))
  })

	function count_edit_modal(){
		var price = $('#harga_item').val()
		var qty = $('#qty_item').val()
		var discount = $('#discount_item').val()

		total_before = price * qty
		$('#total_before').val(total_before)

		total = (price - discount) * qty
		$('#total_item').val(total)

		if(discount == ''){
			$('#discount_item').val(0)
		}
	}

	$(document).on('keyup mouseup', '#harga_item, #qty_item, #discount_item', function(){
		count_edit_modal()
	})

	$(document).on('click','#edit_cart', function(){
		var cart_id = $('#cartid_item').val()
		var price = $('#harga_item').val()
		var qty = $('#qty_item').val()
		var discount = $('#discount_item').val()
        var total = $('#total_item').val()
        var stock = $('#stock_item').val()

		if(price == '' || price < 1 ){
			alert ('Harga Tidak Boleh Kosong')
			$('#harga_item').focus()
		}else if(qty == '' || qty < 1 ){
			alert('Jumlah Barang Minimal 1')
			$('#qty_item').focus('')
		}else if(parseInt(qty) > parseInt(stock)){
			alert('Stock Tidak Mencukupi')
			$('#qty_item').focus('')
		}else{
			$.ajax({
				type :'POST',
				url  : '<?= site_url('kasir/proses')?>',
				data : {'edit_cart' : true, 'cart_id' : cart_id, 'price' : price, 'qty' : qty, 'discount' : discount, 'total' : total},
				dataType: 'json',
				success: function(result){
					if(result.success == true){
						$('#cart-table').load('<?=site_url('kasir/cart_data')?>', function(){
							calculate()
						})
						alert('Data Keranjang Berhasil Diubah')
						$('#modal-item-edit').modal('hide')
					}else{
                        alert('Data Keranjang Tidak Terubah')
                        $('#modal-item-edit').modal('hide')
					}
				}
			})
		}
	})

	function calculate(){
		var subtotal = 0;
		$('#cart-table tr').each(function(){
			subtotal += parseInt($(this).find('#total').text())
		})
		isNaN(subtotal) ? $('#sub_total').val(0) : $('#sub_total').val(subtotal)

		var discount = $('#diskon').val()
		var grand_total = subtotal - discount
		if(isNaN(grand_total)){
			$('#grand_total').val(0)
			$('#grand_total2').text(0)
		}else{
			$('#grand_total').val(grand_total)
			$('#grand_total2').text(grand_total)
		}

		var cash = $('#cash').val();
		cash != 0 ? $('#change').val(cash - grand_total) : $('#change').val(0)
		
		if(discount == ''){
			$('#diskon').val(0)
		}
	}

	$(document).on('keyup mouseup', '#diskon, #cash', function(){
		calculate()
	})

	$(document).ready(function(){
		calculate()
	})

	$(document).on('click','#proses_pembelian', function(){
		var customer_id = $('#customer').val()
		var subtotal = $('#sub_total').val()
		var discount = $('#diskon').val()
		var grandtotal= $('#grand_total').val()
		var cash = $('#cash').val()
		var change = $('#change').val()
        var note = $('#note').val()
        var no_meja = $('#no_meja').val()
        var date = $('#date').val()

        if(subtotal < 1){
            alert('Belum Ada Produk Dipilih')
            $('#barcode').focus()
        }else if(cash < 1){
            alert('Jumlah Uang Belum Diinput')
            $('#cash').focus()
        }else{
            if(confirm('Yakin Proses Transaksi Ini ?')){
                $.ajax({
                    type :'POST',
                    url  : '<?= site_url('kasir/proses')?>',
                    data : {'proses_pembelian' : true, 'customer_id' : customer_id, 'subtotal' : subtotal, 'discount' : discount, 'grandtotal' : grandtotal, 'cash' : cash, 'change' : change, 'note' : note, 'date' : date, 'no_meja' : no_meja},
                    dataType : 'json',
                    success: function(result){
                        if(result.success == true){
                            alert('Transaksi Berhasil')
                            window.open('<?= site_url('kasir/cetak/')?>' + result.kasir_id, '_blank')
                        }else{
                            alert('Transaksi Gagal')
                        }
                        location.href='<?= site_url('kasir') ?>'
                    }
                })
            }
        }
	})

    $(document).on('click', '#batal_pembelian', function(){
        if(confirm('Apakah Anda Yakin ?')){
            $.ajax({
                type : 'POST',
                url  : '<?= site_url('kasir/cart_del')?>',
                data : {'batal_pembelian' : true},
                dataType : 'json',
                success: function(result){
                    if(result.success == true){
                        $('#cart-table').load('<?=site_url('kasir/cart_data')?>', function(){
                            calculate()
                        })
                    }
                }
            })
            $('#diskon').val(0)
            $('#cash').val(0)
            $('#customer').val('').change()
            $('#barcode').val('')
            $('#note').val('')
            $('#barcode').focus()
        }
    })

</script>

