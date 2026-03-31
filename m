Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619B33E6DC5;
	Tue, 31 Mar 2026 13:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774963530; cv=none; b=SlA8LuFCtnuwLbcvVg8cUWcTZ6mtfXFDNw/FanFfKF8HxiSwWR8V76DdGoW3CYk5GImhL/Edjx5IyRO4vpQNJRzLlhoEt4EYBmbHDrXWB/7lzwnz8l0ZFvYPykJJIF8ss66DfyTSe7uXp7T+A4cJctu+u3mApcjqVLvb2nqRSk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774963530; c=relaxed/simple;
	bh=8U45AQ34K6mhFVVX+6tkxH2UVS0UKtC+ziNSiqSVGF0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WjEbLGnZUoFB6tYCZe1CQqAnkMi0ezY2A4ZylMC7bMK19WJm9UblA2LCHtdbi8mxi3nO1WWqdeqphfcFVTJpY6ZCLVlloHuUDL6GT9LmH9I5sTZTNObrn7Yu+zxMF8DEqM25cm+w0o5pYeR2GRSDm+22W2k6Z1BMoDFqKSnZWCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eBR+mvUK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eBR+mvUK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774963529; x=1806499529;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8U45AQ34K6mhFVVX+6tkxH2UVS0UKtC+ziNSiqSVGF0=;
  b=eBR+mvUKiaTiCEbC+ggVSnlL9MBcHaETY+ii16geitKubOUa27cVjuoj
   HBU87YMmeNWdqZDQsB8xzoa7yV9RfZKJVfQKYoOW3u4gdcTmnxaBxNCWT
   drNqUtyTNZvuiSgDIZgRtloiF5FLSeX8EXE/3+TlFY4NRvqMoAhNg4NLX
   zw3/pQkWJNPk/q2cUbF03eiCzYH4iqjyDS9FRpxZy/Ym4JOtXa/hmsk0b
   k/Swf1cQ+lkVtHYGFQ5dofl9IfrCOQALCG5ZRAouqg1EXhpfPusScQmVD
   I0SSiprWI31ZBypMuDwKR4KzZ0b3jPAuP4y6DYjNfFOPqfsefZVea/jKB
   Q==;
X-CSE-ConnectionGUID: nhHuhcF+SmOuHQsdYNtSXQ==
X-CSE-MsgGUID: upPMfXNkSPyH3fXISN7NqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="98587533"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="98587533"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 06:25:29 -0700
X-CSE-ConnectionGUID: 4AWQFtcdRBmgO02S3Pmj0Q==
X-CSE-MsgGUID: rhL8Km6CSq2cNxqNG2ZAgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="226618697"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.6])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 06:25:26 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 31 Mar 2026 16:25:22 +0300 (EEST)
To: Bani Brata <banibrata2007@gmail.com>, 
    Krishna Chomal <krishna.chomal108@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: hp-wmi: Hide bogus fan RPM on HP ENVY x360
 13-bd0xxx
In-Reply-To: <20260329054052.32023-1-banibrata2007@gmail.com>
Message-ID: <96f1e5b3-e1f5-0fd7-7bcc-3160deb3bc7c@linux.intel.com>
References: <20260329054052.32023-1-banibrata2007@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 29 Mar 2026, Bani Brata wrote:

> On the HP ENVY x360 Convertible 13-bd0xxx (board 8824), the WMI
> interfaces for reading fan speed (HPWMI_FAN_SPEED_GET_QUERY) return
> zero-filled buffers regardless of the actual fan speed.
> 
> This results in the hp_wmi driver exposing `fan1_input` and `fan2_input`
> nodes through hwmon that permanently report "0 RPM", which is misleading
> and interferes with userspace sensor monitoring tools.
> 
> Add a DMI quirk to disable exposing the hwmon fan nodes on this specific
> board.
> 
> Signed-off-by: Bani Brata <banibrata2007@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index XXXXXXX..XXXXXXX 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -192,6 +192,18 @@ static const struct dmi_system_id hp_wmi_rfkill_dmi_table[] __initconst = {
>  };
>  
>  static bool is_victus_s_board;
> +static bool is_envy_x360_8824_board;
> +
> +static const struct dmi_system_id hp_envy_x360_8824_boards[] __initconst = {
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "HP ENVY x360 Convertible 13-bd0xxx"),
> +			DMI_MATCH(DMI_BOARD_NAME, "8824"),
> +		},
> +	},
> +	{},
> +};
>  
>  enum hp_wmi_radio {
>  	HPWMI_WIFI	= 0x0,
> @@ -2166,6 +2178,8 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
>  	case hwmon_pwm:
>  		return 0644;
>  	case hwmon_fan:
> +		if (is_envy_x360_8824_board)
> +			return 0;
>  		if (is_victus_s_thermal_profile()) {
>  			if (hp_wmi_get_fan_speed_victus_s(channel) >= 0)
>  				return 0444;
> @@ -2188,6 +2202,8 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  
>  	switch (type) {
>  	case hwmon_fan:
> +		if (is_envy_x360_8824_board)
> +			return -EOPNOTSUPP;
>  		if (is_victus_s_thermal_profile())
>  			ret = hp_wmi_get_fan_speed_victus_s(channel);
>  		else
> @@ -2281,6 +2297,8 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
>  {
>  	const struct dmi_system_id *id;
>  
> +	is_envy_x360_8824_board = dmi_first_match(hp_envy_x360_8824_boards);
> +
>  	/*
>  	 * Currently only victus_s devices use the
>  	 * active_thermal_profile_params

So does this mean we can't get fan speeds at all with this device?

(This approach is written very specific to a model and should be 
generalized if there really isn't any way to get the speeds.)

I've Krishna Chomal who might have better ideas than me.

-- 
 i.

