Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC47825D8E0
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Mar 2025 13:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742824328; cv=none; b=fvOt/nPQNRF7WU6cGNk8bNmTzeXZSY8ej5pnVGeHBUEuwYT2gQEVodhJLhCaqzFOaX5AFLyA98ryFfW+8Q6BTBKczNAAmb+5GDgyuKGODcnPF80LI0Gv0Q84yYDVc9/vae1UV9bb+Feh24phJIYYHWPJrlzbVD5bqpGcVYHVCbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742824328; c=relaxed/simple;
	bh=DzyqcNPcMHessy8yiQdiaceJptsJXwFW5fbl8m0to/k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CoCrm9FqCNUK8jb6Ncfs5pGW3BYNVvqOf6PRsak7l1c7t6xnJ4w58aCPdOWCy9YsnMTf7tCxWEtrPU78zFd/Oh/wjFNG+nDS6E6QEfBzGRBjIDQ6tPBsxP5GzQX5Tx4bNxdiCJY6bz/kwBcUHRC5/4krEwCKh7Ncf0BVgCHGG7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QrqEyx9h; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrqEyx9h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742824326; x=1774360326;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=DzyqcNPcMHessy8yiQdiaceJptsJXwFW5fbl8m0to/k=;
  b=QrqEyx9hw7+CU/uTdFCisYIWg7SeM/Km4i4wepsH1hBRe8+dqjn7EkJQ
   PgHztgXcXOq+RQQrEgUiCB3VJpPqKLgP4oR5FpAJmfMx2+mj4wazMVqpT
   uAzKyTpGKCO54krQF31rOA9vEBFrPzI3NSB7kuYGuZI88OKi00ZXmFZ5+
   2wN2yETHO1h1K32OPfbXKCmn0weWYv6+bidpYrorTgBcQCaTYuykOQiHP
   y/Xqdk2CwF2WDLQk0lbZ556DUN/mq8QswyAc4mMbnDnutfJlUmcWDu5eM
   /C2ZSNddO/tnAl6UPIsWsOQSaUQSAT6njcxANsAFtXAZjve2SZr9KaRn4
   A==;
X-CSE-ConnectionGUID: 75k+rMz1Qn6O34tVxBEXPg==
X-CSE-MsgGUID: JInLBMRLROKWIAx78ZnNBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43914899"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; 
   d="scan'208";a="43914899"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 06:52:06 -0700
X-CSE-ConnectionGUID: z1y+2hnSQxyxqr0TYBH4rA==
X-CSE-MsgGUID: mirr8xbQR1W1EE1LpJLCvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; 
   d="scan'208";a="124005352"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.251])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 06:52:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, kernel test robot <lkp@intel.com>
In-Reply-To: <20250324125052.374369-1-hdegoede@redhat.com>
References: <20250324125052.374369-1-hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Add select
 POWER_SUPPLY to Kconfig
Message-Id: <174282431872.2531.2013678528686222347.b4-ty@linux.intel.com>
Date: Mon, 24 Mar 2025 15:51:58 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 24 Mar 2025 13:50:52 +0100, Hans de Goede wrote:

> Commit c78dd25138d1 ("platform/x86: x86-android-tablets: Add Vexia EDU
> ATLA 10 EC battery driver"), adds power_supply class registering to
> the x86-android-tablets code.
> 
> Add "select POWER_SUPPLY" to the Kconfig entry to avoid these errors:
> 
> ERROR: modpost: "power_supply_get_drvdata" [drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.ko] undefined!
> ERROR: modpost: "power_supply_changed" [drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.ko] undefined!
> ERROR: modpost: "devm_power_supply_register" [drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.ko] undefined!
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: x86-android-tablets: Add select POWER_SUPPLY to Kconfig
      commit: 2c30357e755b087217c7643fda2b8aea6d6deda4

--
 i.

