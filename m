Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77580199EA3
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Nov 2024 12:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731934787; cv=none; b=NSHG3ZPBqMgrWVjm7YN8rGVMYu3cFSCudIoFYzcVexWkR/vDE18gGkB5jfb9a6heeqsk5tz0OSFZ1IXlHjuJnCYHGf1UxgeRmmbc1k2nf36V5WO5UZN4z4FIPJpYK4sZD9m6m16rTIOuZ7pf8tWVZmGJXGXiv0g3TlnMT+GCDzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731934787; c=relaxed/simple;
	bh=BFMMsE382d62rCBP5Pc/ma9VJnwpFgkOn7Ar09jxysE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XiUK9T0Wu1YTWDaSvIstHOrGbGIiAkAPKOtFb+6tmtHLog2Q21xN3O/ifVRONrB5m/LP4oMGhvZbEcZbEKfC1f4hmvMekm7eocvivAJQuLblq6THBLUNB2wt8AleeFpNMSRrvAPU3x4+PKG3Bfl6lfjwStSGJo3MFUOL/lzfCOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fy0j8TQf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fy0j8TQf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731934785; x=1763470785;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=BFMMsE382d62rCBP5Pc/ma9VJnwpFgkOn7Ar09jxysE=;
  b=Fy0j8TQfC5zb3m1zjRfs4yMOSHS+hGIxJG4lBaIothaUQqiWdQFaydAd
   JbRT/k6CtUDdt5hlXtMGvkZzT7crhJm41BrqTVglXoEubTI6SA85ryREY
   jUqvBOqfQ0uMVmJDOHzI7NRCdHQ1XVVG4oQKcuzGHAAtET91YYMJdGerV
   1hfqFEiouRjU5oh9NV6qWKs9dXI0EkIcmOESmx9z03T0e7GHqi/+dhcPN
   ElnBHe2qQ2MhN1yJa4LBsFUWJdqjEWbVX3FCNpXmm0KSrIPF9zp9n97w2
   ZvE/Ex5OAVHL+6ZODs/+OuhUOcIqJAG8Rq1PRJD8eH1/43uk682wsd/dx
   A==;
X-CSE-ConnectionGUID: 8qyD/I+PSsKAHCmgvdkuFQ==
X-CSE-MsgGUID: FJsGoLrYTjSVKPQiPMTUMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="43275117"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="43275117"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 04:59:45 -0800
X-CSE-ConnectionGUID: ORNKNa0SQsaHCzZDdab00Q==
X-CSE-MsgGUID: 1nzTIV7oRkaBwPv09GWczg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="94270885"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.193])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 04:59:43 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20241116154546.85761-1-hdegoede@redhat.com>
References: <20241116154546.85761-1-hdegoede@redhat.com>
Subject: Re: [PATCH v2] platform/x86: p2sb: Cache correct PCI bar for P2SB
 on Gemini Lake
Message-Id: <173193477784.3357.9388023302073020282.b4-ty@linux.intel.com>
Date: Mon, 18 Nov 2024 14:59:37 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sat, 16 Nov 2024 16:45:46 +0100, Hans de Goede wrote:

> Gemini Lake (Goldmont Plus) is an Apollo Lake (Goldmont) derived design and
> as such has the P2SB at device.function 13.0, rather then at the default
> 31.1, just like Apollo Lake.
> 
> At a mapping to P2SB_DEVFN_GOLDMONT to p2sb_cpu_ids[] for Goldmont Plus,
> so that the correct PCI bar gets cached.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: p2sb: Cache correct PCI bar for P2SB on Gemini Lake
      commit: c6a2b4fcec5f2d80b0183fae1117f06127584c28

--
 i.

