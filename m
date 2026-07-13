Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069C0384CD6;
	Mon, 13 Jul 2026 11:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783941536; cv=none; b=CHk2vNYP/1beyf1sERFZXCPHsu92Mhj0uY629v/1CY9dX1xqCRnQFvsAWPKxV1sN9FDirJYSv32b7hn+QRvxT6OBp+YPIc1V6pBfgmwAKMdg03JIyOlVo0sD7d7eE00KTM64H9QNmIOPwjxCq7OZaE+F8nzx3ju4TrDW8P/AvQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783941536; c=relaxed/simple;
	bh=LSc5Imem3FGRDEuE1jyM8Qbfq+qTnnYyfo1sMVkhWKw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YFPntnPen2yBq/yXT2U3A55CjBLUF8HTWxVTSBFXawAIZKj3Uc6jBggoKdXwKB8bFr04FGrTj/nZWewyvdCJOYQ2QaLZb8jPntZVh0tzb+Z3UGQ5XPpC677E3qf+sCcx7P/cjv00MPopgvHlhK8R3z3jUzwcgCtd+qp0cI81DkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DbENlpsP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DbENlpsP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783941535; x=1815477535;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=LSc5Imem3FGRDEuE1jyM8Qbfq+qTnnYyfo1sMVkhWKw=;
  b=DbENlpsP11zluZzLcr3QTDNeJbeA04o/IV3CMu2pbD/Q8xh64pC7oKRa
   rtLyTxk/cgtPtz2WwidEBOXHAXMHXoqzgDMDzKjitSqgk9qOrnZALdx7M
   6DHFRZnLblcbhcYoIpjg3DzKvEvVcv3Stfh8CxFez+YgoU9baHx6L5ZAX
   9WTqYU1K/zZ46aiDbiJgF9qo5+GjrpXvw6JCherrqnMtxNSCP6h5JcH9c
   5tCmsNIRXoMxex0k+PdcIIYlJTw2Lz2hkrIcoTwC+s34e2QjVYwgpGygj
   pD9Vzlq7qzSasn+J3C7q4Fn2nlAebILQbLu8ntWqIGsJ5SVS9Gq/qnOL2
   w==;
X-CSE-ConnectionGUID: e+ed5mwsSZ6ZyC8OoU9bSQ==
X-CSE-MsgGUID: c8f8srjFTh6x7K0ETd2SMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="72071399"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="72071399"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 04:18:54 -0700
X-CSE-ConnectionGUID: XDUePkdhTNyq4vD9Y4oaqA==
X-CSE-MsgGUID: 2KQ5bh/iRLem5z23mL4cLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="293717100"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 04:18:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 13 Jul 2026 14:18:47 +0300 (EEST)
To: Jiale Yao <yaojiale02@163.com>
cc: platform-driver-x86@vger.kernel.org, corentin.chary@gmail.com, 
    luke@ljones.dev, denis.benato@linux.dev, jprvita@gmail.com, 
    Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: asus-wireless:  Check ACPI_COMPANION()
 against NULL
In-Reply-To: <20260712151743.3314169-1-yaojiale02@163.com>
Message-ID: <298e177e-9f10-1d5f-0e42-01a7f98453f8@linux.intel.com>
References: <20260712151743.3314169-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 12 Jul 2026, Jiale Yao wrote:

You've an extra space in the subject in all of these.

Also, please send similar patches for different drivers in a series so 
it's easier for me to apply them in a one go.

--
 i.

> Every platform driver can be forced to match a device that doesn't match
> its list of device IDs because of device_match_driver_override(), so
> platform drivers that rely on the existence of a device's ACPI companion
> object need to verify its presence.
> 
> Accordingly, add a requisite ACPI_COMPANION() check against NULL to the
> asus-wireless driver.
> 
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/platform/x86/asus-wireless.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86/asus-wireless.c
> index 2b494bf3cba8..54052bda9061 100644
> --- a/drivers/platform/x86/asus-wireless.c
> +++ b/drivers/platform/x86/asus-wireless.c
> @@ -132,6 +132,9 @@ static int asus_wireless_probe(struct platform_device *pdev)
>  	const struct acpi_device_id *id;
>  	int err;
>  
> +	if (!adev)
> +		return -ENODEV;
> +
>  	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
>  		return -ENOMEM;
> 
