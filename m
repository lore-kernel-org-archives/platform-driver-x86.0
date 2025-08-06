Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AE3288CA1
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Aug 2025 09:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754472601; cv=none; b=llbp0G4EWomiEftiPu98boVsx0KeokMQtUkZs9yEquqrUKbtbdF6HPUyn1rXLWG1iTk9uUX/+XdNlZRvPymjaWgKiQreZ3YGDCD/pJxs6pWIvIy+81CELn8F1dnUefBybs+Ph/YUZa0HugNNx1XEixrUlmgRV2TKm0DyJyrYTCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754472601; c=relaxed/simple;
	bh=qsVbJ9nNfWipJWxXH+Rz4x5A+6mCQsVp2sM5c5T+4NY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=N+Acq9+WCDOT37O55C/kLQaamFUA4QnTuW76JrOe6fFfnH3HgiuVk1TrE/36MtiEHrps7xj3MaSEQj3ZpBk0mTX9czLL76NsWBMq6SQqDzgMHTX89z46AIjVkcaDiRJa072CkYPC15gx8kpSl0GJov6vvG70rfSe6n6EVHGRHQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XBOpjDkN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XBOpjDkN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754472600; x=1786008600;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=qsVbJ9nNfWipJWxXH+Rz4x5A+6mCQsVp2sM5c5T+4NY=;
  b=XBOpjDkNa3eIa3U6L3a/753IfRvLsqIfAS4WaUT5j+zNyH8ufZCtCCkI
   c1lI/FaJDHFpAzdzieFXVcmQog43nK4KAPGuwz15susCn1NS6m7ddBla1
   3Mak1/FpDEpFQTzpVKpvqETamWTegWZBnyCCdzsejPwMyfhXPvy8TlBfk
   BlpvejNMiqdL9QjUuSZNmGXG+ERnjzML5RI27eLuC35LZgszfzX6ge0C5
   Fz3DqgLQxH6+DKskZzK7oazokjfvOfjtoRmawJ+nEcTLEcWzUdgXSqnQP
   Eo74EUr3KbIFRZk2xFDlMqdoWXOTnDXQNj/Id+pMZDHlgGikoirPqzN8f
   Q==;
X-CSE-ConnectionGUID: uxN1ni1DS0KTv3bse1VAVg==
X-CSE-MsgGUID: XteTJZ2CTbyfbvsxLDlJuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="67373783"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="67373783"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 02:29:59 -0700
X-CSE-ConnectionGUID: fWkAVNCnSf2AeabuTQgW/A==
X-CSE-MsgGUID: aJH1WLm4TuK2xUPyHhuQsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="195696225"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.170])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 02:29:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 6 Aug 2025 12:29:54 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86/amd/hsmp: Ensure sock->metric_tbl_addr is
 non-NULL
In-Reply-To: <20250805091911.483825-1-suma.hegde@amd.com>
Message-ID: <909dcc58-2c0d-1e23-f7a2-2935c91d2512@linux.intel.com>
References: <20250805091911.483825-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Aug 2025, Suma Hegde wrote:

> If metric table address is not allocated, accessing metrics_bin will
> result in a null pointer dereference, so add a check.

NULL

> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>

Missing a Fixes tag?

> ---
> Rebased on review-ilpo-next
> 
>  drivers/platform/x86/amd/hsmp/hsmp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 885e2f8136fd..19f82c1d3090 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -356,6 +356,11 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
>  	if (!sock || !buf)
>  		return -EINVAL;
>  
> +	if (!sock->metric_tbl_addr) {
> +		dev_err(sock->dev, "Metrics table address not available\n");
> +		return -ENOMEM;
> +	}
> +
>  	/* Do not support lseek(), also don't allow more than the size of metric table */
>  	if (size != sizeof(struct hsmp_metric_table)) {
>  		dev_err(sock->dev, "Wrong buffer size\n");

Unrelated to this patch, I guess the "Failed to init metric table" errors 
should be downgraded to dev_warn() or dev_info() since the driver 
continues without it.

-- 
 i.

