Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8811A3E025D;
	Tue, 24 Mar 2026 13:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357734; cv=none; b=j45HdBHtJET4MXapYpUCfpGaliBjWuKOV2vkCL1dU/w9ZpNvFczH/ILpzO9SNdh1mHWLLDOXNnWY+CPDLfEks4l+gfrTc171sUMXr0qTeM47lRW72XalwnK2tKVpzav2qi/Nnc46lGUSnoiRh2pxDn5FGRSC1Oy5rhARsrzwkaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357734; c=relaxed/simple;
	bh=m1xFUo+gLkgC8xs7hVw4dMlGVhlSrwTvtzoQ++sFUjA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=e9Q6CjQ2gERzD8+ZV5RavTjIfcIYq9jSLEK7JwlMf2axqyaq9W9DKthLxIjLsFUSMou99JGk7JePH/ywn8s22IZf/mt7hXN9KaW3uZBTqjuklH5ZVOqfPgs7s41LWjLKwl2sBA1aLduc8M46HgKGAf1O9oOggEnOo3ccxcbnOLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IAGjxMmM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IAGjxMmM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774357733; x=1805893733;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=m1xFUo+gLkgC8xs7hVw4dMlGVhlSrwTvtzoQ++sFUjA=;
  b=IAGjxMmM5A38FbUDw9E6R9IMZYT38jB/RdUGc8SnggD/zsxPJLiNFJEl
   NQjpR7CgSEHcQLYxMtpb4PLTuGav1KHB+2dDMJMNyT9Xr5r8OkNeDxHGE
   EvhJVvhTjyyT0sJgaSWLCJBguVl/ew5/RbWNMlVjeOx8AfqbdxE+DnyMs
   SuUyf19wV/F3+ctm6y3miSy6Fw/8jkCbXH9OQoIx3WtLs+9fMjBiqOy/e
   WG29GS7J5IKeed37YbGnpAgJ7ifBF/ztIVQWuKNOgZPHCv48b6bYF4eln
   iWSiJgV5ulELqi8T1wouNS73InBSh2CLPpo5NEOxJYbCzxk2DL6RZu4xo
   A==;
X-CSE-ConnectionGUID: XCEHZ65XRau+boDzlAVauA==
X-CSE-MsgGUID: fNDVLTrYQXWtAP9NyPUMOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86446288"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86446288"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:08:52 -0700
X-CSE-ConnectionGUID: uwwGhNO9Tj2SRTBAC/p1CQ==
X-CSE-MsgGUID: jZP74VBdT+OQ55I/ujsRfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224588079"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:08:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 24 Mar 2026 15:08:46 +0200 (EET)
To: Werner Sembach <wse@tuxedocomputers.com>
cc: W_Armin@gmx.de, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 2/5] platform/x86: uniwill-laptop: Implement USB-C
 power priority setting
In-Reply-To: <20260312192705.76576-3-wse@tuxedocomputers.com>
Message-ID: <fc314dee-c341-8ff3-794c-2edecefc079a@linux.intel.com>
References: <20260312192705.76576-1-wse@tuxedocomputers.com> <20260312192705.76576-3-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Mar 2026, Werner Sembach wrote:

> On some devices Uniwill offers the option to set the USB-C port to
> prioritise charging or performance. This patch exposes this setting to the
> userspace via sysfs for all TUXEDO devices supporting it.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/x86/uniwill/uniwill-acpi.c | 145 +++++++++++++++++++-
>  1 file changed, 138 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index 048b265bff374..22ae5fccd6a06 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -266,8 +266,8 @@
>  #define BATTERY_CHARGE_FULL_OVER_24H	BIT(3)
>  #define BATTERY_ERM_STATUS_REACHED	BIT(4)
>  
> -#define EC_ADDR_CHARGE_PRIO		0x07CC
> -#define CHARGING_PERFORMANCE		BIT(7)
> +#define EC_ADDR_USB_C_POWER_PRIORITY	0x07CC
> +#define USB_C_POWER_PRIORITY		BIT(7)
>  
>  /* Same bits as EC_ADDR_LIGHTBAR_AC_CTRL except LIGHTBAR_S3_OFF */
>  #define EC_ADDR_LIGHTBAR_BAT_CTRL	0x07E2
> @@ -324,6 +324,12 @@
>  #define UNIWILL_FEATURE_PRIMARY_FAN		BIT(7)
>  #define UNIWILL_FEATURE_SECONDARY_FAN		BIT(8)
>  #define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(9)
> +#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(10)
> +
> +enum usb_c_power_priority_options {
> +	USB_C_POWER_PRIORITY_CHARGING = 0,
> +	USB_C_POWER_PRIORITY_PERFORMANCE,
> +};
>  
>  struct uniwill_data {
>  	struct device *dev;
> @@ -343,6 +349,8 @@ struct uniwill_data {
>  	struct mutex input_lock;	/* Protects input sequence during notify */
>  	struct input_dev *input_device;
>  	struct notifier_block nb;
> +	struct mutex usb_c_power_priority_lock; /* Protects dependent bit write and state safe */
> +	enum usb_c_power_priority_options last_usb_c_power_priority_option;
>  };
>  
>  struct uniwill_battery_entry {
> @@ -527,6 +535,7 @@ static bool uniwill_writeable_reg(struct device *dev, unsigned int reg)
>  	case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>  	case EC_ADDR_CTGP_DB_TPP_OFFSET:
>  	case EC_ADDR_CTGP_DB_DB_OFFSET:
> +	case EC_ADDR_USB_C_POWER_PRIORITY:
>  		return true;
>  	default:
>  		return false;
> @@ -565,6 +574,7 @@ static bool uniwill_readable_reg(struct device *dev, unsigned int reg)
>  	case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>  	case EC_ADDR_CTGP_DB_TPP_OFFSET:
>  	case EC_ADDR_CTGP_DB_DB_OFFSET:
> +	case EC_ADDR_USB_C_POWER_PRIORITY:
>  		return true;
>  	default:
>  		return false;
> @@ -587,6 +597,7 @@ static bool uniwill_volatile_reg(struct device *dev, unsigned int reg)
>  	case EC_ADDR_TRIGGER:
>  	case EC_ADDR_SWITCH_STATUS:
>  	case EC_ADDR_CHARGE_CTRL:
> +	case EC_ADDR_USB_C_POWER_PRIORITY:
>  		return true;
>  	default:
>  		return false;
> @@ -883,6 +894,104 @@ static int uniwill_nvidia_ctgp_init(struct uniwill_data *data)
>  	return 0;
>  }
>  

> +static const char * const USB_C_POWER_PRIORITY_TEXT[] = {

> +static const u8 USB_C_POWER_PRIORITY_VALUE[] = {

These two arrays need to be lowercase as they're not macros.

--
 i.


