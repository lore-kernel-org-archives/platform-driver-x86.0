Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0169953A8BD;
	Thu, 15 Oct 2026 14:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074544; cv=none; b=QObEK8Qg74/w70LD623NAIN7t5ByqV0uCFzdjhJNCbFUeAxikJ8AGT8KSwoxraZwA9ZijGaFXjDdqZ6DjqwvoKdlQ7PiXX00XoxECzgs2Q9kyPK5LiSSAxGfvuL0wkJeXriOirHIac/IVIgUWrCzTr2hHAGMWBcsFAQYvG/F71g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074544; c=relaxed/simple;
	bh=TzCFDmeBqdbKfAGIoWcy7wDdRTWEKwouXi0ycO5xYOU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rtxQVEpJvMTnkp+Gh5M/LhDmKCqsOxzvnSCf44PFm0CPlvyk8gc5P55q/tvssnRSDRbhYTyBkBqDohhsWp2lBB8v1xjMURSaiUOGGkPlHxFwcp+l7Uo1tCknAEcLD0nv3Nl98r10pwq5PkRHxStj+UCHcewNPIhRwTRsay0XyRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kGZBUTLN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGZBUTLN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792074543; x=1823610543;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=TzCFDmeBqdbKfAGIoWcy7wDdRTWEKwouXi0ycO5xYOU=;
  b=kGZBUTLNaoLE+t8NBH87nm23nqDMmieV64i1hH0KymIF7CWuyksL96dT
   tPF+G1xA7ViOi/nR9MEt0mDwDsyroQf/eS1eLO0AipanhW5gS8EudMzhk
   ZgG4KCW49abOiCkOIFmSmAA6/UW8Aw3/bkuukEY98h0HUoYNBfyS56h/c
   HkIBUpPeg6AvgeVn2wfbO1yoHPBgDPV3ZXwIwNXtpVOGvl4C/laqR25Oj
   yXdWznLwCvIkZ/BT/IiFEgrmiEd2GuU1j8PPGl/Eg19VYOfp8tdzvD3Kp
   +munQ1Y0w7A3T7N/LSWCYjz19VvU8IE0oNbfbG9+Lbqo4PYxdrrGRQUkK
   w==;
X-CSE-ConnectionGUID: ANLtBaqbQfWUPR3mKzZADg==
X-CSE-MsgGUID: ofBGY3V2TEuP64Nj+tJaLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="730407"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="730407"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 07:29:02 -0700
X-CSE-ConnectionGUID: D62mxOwCRDaeTMoMuhmhew==
X-CSE-MsgGUID: IbL8I8I7SjeWgoj6qVF4QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2063814"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 07:29:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, David E Box <david.e.box@linux.intel.com>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261013192935.2243291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20261013192935.2243291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v5 00/20] Decouple PCI and auxbus details from Intel
 TPMI driver
Message-Id: <179207453551.13793.9151395992521999111.b4-ty@b4>
Date: Thu, 15 Oct 2026 17:28:55 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 13 Oct 2026 12:29:15 -0700, Kuppuswamy Sathyanarayanan wrote:

> This series is a no functional change refactor of the TPMI driver
> (vsec_tpmi.c). It separates the code that does not care how TPMI was
> discovered from the code that does.
> 
> TPMI is discovered today through a PCIe VSEC capability, with the PFS
> table address computed relative to a PCI BAR. BARs are relocatable at
> runtime by resource rebalancing, hot plug or error recovery, which ties
> a platform wide register window to the lifecycle of one PCI function
> and to an address an untrusted VMM can influence. That is a concern in
> secure VM environments like TDX.
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
[01/20] platform/x86/intel/tpmi: Use static strings for the feature device names
        commit: bf74797a91459b80f02ea6a7e969fabcd8f38d88
[02/20] platform/x86/intel/vsec: Pass a struct device to intel_vsec_set_mapping()
        commit: c8fa7ebd1bac336413cade8d32e48f60dea3f507
[03/20] platform/x86/intel/tpmi: Remove unused vsec_dev from intel_tpmi_pm_feature
        commit: 9880967d2c5276e731fd4a208a138b4f9e7ff210
[04/20] platform/x86/intel/tpmi: Get tpmi_info directly from the parent device
        commit: 82e084332d983908b81c9d23bebcce376fda62f8
[05/20] platform/x86/intel/tpmi: Keep the feature resources in intel_tpmi_info
        commit: 6440396a3787037a34afcc5fdbfd67287136a935
[06/20] platform/x86/intel/tpmi: Describe a TPMI instance by its two devices
        commit: d6c7960a7737e531a14e2875d4273eda9de9c119
[07/20] platform/x86/intel/tpmi: Drop unused arg from tpmi_set_control_base()
        commit: ef60181ce8b0a44bb0825cc8409e409b60552981
[08/20] platform/x86/intel/tpmi: Do not assume TPMI is enumerated from PCI
        commit: 1f0e16fd229d99983f3d633f1f83b5204553a562
[09/20] platform/x86/intel/tpmi: Split out enumeration independent init and exit
        commit: 1cab9841792e35f73b8e1f21bcc3f9f920bc1995
[10/20] platform/x86/intel/tpmi: Split off the PCI VSEC enumeration
        commit: 32cb2f81b0afca8060a07ca2933dae5e833ffa54
[11/20] platform/x86/intel/tpmi: Include the headers tpmi_common.c relies on
        commit: 5ea00e1e4edb9d4ff3f288f9d4d2c0d1a5f0f432
[12/20] platform/x86/intel/tpmi: Turn TPMI_GET_SINGLE_ENTRY_SIZE() into a function
        commit: 70fb9d0d8177c0a2f9a0f2927fbf75a78c9de38b
[13/20] platform/x86/intel/tpmi: Use guard() for tpmi_dev_lock in the status read
        commit: 925ecbd683cb752ee90b2cb076cf5be9e3620454
[14/20] platform/x86/intel/tpmi: Use scope based cleanup in the memory dump
        commit: 29810cc46eb3726f08d3b71f10380539a75e33f8
[15/20] platform/x86/intel/tpmi: Build the TPMI control words in one expression
        commit: f68ec4f3f1a072fd816b83c66e4f6d3ea4b87ff9
[16/20] platform/x86/intel/tpmi: Use DEFINE_SHOW_STORE_ATTRIBUTE() for mem_write
        commit: 769236d3c2265c942ca69b567b21dfcf6439eddd
[17/20] platform/x86/intel/tpmi: Use scnprintf() to build the debugfs names
        commit: 596ce7f0d6fdd6426e331d7817fad9ef02bbeb72
[18/20] platform/x86/intel/tpmi: Use DEFINE_RES_MEM() for the feature resources
        commit: 5f28895b74c778a02c1d0b8e90b804e0fc235c69
[19/20] platform/x86/intel/tpmi: Declare the loop counters in their loops
        commit: 84b0d0eb2d37a8e6e68af418dadfac5b4700527a
[20/20] platform/x86/intel/tpmi: Describe the device creation policy on the function
        commit: 68691508ea41899fb98098148225694f402f3861

--
 i.

