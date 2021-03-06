require 'chefspec'

describe 'yum_package::install' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'installs a yum_package with the default action' do
    expect(chef_run).to install_yum_package('default_action')
    expect(chef_run).to_not install_yum_package('not_default_action')
  end

  it 'installs a yum_package with an explicit action' do
    expect(chef_run).to install_yum_package('explicit_action')
  end

  it 'installs a yum_package with attributes' do
    expect(chef_run).to install_yum_package('with_attributes').with(version: '1.0.0')
    expect(chef_run).to_not install_yum_package('with_attributes').with(version: '1.2.3')
  end

  it 'installs a yum_package when specifying the identity attribute' do
    expect(chef_run).to install_yum_package('identity_attribute')
  end
end
