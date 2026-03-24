Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869C223183F;
	Tue, 24 Mar 2026 13:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357408; cv=none; b=evDn4hp0keJXblknmIvrpZCBejUQPatbsojKjiV2ObT7a+PwUHaIbnZorJyIm2uuPQNBb+8h9jG1h9yBKWfIsr9+3JircTK51aB4ODO/h2RQFFH3Jc2XKevXfq8kfW0q4MDlQlnCMpB9yRd7nbM7zLXt+/9I/LrOeVQhRRkyhPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357408; c=relaxed/simple;
	bh=NsDa6X0iWmiSua0aAUSB2uYUqqai+HaDvaaNr17V6hM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hSGjzFVN+9qvwVpmvNGI2+qy6gI1eWjFnkFm5RaHR+bJb+xybSOUW0i7xjQJCHIiki5l4vm/9LPzx288MRL6K5/dqitZBWHztAHyaSXpeZxZ3N2toYTcrDFjBzrik9nHf5PjWPTKH2aL9GX+W/YkE6pKltufBoPmCdac3cL/qzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWcic8j2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWcic8j2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774357407; x=1805893407;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=NsDa6X0iWmiSua0aAUSB2uYUqqai+HaDvaaNr17V6hM=;
  b=QWcic8j2XrNCZg//GzXWBRITKKeLAXWsLnReDMDPW8EqU/WbuZD+G7Jy
   jpH/HuktPiVJQeOtoF/BpLh79IOaglrnkWLpXD3hcNapR2auS64Y1FLDN
   uOtEfdDPYSFetAYuyPR28nIveY24LxoNdkjnABDoGpJXXHiDPxefE/Tjf
   Vzm9oyeqY6HJn3ib4YDBTB58Tofa+QKOVbGd9yQYNDQYvh2QHyY0koxHH
   nPiFbDRxsN6CQ1Yu+EfcAIY0M1RtNPhb2J8mvuQxrzje9+PaiesF6Rww6
   T/U8Pui8kYw9hGPqAycfwAD+QOzK2Qeg7AJ4KVwCkH/x5VFd2+v6bJBD6
   w==;
X-CSE-ConnectionGUID: X1ovsL4uT8mzsJ8fdLpdyg==
X-CSE-MsgGUID: +uP2oj4vROehxPfdTJxWfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="77975215"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="77975215"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:03:27 -0700
X-CSE-ConnectionGUID: KlBkId8ERCeo+qD13jEXDA==
X-CSE-MsgGUID: m7Kcul9kQyGCp2iN1TvUCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="247424791"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:03:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: w_armin@gmx.de, Mingyou Chen <qby140326@gmail.com>
Cc: cryolitia.pukngae@linux.dev, hansg@kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260323132218.444383-1-qby140326@gmail.com>
References: <20260323132218.444383-1-qby140326@gmail.com>
Subject: Re: [PATCH v16] platform/x86: bitland-mifs-wmi: Add new Bitland
 MIFS WMI driver
Message-Id: <177435739827.7073.15606880745390793418.b4-ty@linux.intel.com>
Date: Tue, 24 Mar 2026 15:03:18 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 23 Mar 2026 21:22:18 +0800, Mingyou Chen wrote:

> Add a new driver for Bitland laptops that utilize the MIFS (MiInterface)
> WMI interface.
> 
> The driver implements several features through the WMI interface:
> 
> - Platform Profile: Supports "Quiet", "Balanced", "Performance", and
>   "Full Speed" modes. The "Full Speed" mode is intelligently restricted
>   based on the AC adapter type (requires DC power, not supported on
>   USB-C charging) as required by the hardware.
> - Hwmon: Provides monitoring for CPU, GPU, and System fan speeds,
>   as well as CPU temperature sensors.
> - Keyboard Backlight: Integrated with the LED class device for
>   brightness control and provides sysfs attributes for keyboard modes
>   (cyclic, fixed, etc.).
> - GPU Mode: Allows switching between Hybrid, Discrete, and UMA
>   graphics modes via sysfs.
> - Hotkeys: Handles WMI events for system hotkeys (Calculator, Browser,
>   App launch) using sparse keymaps and reports status changes for
>   Airplane mode, Touchpad, and CapsLock.
> - Fan Boost: Provides a sysfs interface to force fans to maximum speed.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: bitland-mifs-wmi: Add new Bitland MIFS WMI driver
      commit: dc1ec4fa86b2b8bba2b6122f2b4420217b5bae9e

--
 i.

