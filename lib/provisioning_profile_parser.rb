class Parser
  require "Fastlane"

  attr_reader :profile_path

  def profile
    return FastlaneCore::ProvisioningProfile.parse(profile_path)
  end

  def initialize(path)
    @profile_path = path
  end

  def profile_identity
    encoded_identity = Base64.encode64(profile["DeveloperCertificates"].first.string)
    return Fastlane::FastFile.sh("echo \"#{encoded_identity}\" | base64 -D | openssl x509 -noout -inform DER -subject | sed 's/^.*CN=\\([^\\/]*\\)\\/.*$/\\1/'").strip
  end

  def profile_team
    return profile["TeamIdentifier"].first
  end

  def profile_name
    return profile["Name"]
  end

  def bundle_id
    full_bundle_id = profile["Entitlements"]["application-identifier"]
    return full_bundle_id[full_bundle_id.index(".") + 1, full_bundle_id.length - full_bundle_id.index(".")]
  end

  def profile_uuid
    return profile["UUID"]
  end
end
