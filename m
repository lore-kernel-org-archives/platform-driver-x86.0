Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB6920F076
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 May 2025 12:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746622090; cv=none; b=q8ejQWAOaQFft++2kHIK8wz9zq+jEqiCB5YRgNDuZ3Uc8qjv4oJBDc7I3KnegoAYNyhs+WcLf0E4kcgSGVASRbW83qT2jMGAr5ZsqafepcJ8Absi1fBEzOHbU9dT9DJwcaV0Hu9qQfiOvlGZTH3z9ceHuBpy/xUEfc5zI5kqyuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746622090; c=relaxed/simple;
	bh=RuNNZM7cEPeIHhIxsmrEYC0REyYvaCHhSSXTyvX6Xfk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sjjtqKL23pWjyco3uRDClaQRH3e4hM2EE6tFIaRNtH+oER4FaL/2GZ1dVgNYG1eKcXvxdOTOp6RLoTZ5HSoqxHijWh5SS4QzR0IfSo6/lI2DpdsbAT3eAy1wOrqJ2G305misguNgI6yVRizkuSe0VhmKxUdOWk4NY0DdCiqicNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HA89xQ+2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HA89xQ+2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746622088; x=1778158088;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=RuNNZM7cEPeIHhIxsmrEYC0REyYvaCHhSSXTyvX6Xfk=;
  b=HA89xQ+2SiyC98AKukp4G1fIDYnT89mxUrNMdxfvas50196wSR3RpdkO
   pANWcyPOAsbzjoZ0U7T/4dAb+ZHWFJiLJthCEiswjcPaiqL/P0SafRaiS
   G8sjElzKf0OsZYR5gYSvCKzzrgjhpkVWkuSleAYLqRNX1ngKSQDWEF7vX
   lHBErCE+tOLKo6yadyBI80rMn6TV9xTluMec5SNdqelueSfltAPPVuR5/
   h8dMdLcLkkc867nmksyoQYrs/D8MuZGsrYwlUP64aVxLNAoNF4JUq/YFJ
   z13yF5erDQ6CiTOHzUw2xUg+s8rdvJqnMphX7Tof1/BCFh/ywaP2LXwia
   A==;
X-CSE-ConnectionGUID: JsDke+f/S+m9zY3+VGiQIw==
X-CSE-MsgGUID: OYHZCmeWRD6hWRLpgYjJkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="65879995"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="65879995"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 05:48:08 -0700
X-CSE-ConnectionGUID: t/BDdikrQ1C/tT1I1qaqDg==
X-CSE-MsgGUID: mwdE871URWexzA1aASQgrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="139995124"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 05:48:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>, 
 Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D . Jones" <luke@ljones.dev>, AceLan Kao <acelan.kao@canonical.com>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: acpi4asus-user@lists.sourceforge.net, 
 platform-driver-x86@vger.kernel.org
In-Reply-To: <20250501131702.103360-1-hdegoede@redhat.com>
References: <20250501131702.103360-1-hdegoede@redhat.com>
Subject: Re: [PATCH 0/1] platform/x86: asus-wmi: Fix wlan_ctrl_by_user
 detection
Message-Id: <174662208010.8998.2046325074092725425.b4-ty@linux.intel.com>
Date: Wed, 07 May 2025 15:48:00 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 01 May 2025 15:17:01 +0200, Hans de Goede wrote:

> Here is a patch which fixes:
> https://bugzilla.kernel.org/show_bug.cgi?id=219786
> 
> The patch itself is trivial enough and seems obviously correct to me, but
> the code it fixes was first introduced in 2012 and we've been doing
> the wrong thing when setting rfkill state on some Asus laptops ever since.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-wmi: Fix wlan_ctrl_by_user detection
      commit: bfcfe6d335a967f8ea0c1980960e6f0205b5de6e

--
 i.

