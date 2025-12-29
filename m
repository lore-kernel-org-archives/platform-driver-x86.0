Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD48225408;
	Mon, 29 Dec 2025 16:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767026989; cv=none; b=fPVV++DSoY0HTuS2mwrlS3+lL1MzG/A2enIdHIcQG+9enOs8am8hDQOOm2l4xWuvlP6HtJQnUZANHuvDM6qj2L8xFQT06Da6Sr9pwXFpJr1DcZv8f90oFhm3BIPZ/Acp4T+7Rz9iZWRPiuFV7kkAgvlZfZ1oPU1WQfKh4L2b/sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767026989; c=relaxed/simple;
	bh=rVB8ZaVuTlPGLHl3oQZ7CJLvRsUoyLME3es2ERmDx/w=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=d3ORfZJ6f+63Sb3xktn7CUXn0vVfxx4P7fhLBZL6Dk9J+Zj/D6YOnGiymB8x/ZUzP7/+jlx0aXi1TxbNFOtwvnQtepfcNPKR/1POrGUxTjWi29/3+keY+7ij5yWl9YM+az9u3IaAPxx9mJPnoNkxPe9X/Mw7IIBAa1FqhUvvUt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KIe06hOa; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KIe06hOa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767026987; x=1798562987;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=rVB8ZaVuTlPGLHl3oQZ7CJLvRsUoyLME3es2ERmDx/w=;
  b=KIe06hOa1LUVdfrisMKesl66oJ4BTXorlDZkkf0KLhukn9QKfL+8c9nG
   EVKzWHZyd75G2Cxn8lNcozCycR+aFZZhQ2rzJibTZeAswsKV/UK+cqQmG
   Qg6rsMKIAvZVNhWfPk9KDJGHOgWMtjGJRw3ZHFA2ABVRC5IHXAosF5Wdg
   cwSohalIiiTjF3IUwSGgQ6EVzRxF3KF/srEvhVdeh0J0HI5UG7IH/MeIY
   NZqURXgKc9RTv6gK3Zl37+t1sBloHEDV+4pBDc5p4j/kpE4lWlHEaDT4x
   khRRMGzgfqSCXnDw1pNVN/GVm0Gy2KPLJP3h4Sg2IyQUIRH+TtNnD4ZTc
   A==;
X-CSE-ConnectionGUID: zH1hA2ngRQu7dnkhJKbQzQ==
X-CSE-MsgGUID: tw5x0l7eQhK8q1clE+SJkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68706791"
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="68706791"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 08:49:46 -0800
X-CSE-ConnectionGUID: 9gSJqiAoRZi1rq57EtuDUQ==
X-CSE-MsgGUID: dd/0y72PSVKaNpJpv2itEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="201881264"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 08:49:43 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Dec 2025 18:49:39 +0200 (EET)
To: Nitin Joshi <nitjoshi@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, njoshi1@lenovo.com, 
    Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v6 1/2] platform/x86: thinkpad_acpi: Add support to detect
 hardware damage detection capability.
In-Reply-To: <20251224095019.11622-1-nitjoshi@gmail.com>
Message-ID: <f359e9e7-ade6-a022-f21e-47a581ab97c7@linux.intel.com>
References: <20251224095019.11622-1-nitjoshi@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 24 Dec 2025, Nitin Joshi wrote:

> Thinkpads are adding the ability to detect and report hardware damage
> status. Add new sysfs interface to identify whether hardware damage
> is detected or not.
> 
> Initial support is available for the USB-C replaceable connector.
> 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Nitin Joshi<nitjoshi@gmail.com>
> ---
> Changes since v1:
> -Split patch between hwdd_status and hwdd_detail
> -Incorporated review comments
> Changes since v2:
> -Control visibility of the sysfs attribute based upon ucdd_supported
> Changes since v3:
> -Fix documentation build warning
> Changes since v4:
> -Removed extra line
> Changes since v5:
> -Improved code indentation
> ---
>  .../admin-guide/laptops/thinkpad-acpi.rst     |  21 ++++
>  drivers/platform/x86/lenovo/thinkpad_acpi.c   | 105 ++++++++++++++++++
>  2 files changed, 126 insertions(+)
> 
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index 4ab0fef7d440..2db05f718b11 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -54,6 +54,7 @@ detailed description):
>  	- Setting keyboard language
>  	- WWAN Antenna type
>  	- Auxmac
> +	- Hardware damage detection capability
>  
>  A compatibility table by model and feature is maintained on the web
>  site, http://ibm-acpi.sf.net/. I appreciate any success or failure
> @@ -1576,6 +1577,26 @@ percentage level, above which charging will stop.
>  The exact semantics of the attributes may be found in
>  Documentation/ABI/testing/sysfs-class-power.
>  
> +Hardware damage detection capability
> +------------------------------------
> +
> +sysfs attributes: hwdd_status
> +
> +Thinkpads are adding the ability to detect and report hardware damage.
> +Add new sysfs interface to identify the damaged device status.
> +Initial support is available for the USB-C replaceable connector.
> +
> +The command to check device damaged status is::
> +
> +        cat /sys/devices/platform/thinkpad_acpi/hwdd_status
> +
> +This value displays status of device damaged
> +- 0 = Not Damaged
> +- 1 = Damaged

This seems to result in not the best formatting for htmldocs:

"This value displays status of device damaged - 0 = Not Damaged - 1 = Damaged"

-- 
 i.

