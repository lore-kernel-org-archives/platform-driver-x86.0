Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01C62F2D
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Feb 2024 13:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709040504; cv=none; b=p2qMGG8nG4eo3eK9sugpzRHPklmkic6ieKetB3J+SvCI71EPuoBFPYBp5DCVodnyOXn+seK395ivz4Y+1uA18bowR9EPEZwegtpWi9B2Wca/gVyo/ajhNYD2Qv/kYCQ+h5C8LqsHg7GFAcSOXIovLBaDibr1zcpInvsgT31OsQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709040504; c=relaxed/simple;
	bh=wJHfsM1P2z2QSojnja8D+tpbSXOYGtQgaHRSfYLDNig=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=I7DstRf7ZBV8AZrvYt/FqB4I58N9TUgPo6ljYA84XQKXS9pI/AqC/ZYIREBfFi85Vt31FZemShaEcbePWfkdbQgRt+R8sFC9LahDKREQLdwhZP4m4uafKuuVcATFGv6407JQof34lKdgscI8oiHonFShnwffX3sIX7sp7wj76ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2v+zp4R; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2v+zp4R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709040503; x=1740576503;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=wJHfsM1P2z2QSojnja8D+tpbSXOYGtQgaHRSfYLDNig=;
  b=M2v+zp4R1GnPWY3PgQSHJ/ccWVvbXy7LvUTRzQUjXDxbzCYVu2Oldzjy
   XvOHTA5NWeUTJnPaVCCSqZUABUKuumXAOg35yEI57DxoKwYrIhMIB98fO
   vdqDK8Rp96AhNkvN2V7Ofxy3t3VDONYYnrVXUWs4LVh4uGV26OGQsTtDA
   hMT/2pE/0hKFV3K4yzPMYlDKcZKTaYcL01eVd837vbs3Q3xNRWCuHeBuf
   kwN8Ct1aUdgo3BgkkiCDnyrMdnYv8YQ6TqUXrcXaPgbnHWFzdNMWROGHx
   pkDCjewvUcyL3ueg19bknvz71Y1cHG+Dpmw15OizTya7JTfx+sy2c4QGj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="14017195"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="14017195"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 05:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="7188623"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.34.61])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 05:28:19 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 27 Feb 2024 15:28:15 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com
Subject: Re: [PATCH 3/7] platform/x86/amd/pmf: Add support to get sbios
 requests in PMF driver
In-Reply-To: <20240227125520.3153140-4-Shyam-sundar.S-k@amd.com>
Message-ID: <1358d40e-5114-2d1d-c679-342cf3ca0989@linux.intel.com>
References: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com> <20240227125520.3153140-4-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 Feb 2024, Shyam Sundar S K wrote:

> Update the APMF function index 2 for family 1Ah, that gets the
> information of  SBIOS requests (like the pending requests from BIOS,

extra space.

> custom notifications, updation of power limits etc).
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/acpi.c |  6 ++++++
>  drivers/platform/x86/amd/pmf/pmf.h  | 13 +++++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 1f287a147c57..1b2a099c0cef 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -166,6 +166,12 @@ int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data
>  	return apmf_if_call_store_buffer(pdev, APMF_FUNC_AUTO_MODE, data, sizeof(*data));
>  }
>  
> +int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v2 *req)
> +{
> +	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
> +									req, sizeof(*req));

Fix the alignment please.

> +}
> +
>  int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req)
>  {
>  	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 4364af72a7a3..f11d2a348696 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -116,6 +116,18 @@ struct apmf_sbios_req {
>  	u8 skin_temp_hs2;
>  } __packed;
>  
> +struct apmf_sbios_req_v2 {
> +	u16 size;
> +	u32 pending_req;
> +	u8 rsvd;
> +	u32 update_ppt_pmf;
> +	u32 update_ppt_pmf_apu_only;
> +	u32 update_stt_min;
> +	u8 update_stt_apu;
> +	u8 update_stt_hs2;

Is it intentional that these do not match with the names in struct 
apmf_sbios_req? I mean some of the fields look suspiciously close in name 
so is the purpose still the same and somebody just invented new names for the 
same field?


-- 
 i.

