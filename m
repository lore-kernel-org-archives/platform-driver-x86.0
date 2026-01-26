Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BCA330313;
	Mon, 26 Jan 2026 14:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769439419; cv=none; b=SDX0YdK+mgvckmA3yvvoj7MFf1Y8mK+8VRPLG3TscgSqVXXPGyt7lspctEhUjC7N4V+B20jCqSV709C7bRuVH+CIns9kv0DwOixRDS9bhmP2mLh86O7R6F3lurHzF785ErNQ2ydeeEG4TL2kdXFDljqPgZfLNWZltBQYrsgMKTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769439419; c=relaxed/simple;
	bh=bBrHqhkmSDMiv9vOf4Qw/DIdVmg1HyfNUnbQcl2lAtw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qXPBemXXW8fyydOAcu9OXwxp6JDwLWJZwb14J2VWCMn5wRuXxiYTh7BS0p52c5APXvOpMo/SLc2JtNZC3guYwrJZYJzpoTLhlOVx+d4zDlAeossjJuMold8DZRtd+hBOQ79wciv+3QES+o6w1jwk3HnGMINr5rJb2nVPmtRC3yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n6ng1JSf; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n6ng1JSf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769439418; x=1800975418;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=bBrHqhkmSDMiv9vOf4Qw/DIdVmg1HyfNUnbQcl2lAtw=;
  b=n6ng1JSfdCVSbylnGICjmZgY+VvgdqljK8/2/VraEYaFPvo/7G4J5ORW
   ZQ20ExeXFIZ/6TzCwaODFZLFIER2MfabunhJ5squ/D1B6+LfjLJoUvfx+
   kgyUwmcbi6U4iZ7zfKOYKOU7Jrs5sjZa8t1Y2RsHSc5D1IXpqDFo+zWAn
   91QHBoZtPBxd8fu2SK3ThDINI1bxgHvwzUWh2CNq3xdo6WIiHgbD8QCrh
   gTwOv84UeBMygJvPP8Unof9AwzCIfyMJ9tSFFhaIz3U9K+hgdtlCm0IM8
   cDE7R1Mi/F+lKT5M/xhqCQB8pLaAdmAlTFoo8HQffqxihmeFb8Tl4DS2I
   g==;
X-CSE-ConnectionGUID: BxzAwqqkR827I2xcH9ZTEw==
X-CSE-MsgGUID: VH/tWMtGSOCdDuVXBO6Kwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70584610"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70584610"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:56:57 -0800
X-CSE-ConnectionGUID: BHN6fluRRYSxsI5/nK6CXg==
X-CSE-MsgGUID: JPAzlXj0SVWIaq7tP1C1ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="212166256"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.150])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:56:54 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: xi.pardee@linux.intel.com, andriy.shevchenko@linux.intel.com, 
 "David E. Box" <david.e.box@linux.intel.com>
Cc: hansg@kernel.org, linux-kernel@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org
In-Reply-To: <20260122022110.3231344-1-david.e.box@linux.intel.com>
References: <20260122022110.3231344-1-david.e.box@linux.intel.com>
Subject: Re: [PATCH] platform/x86/intel/vsec: Add Nova Lake PUNIT support
Message-Id: <176943941009.16098.4985456806296073303.b4-ty@linux.intel.com>
Date: Mon, 26 Jan 2026 16:56:50 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 21 Jan 2026 18:21:08 -0800, David E. Box wrote:

> Add PCI ID for Nova Lake, supporting PUNIT telemetry.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/intel/vsec: Add Nova Lake PUNIT support
      commit: 98bdc485b281da7e20e67b13a8cc834956d68e9c

--
 i.

