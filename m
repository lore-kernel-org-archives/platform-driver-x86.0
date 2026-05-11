Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B0A3FBEAC;
	Mon, 11 May 2026 14:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778509246; cv=none; b=jXEBuzwQBR/3VXPP+0EiyFf98zq4KOmJuMhv5ZLjMnOHEV6W4nrWKsxUJrx9cqPbbASvj9c9A/KBrSG2VMEdJPhIzjsf/HRVIVe8cowwd1T39v4Evnon9uM56iKcAazy+guNnzDlXM3JZITGsAJpLWKU2uyngKlGELd1tZQIBcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778509246; c=relaxed/simple;
	bh=3vX/vEotFaZ0SMLvY++q2Cxee5R6yWvMGqiVQVO6+Es=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pZ6xsMjlZGO/eeBT13Kd0ZZaTdtZNGB6iUjJS/gQ7FINijpsuA399NBvkfcgebK0OQMcpnJuta46ON/ysvJPVEKM5V0AKWDZVGfvoupBp8Bu3EPQKqWq8rRQrY2V6rWjjPwT6jFM2vlGMRdgrvJbBUL7c7fyVda370VQT9Gno4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUF5Azjj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUF5Azjj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778509245; x=1810045245;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3vX/vEotFaZ0SMLvY++q2Cxee5R6yWvMGqiVQVO6+Es=;
  b=lUF5Azjj47LDD9sktOhU4cx7oMcf4OG8EAFH+K6VxQrRgkUFmlIEJq+a
   HsvWZ8uYzqNd78gkXu4srUvS06cvuEzwswCPYe5cGor0hAnZQvB4BsWdb
   SRORn8rVQCIhrJ/DjsNfaXpFOjFL8JeK4uaiXndwd7FdoKZ1mueS9CSKJ
   f2rfo3xfpRpglL1S3j7KoI+79FF2jgyOjaybRLStXQXsF89F2RmnSFg4A
   LdOyAPRyPBAsCDwrPjKusC0jyWaBmYLh05mGn0zZymMRPnC5cU315v+Wf
   g3tKf+F1jjHxJM0dTnLJaMYSHfKQfxefSAjep328riOhmG4VGCAG2lm8h
   Q==;
X-CSE-ConnectionGUID: On32nVuVR9+WyIsOxaz9NQ==
X-CSE-MsgGUID: aEeKn2OvSAiGYh/U01ILlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="66927341"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="66927341"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 07:20:44 -0700
X-CSE-ConnectionGUID: x79k8kGrTtunX/7Ay9SrlQ==
X-CSE-MsgGUID: cJk5a3ThRtKllXLUhEU3Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="267823746"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.28])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 07:20:41 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 11 May 2026 17:20:37 +0300 (EEST)
To: Krishnamoorthi M <krishnamoorthi.m@amd.com>
cc: mario.limonciello@amd.com, Hans de Goede <hansg@kernel.org>, 
    Shyam-sundar.S-k@amd.com, perry.yuan@amd.com, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86/amd: hfi: Support for ranking table
 versions
In-Reply-To: <20260507190926.1211726-1-krishnamoorthi.m@amd.com>
Message-ID: <cb917e96-db3e-baf8-91a0-8bba4ba97208@linux.intel.com>
References: <20260507190926.1211726-1-krishnamoorthi.m@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 May 2026, Krishnamoorthi M wrote:

> Add changes to support new ranking table version. Version 2 of the
> heterogeneous ranking table provides static CPU rankings. Version 3 adds
> dynamic ranking table support on newer AMD platforms. These changes ensure
> that platforms still reporting version 2 continue to function with the
> existing static ranking path, avoiding regressions on older hardware
> that does not supply a dynamic ranking table.
> 
> Signed-off-by: Krishnamoorthi M <krishnamoorthi.m@amd.com>

Hi,

Don't we want to have Cc: stable@vger.kernel.org # 6.17 for this?

(I can add it if that's the case, no need to resubmit because of it.)

-- 
 i.

> ---
>  drivers/platform/x86/amd/hfi/hfi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hfi/hfi.c b/drivers/platform/x86/amd/hfi/hfi.c
> index 83863a5e0fbc..e0ebcb0c4acd 100644
> --- a/drivers/platform/x86/amd/hfi/hfi.c
> +++ b/drivers/platform/x86/amd/hfi/hfi.c
> @@ -33,7 +33,8 @@
>  
>  #define AMD_HFI_DRIVER		"amd_hfi"
>  #define AMD_HFI_MAILBOX_COUNT		1
> -#define AMD_HETERO_RANKING_TABLE_VER	2
> +#define AMD_HETERO_RANKING_TABLE_MIN_VER	2
> +#define AMD_HETERO_RANKING_TABLE_MAX_VER	3
>  
>  #define AMD_HETERO_CPUID_27	0x80000027
>  
> @@ -158,7 +159,8 @@ static int amd_hfi_fill_metadata(struct amd_hfi_data *amd_hfi_data)
>  		dev_err(amd_hfi_data->dev, "invalid signature in shared memory\n");
>  		return -EINVAL;
>  	}
> -	if (amd_hfi_data->shmem->version_number != AMD_HETERO_RANKING_TABLE_VER) {
> +	if (amd_hfi_data->shmem->version_number < AMD_HETERO_RANKING_TABLE_MIN_VER ||
> +	    amd_hfi_data->shmem->version_number > AMD_HETERO_RANKING_TABLE_MAX_VER) {
>  		dev_err(amd_hfi_data->dev, "invalid version %d\n",
>  			amd_hfi_data->shmem->version_number);
>  		return -EINVAL;
> 
