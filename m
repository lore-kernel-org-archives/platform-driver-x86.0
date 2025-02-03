Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB51205E05
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Feb 2025 13:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590634; cv=none; b=X0mupS4RVtA1MGkfM658s+N+q7QG/olQtKMFGek0KEJULsiuei1BnGjNGrh/DcX652HOl4YxxH0a4xTmjHtiXwFEZAw3qHcKbBtjpnF7EK+qR7TJ09Z7QcsdpZxQV8tAYWt4r97gYDoE7ZzFk4X1fpqcvTYQJIcDLYCf+rsEu5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590634; c=relaxed/simple;
	bh=hDueGYe4k9paqNqaNHXwrfb/mpCxfQ+uhrxbHGhMkhI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kmGShui9uPG+/tPqEYgaC1EwJcBK7fqWhRqdQlkBPLk6XOCzjcRleWodRXF74FmmadNaqs1oU+5u9U8XzLrsdlbtWeiuNC6uTLwe8cPVLW9kOvBbDQWdkmAb/THnWe6XjfwSytQ5V5xSxICJ2xEHXbYCWASpfMuoFdSMnNQ8v2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g75UgxpY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g75UgxpY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738590633; x=1770126633;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=hDueGYe4k9paqNqaNHXwrfb/mpCxfQ+uhrxbHGhMkhI=;
  b=g75UgxpYGcFRFQMCdSQRfGqh+8XR5ozjvBTlWwTXNjRU2Mte51xYzzZA
   s9qPUvXwuqI0aDNaGososiTsrRVk4J2WONI/NFmtuLvc+a9yNQFKBeowD
   ihxCtMOwnr1jTM1Ne/XYVrzEIgBsz7Xri80wsOM42jp7ZureH+9Q76jF3
   /o2jB/XOrH+LjyGhxUA6Mfp2wCJDPFwUe7QgSBN/7XUMlhC2t/KnJouBb
   LaSyIIbsxZDFcBNm2qD6kSzL5XEcnDp7IX2OVRDoqcIa2nxqoikZ2XWpm
   7HfLUV/o+Rlak341fomviqycpbizCU4Zd2a1g34XsMLkoyVX3fPivx97l
   w==;
X-CSE-ConnectionGUID: ycVAdzESStOK147g5oQQsA==
X-CSE-MsgGUID: d5UA7OFHRVC7drnmwqj2Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="49339017"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="49339017"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:50:33 -0800
X-CSE-ConnectionGUID: FEmkdXxpRk6e1DlK07vz0w==
X-CSE-MsgGUID: USxVdrvLSI+kdtWY3B3XfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110189431"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.194])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:50:29 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 3 Feb 2025 15:50:26 +0200 (EET)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, michaelsh@nvidia.com, 
    crajank@nvidia.com, fradensky@nvidia.com, oleksandrs@nvidia.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v5 04/12] platform_data/mlxreg: Add capability bit and
 mask fields
In-Reply-To: <20250124172632.22437-5-vadimp@nvidia.com>
Message-ID: <ec31c25f-cbbc-b958-88b0-aa686cd58cd1@linux.intel.com>
References: <20250124172632.22437-1-vadimp@nvidia.com> <20250124172632.22437-5-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Jan 2025, Vadim Pasternak wrote:

> Some 'capability' registers can be shared between different resources.
> Add new fields 'capability_bit' and 'capability_mask' to structs
> 'mlxreg_core_data' and 'mlxreg_core_item' for getting only relevant
> capability bits.
> 
> Reviewed-by: Felix Radensky <fradensky@nvidia.com>
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  include/linux/platform_data/mlxreg.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
> index 0b9f81a6f753..d9f679752226 100644
> --- a/include/linux/platform_data/mlxreg.h
> +++ b/include/linux/platform_data/mlxreg.h
> @@ -118,6 +118,8 @@ struct mlxreg_hotplug_device {
>   * @mask: attribute access mask;
>   * @bit: attribute effective bit;
>   * @capability: attribute capability register;
> + * @capability_bit: started bit in attribute capability register;

"started bit" sounds a bit clumsy.

> + * @capability_mask: mask in attribute capability register;
>   * @reg_prsnt: attribute presence register;
>   * @reg_sync: attribute synch register;
>   * @reg_pwr: attribute power register;
> @@ -138,6 +140,8 @@ struct mlxreg_core_data {
>  	u32 mask;
>  	u32 bit;
>  	u32 capability;
> +	u32 capability_bit;
> +	u32 capability_mask;
>  	u32 reg_prsnt;
>  	u32 reg_sync;
>  	u32 reg_pwr;
> @@ -162,6 +166,8 @@ struct mlxreg_core_data {
>   * @reg: group interrupt status register;
>   * @mask: group interrupt mask;
>   * @capability: group capability register;
> + * @capability_bit: started bit in attribute capability register;
> + * @capability_mask: mask in attribute capability register;

This is probably a bit misleading as you masked with it before shifting 
with capability_bit (in patch 5) so the mask seems zeroth-bit based rather 
than a "mask in attribute capability register" ?

>   * @cache: last status value for elements fro the same group;
>   * @count: number of available elements in the group;
>   * @ind: element's index inside the group;
> @@ -175,6 +181,8 @@ struct mlxreg_core_item {
>  	u32 reg;
>  	u32 mask;
>  	u32 capability;
> +	u32 capability_bit;
> +	u32 capability_mask;
>  	u32 cache;
>  	u8 count;
>  	u8 ind;
> 

-- 
 i.

