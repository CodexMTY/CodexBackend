class User < ApplicationRecord
    include Rails.application.routes.url_helpers
    has_many :evaluaciones_anuales
    has_many :upward_fbks
    has_many :cliente_proveedors
    has_one_attached :image
    has_secure_password

    validates :nombre, presence: true, on: :create
    validates :apellidos, presence: true, on: :create
    validates :email, presence: true, uniqueness: true, on: :create

    def get_image_url
        url_for(self.image) if self.image.attached?
    end

    def getEdad
        if self.cumpleanos
            now = Time.now.utc.to_date
            now.year - self.cumpleanos.year - (self.cumpleanos.to_date.change(:year => now.year) > now ? 1 : 0)
        else
            nil
        end
    end

    def getAntiguedad
        if self.fecha_ingreso
            now = Time.now.utc.to_date
            now.year - self.fecha_ingreso.year - (self.fecha_ingreso.to_date.change(:year => now.year) > now ? 1 : 0)
        else
            nil
        end
    end
end
