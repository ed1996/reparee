xml.instruct! :xml, version: '1.0'
xml.tag! 'urlset', 'xmlns' => "http://www.sitemaps.org/schemas/sitemap/0.9" do

  xml.tag! 'url' do
    xml.tag! 'loc', root_url
  end

  xml.tag! 'url' do
    xml.tag! 'loc', contacts_url
  end

  xml.tag! 'url' do
    xml.tag! 'loc', abonnement_url
  end

  xml.tag! 'url' do
    xml.tag! 'loc', services_url
  end

  xml.tag! 'url' do
    xml.tag! 'loc', equipe_url
  end

  xml.tag! 'url' do
    xml.tag! 'loc', cgv_url
  end

  xml.tag! 'url' do
    xml.tag! 'loc', politique_de_confidentialite_url
  end

  xml.tag! 'url' do
    xml.tag! 'loc', mentions_legales_url
  end

  @entreprises.each do |entreprise|
    xml.tag! 'url' do
      xml.tag! 'loc', entreprise_url(entreprise)
      xml.lastmod entreprise.updated_at.strftime("%F")
    end
  end

end