Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA9B367B73;
	Fri, 10 Jul 2026 17:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783703445; cv=none; b=R8b+QY3olx2/PgLBwojYffSb93v5EgUBazw0Y+QqVnjmw9p3v4bbFg6KeTUjC9l+Y1WIvghpYfM1JfWarpcsyJgbaXKM52YqTrLMnwmUuwvAd7b4V57Pkd0uZI+neCr0ZEj+zlxAOvU2u6MR9dXptGAaOWS1fQGbiaZVJdcRYaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783703445; c=relaxed/simple;
	bh=RQ2FwVdhFdIwkCktJTz1+V8HT2zNvERNy13bs/cRqxc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jfyUwb2Fp00WljsWCu2hofn0+UGYEnTQ0uv5dnkUyYX0xl3hPdxZDzqnlFytb+Z5hW8hTWK3cPUEayIsDcaHpoVOFb0x0TPPpfkgSvLjIC+qIPq6lRmHJoZ4HtugfWQjquJOZCEPU9IWpeMs0j/sXw/JiL1OSRxdqnTD7ezBvjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YDkAnIoP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YDkAnIoP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783703444; x=1815239444;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=RQ2FwVdhFdIwkCktJTz1+V8HT2zNvERNy13bs/cRqxc=;
  b=YDkAnIoP3aDfIwFz0euPd4orCVcTYqVe5GE433pSAWmEFhBCbH3D4sYR
   7W44IGrHF3lcBwzWrYjy67p5pp5zQPRrti/+5NetbbDpHSz52xDJM/rgy
   MWQcqoDGb3RR0kfQkdwVr8Ka9ibKbtXc+F+VZOC3tGlpsrvGdSWvoY6U5
   D4hyW9NWnRAywtJA+PduLnXiE4nouaPEfuat/3Hi3wpcxAiibS2fpuiFm
   Lurx+auWButmtg1JPwydB1QAdNX4xPIYov4n7qViKk4K7QgpEeEmzD757
   0zdUEuFiLfFW/cHaX398jHDgH5OMxGv5FBfcZQ0StYpfh0WiiDb235ubf
   A==;
X-CSE-ConnectionGUID: u2CY38trRIa8TRaD5EANOw==
X-CSE-MsgGUID: Kyu3/3prQoiToHQm+os6SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84507205"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84507205"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 10:10:43 -0700
X-CSE-ConnectionGUID: 4kgc9+gbS9q9HH5b7GXjVQ==
X-CSE-MsgGUID: lH6SnV1qQMC5qQofPN17rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="255031656"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.169])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 10:10:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D . Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, Marco Scardovi <scardracs@disroot.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260617155104.10111-1-scardracs@disroot.org>
References: <20260617155104.10111-1-scardracs@disroot.org>
Subject: Re: [PATCH] platform/x86: asus-wmi: fix resource leaks on probe
 failure
Message-Id: <178370343019.25696.17820613871927104604.b4-ty@b4>
Date: Fri, 10 Jul 2026 20:10:30 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 17 Jun 2026 17:51:04 +0200, Marco Scardovi wrote:

> During driver initialization in asus_wmi_add(), various subsystems are
> registered sequentially. However, the error path labels are out of order
> relative to the registration sequence.
> 
> Specifically:
> 1. If asus_wmi_custom_fan_curve_init() fails, the driver jumps to
>    fail_custom_fan_curve. Because this label is placed below fail_sysfs,
>    it bypasses the cleanup calls for the input device and sysfs groups,
>    which were successfully registered before, leaking those resources.
> 2. If asus_screenpad_init() fails, the driver jumps to fail_screenpad.
>    Because fail_screenpad is placed below fail_backlight, it bypasses the
>    cleanup calls for backlight and rfkill, leaking those resources.
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
[1/1] platform/x86: asus-wmi: fix resource leaks on probe failure
      commit: ef3daa2b84a2b8499ce9e2ce1c865dca36d39f95

--
 i.

