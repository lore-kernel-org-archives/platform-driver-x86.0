Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E18272E50
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 May 2025 14:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714895; cv=none; b=ku8cJ7cXxm0Lz7gO8LsIHD6SSYoMZbPlOn8eba+UL+feoBxUwAomy6Um2x19lDKsG+T6dohMgVL+tB+hxc83C6rNvSjnmg3Ord3PbKlMvlvMIexwNOfjgPu3Glvm24Bbt+Mv3g4zGzAME4BwjOmzZDpnOID0gKGOtMzLgfx+n/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714895; c=relaxed/simple;
	bh=WEXdRltcrWXosUodxk6Kh2nr95Ef7i+oqlXJIIFZ9aE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=du2351245sZ/LnDTE76xV9xTXOJ68HouzdY46hNYNbVlNDd5v8NNhQFgKX6rk4LuwPe6ov0+ve40RCv0mdajeh3WqyJ4zTjTrF2RXaufga6ZFmWlglJBUQnahDLZvd2Hj4XrebKkgliHrvUm0qVf9EN3CnmVtDQ/SjTwn08U/P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iv2F5wjS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iv2F5wjS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746714894; x=1778250894;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=WEXdRltcrWXosUodxk6Kh2nr95Ef7i+oqlXJIIFZ9aE=;
  b=iv2F5wjSDgvMioVsgU+yBgN/j1Ch8z4h+bemO/T41618ujfc5fl1D+pA
   kZpJ8GYwcmg1jjpW9zPFDh+Jm0Ug/CLU6Dj/M4rA0Rywj9gNJRAO3Hgsx
   dHhRc1wq6+KxPAGAPWLuHAlkwCU27wqOZoCdp8MAdqkfAE+kssRsbVurr
   5rYMKkchbPiZ1T/mYwM3ZIxJpYyk95ez+BGYTqAvf35IiLwD8SGKbUrtT
   plIQabhzd+x3CUONPbahicGGOMPW8BMhNx2TrwwR/X5kS6MloYceDYM/4
   mBZesgMbcGFWcO0BLZZSO7N7ZhDWYkZacNQQfL60qbQRV8QqVkySIDBAg
   g==;
X-CSE-ConnectionGUID: 9zhc9zGWR9aEG8Z3FZr22g==
X-CSE-MsgGUID: +YEw8fRUT5S9lHmUCZWPbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="47608714"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="47608714"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:34:53 -0700
X-CSE-ConnectionGUID: v9exqaEfTKSyOhyArILQOg==
X-CSE-MsgGUID: PQeZCQxRSteDYTV8OVCIkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="136836499"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:34:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 8 May 2025 17:34:48 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v4 1/3] platform/x86/amd/hsmp: Use a single DRIVER_VERSION for
 all hsmp modules
In-Reply-To: <20250506101542.200811-1-suma.hegde@amd.com>
Message-ID: <0f6fcfc6-f79f-e5fc-fa3e-6a6b6a5956c8@linux.intel.com>
References: <20250506101542.200811-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 May 2025, Suma Hegde wrote:

> Use a single DRIVER_VERSION for the plat, hsmp and acpi modules,
> as all these modules are connected to a common functionality.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
> Changes since v3:
> None
> 
> This patch is rebased on https://lore.kernel.org/platform-driver-x86/20250425102357.266790-1-suma.hegde@amd.com/T/#u
> 
> Changes since v2:
> Update the commit message and description
> 
> Changes since v1:
> None
> 
>  drivers/platform/x86/amd/hsmp/acpi.c | 1 -
>  drivers/platform/x86/amd/hsmp/hsmp.c | 2 --
>  drivers/platform/x86/amd/hsmp/hsmp.h | 2 ++
>  drivers/platform/x86/amd/hsmp/plat.c | 1 -
>  4 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index eaae044e4f82..12f4950afcd9 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -28,7 +28,6 @@
>  #include "hsmp.h"
>  
>  #define DRIVER_NAME		"hsmp_acpi"
> -#define DRIVER_VERSION		"2.3"

This fails to apply on top of the review-ilpo-next branch, I've no idea on 
what commit this is based on. Could you please rebase and check if the 
entire series is fine wrt. the changes what this is based on vs what's in 
the review-ilpo-next branch.

--
 i.

>  /* These are the strings specified in ACPI table */
>  #define MSG_IDOFF_STR		"MsgIdOffset"
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index a3ac09a90de4..3df34d7436a9 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -32,8 +32,6 @@
>  #define HSMP_WR			true
>  #define HSMP_RD			false
>  
> -#define DRIVER_VERSION		"2.4"
> -
>  /*
>   * When same message numbers are used for both GET and SET operation,
>   * bit:31 indicates whether its SET or GET operation.
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index d58d4f0c20d5..7877cb97993b 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -25,6 +25,8 @@
>  #define HSMP_DEVNODE_NAME	"hsmp"
>  #define ACPI_HSMP_DEVICE_HID    "AMDI0097"
>  
> +#define DRIVER_VERSION		"2.4"
> +
>  struct hsmp_mbaddr_info {
>  	u32 base_addr;
>  	u32 msg_id_off;
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index 81931e808bbc..4f03fdf988c1 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -24,7 +24,6 @@
>  #include "hsmp.h"
>  
>  #define DRIVER_NAME		"amd_hsmp"
> -#define DRIVER_VERSION		"2.3"
>  
>  /*
>   * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
> 
