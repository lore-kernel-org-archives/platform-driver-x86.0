Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4260041D23D
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 23:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789514501; cv=none; b=AY8grwjTSOwki6Iy8hzgWsv+EKCYFIkCDTVgpQBSr1U1kIikNJX1cD6WFixvX2NBWZMNGzlWPT9kYSe7yo4Cqy9wvlolEsMWyMR5K72xtINbNp24+YE0gIrAxF/ZMaHe/MkaHexT7xwe+fhrqNTgQpU/AQNJqTzWNEddp9OYCEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789514501; c=relaxed/simple;
	bh=hTBA9SFYAMZuD7UDd3aQLyp77f4fp5gwFVnEZVmU+rU=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cOZ1r6xzj0uX3Zbra8SZFflDhXFEIpQKv+ymVeU1tONSr2F7benoDgi0Rbi5PLJ/zZbeb8PmSe0A3mdbCRHGkY7Wdk0YUlt6svfVhDxrhBKqZM05y9ih6KMC55L8tG7LtUZZG/+/AAA8+Q/YUIOOAVABSOa2nSVx4y/jDdiKFgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=azUPQuRu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azUPQuRu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789514499; x=1821050499;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=hTBA9SFYAMZuD7UDd3aQLyp77f4fp5gwFVnEZVmU+rU=;
  b=azUPQuRutUlhM2Tv8Ua9bkgf6ubCr934fBEbijeZdHiK9y31qAcuCV+c
   58IZs7uDgu76/azDfr/54FyaySJUjBtasD0LxdvFgzUSpjJRjs+bhKV1D
   FFfeAcznVm154DIuGnYGpFxLKMaAkHlSV1aQ0kCIo1lFKi2+nIews9QxO
   SVO2k6WH8MqQtJVb4k2jN/CKyESOtlBUeHbO2+VDf/QukhIq3GV5YOBSF
   EKpYpusbRvnfJEcR7s7bAgvVRfE7+F9pKh9in2jOgeJ+gEU4QB8ckdYkE
   4Glv53qHvz/3W1R0S7pi0ST2UfXykE87FdSH13l0h7C9xu8l0AfbajeT/
   w==;
X-CSE-ConnectionGUID: k6YJjkFWS4C2/YfZhOe7ng==
X-CSE-MsgGUID: PivBwkJoRwKOpkJFwO1VWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92398093"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92398093"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 16:21:35 -0700
X-CSE-ConnectionGUID: pJJPBW6WQJyoX+dnIugB9Q==
X-CSE-MsgGUID: JHEceXl8QbyiOL2KLeAoyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1378472"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 16:21:34 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, Tinoy Thomas <yo@t69.dev>
In-Reply-To: <20260805105618.30736-1-yo@t69.dev>
References: <20260805105618.30736-1-yo@t69.dev>
Subject: Re: [PATCH] platform/x86: asus-wmi: add tablet-mode switch quirk
 for ASUS ProArt PX13
Message-Id: <178951448930.41627.6418065202371869211.b4-ty@b4>
Date: Wed, 16 Sep 2026 02:21:29 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 05 Aug 2026 05:56:18 -0500, Tinoy Thomas wrote:

> The ProArt PX13 (HN7306WV) is a 360-degree convertible. It exposes no
> dedicated SW_TABLET_MODE input switch, but the firmware implements the
> ASUS WMI lid-flip query (DSTS dev_id 0x00060062): it returns 0x10000
> with the lid open and 0x10001 when the screen is folded back, and the
> 0xfa (NOTIFY_LID_FLIP) WMI event fires on every fold/unfold transition.
> 
> Add a DMI quirk selecting the lid-flip dev-id so the driver registers
> SW_TABLET_MODE on the "Asus WMI hotkeys" input device and reports the
> hinge state, matching the existing UX360 behavior.
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
[1/1] platform/x86: asus-wmi: add tablet-mode switch quirk for ASUS ProArt PX13
      commit: aa5e0d0fa3cce4e5e54e51b68676ce659a6fd156

--
 i.

