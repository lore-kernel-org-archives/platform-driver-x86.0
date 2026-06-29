Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D491A36CDF2;
	Mon, 29 Jun 2026 12:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782737191; cv=none; b=TxXwM8Df0qXnd8b9ftZrb1rC/Jsm0VkNuPgsnWZrgxvtlWq5if/SDkqrXYq9F243E7GLhfFLGVk38wPQQTf3NAFcvmTkRFK/uAB2/JomFL/LTpLgcvvqLgQ6nT3+P078T5b7PZ6zenIyXYWZbatPhIT6bpGwYa70KUg5a+91BKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782737191; c=relaxed/simple;
	bh=zLL0MwqkRs2nuG/JEjzHH3UyyV+wpmGozGxMwrhzbpg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GLCWY2hqNXKnpDIsvH/1nnKV+OO/Dkln0Cl23ljLbJuZ33rk1YxwwtYwtrOvnhk7JQuHs76K7IiIi8QdFBANNflgJdnkdhiCmXbiTI9iCSuQ1hZ+Fs1zqlNAJQxJ3SfAzcHnNyp+TtIfgggtOAdJsQwtpSIT4zb8xITBC1Hx6OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=itDy9mT6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="itDy9mT6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782737190; x=1814273190;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zLL0MwqkRs2nuG/JEjzHH3UyyV+wpmGozGxMwrhzbpg=;
  b=itDy9mT6WkA0RrEMoNVfIVsfSuh6zskpEOrR60hlcnRBQkr+VvlOb0AL
   LepJII8bOMvg1M+nUa0V2bcrEXtECzPaZdBGmLoQlSx0iDXFpblvL/UrR
   h610wGSkb1MSLJYpa4DSjA2zNS6SdTWO28LOGvYqVoLt0HQzQ/Gik1t/z
   UuBZk6tmLCavFQSwonWcM2opSDysyoYJmQLS3UZUHJHiQQ+8pU/tTKnaG
   fEpgYi7KGzKsMs9+yqjzpWZ6YevV0RAhsPa8IsmS5pIL5EXE3gQCczeKI
   EkcYTIzrtUhFX7l1r0ILSWOPF8J7MGxRL8qcHNP59RDXunoP099+B8yzu
   g==;
X-CSE-ConnectionGUID: SxsAu+nwTbyuLiKUxd9W9w==
X-CSE-MsgGUID: QbkjmP0rQLGIrD55NM3mng==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="106217459"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="106217459"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 05:46:29 -0700
X-CSE-ConnectionGUID: hNm9td71QV6wx8HapOLGvQ==
X-CSE-MsgGUID: nKAc7ZyTS62ohkDP3f4eyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="247977120"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.42])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 05:46:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Jun 2026 15:46:24 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] platform/x86/amd/hsmp: Pass struct device explicitly
 to ACPI mailbox parsers
In-Reply-To: <20260629073923.1595696-4-muralidhara.mk@amd.com>
Message-ID: <74e6fd67-4c10-8efa-7565-dab0dd008b5d@linux.intel.com>
References: <20260629073923.1595696-1-muralidhara.mk@amd.com> <20260629073923.1595696-4-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Jun 2026, Muralidhara M K wrote:

> hsmp_read_acpi_crs() and hsmp_read_acpi_dsd() read the ACPI handle and
> emit error messages via sock->dev.  Pass the struct device explicitly to
> both helpers instead of reading it back from sock->dev.
> 
> This is a pure refactor with no functional change; it prepares for
> publishing sock->dev as the data-plane readiness gate only after the
> socket has been fully initialized, so the parsers must not depend on
> sock->dev already being set.
> 
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> Link: https://lore.kernel.org/platform-driver-x86/20260625123337.886435-5-muralidhara.mk@amd.com/T/#u [1]
> ---
>  drivers/platform/x86/amd/hsmp/acpi.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 8c3185ae6395..f7fbba4c6b66 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -107,7 +107,7 @@ static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
>  	return AE_OK;
>  }
>  
> -static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
> +static int hsmp_read_acpi_dsd(struct hsmp_socket *sock, struct device *dev)
>  {
>  	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
>  	union acpi_object *guid, *mailbox_package;
> @@ -116,10 +116,10 @@ static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
>  	int ret = 0;
>  	int j;
>  
> -	status = acpi_evaluate_object_typed(ACPI_HANDLE(sock->dev), "_DSD", NULL,
> +	status = acpi_evaluate_object_typed(ACPI_HANDLE(dev), "_DSD", NULL,
>  					    &buf, ACPI_TYPE_PACKAGE);
>  	if (ACPI_FAILURE(status)) {
> -		dev_err(sock->dev, "Failed to read mailbox reg offsets from DSD table, err: %s\n",
> +		dev_err(dev, "Failed to read mailbox reg offsets from DSD table, err: %s\n",
>  			acpi_format_exception(status));
>  		return -ENODEV;
>  	}
> @@ -142,7 +142,7 @@ static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
>  	guid = &dsd->package.elements[0];
>  	mailbox_package = &dsd->package.elements[1];
>  	if (!is_acpi_hsmp_uuid(guid) || mailbox_package->type != ACPI_TYPE_PACKAGE) {
> -		dev_err(sock->dev, "Invalid hsmp _DSD table data\n");
> +		dev_err(dev, "Invalid hsmp _DSD table data\n");
>  		ret = -EINVAL;
>  		goto free_buf;
>  	}
> @@ -192,14 +192,14 @@ static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
>  	return ret;
>  }
>  
> -static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
> +static int hsmp_read_acpi_crs(struct hsmp_socket *sock, struct device *dev)
>  {
>  	acpi_status status;
>  
> -	status = acpi_walk_resources(ACPI_HANDLE(sock->dev), METHOD_NAME__CRS,
> +	status = acpi_walk_resources(ACPI_HANDLE(dev), METHOD_NAME__CRS,
>  				     hsmp_resource, sock);
>  	if (ACPI_FAILURE(status)) {
> -		dev_err(sock->dev, "Failed to look up MP1 base address from CRS method, err: %s\n",
> +		dev_err(dev, "Failed to look up MP1 base address from CRS method, err: %s\n",
>  			acpi_format_exception(status));
>  		return -EINVAL;
>  	}
> @@ -207,10 +207,10 @@ static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
>  		return -EINVAL;
>  
>  	/* The mapped region should be un-cached */
> -	sock->virt_base_addr = devm_ioremap_uc(sock->dev, sock->mbinfo.base_addr,
> +	sock->virt_base_addr = devm_ioremap_uc(dev, sock->mbinfo.base_addr,
>  					       sock->mbinfo.size);
>  	if (!sock->virt_base_addr) {
> -		dev_err(sock->dev, "Failed to ioremap MP1 base address\n");
> +		dev_err(dev, "Failed to ioremap MP1 base address\n");
>  		return -ENOMEM;
>  	}
>  
> @@ -232,12 +232,12 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>  	dev_set_drvdata(dev, sock);
>  
>  	/* Read MP1 base address from CRS method */
> -	ret = hsmp_read_acpi_crs(sock);
> +	ret = hsmp_read_acpi_crs(sock, dev);
>  	if (ret)
>  		return ret;
>  
>  	/* Read mailbox offsets from DSD table */
> -	return hsmp_read_acpi_dsd(sock);
> +	return hsmp_read_acpi_dsd(sock, dev);

It would probably make more sense to have the arguments other way around 
(dev, sock) in both of these calls as dev is "complete" and we're still 
filling sock at this point.

-- 
 i.

