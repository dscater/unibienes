<div class="row">
    <div class="col-12">
        <p><strong>TITULAR:</strong> {{ $o_datos_banco->titular }}</p>
        <p><strong>BANCO:</strong> {{ $o_datos_banco->banco }}</p>
        <p><strong>NRO. CUENTA: </strong> {{ $o_datos_banco->nro_cuenta }}</p>
        <p><strong>QR:</strong> <img src="{{ asset('imgs/' . $o_datos_banco->qr) }}" alt="" class="img_qr_pago">
        </p>
    </div>
</div>
