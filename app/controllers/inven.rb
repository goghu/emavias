class Inven
	def get_total(idalmacen,idproducto)
		registro = Total.where(almacen_id: idalmacen,producto_id: idproducto).first
		if registro == nil
			return 0
		else
			return registro.cantidad
		end
	end

	def set_total(idalmacen,idproducto,total)
		registro = Total.where(almacen_id: idalmacen,producto_id: idproducto).first
		if registro == nil
			nuevo_registro = Total.new
			nuevo_registro.cantidad = total
			nuevo_registro.user_id = current_user.id
			nuevo_registro.producto_id = idproducto
			nuevo_registro.almacen_id = idalmacen
			nuevo_registro.save
		else
			registro.cantidad = total
			registro.save
		end

	end

end
