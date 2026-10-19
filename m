Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24FA277026;
	Mon, 19 Oct 2026 06:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792390986; cv=none; b=dNvcjMARq1cpEFjnkl8C9wnRFZFyjaz7W02Mxsmr6nZ3jElM7VS+RaU8baj67XU+SLV2+nbO2Q5u1k2ZEwodmUaERvedRcRZ9+n0lsneaTKKtxthk+l4dvv/rBQm0hyU20GX/rOCw8nn/VghZD5R7z/u7Jgi+rTEiaS5Er7m5GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792390986; c=relaxed/simple;
	bh=jok0pH1kBDXxoD4Ns1By6b6+o9P9TjnkBuZkqo+jr40=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oE7e7ANGezizMnttDLWoqF6K/N9OZnE7M7Yzo4nhfRcDjPtwJ2e56us5bU9YCqAzO9m4VpKaptpZVlBlzkrSkcDgdZ7Wp7mLp+m5qyvMbN/trtuMjR/7ipZrJqJWSVxqGHnvINmGn1/BwKNYFDkgu/WkXqHMoo6XjEGaHEFs0/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SFcTdA4j; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFcTdA4j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792390984; x=1823926984;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jok0pH1kBDXxoD4Ns1By6b6+o9P9TjnkBuZkqo+jr40=;
  b=SFcTdA4jQYBMhCAikpR6xg1UHmqmDrD9irkV7njBolM0QF5zG6cUKBrB
   lrX6YH5ETVJRvLWmjcoGlCDCDUOMt2Am6AnCMAZYyTSH37u3kISXgvd9b
   jjcblTcH4PM2YqxBMUo8mZLzKqcJ/7y3hsYYR0V147OcgLced0IemuuGI
   lTihnVyfw7zf4gG9zkVKUGbXIJbuuj7U/uUf75pR0DEgcrH6vssZfeBOn
   +qZ++k2ileKYY2H+RiPIzapsOx3QI1GdAbBa5DeRegs3yIuKmfwkElzBz
   KXe6J+3AongXx2AtTTNecFNnnQvlN+sJlEVGjWBMe7wgbeQT7SSYF4hlN
   A==;
X-CSE-ConnectionGUID: epv+dglaRQSXDr/r7qnaiA==
X-CSE-MsgGUID: oBOHk8wwR7ioEqhtHQC0ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1080453"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1080453"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 23:23:04 -0700
X-CSE-ConnectionGUID: ZTqwcc46RBGam4S3f5Ur2w==
X-CSE-MsgGUID: INukVwBaTbCDDQ9Z1O8Xsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2507134"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 23:23:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 Oct 2026 09:22:59 +0300 (EEST)
To: Krishna Chomal <krishna.chomal108@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, 
    Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Disable hwmon attributes when no
 fans are usable
In-Reply-To: <20261017132421.279522-1-krishna.chomal108@gmail.com>
Message-ID: <650e9c05-6631-8870-44ba-5a7532cb500b@linux.intel.com>
References: <20261017132421.279522-1-krishna.chomal108@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 17 Oct 2026, Krishna Chomal wrote:

> Currently, hp_wmi_hwmon_is_visible() checks whether fan RPM queries
> succeed before exposing fan1_input and fan2_input, but pwm1_enable
> remains visible always, even when fan support is unavailable. 

Why does it yield different result from is_visible?

...Somehow I find starting with this more confusing than helpful.

> On some
> devices, such as certain Omnibook models, the firmware does not provide
> functional WMI fan methods. Exposing pwm1_enable on these devices can
> mislead userspace and cause fan mode changes to fail.
> 
> Additionally, some firmware implementations provide stub methods
> that return an all-zero buffer instead of an error. In this case,
> hp_wmi_get_active_fan_speed() and hp_wmi_get_fan_speed() can report 0
> RPM even when the fan is physically spinning.
> 
> Use the result of fan count query (fetched from firmware once in
> hp_wmi_setup_fan_settings(), and cached in hwmon private data) to
> determine whether fan related attributes should be exposed.
> 
> The fan count query can have the following outcomes:
> * Negative: The WMI query failed. Other fan-related queries are also
>   expected to fail, so disable fan support.
> * Zero (stub firmware): The methods return zero-filled responses without
>   providing functional fan support, so disable fan support.
> * Zero (genuine firmware): No fans are exposed through WMI, so disable
>   fan support.
> * Positive (1 or 2): Firmware reports one or more fans, so allow fan
>   support. Per-channel RPM queries continue to determine which
>   individual fan input attributes are exposed.
> 
> When fan support is unavailable, hide the fan and PWM attributes and
> skip applying the initial fan settings.
> 
> Tested on: HP OmniBook 5 Laptop 16-ag1xxx (board: 8DF4)
> 
> Tested-by: Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>
> Reported-by: Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222138
> Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 0eac5e1d9cdb..52077833ac89 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -651,6 +651,7 @@ enum pwm_modes {
>  
>  struct hp_wmi_hwmon_priv {
>  	struct mutex lock;	/* protects mode, pwm */
> +	int fan_count;
>  	u8 min_rpm;
>  	u8 max_rpm;
>  	u8 mode;
> @@ -2950,12 +2951,18 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
>  				       enum hwmon_sensor_types type,
>  				       u32 attr, int channel)
>  {
> +	const struct hp_wmi_hwmon_priv *priv = data;
> +
>  	switch (type) {
>  	case hwmon_pwm:
> +		if (priv->fan_count <= 0)
> +			return 0;
>  		if (attr == hwmon_pwm_input && !hp_wmi_fan_control_supported())
>  			return 0;
>  		return 0644;
>  	case hwmon_fan:
> +		if (priv->fan_count <= 0)
> +			return 0;
>  		if (hp_wmi_fan_control_supported()) {
>  			if (hp_wmi_get_active_fan_speed(channel) >= 0)
>  				return 0444;
> @@ -3124,6 +3131,7 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
>  
>  	/* Default behaviour on hwmon init is automatic mode */
>  	priv->mode = PWM_MODE_AUTO;
> +	priv->fan_count = hp_wmi_get_fan_count_userdefine_trigger();
>  
>  	/* Bypass devices without fan control support. */
>  	if (!hp_wmi_fan_table_supported())
> @@ -3208,6 +3216,11 @@ static int hp_wmi_hwmon_init(void)
>  		return PTR_ERR(hwmon);
>  	}
>  
> +	if (priv->fan_count <= 0) {
> +		dev_info(dev, "No usable fans reported by WMI, disabling fan support\n");
> +		return 0;
> +	}
> +
>  	ret = hp_wmi_apply_fan_settings(priv);
>  	if (ret)
>  		dev_warn(dev, "Failed to apply initial fan settings: %d\n", ret);
> 

-- 
 i.

