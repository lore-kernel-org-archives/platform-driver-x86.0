Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A2F41228D
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jul 2026 08:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327715; cv=none; b=je3w4sVnE6jsjYQW+IlJsL7x6zFHvzktD5m7jjnzDM+teXCGhZMpBlxZ7kCbmR0M3I1pL+7oB4qlGW+6RpsODavL9MMezoJsmOnOnYhJLCs66DjQibav7QBIwHPKtSu7M5CjTDZZLLtZPuos7SMhyNEOBapmp7MoejydeWUvWl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327715; c=relaxed/simple;
	bh=peBZVF/CfcXhU2xbS88p8STT2HNEa4cVZO10yX7C2lc=;
	h=From:Date:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=qu4wLXb21c9qF6yh6AJlpJR8zlCpVTaJGv1bhTEWtAAy2+UtQhcks+RnHXZSwTSyu2s3L4gCM6Sa6IBzoueyEYYm12fsh8BjuEiaHjKSdUJ2bZ52ilbrmPlgPZ6e3/vK4WS2CFElejxzr+Yo4zFnWL/pQbnddn1jcGLmoZMKt48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=APaQQg9n; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="APaQQg9n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783327709; x=1814863709;
  h=from:date:to:cc:subject:message-id:mime-version;
  bh=peBZVF/CfcXhU2xbS88p8STT2HNEa4cVZO10yX7C2lc=;
  b=APaQQg9n7ZIg8XfZfHjkVP8NIycgQCNO9k8KsO1KZ3SQOKDwiODtTVnE
   VU2q4klacqoAk9CmbyzB9ipRC9F3rgG9DrVVvEPKaoj8WApAPIFwGkhv0
   z2VeTqYqfK+wc2Uhr898gM+iB7AEyuYYkRBLWmMCAmieffqet04gRg/3+
   SKc8EaMSIp6dWIJvOQV7A6jTVYeWdSd2vmR1qwHLG0Q6oLQHTl+qV+Hku
   CND7lFk06/3wrC5v3sqXY2jMCrW6xNfXtcQODye9IUUFUx0WwhZ8mq1Nt
   wVyXFn8v1v3VpPfd7VS1vn8gQZUI461/dsMNDyMZhJX3b0vOxfgS/cfqF
   w==;
X-CSE-ConnectionGUID: olWptAubSl6T7Kq+Npz4hw==
X-CSE-MsgGUID: 9SdZMz0+RDiIb6lF2A1aXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="87871273"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="87871273"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 01:48:25 -0700
X-CSE-ConnectionGUID: MjZZ5s+YTKqoIACHHUWYpg==
X-CSE-MsgGUID: pEICxPfoTt2Jl3eASwzbJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="253185475"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.95])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 01:48:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 6 Jul 2026 11:48:18 +0300 (EEST)
To: PDx86 ML <platform-driver-x86@vger.kernel.org>, 
    Hans de Goede <hansg@kernel.org>
cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: Imminent rebase of pdx86 trees to v7.2-rc2
Message-ID: <8084b592-cb10-2ae4-603a-615f053ca01d@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

Because of the recent mid-rc-cycle merge of the rework for 
mod_devicetable.h in d2c9a99135da ("Merge tag 'device-id-rework' of 
git://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux"), I'll be 
(re)basing our pdx86 tree on top of v7.2-rc2.

This has already happened for the review-ilpo-next branch where from it 
will propagate to for-next once the build test completes. The propagation 
is expected to take a day or two unless LKP decides to not cooperate or 
there is a build issue.

For the fixes (and review-ilpo-fixes) branch, the new base will be used 
after the next PR has been made.

The potential conflicts will be in #include block only so if your patch is 
touching header includes, please make sure you're based on a fresh commit 
from pdx86 repo before submitting.

I'm sorry for any inconvenience.

-- 
 i.

