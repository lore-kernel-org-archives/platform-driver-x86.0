Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A0935FF7B;
	Mon, 12 Jan 2026 15:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768232076; cv=none; b=tVO8DASdYorceaHwQGjMNZ/O7il+oQxU8QKKEYvnLPM3f7XKxKvxqZA7ku0OsjUf0yAh0f0Ov8CePKHI7zOSYeUwaKh6OxA4YNTUGzCcqYmBkqCfkboCdCb8dU2XbTh2SRcfhNOuNivacReaxbrQjGBgsX2Vx+kWxvrMxfIUyx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768232076; c=relaxed/simple;
	bh=I4rIb1NlPljSs9DaY6mcQY5q5i5Elf9bt/fnJlCIUmY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ay4YsTl4zyuGAW86L/wpCeYARTSMB2NtiXq7OG1HUVnPhSkSqW3+yO73aYZshe1xJZKQBFftipGzxx5fyYtUUdteFYgC2ScQDcPhVacyuldZi3K9aTRQHa24USKD9FSaGkMIl1+SOs3RtHWuOr4URHkPvLNkP6i8GHmt7vbEVq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OI2ppvzV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OI2ppvzV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768232075; x=1799768075;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=I4rIb1NlPljSs9DaY6mcQY5q5i5Elf9bt/fnJlCIUmY=;
  b=OI2ppvzVW80+SHYQ0FQh37K3iKlpLwqn1eJzVpvtvJX567kLljBzLREt
   N0j2uLYf9OW9fy6LV13q6OowSvG5ui4COeo78o27VbZM0WBEZQEluOBRL
   DrXN2WPSdqFeDqnuNFbwAT8BBCdRF39gJRrb05Yqed2ZeX5cTdNYC9ZEv
   xzsItcGiuCI0x5EMjPXbmJxkbXfL0yWoJSLPOAJRePeHWxxePmGhYT0tC
   YRHu+owTYR9dP8putwaRmPW3cCECuxRz97xwsPpCJ3TWqCjjCxWKYfIk4
   uknwRpSDropXI8qFFDNenOozcGA0P4+zcBPGatJ9V2smT2pUoZDhpdv8p
   g==;
X-CSE-ConnectionGUID: fq2XfsujTqauRn6q7rkU7A==
X-CSE-MsgGUID: 7WTqI34kRme367h4Pw7KKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80613196"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="80613196"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 07:34:35 -0800
X-CSE-ConnectionGUID: EpYSdm+JQt2atVIQ10RLww==
X-CSE-MsgGUID: ScRbl3cMQ1GdIVk/1Ly6PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208960332"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.111])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 07:34:32 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Nitin Joshi <nitjoshi@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 njoshi1@lenovo.com, Mark Pearson <mpearson-lenovo@squebb.ca>
In-Reply-To: <20260106174519.6402-1-nitjoshi@gmail.com>
References: <20260106174519.6402-1-nitjoshi@gmail.com>
Subject: Re: [PATCH v7 1/2] platform/x86: thinkpad_acpi: Add support to
 detect hardware damage detection capability.
Message-Id: <176823206669.9723.6632860233321303705.b4-ty@linux.intel.com>
Date: Mon, 12 Jan 2026 17:34:26 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 07 Jan 2026 02:45:18 +0900, Nitin Joshi wrote:

> Thinkpads are adding the ability to detect and report hardware damage
> status. Add new sysfs interface to identify whether hardware damage
> is detected or not.
> 
> Initial support is available for the USB-C replaceable connector.
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86: thinkpad_acpi: Add support to detect hardware damage detection capability.
      commit: f4afc36985365f2926fe5beaefbb99b97061378d
[2/2] platform/x86: thinkpad_acpi: Add sysfs to display details of damaged device.
      commit: c333c896ca30a1bfbd32927e3642e45f4d3cf0ac

--
 i.

