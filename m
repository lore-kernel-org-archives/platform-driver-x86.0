Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2640C3D8106
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 13:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444693; cv=none; b=nXH/nM4nyMAjj18KzAn1KdddgbX6r5MfpqiY9bKYUZgvmQVxHX2peLRk8xpJ5lf9ehIiymB+OFAipLnG9LKhytAq8Kd7KFAa4Gmq0EY5WXVGC1J7oKQK1h75MQIRukKykp2RZ2VfR8ffeJrDRye7A43AEPplR4bQ5vrTNtLgyjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444693; c=relaxed/simple;
	bh=XnL78MOhN8V7DH+2dJI449gpOlD9FPaGZt4UrszF3xw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LFvnRebf3kDFYOSGClnSfNNJUoiAhSqZc/ZDfBnngJ7GXYfKvCl1Lj6SGPGElJ6iSEykU8uUn68ZtVEcENex+VHWJOicB75LAAAoQJWzcOgwBjG8S9ZPwmQbjTzMH0hyqK7LuzyiKUW+pMdDmIcygIbZRtrY/4zTfyBlFChJuOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mll+A2kG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mll+A2kG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774444692; x=1805980692;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=XnL78MOhN8V7DH+2dJI449gpOlD9FPaGZt4UrszF3xw=;
  b=Mll+A2kGARQzqe1udFGqk3vBXGfhXFVtklq3H/DBovZUAhPX9fANqXSS
   zVCBy85o/Ql4xOQqajG9Cj9qG1G4snYrzPODkrltoTMwkEiCm2ZlZ4lJk
   jpasLDjhe8GEvcaUFqKX3ouKGb+XiBev3LsRV7CuJGsTOy/5DqjCoo3gU
   wwMGIz4jMzKzqhxA+TOS9kOoHY1EK81sbLuyKEeLIqA8g4I1kxkl4fVcY
   ry/CNctwFhlerBIi+1Nc3myocqzi0KZeygQbIdtsGIhdH9eUS3L/28uyu
   FB6fjdeFEzYHTwatcbOeJA4tVX2+u4hnzv5gi0vp86wt6dY77qy25vMkC
   w==;
X-CSE-ConnectionGUID: mC2UIR9LTLe4d5MufGtyWQ==
X-CSE-MsgGUID: 10fBzu1dQ7OfIvl/VZdURw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75595683"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75595683"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 06:18:11 -0700
X-CSE-ConnectionGUID: 6pz5aCUQSXWNUOkMDXWIJQ==
X-CSE-MsgGUID: XXBT241JQ62Qv8Sm/Szlgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="248190760"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 06:18:09 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 25 Mar 2026 15:18:06 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Yijun.Shen@Dell.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v3 1/7] platform/x86/amd/pmf: Add util layer and userspace
 misc device interface
In-Reply-To: <20260301131124.1370565-2-Shyam-sundar.S-k@amd.com>
Message-ID: <e32f055a-88b2-deea-94c1-5072ac9a5a76@linux.intel.com>
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com> <20260301131124.1370565-2-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 1 Mar 2026, Shyam Sundar S K wrote:

> Add a util layer to AMD PMF that exposes a minimal userspace interface
> via a misc character device for metrics monitoring and feature discovery.
> 
> This creates /dev/amdpmf_interface with basic ioctl support to retrieve
> PMF metrics such as:
> *Power source and power slider position
> *Platform type, lid state, and user presence
> *Skin temperature and ambient light
> *BIOS input parameters (1-10)
> *Graphics workload metrics
> *CPU C-state residency (average and maximum)
> *Socket power consumption

Also, can you please add a space after those * chars.

Consider e.g. 2 space indentation for the list.

> +/**
> + * struct amd_pmf_ioctl_info - Structure for PMF ioctl data exchange
> + * @control_code: Input parameter specifying which data to query (enum pmf_ioctl_id)
> + * @feature_supported: Output flag indicating if the queried feature is supported
> + * @feature_version: Output field containing the feature version number
> + * @val: Output field containing the queried value
> + *
> + * This structure is used with the IOCTL_PMF_POPULATE_DATA ioctl command
> + * to exchange data between user space and the AMD PMF kernel driver.
> + * The user provides the control_code to specify the query type, and the
> + * driver populates the remaining fields with the response data.
> + */
> +struct amd_pmf_ioctl_info {
> +	enum pmf_ioctl_id control_code; /* In */
> +	bool feature_supported; /* Out */
> +	unsigned long feature_version; /* Out */
> +	long long val; /* Out */

Align comments.

-- 
 i.

