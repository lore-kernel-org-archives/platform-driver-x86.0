Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D283939B3;
	Tue, 15 Sep 2026 13:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478356; cv=none; b=sklbeyveEcXtf50i5/JeDAvO5VUKZL3qhIQdX9fOmcpC9ajqRwc4WUtyHjycyr67ZTguOTBX23qOPBApx12+oT8qffGCU2Vx4olQf/eZvWrF0/atrOHsOkYvuP5gvik/LIBzDPeAypr/58jquMv5bDkDqZ40w4QI3uuZQDOmtJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478356; c=relaxed/simple;
	bh=77Ok9U9fWX55XK2TUWHLPaxY3j+guZtQ9ytqGuFu+rc=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DnC+RFMx4NqQV85hVCeO2mCEtHR5UOowtMyLQ5uhx0A176bYDWYeJGWuAnH3xip9aibMR1CNrlw/qn97mC4xQ9s1Ao4wcN/H55EWOSHqrB7HWC4UEaHB3pCwX2EFHz3jZJLU1Qxn+d2Xn2bzEHEZ79SpRdZ0qpAKH+DwFnmkzaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vex3Zk9Z; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vex3Zk9Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789478356; x=1821014356;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=77Ok9U9fWX55XK2TUWHLPaxY3j+guZtQ9ytqGuFu+rc=;
  b=Vex3Zk9Z+4kXFZUdrgOkrbD/mVcw/SKUhNetXr0JyVbOY8+pC+z3qPpW
   YCei4aVGNACWIKijbFY9Ua8HYZRfEdlnQIL7vXWVgtmMCYxfo0kNAPJqp
   mO69vVS2d+VDhAuPJpRRspc4uvDRB/2bb36DD9xvzAr/LjmIY2dY88EFw
   ljGVKhs7hXo9mLKl7rxTaeGWnopK88Y63/nTKMlSRa5ABIMiO5jlBsAJ7
   ijUBzbb7rdqRFoXayA8YBQHabQV4efl87ffGFYCGZr8Ums03f7AxfPhFQ
   LRxykDgClWuWQsALie/MFpE0nVB4qWIlCJlNlJ5PNkyZWFgAEEhXYXpT8
   w==;
X-CSE-ConnectionGUID: BG8QazJDTfWbdx4wQKGJyw==
X-CSE-MsgGUID: vSWdBJPKR2OSCi2dFuWK9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="112609096"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="112609096"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:19:15 -0700
X-CSE-ConnectionGUID: SdTTEVfIRL6horfLtG2MFA==
X-CSE-MsgGUID: l0AUExP4QG2nScW8HZMHTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269331077"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:19:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, Lukas Wunner <lukas@wunner.de>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Guangshuo Li <lgs201920130244@gmail.com>
In-Reply-To: <20260708032647.712412-1-lgs201920130244@gmail.com>
References: <20260708032647.712412-1-lgs201920130244@gmail.com>
Subject: Re: [PATCH] platform/x86/intel/vsec: reset state before
 re-enumerating
Message-Id: <178947834638.32141.10693851497877140431.b4-ty@b4>
Date: Tue, 15 Sep 2026 16:19:06 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 08 Jul 2026 11:26:47 +0800, Guangshuo Li wrote:

> The change referenced by the Fixes tag split the VSEC enumeration logic
> out of intel_vsec_pci_probe() and made PCIe error recovery call
> intel_vsec_pci_init() directly. This avoids another pcim_enable_device()
> devm action and another devm allocation during slot reset, but it also
> means that error recovery reuses the priv structure allocated by probe.
> 
> On the initial probe, priv is zeroed by devm_kzalloc(), so state[],
> suppliers[] and found_caps start from their initial values. During slot
> reset, the existing aux devices are removed before re-enumerating, but
> the reused priv still records the old devices as registered and the old
> capabilities as found.
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
[1/1] platform/x86/intel/vsec: reset state before re-enumerating
      commit: 34744f72e1b83b8fc55f7321819c4bc8daab0a69

--
 i.

