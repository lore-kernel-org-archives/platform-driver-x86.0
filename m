Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0204483A0;
	Thu, 17 Sep 2026 09:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635821; cv=none; b=m9bKDosMfBwn75n6MoJMKNCT+husPIprS2tpmia+oMX4opxoncb/hFxK1fgpZX3OWZJobuxUO54uqMFI7WP3R0+JwbA8z7Cz1reXYbktTYSSjaV97775UIBX0In3+lI8xtUWhvB8Ok6HUG3+Kv2OAab/g8sbf+i5p43aO6+Y9KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635821; c=relaxed/simple;
	bh=+etZYcAerQ6xGXxA4sOP8clfLpSbr8/v1wNNPdMT3Z0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ojZ5uYibXxUqba1GL72Ek7FhANX5oTJyRlFXxBzDI6N1k57uyKGDFLnedM9phAaUm8uwBj41C6e7GpSaQ8riVtcBkjo0BxrIPTi5QXNxpKQikv0zBr1EcATaY7LUZa2ellRUI7uwTmyfVxID9Jewl15e89jT0JUdMb0fU64g+IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mJeoNvvD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mJeoNvvD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789635820; x=1821171820;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=+etZYcAerQ6xGXxA4sOP8clfLpSbr8/v1wNNPdMT3Z0=;
  b=mJeoNvvD2KNwH1P9bs4dTEOgAlXK0U/ixIgGalSHZql2wdb3oSjxUNq6
   f56MiObi7rmgJ7vOqBssGfXRtP0jwILR1uuhiALF8RvN6lqcSXrIlZo8o
   9hDCYXNEybdXSocJKyPZ+FfN81GuyEMWO8sbvHydT325C9nBYs1mliUIq
   MS9/t5DC0z5A7cvWRpHXGdFONfl6U9ksccm6aGTaC9dkG5+8w5pfSSaYT
   Ki4Odgy/9BX5yQdErJnCAvNP0e7HCDEpjPJJs2mMBBQYnoYIOju5VsqHl
   MKIGm9ahjEWmnujnDKkWqEorSAzv4mBAsK3dJB4wbvbd4/Kiv04eym9hX
   A==;
X-CSE-ConnectionGUID: RWM+5uTMTryYlG1qp1LK6A==
X-CSE-MsgGUID: Ngkmu+VpRIesVQ/VA+UgoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100634910"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100634910"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 02:03:39 -0700
X-CSE-ConnectionGUID: klOR6fufSKiR+xg6iUTvIg==
X-CSE-MsgGUID: XzRldXV2R6aAb3d0igiUTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1883063"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.62])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 02:03:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Sep 2026 12:03:32 +0300 (EEST)
To: chipang_kao <prozac2734@gmail.com>, W_Armin@gmx.de
cc: Hans de Goede <hansg@kernel.org>, bryan.odonoghue@linaro.org, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    chipang_kao <chipang_kao@asus.com>
Subject: Re: [PATCH 0/2] platform: Enable ACPI WMI and ASUS WMI driver for
 ARM64
In-Reply-To: <20260917021055.8029-1-chipang_kao@asus.com>
Message-ID: <1b64ae74-5e62-8cd2-c633-e5451aa9dec4@linux.intel.com>
References: <20260917021055.8029-1-chipang_kao@asus.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Sep 2026, chipang_kao wrote:

> This series enables ACPI WMI core support and the ASUS WMI platform
> driver on ARM64 architectures.
> 
> ACPI WMI is not limited to x86 platforms. Modern ARM64 laptops and
> platforms have adopted ACPI WMI to expose vendor-specific features
> such as hotkeys and fan control.
> 
> To support these devices:
> 1. Removes the strict 'X86' dependency from CONFIG_ACPI_WMI.
> 2. Updates the ARM64 platform driver infrastructure to allow
>    building the ASUS WMI driver without duplicating source code.
> 
> chipang_kao (2):
>   platform/wmi: Remove X86 dependency for ACPI_WMI
>   platform/arm64: Enable ASUS WMI driver support
> 
>  drivers/platform/arm64/Kconfig  | 46 +++++++++++++++++++++++++++++++++
>  drivers/platform/arm64/Makefile |  2 ++
>  drivers/platform/wmi/Kconfig    |  2 +-
>  3 files changed, 49 insertions(+), 1 deletion(-)

Thanks, but there's already a series to this effect under discussion:

  https://lore.kernel.org/all/20260724025959.142826-1-W_Armin@gmx.de/

If you have some insight, please comment on that thread.

My hope is that the other series will be ready for merging within this 
kernel cycle.

-- 
 i.

