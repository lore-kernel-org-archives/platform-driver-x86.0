Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604868;
	b=x50aqSnpPVnVEUyWNVRt53343aaxEbC+kPO0LD/CdButCYrOVl4l1cTvfpXVTV3yU2uQ
	 37Bwp9wvAjanEtrJZ7GYYjUVeC4+CQaYMluQy6jXbwMGEwvzPB5qb+kiE7QMfVn1i4CK/
	 Y4Rt8EyNKN93ID4i4kIkA/ow7OkSQzmaRzxkxebHNKs92QLkZ9VqrSrdpdEuSrn6GKl52
	 wsOw6a2V/18r9P3GBnlR8VrUvg6xSegwiVA1pZk7dUwUNRVwJgP62HeGIL4voWoJSYSQc
	 9PPrv0D8gNcJRolvyOA2/Wi5Wxn21lXaeZknc1c2UJPGUYlMR8LRDN1hDa1rz7PAUqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604868;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=TnpFhh3ev1aa4da0xWF3S5jrQTnhqwX1LzAEX7kv9kk=;
	b=lWOaV7DzI62iQR+GAI3KpkH1/GyESSWDt3zOEuobRfFoGAP/pwGtixmREToAB7oIosG1
	 I6jJLuPhH9JOlTU0qmDbdsUXWRCQ19J05ixfg/31XnkHrzfoxIAZ/02pFG1I733dnEuAi
	 Ju4pBkcytyoYFustSejnTjexRhbM5+Uzpo8ICRd8I2N8bjaFoyCPkxVHCaBRbBt2IOFzh
	 IUX3V1eRT7Wz7YXK7IJzCiDwR18o+xd8m8y24Lp0fNWdzTT+BV7mQ05DZHPQC2LumrOCt
	 0xJGrb1zC8yoF1NDKe7HsA7lUx/bItbdt0zyKtq9ozVV2SxOT64q9ueIjkbzodfRdzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pi1Ao5p8;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8A9606A886;
	Fri, 13 Nov 2026 21:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D8A9606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pi1Ao5p8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794604868; x=1826140868;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=RrGaXyvzyjgJ4P0xQw9eIQnxfBssJ9V+WpmQ5Q3k+y8=;
  b=Pi1Ao5p8R4vetBRMnwtQleEzyrMPvdwrKNmzZRoMqE9itQxKNcdpmg52
   43goDXaTEAXZgxjJPDUY79Br99pIS8u2VUvRWd+4EfpNL39gABAN+5yQY
   Nfb8htzGqL88hWzD7P+Z1niBTQ2xLkjSapjZpY7g63j+iXn4vYInQIyEu
   9RrbENXxocQMyYl0MNqUQe0owp/g3gOMwgnae+7aqZ7VF43jBxBiJga9M
   GUETvIFS62zcukhwKU3UwpqFUTK+yQt00Ddl/iiVR8rbGgQwIjaLIc7DH
   Vw8FA1tUzo4c7oQu7XyqGCOnvBuHyrVbwiWFOvYSSSI/UsxVxk90nMDqg
   w==;
X-CSE-ConnectionGUID: SOJOBrC5QZe/Q2Bkxyg+3w==
X-CSE-MsgGUID: ZJoRrkLhSmawixHGYdn4bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3277584"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3277584"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 13:21:07 -0800
X-CSE-ConnectionGUID: EI3Xt7GsSIawFG5mKJrJXQ==
X-CSE-MsgGUID: 6Hz3T8yhTPaq5XZVUPIWig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9287201"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 13:21:03 -0800
Date: Fri, 13 Nov 2026 13:20:55 -0800
From: David Box <david.e.box@linux.intel.com>
To: ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, rodrigo.vivi@intel.com, michael.j.ruhl@intel.com, 
	ayaz.siddiqui@intel.com, syed.abdul.muqthyar.ahmed@intel.com, 
	intel-xe@lists.freedesktop.org, hansg@kernel.org
Subject: Re: [PATCH v3 1/1] platform/x86/intel/pmt: Notify userspace when
 crashlogs complete
Message-ID: <179460474975.2604806.7772916319418845665@linux.intel.com>
References: <cover.1794444671.git.david.e.box@linux.intel.com>
 <c265bd093c23d96417cb5c6504938c90adc36ac9.1794444671.git.david.e.box@linux.intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c265bd093c23d96417cb5c6504938c90adc36ac9.1794444671.git.david.e.box@linux.intel.com>

Sashiko's report [1] is right, and the underlying problem isn't one the
crashlog driver can fix on its own. Please hold off on this version.

The problem

On BMG and CRI, PMT features share one MMIO window, and a SoC remapper
index selects which region it shows. That is why PMT has callbacks: the
parent switches the window and performs the access under its lock
(xe->pmt.lock). On CRI the read_reg()/write_reg() callbacks cover the
discovery status and control areas.

For CRI, xe also holds pmt.lock across intel_vsec_register() with the
window parked on discovery, because the PMT drivers read their
discovery headers directly rather than through a callback. But a PMT
driver's probe also needs its own regions: crashlog reads its status
through read_reg(), which must take pmt.lock to switch the window. v2
deadlocked on exactly that, and v3 hit the same lock through an ABBA
with control_mutex (what Sashiko found). Remove has the same problem,
and the lock doesn't protect a PMT driver loaded after registration.

What it takes to fix

1. Document the contract in include/linux/intel_vsec.h: callbacks may
   be called from the client's probe and remove, so a parent must not
   hold a lock its callbacks take across intel_vsec_register() or
   device removal. I'll send that patch.

2. Have xe switch the window only at the time of each access, as
   xe_pmt_telem_read() already does, and stop holding pmt.lock across
   registration. The only thing that requires holding it today is the
   PMT drivers' direct discovery-header reads. Since the headers are
   static, xe can copy the discovery tables under the lock before
   registering and pass the copy in, and the PMT drivers can decode
   from it. Live status and control stay on read_reg()/write_reg().
   I'll can do the PMT side.

3. Then v4 of this patch returns to the simpler v2 design: check for a
   completed crashlog directly in probe, with no work item. The other
   v3 fixes stay.

Michael, does switching the window only at access time work for CRI,
and are there other direct reads of the window I'm missing? Ilpo, are
you OK with the documented contract and with the PMT drivers decoding
discovery headers from a copy the parent provides?

[1] https://lore.kernel.org/all/sashiko-outbox-210176@kernel.org/

David
