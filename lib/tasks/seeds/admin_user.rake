# frozen_string_literal: true

PERMISSIONS = [
  { title: 'Usuarios', category: 'Sistema', code: 'user' },
  { title: 'Grupos', category: 'Sistema', code: 'group' },
  { title: 'Clientes', category: 'Clientes', code: 'client',
    custom_actions: '{ "search": "view" }' },

  { title: 'Productos', category: 'Productos', code: 'product',
    custom_actions: '{ "download": "view" }' },

  { title: 'Tipos de productos', category: 'Productos', code: 'product_type' },
  { title: 'Proveedores', category: 'Productos', code: 'producer',
    custom_actions: '{ "download": "view" }' },

  { title: 'Marcas', category: 'Productos', code: 'family' },
  { title: 'Categorías', category: 'Productos', code: 'category' },

  { title: 'Inventario', category: 'Inventario', code: 'inventory',
    custom_actions: '{ "download_product": "view", '\
                       '"download_deposit_product": "view" }' },

  { title: 'Movimientos', category: 'Inventario', code: 'move',
    custom_actions: '{ "download": "view" }' },

  { title: 'Proveedores', category: 'Inventario', code: 'provider',
    custom_actions: '{ "download": "view" }' },

  { title: 'Depósitos', category: 'Inventario', code: 'deposit',
    custom_actions: '{ "download": "view" }' },

  { title: 'Tipos de depósito', category: 'Inventario', code: 'deposit_type' }
].freeze

def create_permissions
  print 'Creating permissions...'

  PERMISSIONS.each do |p|
    perm = Permission.find_or_initialize_by(code: p[:code])
    perm.title = p[:title]
    perm.category = p[:category]
    perm.custom_actions = p[:custom_actions]
    perm.save!
  end
end

namespace :seeds do
  desc 'Create admin user'

  task admin_user: :environment do
    ActiveRecord::Base.transaction do
      if User.find_by(username: 'admin')
        puts 'El usuario admin ya existe'
      else
        g = Group.find_or_create_by(name: 'Administradores', admin: true)
        g.users.create!(email: 'admin@example.com',
                        active: true,
                        firstname: 'admin',
                        lastname: 'admin',
                        username: 'admin',
                        password: 'admin-123',
                        password_confirmation: 'admin-123')
      end

      create_permissions
    end
  end
end
