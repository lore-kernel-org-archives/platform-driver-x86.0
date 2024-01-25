Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91534E1BC
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jan 2024 12:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706186017; cv=none; b=rhjm/s1vfbLq4HL+to2CpvzkuJPkwSHdg3eRNvK1fYYnhNhDwDstZ1djvKEOyZQ90dDQNmttZVSId5fvy//DiFCb94+AXTXYwpvtZfNfOGtIAUqT9DjT2YQREXqSg2lj5UvAVr1KKz4xLTUTukbCxk+xE0q3qciH58xEk+hCrz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706186017; c=relaxed/simple;
	bh=ZgzJMcpBEauXDQaVKamaRizmaE5VC+bRSZVFt9oMDIg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Y75ljcg4Nq5k2mrYlnfsYfeDCZS51hw8I+hiAstz+CRUpQlwRUB3re4I68tQiavTjnOI3QOjTk1NRqeuS9QI7uQoJljhifn7/xPwrBwuO1qUyQEski1SvzkTUn1HZbV9nvt+XSQ5sP+CQWWXYtIXeUUwCuLdBrj767mq8eoehUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYvgR1Lr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYvgR1Lr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706186015; x=1737722015;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ZgzJMcpBEauXDQaVKamaRizmaE5VC+bRSZVFt9oMDIg=;
  b=XYvgR1LrWsgEGHIxezHhb8Y421woEF4FoqXbpCetYfglUnZnc2qgWS1w
   VgIhQc2NEAUZSt9fBrkzd9QHOpYY7KZTBXjqRyWEuONhDOCYoBJkeXLn5
   x6GFbYn4/DLpz5RS4RYZOJoe059ejOW1L7CoipnqwnjFA/FgUoGjO+IB8
   yfaIWXFAfW93YKV/TqCV8q+0PEAkJcoB22YfgL6nChjVLEiVmFSpZTy2p
   KAZ3nG++/Vbei92rJFi+Z3jbPMKBkn6Ovgx8Sq/FIAUQXtjVqVb2DcdP2
   WFL0HWc+lFQD/5T/YHlMbh1p+IKG626TuNkiybxkM+d1xQFQ+qV6MIKFe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="9526339"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9526339"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 04:33:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2411852"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.94.252.55])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 04:33:33 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 25 Jan 2024 14:33:28 +0200 (EET)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v5 10/11] platform/x86/amd/hsmp: Change devm_kzalloc()
 to devm_kcalloc()
In-Reply-To: <20240106022532.1746932-10-suma.hegde@amd.com>
Message-ID: <8b896046-2058-805d-1998-7ae6d51edd01@linux.intel.com>
References: <20240106022532.1746932-1-suma.hegde@amd.com> <20240106022532.1746932-10-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 6 Jan 2024, Suma Hegde wrote:

> Use the standard array allocation variant of devm memory allocation
> APIs.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>

I decided to apply all but this patch 10/11 into review-ilpo. I fixed the 
parenthesis issue I mentioned in one of the patches while applying.

Please check the comment I made against this patch and respin this one.

I also noticed while applying one other extra parenthesis case in patch 5 
but since it was not added, I didn't go to tweak it now myself, but just 
you know.

-- 
 i.

