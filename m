Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E447401A13;
	Tue, 21 Jul 2026 17:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784654181; cv=none; b=ogoEfoYGoCIppu4ptfCwClaNNP42ofC+Ld9kwociZ1R6Rx8IQIAFJ2ihqzK6Xyv8hLE7cAQjuWJk9v9DrfqcwltPBwIlGDUAiDDmigJHdal0Q28pCali1Kc5a1zVkVYTOSwIyCHV/JfxKAoXYNvgOL63QoR1W1T5gT2oX5oAus8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784654181; c=relaxed/simple;
	bh=l7xIR5WagElt05+KCQ8HKGM6Ir4f8muOHCmKKgvf76E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=G4gW1RyRoQJX/ydtBgzRzV7Y3A//j5Psew7GZP2bCeGymx3l+i9cB1CU23L+lOUQjrm6vEOma0x283hKXN2iLnUUCtZ3eFd9q3vOa9For/IWmgLF6Evqen+TjycZr5DtaAHu7VsfAhrelWgRgF2PR0NhXrU3kLZCPX6qxJNBE/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAgcBKU3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAgcBKU3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784654180; x=1816190180;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=l7xIR5WagElt05+KCQ8HKGM6Ir4f8muOHCmKKgvf76E=;
  b=dAgcBKU3VzJaJ/36tv2YmXif3AQaDWjkA6e/kb5Gr94EWeYr4foHMMAF
   Bg8lWxnKyNh341nAVB2mYtbn8EHZT0vo5OJmU/kr4gcuVUiOSytr6hSo5
   Km8pRPUd+u+u6nEduF3e1vDhhgzvdegkz/KMAn4noDATifa6QNmoNLPTu
   3ozr8MEIet90ob8Q08aaOY1fuQfzTjKJVHL4gb4Mbr9mr43JGiAt9W1Fr
   WnaQ2iOfChuv3ySNY3Ek6KdLSqho/p6mMBpVc0O0BUZbg2iQpo8HcMeG0
   RqvUcGg7j8L+v9RpqhyXK1ve/jq3uHDgpo/peTHrMBaxqAZN2sBxXzh9M
   w==;
X-CSE-ConnectionGUID: biUy4kfBRyKoU3YVwFlp+w==
X-CSE-MsgGUID: 46MSTZuCQoWysw2nrMOULQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95627046"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="95627046"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:16:19 -0700
X-CSE-ConnectionGUID: gCiWD1CbSMm8Z0yVPhi2sA==
X-CSE-MsgGUID: 9qprRPusRD6JL8L9ooatzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="256606075"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:16:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
 "David E . Box" <david.e.box@linux.intel.com>, 
 Yousef Alhouseen <alhouseenyousef@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans de Goede <hansg@kernel.org>
In-Reply-To: <20260630105101.54016-1-alhouseenyousef@gmail.com>
References: <20260630105101.54016-1-alhouseenyousef@gmail.com>
Subject: Re: [PATCH] platform/x86/intel/pmc: initialize empty PMT read
 result
Message-Id: <178465417246.18499.14956271722010713784.b4-ty@b4>
Date: Tue, 21 Jul 2026 20:16:12 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 30 Jun 2026 12:51:01 +0200, Yousef Alhouseen wrote:

> pmc_core_pmt_get_lpm_req() returns the last telemetry read status. When
> firmware exposes no enabled low-power modes, the loop does not run
> and the function returns an uninitialized stack value.
> 
> Initialize the status to success so an empty mode set is handled
> deterministically.
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
[1/1] platform/x86/intel/pmc: initialize empty PMT read result
      commit: 408b87a481e3ab33cba00292e4c80a30ba97f995

--
 i.

