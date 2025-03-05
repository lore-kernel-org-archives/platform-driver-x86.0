Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C521514CC
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Mar 2025 11:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741175692; cv=none; b=SyS4VHjncCvuxn9kZZWbll3APkxX1z1YNObzgd1hK02gkvMR1gxGIxEEFzfPa9iCpXgSnmKvd5k7wHQWAh/IU11Z8uzUBAYNeFPquosf6l6DMByeeg2xyXDgkX0CNKfH+98tfVjTCYoaf2iO7okJN/xdrsHLsIe1dU51GoGBLAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741175692; c=relaxed/simple;
	bh=4GbEz7j/9W2zKnXjng/f83W/4oeHsPC1e1hK0++np4o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Vo5jAOY5+Ndo12po5wD99QV8tM8ahZ9iRDmZgmMYj4vdl6Uv/pdaG3YmNhOphr7UYWZi+elaoLyhh2WPYZ7CLZlnDMv34yUbbdepAkWAS/aVnz45ZY6gMG2lZ98ZHiRsWEImiB4oWXqtaJIuvflfNdmrCGKFDVZ9DQHe1b0KHIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WecH9esY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WecH9esY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741175691; x=1772711691;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=4GbEz7j/9W2zKnXjng/f83W/4oeHsPC1e1hK0++np4o=;
  b=WecH9esYEqOhyh+kZF1kTX0ct7X+mgWHzza8oy0f3VajjTfbODa6BXUA
   Aul75NaOIFMs8oxq9dLVjVfpdnHC5aHW0slo7xQzRkzeDoHscuVfOQ7iu
   pFBPgG8eOHpX8klgdYqVYsAPZfwOvOqskeewJalpkYn8zoLhlKP+LlrpX
   qnv7NzcbmCmezFbMZFfVLdxevylxrWDF0TkIlX1pYHICTiGu0Xsiz3SfF
   11hdCy0NAqUSgNu4vrbtddXHillbxhJPgYU1wGK/kMBn/9VE9AGqB3MOs
   uK3iRszwXrSF1h6FFRA7Kyzga2zhxe1f2XC3f0HGr9lSH39kKWC9IrhhE
   A==;
X-CSE-ConnectionGUID: hm6c/F9FT8OQ7FryX2D3Wg==
X-CSE-MsgGUID: kehtjIGGQACpWmW6qD3Hlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42380463"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="42380463"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 03:54:51 -0800
X-CSE-ConnectionGUID: AELHHq8iRbKRCll/oZJVvg==
X-CSE-MsgGUID: xiPeCgIDSj2Woz6pkkTiAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="118822190"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.112])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 03:54:49 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com, 
 mario.limonciello@amd.com
In-Reply-To: <20250305045842.4117767-1-Shyam-sundar.S-k@amd.com>
References: <20250305045842.4117767-1-Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v3 1/2] platform/x86/amd/pmf: Propagate PMF-TA return
 codes
Message-Id: <174117568382.1603.3458258416758662092.b4-ty@linux.intel.com>
Date: Wed, 05 Mar 2025 13:54:43 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 05 Mar 2025 10:28:41 +0530, Shyam Sundar S K wrote:

> In the amd_pmf_invoke_cmd_init() function within the PMF driver ensure
> that the actual result from the PMF-TA is returned rather than a generic
> EIO. This change allows for proper handling of errors originating from the
> PMF-TA.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86/amd/pmf: Propagate PMF-TA return codes
      commit: 9ba93cb8212d62bccd8b41b8adb6656abf37280a
[2/2] platform/x86/amd/pmf: Update PMF Driver for Compatibility with new PMF-TA
      commit: 376a8c2a144397d9cf2a67d403dd64f4a7ff9104

--
 i.

