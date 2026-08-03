Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792E14334A2;
	Mon,  3 Aug 2026 19:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785784369; cv=none; b=ZKQu9yoNA3tW9yYLEAxFhf8TWrnbcbA4FfeYTjWmHGLNsqlcXMV8vDxkcTvjPLuxNtVDB1N3ZsxlIoeguhXnEQri1R8na5WlpqsCZpbtBeIcR9Rvu+r+nhnR9WwYrrz+SLtaFfm2DoaiQVgP60MpQ/TJ9KJLuWKSdMA02EvXoMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785784369; c=relaxed/simple;
	bh=YSlMPszoVdKIcnYZZecGhw5zsV+yVN6W72HLOwBaXRI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=luQAl5puwhmDJFLs28iwUlTHJCBM331FJrcavE9KGqUMyiHpZrDfmF6m0yDFULkIW0aLDJLpKbB1z5Juzg065w/Zi6IxWi3edu9ZuPyKhoICHngrW2nHsGJ78cCMe4LTjiZclJ132TzTtwmKmDhkcon/zTwaIGe5m/Y1SVxpToY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NEIC5Gl8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NEIC5Gl8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785784368; x=1817320368;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=YSlMPszoVdKIcnYZZecGhw5zsV+yVN6W72HLOwBaXRI=;
  b=NEIC5Gl8Fo7i1W1mAT+zH7P0Ys+M9U1y7jkJyRWrCWYHTOr5/6FwjGPr
   UdJTygBg01Kn8Lm5OdIfDGx8WjtX6enqOSuBleexKiO31i+VLRJVxfYw9
   zTRX0Z6WaHtBM4HHnVLZRV0WRupc2Y9+JN3UUHzT4nE7MlstnPwOGFWaQ
   F6UZwACVw1wvq/EG9tldZM6+uuJNU3g7cPkTlHXHmL6pHXus76cTa0BZ8
   3uhggbJXA5+/z0UIfq6RK7zx53EW4TujI83Dc5vQepTKTQVxpC7nHxXdY
   WJq+24f9mvz2qv9f1VmnloneW28p2M/yl3JxG7oMRbGEPd++y2mYfGkEU
   w==;
X-CSE-ConnectionGUID: LYM2w3RPQPa17iyas3ou8A==
X-CSE-MsgGUID: 29dr7stUQYOgYl4M5nK0Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="85307325"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="85307325"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 12:12:45 -0700
X-CSE-ConnectionGUID: 2u9rqEUrTMmWt8p8e0x1oA==
X-CSE-MsgGUID: Ikg0cfJeRLeqUdmIvPXdag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="291238114"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.61])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 12:12:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Joshua Grisham <josh@joshuagrisham.com>, 
 Riccardo Squarcialupi <rikysquarcia@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260731125431.199902-1-rikysquarcia@gmail.com>
References: <20260731125431.199902-1-rikysquarcia@gmail.com>
Subject: Re: [PATCH] platform/x86: samsung-galaxybook: Add SAMB430 device
 ID
Message-Id: <178578435863.17622.13518446521723887512.b4-ty@b4>
Date: Mon, 03 Aug 2026 22:12:38 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 31 Jul 2026 14:54:31 +0200, Riccardo Squarcialupi wrote:

> The Samsung Galaxy Book6 Pro (NP944XJG-KG4IT) exposes its SCAI ACPI
> device with HID SAMB430, which is not in the driver's device ID table,
> so the driver never binds and none of its features are available.
> 
> Add SAMB430 to galaxybook_device_ids[].
> 
> Tested on an NP944XJG-KG4IT by forcing the bind via driver_override,
> which is equivalent to an ID table match. All driver features probe
> successfully: keyboard backlight LED, battery charge control end
> threshold, platform profile (low-power/quiet/balanced/performance),
> firmware attributes (power_on_lid_open, usb_charging), and the camera
> lens cover input switch.
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
[1/1] platform/x86: samsung-galaxybook: Add SAMB430 device ID
      commit: 31e1acf15df9a23ff3ead6dddf8ae1b7103d8b49

--
 i.

