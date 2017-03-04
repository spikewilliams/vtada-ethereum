module VtadaRPCUtils

  def to_decimal(hex)
    if hex == nil
      return nil
    end
    if hex.is_a?(Integer)
      return hex
    end
    hex.to_i(16)
  end

  def to_hex(decimal)
    if decimal == nil
      return nil
    end
    if decimal.is_a?(String)
      return decimal
    end
    decimal.to_s(16)
  end

  def wei_to_ether(wei)
    1.0 * wei / 10**18
  end

  def ether_to_wei(ether)
    ether * 10**18
  end
end
