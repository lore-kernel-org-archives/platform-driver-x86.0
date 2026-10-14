Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42DF4E3ED9
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 12:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980973; cv=none; b=EsWUQZluETfw24YEgVsXHmxKtncWUpc8oAcmaUCOlybGGHmftbZ/rYyQTLeXelDsOLOsP2jS9GdMlwaCwwLsxiboYhc+0R4zduite8F6D71WHb8uBqVmdB6Byldhmcom1ZX9l9dM+p7TqQWWZ9AHiSEnq9HTtO1zfa8Zoni959o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980973; c=relaxed/simple;
	bh=2MyFmJXEKzbEflgWMRG+W9EmU1OEWoyQsVwTezg1/U0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ny1i/DO4YG/7vVhoxYgoMq1zkch8B+uK//et+KFsbh24l155P9EjJWe21oi17ql6TAQ1ZCf6kJeDF5SUK4BsiYkVJExEv7TmkHJdcAIG5rYtdlPDudk2stJVcZtx5MtdcAo4evqpcQ5xM0fs8hbwV3WMsBMGinH6kjjt/LNYi7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WhsQ4JJg; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WhsQ4JJg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791980971; x=1823516971;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2MyFmJXEKzbEflgWMRG+W9EmU1OEWoyQsVwTezg1/U0=;
  b=WhsQ4JJgMb3kJZ+O+RpOOLEmFAmeabC6OvdtiCQe0i9F3FDnFZ/4PEzJ
   u/D0JgDpNjqYi7usR1lsRAZrRU6m0pweksEnx6u65twoFrUlRNmI3Vk5W
   oCH26mEE7TlDHFIiweQ4cWJ23YPuufOJfP24IptUs5t5+yaEbKkrRXrN1
   WR7a9R4GNYj8LslC+pusKRCbb/yQZDEofEbj2Knf6OHQKs68wCYAmzSeN
   uWZHp+sI0D1MRZLyxwgaSDFJwtKF2S6jRPoJomtc3CyLSWaiSp5vm73Cj
   XZCSfHx1m/fMdwW2Kz+xishzqviBZjntqAcxy4pCa9Xb95SBIetn+oBOi
   A==;
X-CSE-ConnectionGUID: 7PdUyqGgQWOViQrXI74Kpw==
X-CSE-MsgGUID: LG+ACPpWQ4CcavuJY0Lktg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="735166"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="735166"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 05:29:30 -0700
X-CSE-ConnectionGUID: Fbk2cuoMTByycD4GZ9IUPQ==
X-CSE-MsgGUID: 9Ns6/BPTSOOxnv1vKvcqWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1505796"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.234])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 05:29:28 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 14 Oct 2026 15:29:23 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com
Subject: Re: [PATCH v3] platform/x86/amd/pmf: Fix ACPI buffer validation in
 APTS path
In-Reply-To: <20261005072811.1378555-1-Shyam-sundar.S-k@amd.com>
Message-ID: <38298423-a12a-123d-9a8d-1b80e121f0df@linux.intel.com>
References: <20261005072811.1378555-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 Oct 2026, Shyam Sundar S K wrote:

> apts_if_call_store_buffer() reads a u16 size from info->buffer.pointer
> without checking it is non-NULL and at least 2 bytes long, so a short or
> NULL firmware buffer can cause an out-of-bounds read.
> 
> Add a common helper, amd_pmf_if_verify_buffer(), that validates the
> buffer (type, NULL or short pointer, header and output size) and returns
> the size on success. Call it from both apts_if_call_store_buffer() and
> apmf_if_call_store_buffer().
> 
> Fixes: 3eecb434d7f2 ("platform/x86/amd/pmf: Add support to get sps default APTS index values")
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

This doens't apply cleanly, please rebase.

--
 i.

