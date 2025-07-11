Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678712EF9A3
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Jul 2025 16:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752251193; cv=none; b=SvV9dJ64P4YC59eI9jOi5A5FRSQyzoVU5H+iBSp/wFJIzZxOETp7g5HMyegz2/0v+gsKMTQxEtP9ILsDmL5RYBOxdL0HAQ12c+ZushHoORi0Ef82BuM2XXqPyju1sBzk4BFO1k+iEW3pcp8QD6zFmjpxlPzIFnzMXaYoamhJYQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752251193; c=relaxed/simple;
	bh=6TM18RgHFfaNkI5GGNvloZ/6Icd4Am20kcYFkcOe/Ow=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Wyokq99rTQM81ZfG9Xy1TXVCMF6gV/Xpv4nZ5mTpXCilZNOetXyyJjY3vfQulla5US53Epu3rSwvLWwVb6sY9R/jjsRXIQDaUJCXT+hJTKyXAaI6+Gg15cfpjsGOA0feu5H/9v7AxjDwarK2kFgLx90aBY7F48Ct25ieHuYY8Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TCPGQNtk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TCPGQNtk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752251191; x=1783787191;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6TM18RgHFfaNkI5GGNvloZ/6Icd4Am20kcYFkcOe/Ow=;
  b=TCPGQNtkk4pdy3+sT2b/MRd5BvikU1ZqHg2t0WwFfwlcPIm6YRV4wzF6
   Cv5GppxCzxSCahvFRGZV/QAs+ZIFxV9c32CF4MzNSmQK+5zgH32AcVCZ3
   h3cMZ9FrMqFhMRaBoxG0KRQ0nYHxm9VyF/EbYikJc+Vpxsp/Q3XdrYLd2
   Wa4Mhdp5dtcgP+2EmYx1+zgqLd+zZmoJIm7OJSnlwaAZu4NIFhZGgunbx
   OPdQunFEkK2RbzOo8GKQsf/XzE3Por3KdjRQgwH37nzoZPS5pC81riVxm
   jfD4+IROneeQSYLrC3D1+UYahZ7GQ7S3jO31MQU/MxlQqJlCUfjbMmHvY
   g==;
X-CSE-ConnectionGUID: CALqMThdR3G62pCkF8DRfQ==
X-CSE-MsgGUID: Oxu7KzbfQJq0HMW5s+nqdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53773860"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="53773860"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 09:26:31 -0700
X-CSE-ConnectionGUID: Frdc6OUjTzCNoOgDVDVrrA==
X-CSE-MsgGUID: SkzaicNkT/CstEtuC3BIoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="155819660"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.249])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 09:26:28 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 11 Jul 2025 19:26:24 +0300 (EEST)
To: Torsten Hilbrich <torsten.hilbrich@secunet.com>
cc: platform-driver-x86@vger.kernel.org, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, Hans de Goede <hansg@kernel.org>, 
    Wassenberg Dennis <dennis.wassenberg@secunet.com>
Subject: Re: [PATCH] platform/x86: Fix initialization order for
 firmware_attributes_class
In-Reply-To: <7dce5f7f-c348-4350-ac53-d14a8e1e8034@secunet.com>
Message-ID: <8288d533-f655-e8a9-758f-47e5e587e50b@linux.intel.com>
References: <7dce5f7f-c348-4350-ac53-d14a8e1e8034@secunet.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Jul 2025, Torsten Hilbrich wrote:

> The think-lmi driver uses the firwmare_attributes_class. But this class
> is registered after think-lmi, causing the "think-lmi" directory in
> "/sys/class/firmware-attributes" to be missing when the driver is
> compiled as builtin.
> 
> Fixes: 55922403807a ("platform/x86: think-lmi: Directly use
> firmware_attributes_class")
> Signed-off-by: Torsten Hilbrich <torsten.hilbrich@secunet.com>
> ---
>  drivers/platform/x86/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index abbc2644ff6d..bea87a85ae75 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -58,6 +58,8 @@ obj-$(CONFIG_X86_PLATFORM_DRIVERS_HP)	+= hp/
>  # Hewlett Packard Enterprise
>  obj-$(CONFIG_UV_SYSFS)       += uv_sysfs.o
>  +obj-$(CONFIG_FW_ATTR_CLASS)	+= firmware_attributes_class.o
> +
>  # IBM Thinkpad and Lenovo
>  obj-$(CONFIG_IBM_RTL)		+= ibm_rtl.o
>  obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
> @@ -128,7 +130,6 @@ obj-$(CONFIG_SYSTEM76_ACPI)	+= system76_acpi.o
>  obj-$(CONFIG_TOPSTAR_LAPTOP)	+= topstar-laptop.o
>   # Platform drivers
> -obj-$(CONFIG_FW_ATTR_CLASS)		+= firmware_attributes_class.o
>  obj-$(CONFIG_SERIAL_MULTI_INSTANTIATE)	+= serial-multi-instantiate.o
>  obj-$(CONFIG_TOUCHSCREEN_DMI)		+= touchscreen_dmi.o
>  obj-$(CONFIG_WIRELESS_HOTKEY)		+= wireless-hotkey.o
> 

I've applied this to review-ilpo-fixes but the patch was corrupted by 
extra spaces which I had to remove manually before applying.

-- 
 i.

