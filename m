Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49384A8420;
	Tue, 15 Sep 2026 11:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789471947; cv=none; b=nC7kPnrUbSETauLTqENA/RXkmZjNYzR5rUwmyZ7fTAAUMvPJ+AnNDom2U+DFXHIrvGj+91dgHPXLPWePXkd3sgoqFPLiytKyY+9ifTIMLEwPoLAoTsohnEdQ+EkqlFsUPjIwlYBcaO7D1P86ONKrNjQEkO01Q8fR2jWXNdKTLhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789471947; c=relaxed/simple;
	bh=R6xc1/osyq4Vv3lkKcUOfBYg1gbhJ1iUJlt4Zlx0LWU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CDF4g+uSWFmj3XUeMCpakmBvbSPb/yw5jjvmDhArsRe3b8Xvqt6gcF7qh9QmLLTRkX65BLY1/WA0xiXAFiOTcq6mbz8AsojN5tyCODQWeF0UeeD66K5NzPs94ba0PdBbhfo8J5ySuggGJTuxEdNbGkzyCdYQWyR+jFvfgAX4cZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iVNvoAbd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iVNvoAbd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789471946; x=1821007946;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=R6xc1/osyq4Vv3lkKcUOfBYg1gbhJ1iUJlt4Zlx0LWU=;
  b=iVNvoAbd3Jetaqzl3omegHFT45bD1cpgvlB17oAShSjwOV+j5+dJLtKi
   HzU5XxmdT/RI2XYNjeN++nAR+VrwNRX/MKo/yHZIQAiLcaraOCmcb97qJ
   JBTdyBVyVBYeB6DN4sAOkfHimdMDN9KqMTSOo7Mq6V38KUDT1ijTSsFZq
   P8OahNGx+oEmoH5QNkNn7XV1PvAH5H8PkKjHuVIMXSwsqJuDeL5KDShIa
   LowBAk+8kHqkx1c4FxjsH7GYotNwIJODpmg1UI00BsSz0hhKFYTHT5xu6
   5gdp3tZw79fcgqwsB0krT6gdXWdhMZWR+THI1OLODV4UVvu1FxyNPR9ap
   g==;
X-CSE-ConnectionGUID: wITfw4gNRWu3vHJ9vV2LwQ==
X-CSE-MsgGUID: SOSjtisFQSWyShDWFS7SjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115367459"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="115367459"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 04:32:25 -0700
X-CSE-ConnectionGUID: Dka1BLtYTuysIcQE/vR9oA==
X-CSE-MsgGUID: drc2pMoaQKyEGG+wF/k8aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272965692"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 04:32:21 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 i@rsplwe.com, rahulbheda131313@gmail.com, kento@kekto.ru, 
 qby140326@gmail.com, martiya.ar@gmail.com, vlku.milos.fun@gmail.com, 
 mm3885525@gmail.com, wleizc7319@gmail.com
In-Reply-To: <20260904224516.8893-1-W_Armin@gmx.de>
References: <20260904224516.8893-1-W_Armin@gmx.de>
Subject: Re: [PATCH 0/2] Fix for platform profile issues on USB-C-only
 models
Message-Id: <178947193589.31094.14063517846504462170.b4-ty@b4>
Date: Tue, 15 Sep 2026 14:32:15 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sat, 05 Sep 2026 00:45:14 +0200, Armin Wolf wrote:

> After looking thru the ACPI tables of various people having issues
> with the bitland-mifs-wmi driver, i came to the following conclusions:
> 
> 1. There seem to be multiple flavors of the Mifs interface,
> distinguishable by small changes inside their WMI MOF definitions
> 
> 2. The buffer format used to communicate with the ACPI-WMI firmware
> operates differently than previously thought.
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
[1/2] platform/x86: bitland-mifs-wmi: Detect failed function calls
      commit: 437954f921dc60a5a988f0a6b343e9e5734b872a
[2/2] platform/x86: bitland-mifs-wmi: Treat WMI_FN_SYSTEM_AC_TYPE as optional
      commit: 46482926cce834fa6cb3b08246f10455a0694b03

--
 i.

