Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D615C472F76;
	Tue, 18 Aug 2026 14:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787062111; cv=none; b=WNwCARUgP/MWNx+54kNHsOtUVw/jmaGEsyoVPhjwQ7omw9sGJd3S8t0qEIFzYbOoBNcMhd/jgP0/WCu20NDPIqckYquOaQLazN3S072Lfr+4rsCFfAgEh9saxOvsS4Zsk6Vzg8ZjNtwIgZymYaix7EnI22F5pr5cU/KsJ/CMa54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787062111; c=relaxed/simple;
	bh=ZKuueehRYEzl6uFVW/adUeh5fTNO3cMKRLz5r1fw834=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QMjknJkg5zO7lkTwSduLbHDQ4wFCUNbI6HqHCBf9Z9uFnjtLpl1PDVwgdWggpzG+dcfBGLAZi3uE+KKnGuzzKGniOoF/nNd5yS8YTuPlpByW9/Wxn2zT8VKjwv4qB9Vde3+KtgjADudhQM0QmsTXm2WV+96stNxPZLt3156rUrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DGMNQpho; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DGMNQpho"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787062110; x=1818598110;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=ZKuueehRYEzl6uFVW/adUeh5fTNO3cMKRLz5r1fw834=;
  b=DGMNQphoZlU5Z9OXs+DejEk21W0RPq+c0m+AFNzxjtWWKLuLcmXv6QoO
   X9ZBXePrP11dfGhk/H63Nm351ekGmePzZoAmDEZBmDCB83u4KV88/e/3n
   SXFCcY5OeVqP4rqhOZaKW+z5an+epfxLxDB4vrB9cBHaNbGMlnxzzR0p+
   XWXz4JLRxts85XMy8PL3u7N8SK+Fw1mdLHtGvTUVrOEQw2i1w8P7xfcan
   fRNvMkESl3Zgp0Y5sza76Kfl13hqBYFgMOXUs2oJdSJ2dmia14s2SKib6
   ocKrS2bXyF3jHvp/ob2WiEKgDWXY5RG+omYXjGm5z2eozfQO7GUIoSG59
   w==;
X-CSE-ConnectionGUID: PEgiPPtWSX2ob3KsyZcw/g==
X-CSE-MsgGUID: JDqL4DRTRryytRRS1jS+dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="105089191"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="105089191"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:08:29 -0700
X-CSE-ConnectionGUID: k8PHZEZVTOyXh2vXjV6eXw==
X-CSE-MsgGUID: eQKniEV5QRG2pIhnz5Sc5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="267214071"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:08:26 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Andrew Onyshchuk <andryk.rv@gmail.com>
Cc: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, hmh@hmh.eng.br, 
 hansg@kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260806154417.618575-1-andryk.rv@gmail.com>
References: <20260806154417.618575-1-andryk.rv@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix fan speed reporting
 on Edge E330
Message-Id: <178706210259.20251.17365085472196116757.b4-ty@b4>
Date: Tue, 18 Aug 2026 17:08:22 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Thu, 06 Aug 2026 08:44:17 -0700, Andrew Onyshchuk wrote:

> The ThinkPad Edge E330 with H3 firmware uses the non-standard EC fan
> register block. Without a matching quirk, thinkpad_acpi reads the legacy
> tachometer registers and reports 0 RPM.
> 
> Add the H3 BIOS family to TPACPI_FAN_NS so the driver reads the fan
> period from EC register 0x95 using the existing non-standard reporting
> path.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: thinkpad_acpi: Fix fan speed reporting on Edge E330
      commit: 051292bf7697e72a760401b6883c55a98beecc5b

--
 i.

