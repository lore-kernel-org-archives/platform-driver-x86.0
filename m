Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435155;
	b=nvqH3Pf4PNDiIfvZp+FtiZQxi9fkCYuLaMyPrP1FJNJe0MJl2faehejeOzO9p4fQZ+si
	 8zrISyGoIp5IQMEMLw+glGN4ngY7+JvWBjbc6zSpA7GWyZ0pcVo2dUK3eD8LJvepDtI9e
	 wsupDWGYy+wYArX7oki2XCAWyd7tzmIFQWJje1P31BPSl7fi0ubrVr21ya+M+0vSfQOIn
	 pA9kBVl4ofwHyzE7U7UwMHc1+ywal5aODNlKuKqLTJnWA+DLv7KQXZHNSoYOT6jSjIQbh
	 kEeYgKuIaFrxjiSEkxujIHl9U9ILZKLT95DUyntxn/nKlgm9CzJIdde85t+RMgQZtCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435155;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=vCHHL8GtZxUcBgElveCjjiFk0Z1GDSoAFMR2e2tq3JI=;
	b=R+5HhqbPar2gyq9/FvSfz28oIjCw43iM9quLq+VqzPKJyGdWInsWs7lEUdFqP9caNEHy
	 mMi93BQPr3sSiM6rJXagNeVRJL8iWc4BuQtaxm8DX7KWjgOko/+gkmkDTl60dYn7VThwn
	 2+49tkrgwmpUlkEqQsOMs+JWK8yiB2bxHi4pd8mFmaUfcYs3hl8N+lfS6Y9yr3vcmjy+Z
	 EhJZkYOYhUgAdJe8rIjNc4zhG/v6u5ZMc17ewFU04TxeCtOvSMf2yyoPJ0Suk5u04i8OV
	 F5Du9CVk8qYr4JJwT2Svvt8c9zM9P+8eHNJj3K6WsYCn26uDRHkGklpXpk6o9KXWg7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TFpUFl1W;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC56C606A32C
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 11:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC56C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TFpUFl1W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795435155; x=1826971155;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jCDYA0CNTZQGQQOmOwup7KXAqLwzr4Kg8soDwUgu1HI=;
  b=TFpUFl1Wsi1oddxQku7bCyoVEoNTMrjsGKrJTdCXB+b+SACXvBEVT/NG
   O5GSDWJUGNTgYdv9n3MX49UF2MFWh5lqf+VC5BYXZWKODAjnlsz6volhy
   8/vlh/ff/p8v2SqIGL75pjjWK5TAS7fLVIN7TlmMGmATasPxqocx/FA35
   346LogXW01HWS/54aQKnZvq6DrOzzxD27+N367wh9aRpT7jnP2wLjr3Qh
   g5g2Aqe8/3Qo9IAuT4e4Oe68wfkXn62/T4GDi95BMEA6iLKZMw8iDGCYk
   G+et+2doIzjYOEXUlndtp8Iu2YJBtrL0b8n3iQ3k8V/ih1vHwFMoMecjn
   w==;
X-CSE-ConnectionGUID: C4uB2hVFTrKpHFvxXwFL4g==
X-CSE-MsgGUID: 0kRUNVVjQgezp+2RDTEAEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4251677"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4251677"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 03:59:15 -0800
X-CSE-ConnectionGUID: G4UV9MbOSZ+awukjlmeRSA==
X-CSE-MsgGUID: QDLJ8X1DQNCM8c3E1ibT6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11379646"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 03:59:12 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Nov 2026 13:59:09 +0200 (EET)
To: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
cc: platform-driver-x86@vger.kernel.org, Suma.Hegde@amd.com, 
    NaveenKrishna.Chatradhi@amd.com
Subject: Re: [PATCH 00/26] platform/x86/amd/hsmp: Extend socket and per-CPU
 sysfs
In-Reply-To: <cover.1793602633.git.Muthusamy.Ramalingam@amd.com>
Message-ID: <56a6c02d-e68b-2cb8-a83c-ca8679bc5a4f@linux.intel.com>
References: <cover.1793602633.git.Muthusamy.Ramalingam@amd.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 2 Nov 2026, Muthusamy Ramalingam wrote:

