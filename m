Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304183C7E1D;
	Thu,  8 Oct 2026 12:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791461356; cv=none; b=eMrC05Bia0/uUUc6W/EMTvASyQplQuHMskpc3O5M0oOvk0geRXdYwq45b5j9qMpenccq1/dlQ4AekOcfugOglOJLdvaFxe5iIpCdC5P4g5L7Px3CFk1fxUTiRpoOaw1Ix1ymGipF2VJttpe3uEhdV/uqeeopU+oGnzanpprAW50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791461356; c=relaxed/simple;
	bh=/YSFPQk3S4NCWQ/IrETBNizbXIwPnIgqk+FGbKeVNSU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rqqr0qxVqMC4v38i4mF1B/4ifpFuIyK+J6uNfXiVEFdOdP9/f2u9USco4yX/Unm9HbuWlAT2/CJWppVsjbFIwbnq0sEYSzEXUhgsBY5GVBybiddLbRvfi/IED/w1x8sX/DWYIEe7Pytb45EIZ+RMskGKgcV9bJ/BZOBuG24WBM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ir1hHhmc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ir1hHhmc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791461355; x=1822997355;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/YSFPQk3S4NCWQ/IrETBNizbXIwPnIgqk+FGbKeVNSU=;
  b=ir1hHhmc3tRNmH3u9skJGbI06oypXpYnNGLg6A9T2RnVGRPmQASVoCTG
   VQfSw4p8DQlan62QafnSZTG5xQ1D4sIDmL+I1Mq82+YqptIDGMB6dejQy
   cjP+yVuyG9BMEyiDvygLbWmQP4iwAaCnRnaTabYCh1TNVT2Vk/EXQiRSw
   ImCRkyTrJs1fRCzKmat/DRwvVAhxcNnrhhXQYmxfIb/pxJQBXYNKWzLWd
   4h6NK3LVpohuRSd/C6/aFEmpLu3kEJsPNkMmDq7afcmRiAcD6s9jQOBpR
   VZqkmy89N2P6dlFnM32HJbzgAdcZA5Uc/oN3uE8gM6TUg2VLUQDnGIISE
   g==;
X-CSE-ConnectionGUID: 0D5SzRwSRIO2tXZDy7WboA==
X-CSE-MsgGUID: n7f8QxMKRqqM/gkerkGJpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="135556"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="135556"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 05:09:14 -0700
X-CSE-ConnectionGUID: gjaqQomhRty2G193C+jYuQ==
X-CSE-MsgGUID: oYpqePm7Rle6fEkcpvLt2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="137895"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.140])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 05:09:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 8 Oct 2026 15:09:09 +0300 (EEST)
To: Mohamed Jouini <amad3v@gmail.com>
cc: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] platform/x86: uniwill-laptop: Add PCSpecialist
 Recoil 16 AMD
In-Reply-To: <20260927014031.3465252-2-amad3v@gmail.com>
Message-ID: <fb9cd6ad-53e5-3c1c-e14a-ba251e485e37@linux.intel.com>
References: <20260927014031.3465252-1-amad3v@gmail.com> <20260927014031.3465252-2-amad3v@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 27 Sep 2026, Mohamed Jouini wrote:

> The PCSpecialist Recoil 16 AMD is a rebadged TUXEDO Stellaris 16 Gen7 AMD
> but reports sys_vendor "PCSpecialist" and board name "X6FR57TY", so the
> existing entry does not match it. Use the Stellaris 16 Gen7 AMD feature
> set.
> 
> Signed-off-by: Mohamed Jouini <amad3v@gmail.com>
> ---
> Changes in v2:
> - Use the existing Stellaris 16 Gen7 AMD feature set (charging profiles)
>   instead of a separate descriptor with the percentage charge limit.
> 
>  drivers/platform/x86/uniwill/uniwill-acpi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index eeead0159..7d39e97fa 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -3268,6 +3268,14 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  		},
>  		.driver_data = &tux_featureset_4_nvidia_descriptor,
>  	},
> +	{
> +		.ident = "PCSpecialist Recoil 16 AMD",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "PCSpecialist"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR57TY"),
> +		},
> +		.driver_data = &tux_featureset_4_nvidia_descriptor,

Hi,

The descriptors were renamed by recent work so could you please rebase 
this on top of the for-next branch and send v3.

-- 
 i.