> ---
> v3:
>  - Move full buffer validation (type, NULL or short pointer, header and
>    output size checks) into verify buffer helper.
> 
> v2:
>  - Add a helper function for NULL pointer and buffer validation. Reuse it
>    in apmf_if_call_store_buffer() and apts_if_call_store_buffer().
> 
>  drivers/platform/x86/amd/pmf/acpi.c | 70 +++++++++++++----------------
>  1 file changed, 30 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 3d94b03cf794..59173bcc3750 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -50,47 +50,54 @@ static union acpi_object *apmf_if_call(struct amd_pmf_dev *pdev, int fn, struct
>  	return buffer.pointer;
>  }
>  
> -static int apmf_if_call_store_buffer(struct amd_pmf_dev *pdev, int fn, void *dest, size_t out_sz)
> +static int amd_pmf_if_verify_buffer(struct amd_pmf_dev *pdev,
> +				    union acpi_object *info, size_t out_sz)
>  {
> -	union acpi_object *info;
>  	size_t size;
> -	int err = 0;
> -
> -	info = apmf_if_call(pdev, fn, NULL);
> -	if (!info)
> -		return -EIO;
>  
>  	if (info->type != ACPI_TYPE_BUFFER) {
>  		dev_err(pdev->dev, "object is not a buffer\n");
> -		err = -EINVAL;
> -		goto out;
> +		return -EINVAL;
>  	}
>  
> -	if (info->buffer.length < 2) {
> -		dev_err(pdev->dev, "buffer too small\n");
> -		err = -EINVAL;
> -		goto out;
> +	if (!info->buffer.pointer || info->buffer.length < 2) {
> +		dev_err(pdev->dev, "buffer pointer is NULL or too small\n");
> +		return -EINVAL;
>  	}
>  
>  	size = *(u16 *)info->buffer.pointer;
>  	if (info->buffer.length < size) {
> -		dev_err(pdev->dev, "buffer smaller then headersize %u < %zu\n",
> +		dev_err(pdev->dev, "buffer smaller than headersize %u < %zu\n",
>  			info->buffer.length, size);
> -		err = -EINVAL;
> -		goto out;
> +		return -EINVAL;
>  	}
>  
>  	if (size < out_sz) {
>  		dev_err(pdev->dev, "buffer too small %zu\n", size);
> -		err = -EINVAL;
> -		goto out;
> +		return -EINVAL;
>  	}
>  
> +	return (int)size;
> +}
> +
> +static int apmf_if_call_store_buffer(struct amd_pmf_dev *pdev, int fn, void *dest, size_t out_sz)
> +{
> +	union acpi_object *info;
> +	int size;
> +
> +	info = apmf_if_call(pdev, fn, NULL);
> +	if (!info)
> +		return -EIO;
> +
> +	size = amd_pmf_if_verify_buffer(pdev, info, out_sz);
> +	if (size < 0)
> +		goto out;
> +
>  	memcpy(dest, info->buffer.pointer, out_sz);
>  
>  out:
>  	kfree(info);
> -	return err;
> +	return size < 0 ? size : 0;
>  }
>  
>  static union acpi_object *apts_if_call(struct amd_pmf_dev *pdev, u32 state_index)
> @@ -125,37 +132,20 @@ static int apts_if_call_store_buffer(struct amd_pmf_dev *pdev,
>  				     u32 index, void *data, size_t out_sz)
>  {
>  	union acpi_object *info;
> -	size_t size;
> -	int err = 0;
> +	int size;
>  
>  	info = apts_if_call(pdev, index);
>  	if (!info)
>  		return -EIO;
>  
> -	if (info->type != ACPI_TYPE_BUFFER) {
> -		dev_err(pdev->dev, "object is not a buffer\n");
> -		err = -EINVAL;
> -		goto out;
> -	}
> -
> -	size = *(u16 *)info->buffer.pointer;
> -	if (info->buffer.length < size) {
> -		dev_err(pdev->dev, "buffer smaller than header size %u < %zu\n",
> -			info->buffer.length, size);
> -		err = -EINVAL;
> -		goto out;
> -	}
> -
> -	if (size < out_sz) {
> -		dev_err(pdev->dev, "buffer too small %zu\n", size);
> -		err = -EINVAL;
> +	size = amd_pmf_if_verify_buffer(pdev, info, out_sz);
> +	if (size < 0)
>  		goto out;
> -	}
>  
>  	memcpy(data, info->buffer.pointer, out_sz);
>  out:
>  	kfree(info);
> -	return err;
> +	return size < 0 ? size : 0;
>  }
>  
>  int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index)
> 
