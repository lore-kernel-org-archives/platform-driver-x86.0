Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70E64E3243;
	Thu, 17 Sep 2026 15:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657634; cv=none; b=kA2lRQtHE3/o9KXMks2ed+WgnRtEKE1Y2LOiVIn445txTYG2MWBj2klUSUAP3/uOam+6zb3X/lsiHmUyYF2KPq7mY33/ySzp0pBAptIKI7swZdoqh+JNjJVJVVMYpAbxvpPLJjkOGAVIIqbulYI/ORs/K05luCHLeAq24rx1PdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657634; c=relaxed/simple;
	bh=yVqWFSiV+ObwksnCrZ0HQp5TvTxFZ6LvDpTy5m9TEcA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=N+CoYne+m8n+NEA7M4gJr88gs0CC1uXNLvx9vonrjSj6d6m8ncK042MUxmcojaxiN/y10vrgCXYH76JV/llntEGAlovcPoE3F10NThQCqJQ8A2knXqZ8CZm+Rkb9h1KfTRtCGWHRmZxL35S/7WFvhpezNzMcVFWxSqiIe3lyRSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4qA+iCB; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4qA+iCB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789657621; x=1821193621;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=yVqWFSiV+ObwksnCrZ0HQp5TvTxFZ6LvDpTy5m9TEcA=;
  b=A4qA+iCByxoknODDIztqDSwAlm6B4IGmKJDlmMI5P12Qne8DzoVKsqaj
   t9VmYcIJoUx6049l+0fa1gJgq1d+LiU5Sg0cofwW1qoXaAdksIOTSrpVK
   gsKgB92B8EUPW56g98bbIpxXwtKaILxnGX2GCFFdnL5tXVFz5bv9enGvk
   lUYyMHPdJWaf/W/sNI204pe8ZYq0A+RT3Zo1IrcCiwFmFYrsJh2Zq9ush
   nC4oGc3iURkULImOQiRckg1y7axfMRdhfFYf2xObMRS+hlY2q/WNphxJF
   1ZVFyN1aJzOt41NnXrM0ZqVjrBZdLCkqZnzo/k7SHV01Wdn6huxATMOaQ
   w==;
X-CSE-ConnectionGUID: uyH8RhFSRHaQ2dOnj5Kpgg==
X-CSE-MsgGUID: BsxsxH8YQjK7j0VL4UbDVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100685237"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100685237"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 08:04:31 -0700
X-CSE-ConnectionGUID: vqvy+8jQSq6/cAPXwecKZA==
X-CSE-MsgGUID: h73gKmJETLijBRsNi0mqUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2267683"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.62])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 08:04:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
In-Reply-To: <20260819173933.1184291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260819173933.1184291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v1] platform/x86: intel-uncore-freq: Add support for
 rugged Panther Lake
Message-Id: <178965746453.22350.1481484898271821669.b4-ty@b4>
Date: Thu, 17 Sep 2026 18:04:24 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 19 Aug 2026 10:39:33 -0700, Kuppuswamy Sathyanarayanan wrote:

> Add uncore frequency support for rugged Panther Lake.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: intel-uncore-freq: Add support for rugged Panther Lake
      commit: 6dd5dfdc96dd33a94f3bf2135d2dcb14f3661d1e

--
 i.

