class User < ApplicationRecord
    has_many :evaluaciones_anuales
    has_many :upward_fbks
    has_many :cliente_proveedors
    has_secure_password
end
