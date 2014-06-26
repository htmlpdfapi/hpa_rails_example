class ExampleController < ApplicationController


  def index  
  end


  def show
    @images = "cats"
    respond_to do |format|
      format.html { render(layout: 'pdf') }

      format.pdf do
        pdf = Hpa::Pdf.create( 
          html: render_to_string(layout: 'pdf').to_str,
          header: render_to_string(template: 'example/header.erb', layout: 'pdf').to_str,
          footer: render_to_string(template: 'example/footer.erb', layout: 'pdf').to_str,
          header_spacing: 10,
          footer_spacing: 10,
          engine_version: 12
        )

        send_data(pdf, filename: "hpa_rails_example.pdf", type: "application/pdf", disposition: "inline")
      end

    end
  end


end
