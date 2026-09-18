Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465004AA56F;
	Fri, 18 Sep 2026 11:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731795; cv=none; b=TJnYLIC3oJ9JftLnLDYZwVVijNyWGYvTW7sjk07bKfOFNFNNWpnOYXWv1m7lSvuX2A5OvlKeWUNBEG4n7qdnSceB0k2fX9rEO3WVFfmVm89RA/HLtyD9gPqIUX2gIRvB2fQIof4EUckejnDmoqcLPUwJn90VFVAVTQuirckHNEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731795; c=relaxed/simple;
	bh=onUc9JqbjuAPAz/9UK3t/8vAhb52h9QajNBbzRYlWVo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EuRopYJTYHy0E9kcXR2AuasPD86x9cxc6qqQixuhbnowiwBjUtZkTepsC0Rew8Aen7m++I/OQ/0KYEy7Qu0AkemxUrC1msle27tKkiLI9RTxP9KRgbiifiHXpxEfEs2QDS1ny8YjVdz9cpZO7Z6WIP5MIewIboNjl6AjOaUv/zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MyuWKtyN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MyuWKtyN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789731793; x=1821267793;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=onUc9JqbjuAPAz/9UK3t/8vAhb52h9QajNBbzRYlWVo=;
  b=MyuWKtyNHgOk9g5Fmb/abW48ZaTIVQvlztFaDFj0GSPDL9W3zL8SlqYB
   k4K3H61fydE3qm66KJvKHpri0kUo/w6cficXNuh29W8I1oLO9LIMFcBmw
   DO25E1YiTKwINeL4X1ZXf8rO/KtjLxo/eGjXAA829GS2zRrGCsIMTy+7g
   LTCqAg+cEKCd3qCKxeKlxREoAiZOADtXpohGEopl/FMgZeV3gKzUAyVjT
   VWGKoMCuflC7Cx6jFBvpGkTEE6mNoxNIN57t1qRz+TjuI9C09qjXPI2jh
   pAAiDlA+jd6MKnxOtLFs5DoXCoE10VAALE6RMPlh3hkjZ8CbtSuJpKA5j
   g==;
X-CSE-ConnectionGUID: 1Wkq98gVRkq6kfVkiSd1Dg==
X-CSE-MsgGUID: OE1WKXOUQA6kW2NC2YoG1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="89368122"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="89368122"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:43:13 -0700
X-CSE-ConnectionGUID: ezLE/4tLRxqyuVI2Oe7JlQ==
X-CSE-MsgGUID: RjK1UMU3RLGELhA1Gtv8EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="271682216"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:43:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 18 Sep 2026 14:43:07 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: Mario.Limonciello@amd.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, 
    Mario Limonciello <superm1@kernel.org>
Subject: Re: [PATCH v5 3/4] platform/x86/amd/hsmp: Add ACPI client support
 for Family 1Ah
In-Reply-To: <20260901045134.2833282-4-muralidhara.mk@amd.com>
Message-ID: <af7a2864-a632-7c5a-1c69-11a968839ca2@linux.intel.com>
References: <20260901045134.2833282-1-muralidhara.mk@amd.com> <20260901045134.2833282-4-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Sep 2026, Muralidhara M K wrote:

> The ACPI HSMP device (HID AMDI0097) on the Family 1Ah client platforms
> (Models 80h-8Fh and E0h-E3h) describes its mailbox the same way server
> platforms already do, via _CRS/_DSD, so hsmp_parse_acpi_table() and
> hsmp_get_uid() need no client-specific handling.
> 
> Client platforms don't report a server protocol version, so also gate
> the metric table DRAM base lookup on is_client_platform() alongside
> the existing proto_ver check, so client platforms get their metric
> table base initialized too.
> 
> hsmp_pdev->proto_ver holds the Ryzen Master SMC interface version on
> client platforms, a separate numbering space from the server protocol
> versions in enum hsmp_proto_versions, so gate on it using its own
> RYZEN_MASTER_PROTO_VER1 rather than assuming every client platform is
> ready for the metric table lookup regardless of interface version.
> 
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>  arch/x86/include/uapi/asm/amd_hsmp.h | 9 +++++++++
>  drivers/platform/x86/amd/hsmp/acpi.c | 3 ++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
> index 00ca7855ca00..3e1b7cbe0f04 100644
> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
> @@ -95,6 +95,15 @@ enum hsmp_proto_versions {
>  	HSMP_PROTO_VER7
>  };
>  
> +/*
> + * The Ryzen Master SMC interface versions its own way, reported by
> + * HSMP_CLIENT_GET_INTERFACE_VER. It is a separate numbering space from
> + * enum hsmp_proto_versions above, which only applies to the server set.
> + */
> +enum ryzen_master_proto_versions {
> +	RYZEN_MASTER_PROTO_VER1 = 1,
> +};
> +
>  struct hsmp_msg_desc {
>  	int num_args;
>  	int response_sz;
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 8257cd1da48e..43d746546536 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -557,7 +557,8 @@ static int init_acpi(struct device *dev)
>  		return ret;
>  	}
>  
> -	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
> +	if ((is_client_platform() && hsmp_pdev->proto_ver >= RYZEN_MASTER_PROTO_VER1) ||
> +	    hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {

sashiko also warns that !is_client_platform() is not done for the second 
part of the check, which may eventually lead to spurious matches on the 
second check on a client platform.


-- 
 i.

