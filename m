Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7282DA77C
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 10:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749809674; cv=none; b=HSbuSZ63ZitpRINTVCyNqGN7hQk4mfnOlSVuynHCRQFDiwRkA3rXHMxUZZ9j4gFjn012Wie+0L+DspyAa+nVqQ9PA1LjZjay+JT0lnFlP7VA6Z1iK4iRZWahToBGTynxo0BmcTi4vOgxCshNKDQQjMobXXHBygqpnTjezihEDvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749809674; c=relaxed/simple;
	bh=YbQn5pTPKYHK1odVVLyyDF/3cPmR/Kj/E4OQM6tfKXI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iWzCN4IBvGQ0r2kPs8gHkq6GDYUnRmlVHagvGHD7+YZ5SnuNid+lpwOcwzEKHCrf1dSVEiFeYy6wRj7zDJeXVo1lIXzXUd3gYUDAdl/zY1OptC74ySCfzbCZCQJXHddUvVe2IIzcqyy5T8cH9HGR6ESLCd3soQyCv2Dtj1/pBmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E/wO85/r; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/wO85/r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749809673; x=1781345673;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=YbQn5pTPKYHK1odVVLyyDF/3cPmR/Kj/E4OQM6tfKXI=;
  b=E/wO85/rGqs3Uz/quljhDALPtlBgFHk+AZyYDZtQaI1+deQdnPIVz2oA
   9ZhHb/66x2JcUk5/lEF9P6p8UWYUsa6p8GEx6QnlozO/DUWPziFRyqXLT
   7VNIDoNqQPWktcTroZVo9T4knkp67+6RNV55jHXsXtvcrKQbkVsbLuJ9+
   ZHNnAN1tlEOR9iuQ3TPrlMUUIpUwl6qtJlQpLR5uyCkKBZpIQFohuepYu
   dRuQquBmbBZKMyst4v+mfmgt24scWUdbE5ZOt6QrapVj355QtUSGWmMnG
   LIexbuZhftO6/+iaugo3k6Cb8pCorjesjq0gvBG9zbr+RRA9Qj/NHy91X
   A==;
X-CSE-ConnectionGUID: ixiB4mlRSUyapgeAjFaj8A==
X-CSE-MsgGUID: sUUhzKGsSCOPo1ZdBzDC/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69595169"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="69595169"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 03:14:32 -0700
X-CSE-ConnectionGUID: 339OeZidSTKYW5oPHsNaAg==
X-CSE-MsgGUID: uomn6ER7R9mYhmLqJEfrEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="178690094"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.102])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 03:14:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 13 Jun 2025 13:14:25 +0300 (EEST)
To: Jelle van der Waa <jvanderwaa@redhat.com>
cc: Jonathan Woithe <jwoithe@just42.net>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/x86: fujitsu: use unsigned int for
 kstrtounit
In-Reply-To: <20250609102115.36936-2-jvanderwaa@redhat.com>
Message-ID: <4785783c-a1a5-7447-6670-5466ed551889@linux.intel.com>
References: <20250609102115.36936-1-jvanderwaa@redhat.com> <20250609102115.36936-2-jvanderwaa@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Jun 2025, Jelle van der Waa wrote:

> The charge control threshold value ranges from 0-100.
> 
> Signed-off-by: Jelle van der Waa <jvanderwaa@redhat.com>
> ---
>  drivers/platform/x86/fujitsu-laptop.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index 162809140f68..c8aeb28a783c 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -180,7 +180,8 @@ static ssize_t charge_control_end_threshold_store(struct device *dev,
>  				const char *buf, size_t count)
>  {
>  	int cc_end_value, s006_cc_return;
> -	int value, ret;
> +	int ret;
> +	unsigned int value;

Thanks.

I've applied this series to the review-ilpo-next branch but I changed 
these variables to the reverse xmas-tree order while applying. In general, 
if there's no good reason to do otherwise, reverse xmas tree order is 
preferred for local variables.

>  
>  	ret = kstrtouint(buf, 10, &value);
>  	if (ret)
> 

-- 
 i.

