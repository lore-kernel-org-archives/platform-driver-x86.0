Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19860356766
	for <platform-driver-x86@vger.kernel.org>; Tue,  8 Sep 2026 19:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894081; cv=none; b=X/j1P10U7flUwxF1H7VMX1JSDZT7P+QbFxh0aj5U4BvzSntAGDv+Q+XvTC8Dp68F2+pxkq6fuDOVrThMAWHmG/Lo6J309niZGufZc666fcPj70lFEarBe0o32KbIEqg8Ky26/MW2w7xKs4RCJepsJQP2/OjC6OoXrrgfA4QBQBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894081; c=relaxed/simple;
	bh=NpLQZASdu5iyWzUXLdSFnmOXFIRW4YZi6LZ4ciZcvKI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lSs84RoRnrVUINYbFALXMLou7rbj4l5V9CLP83i6DrV9NaxaXCOJl3Uv9+u+xFOMW2zASHrAQI3KrtmirCIGjndwF3K1SL6gtXH3HKFOa1SSaNzZHjz/rWhp4TW3dEaiTG44EE68SwgfvJC/uq3SBfvtyS9HD4fvQ7B8pVNu1zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EcNAvZVz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EcNAvZVz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788894080; x=1820430080;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=NpLQZASdu5iyWzUXLdSFnmOXFIRW4YZi6LZ4ciZcvKI=;
  b=EcNAvZVz3nQ10CQI+LI2Kxuv2sErR7vXssPJQDPHiBwPXpRAvdvlbgD5
   /eb3igtwGtZ3yARzrS+STyWhY176NJ+DhCud9U3TcmD35fledcCyn6cm6
   0k1t7HEH1aJML6LOR1/yqyQbtvMAjJ7jkBMcj/sNYOW12So6H/EqFFwq+
   qihV8u+fzn88aWOqE4/91f0WHRdtBaW4e82OfHJStZ19EUH0g1WAXEpiF
   YfHJLaQxh6NUo8y8SFpbX19r1l5ZfnTVtFiLIQL0BCvk6LdQq0J5RdmsS
   ObqyD4c8r34Qn/w7jLVCSoOemS2V1sL/yf+0XfkTznLQsUH0ajz+KEWTp
   A==;
X-CSE-ConnectionGUID: RPMdm0M+TDSL1yNMxzY1JA==
X-CSE-MsgGUID: xErZdcnURBCu6gavyunnpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99900360"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="99900360"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 12:01:17 -0700
X-CSE-ConnectionGUID: HC7wVmBkQce3eWe2IxARsA==
X-CSE-MsgGUID: iYBOvJGsSyOHaHIhGDPtxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="273033688"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.109])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 12:01:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
 platform-driver-x86@vger.kernel.org, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
In-Reply-To: <20260908185517.49047-1-johannes.goede@oss.qualcomm.com>
References: <20260908185517.49047-1-johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v2] platform/x86: x86-android-tablets: fix
 gpio_secondary_fwnode_init() not working
Message-Id: <178889406653.4053.2141919269090940483.b4-ty@b4>
Date: Tue, 08 Sep 2026 22:01:06 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 08 Sep 2026 20:55:17 +0200, Hans de Goede wrote:

> acpi_bus_find_device_by_name() call returns a pointer to the device object
> on the ACPI bus, aka the ACPI companion device.
> 
> gpio_secondary_fwnode_init() then continues with setting the secondary
> fwnode on this device. But this is not the actual physical device for
> the GPIO controller (e.g. the GPIO controller platform bus device).
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: x86-android-tablets: fix gpio_secondary_fwnode_init() not working
      commit: dd519eb8f66eaa205bbbdcb753588138a1d18414

--
 i.

