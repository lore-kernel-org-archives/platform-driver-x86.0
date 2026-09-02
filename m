Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8482745517D;
	Wed,  2 Sep 2026 11:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349608; cv=none; b=mU8i6EE+faCFM5iSKSVJyRfOTIJepgf3XakuJQiY3SDQZ5YXTAMjUp4FHwAFZ0zbmGPdshV+N07cT/kZ6Uwa4Fgib2sbqkjg2Urobm5RFdFmi8F4U6M1gWYe6biQuJlpKJ7s8ABdNQMLGHM7GbnTnkx1puW44Ea0Ceg1GS/S3/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349608; c=relaxed/simple;
	bh=g7nFIe+myxIczniePf1uUgYLGxAiEsmCxlQEJ3bOOt8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bY+MJUf7gx6SyPMP8/f/OSx1sOHdX1kIUvmPedt13XfoMn57Lw/UiLRDbfliHUH43pnu7AtFrzch8Dzb1+KA0zLmm226cpjFRKufDg+6u678CdWBLcZVCjRz/yRWcWW2Cjm2c9ECPh+ekP9hH9tE5tNwu9fdz68IH06rPPqWoS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRFAHkwS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRFAHkwS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788349604; x=1819885604;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=g7nFIe+myxIczniePf1uUgYLGxAiEsmCxlQEJ3bOOt8=;
  b=hRFAHkwSphBY1DuJOQw4vLWvQHbQoAJgrTVP8aXsSsS6MOFDTiK3A+pd
   z4jk5PVdhf3OPoA5iKbSPJYwUOlHhgEFFFdBeg+RcfuzcYUuODf0UfXXd
   kf0pb83OT0w9xwRrPBwB++7q/f1tTzx/osurh7bbLmMikP+VvfmtdirnG
   +GHf05VZcuAiOSpTBZrCIBbQkzcONfZMSYFii4dwSX6+1CVFNiUXRh0uF
   nscPThgJH4sdrb6vTv96JeIhVL9nzs5yaknptH4JhIa/qP5bjLs7I6GyQ
   TmeMkBZbi6uYklgrvrZD/HJbBFXo2XwRMGNEi5G4vNdT/Cqdt056/Ukpy
   w==;
X-CSE-ConnectionGUID: LAuzkNHrSkaoVemQi4tW/A==
X-CSE-MsgGUID: Noo+qSLSQEyvl2VbaycyUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="100318723"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="100318723"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 04:46:41 -0700
X-CSE-ConnectionGUID: V7B9WL++TxyyA9HKyP1lfw==
X-CSE-MsgGUID: xzuN3+ccTcq2FZpnL5JZNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="265086701"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.185])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 04:46:38 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
References: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
Subject: Re: [PATCH 0/6] platform/x86: x86-android-tablets: fix Arizona and
 Crystal Cove GPIO lookups
Message-Id: <178834959196.3990.3844849629099669864.b4-ty@b4>
Date: Wed, 02 Sep 2026 14:46:31 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sun, 30 Aug 2026 04:15:04 -0700, Dmitry Torokhov wrote:

> When gpiolib dropped name-against-label matching in favor of firmware node
> identity mapping, lookups referencing unattached software nodes (such as
> arizona and gpio_crystalcove in x86-android-tablets) stopped working.
> 
> This series fixes the lookups and cleans up redundant software node
> registrations on Lenovo tablets:
> - Point Arizona GPIO property entries directly to the codec device software
>   node, which is attached to the parent device.
> - Hold a device reference in gpio_secondary_fwnode_init() to ensure safety
>   during devres action teardown.
> - Generalize gpio_secondary_fwnode_init() to accept a node group argument
>   and use it to attach crystalcove_gpiochip_node as a secondary firmware
>   node to INT33FD:00 on Lenovo Yoga Tab 2 models.
> - Drop redundant swnode group registrations on Lenovo Yoga Tab 3 and
>   Yoga Tab 2 models where codec software nodes are already registered when
>   attached to their respective devices.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/6] platform/x86: x86-android-tablets: fix Arizona GPIO swnode references
      commit: 355b6558dd7be049aff4f0d438b0128f91a982eb
[2/6] platform/x86: x86-android-tablets: hold device reference for secondary fwnode teardown
      commit: 144113b0a70fa18033a747ee5db6803308f7688c
[3/6] platform/x86: x86-android-tablets: pass node group to gpio_secondary_fwnode_init()
      commit: aab060ec969c3859b81f80f3444fd5a2edfc3cf5
[4/6] platform/x86: x86-android-tablets: add Crystal Cove GPIO swnode support
      commit: 7872c625cd83a0247821cedd6c6f63938d4bddbc
[5/6] platform/x86: x86-android-tablets: drop redundant swnode group on YT3
      commit: 74884436a53df0bbaf6d92d2922f643a4581b247
[6/6] platform/x86: x86-android-tablets: use shared battery swnode group on Yoga Tab 2
      commit: 312fd3f3a85b89aa0d4fb5417043d640daa3732c

--
 i.