> This series extends the AMD HSMP sysfs interface on both the ACPI and
> platform drivers. It starts with socket attribute naming cleanup and a
> parser-friendly store error helper, then adds the remaining
> message-backed socket and per-CPU attributes used on server platforms.
> 
> Later patches cover link/bandwidth, DIMM, SVI3, power-efficiency, and
> per-CPU files. Attribute visibility follows the enabled-message bitmaps.
> Probe-time discovery for optional DIMM/IO/xGMI hardware is quieted so
> expected firmware misses do not flood dmesg.
> 
> The series ends with socket_temperature (HSMP_GET_TEMP_MONITOR).
> 
> 
> Muthusamy Ramalingam (26):
>   platform/x86/amd/hsmp: Drop _input from socket sysfs names
>   platform/x86/amd/hsmp: Rename clk_fmax and clk_fmin sysfs files
>   platform/x86/amd/hsmp: Add hsmp_err helper for parser-friendly store
>     errors
>   platform/x86/amd/hsmp: Treat socket_power_limit as firmware-clamped
>   platform/x86/amd/hsmp: Print protocol_version as hexadecimal
>   platform/x86/amd/hsmp: Add sdps_limit sysfs file
>   platform/x86/amd/hsmp: Add df_pstate_range sysfs file
>   platform/x86/amd/hsmp: Add xgmi_width sysfs file
>   platform/x86/amd/hsmp: Add gmi3_link_width sysfs file
>   platform/x86/amd/hsmp: Add pcie_link_rate sysfs file
>   platform/x86/amd/hsmp: Add lclk DPM sysfs files
>   platform/x86/amd/hsmp: Add io_bw and xgmi_bw sysfs files
>   platform/x86/amd/hsmp: Add DIMM sideband sysfs files
>   platform/x86/amd/hsmp: Add per-CPU floor limit sysfs files
>   platform/x86/amd/hsmp: Add metric_version sysfs file
>   platform/x86/amd/hsmp: Add enabled command sysfs files
>   platform/x86/amd/hsmp: Add DIMM power and temperature sysfs files
>   platform/x86/amd/hsmp: Add SVI3 temperature sysfs files
>   platform/x86/amd/hsmp: Add cclk_floor_limit sysfs file
>   platform/x86/amd/hsmp: Add xgmi_pstate_range sysfs file
>   platform/x86/amd/hsmp: Quiet probe-time firmware status dmesg spam
>   platform/x86/amd/hsmp: Add powereff_mode sysfs file
>   platform/x86/amd/hsmp: Add svi_power sysfs file
>   platform/x86/amd/hsmp: Add per-CPU ccd_power sysfs file
>   platform/x86/amd/hsmp: Add per-CPU freq_limit sysfs file
>   platform/x86/amd/hsmp: Add socket_temperature sysfs file
> 
>  Documentation/arch/x86/amd_hsmp.rst   |  116 +-
>  arch/x86/include/asm/amd/hsmp.h       |    7 +
>  arch/x86/include/uapi/asm/amd_hsmp.h  |   11 +-
>  drivers/platform/x86/amd/hsmp/acpi.c  |  645 ++++++-
>  drivers/platform/x86/amd/hsmp/hsmp.c  |  298 +++-
>  drivers/platform/x86/amd/hsmp/hsmp.h  |   31 +
>  drivers/platform/x86/amd/hsmp/plat.c  | 2346 +++++++++++++++++++++++--
>  drivers/platform/x86/amd/hsmp/sysfs.c | 1858 +++++++++++++++++++-
>  drivers/platform/x86/amd/hsmp/sysfs.h |  116 +-
>  9 files changed, 5260 insertions(+), 168 deletions(-)
> 
> This series is rebased on top of https://lore.kernel.org/platform-driver-x86/20261014111430.23156-1-suma.hegde@amd.com/T/#t

Similar problems were repeated in a large number of patches, please fix 
them all even if I didn't end up marking them all.

-- 
 i.

