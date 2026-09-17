Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0C14A3F30;
	Thu, 17 Sep 2026 09:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636302; cv=none; b=LgT+yipwp02euqFWQXi0Nu1pcJ3AhOkVThijtGelHaAM5Us4tQ1CNtaxP2uYScGHdTGoKOf5NURW2VUqiFw8S3GE0ZnTdUgabFwuWzML4uNekypvGu7RpDnueczThwTBcPpLdw+iYDvXuG3e+5vM32ekbP93oEUdwLAeb/SO2kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636302; c=relaxed/simple;
	bh=9cAIMFkkngYM21BSt328Hyv8NWE9MK1/xH/EJgjG+1I=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cd6YovPxQGpHpaDF4y3XM2+PBkd89Mt0sLWyNgwmC/UjBnIHt+G7G6X3p1wnJ/D5Qt4mFzKgndDsD+1Q673Ff6SsN/inLG3j9YDmqN9gXRiTnIm/xg7Ra9hlCZzCKBo8AKg6bfN4uKhR2zNu23UIUWAM7GNqXUx9fRg+0cl8G/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U9CfQbsM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9CfQbsM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789636301; x=1821172301;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9cAIMFkkngYM21BSt328Hyv8NWE9MK1/xH/EJgjG+1I=;
  b=U9CfQbsMCAZx2ALlHeemqwDZeJ5E/tk15ZGJuSJfX0XWR9sE+c7tBPBV
   ybkvZfZiahYWxH1M+Qf85GdQheeD7BdXD5Egc8HaBi9BlqxnDEUfH9ic5
   W5lfzNMNi98eykin07iHCs1PUvelVhTEbq03mZAo+UgP/fhnoc3xiOl1l
   V4oQQXoLe+dXZ/UgBBKNgpD8ujXkigXp8iKpWL8O4gnTkbVHOi9xCXkvc
   uoo5Sfgd4aHILrtpxVQI9ZGwDZ2ufSCkrvJ4mdLtpTHqghqgsaTEav68J
   NhAxUVu30dqk5jWyMT58If/AEblka+GiCG/FsaFKgN1KM7ommeGTw/rgk
   w==;
X-CSE-ConnectionGUID: gdtpVJeWRl6ltsjOJEttHQ==
X-CSE-MsgGUID: OeDfz8UZQEanjs+5gW6jGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100636291"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100636291"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 02:11:40 -0700
X-CSE-ConnectionGUID: WynMh5tJQEeY2nFE6dSyvw==
X-CSE-MsgGUID: p5WyakG2R2iGHtY89u/9Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1888908"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.62])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 02:11:38 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Sep 2026 12:11:33 +0300 (EEST)
To: chipang_kao <prozac2734@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, bryan.odonoghue@linaro.org, 
    W_Armin@gmx.de, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, chipang_kao <chipang_kao@asus.com>
Subject: Re: [PATCH 2/2] platform/arm64: Enable ASUS WMI driver support
In-Reply-To: <20260917021055.8029-3-chipang_kao@asus.com>
Message-ID: <cea8b0e8-518e-ace7-3fb1-688b29b497d5@linux.intel.com>
References: <20260917021055.8029-1-chipang_kao@asus.com> <20260917021055.8029-3-chipang_kao@asus.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Sep 2026, chipang_kao wrote:

> Wire up the Makefile to build drivers/platform/x86/asus-wmi.c
> and asus-nb-wmi.c without duplicating driver source code.
> 
> Signed-off-by: chipang_kao <chipang_kao@asus.com>
> ---
>  drivers/platform/arm64/Kconfig  | 46 +++++++++++++++++++++++++++++++++
>  drivers/platform/arm64/Makefile |  2 ++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
> index e32e01b2a9bd..59aa389d9aab 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -103,4 +103,50 @@ config EC_QCOM_HAMOA
>  
>  	  This driver currently supports Hamoa/Purwa/Glymur reference devices.
>  
> +config ASUS_WMI
> +	tristate "ASUS WMI Driver"
> +	depends on ACPI_WMI
> +	depends on ACPI_BATTERY
> +	depends on INPUT
> +	depends on HWMON
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	depends on RFKILL || RFKILL = n
> +	depends on HOTPLUG_PCI
> +	depends on ACPI_VIDEO || ACPI_VIDEO = n
> +	depends on SERIO_I8042 || SERIO_I8042 = n
> +	select INPUT_SPARSEKMAP
> +	select LEDS_CLASS
> +	select NEW_LEDS
> +	select ACPI_PLATFORM_PROFILE
> +	help
> +	  Say Y here if you have a WMI aware Asus laptop (like Eee PCs or new
> +	  Asus Notebooks).
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called asus-wmi.
> +
> +config ASUS_WMI_DEPRECATED_ATTRS
> +	bool "BIOS option support in WMI platform (DEPRECATED)"
> +	depends on ASUS_WMI
> +	default y
> +	help
> +	  Say Y to expose the configurable BIOS options through the asus-wmi
> +	  driver.
> +
> +	  This can be used with or without the asus-armoury driver which
> +	  has the same attributes, but more, and better features.
> +
> +config ASUS_NB_WMI
> +	tristate "Asus Notebook WMI Driver"
> +	depends on ASUS_WMI
> +	help
> +	  This is a driver for newer Asus notebooks. It adds extra features
> +	  like wireless radio and bluetooth control, leds, hotkeys, backlight...
> +
> +	  For more information, see
> +	  <file:Documentation/ABI/testing/sysfs-platform-asus-wmi>
> +
> +	  If you have an ACPI-WMI compatible Asus Notebook, say Y or M
> +	  here.

I only now notice the second patch is not covered by Armin's series.

But this duplicates Kconfig entries.

I suppose the best approach would be to split drivers/platform/x86/Kconfig 
into two and source the generic one here.

> +
>  endif # ARM64_PLATFORM_DEVICES
> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
> index 7681be4a46e9..d608b2aa8c12 100644
> --- a/drivers/platform/arm64/Makefile
> +++ b/drivers/platform/arm64/Makefile
> @@ -10,3 +10,5 @@ obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
>  obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
>  obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
>  obj-$(CONFIG_EC_QCOM_HAMOA) += qcom-hamoa-ec.o
> +obj-$(CONFIG_ASUS_WMI) += ../x86/asus-wmi.o
> +obj-$(CONFIG_ASUS_NB_WMI) += ../x86/asus-nb-wmi.o
> 

-- 
 i.

