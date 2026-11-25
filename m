Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649288;
	b=CJrDsegaj0JP0E/KZTpqIMR8WbcRskG5E2f642x3FGN1AiGSHbHVC3ca9Ff0GcKCpOjo
	 Sw60YryV9easJTbXXaiq6cGDqFiXG1mAatGWAt0V02CYZ+ePy0u2yo24mozX6oas6bHiL
	 IwalMVy38eFPMTR/SsO5DhgZmJZQ1i6ZvaS84D8PnGYfIfmHT9MH5+yswc1cQqeSJc08C
	 dlomPKpxCLZM6t9qvPIBfvYp5cmtTkm/4gvA3GhpBHgRAttmk5UdX/C494cZgefZxMdPW
	 t5go58p8QYxfcJr1YXzyzmhVsTTForUmPHHqGpFbeI/w9cOkLQDj3/sptez8bkIVkZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649288;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=F6Ok10wL1jmNIuPc7G0dFFqUvBkjqFUj9Tftx133Fts=;
	b=g/kG5E2TegmQgxybl8HtOQbqJELscYbc1/ZZBuGr707CCxaKyeqcUJ2+XD0uYS6kYCxW
	 WVuTnYs4qsIZk5RcYQz/6uDiSnHqoSQaEW79Qdi7U8dhy4BIwftmVIfRJQLVAZlshaA0i
	 9srRFjQ/0+ph1+S3D/2XJISOMB2Ogzo7rkzunSkY90IioYDgiDlCB6IjinMSRocGCv1N8
	 o7G8J2/lYYA31lNgYh9BEzcYoGNRZ+O0z5GlDJYnX0b2pZL8U2Pa6eYdqBbX6WQGm32IZ
	 s2dC1H5Bk6onTWo3xDi3uVD5AKIOMx5ah1IYBFKxcf9fn7nYRyD96uH1XeQDySwNTqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DNvqHAyX;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4DC606A31E;
	Wed, 25 Nov 2026 23:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE4DC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DNvqHAyX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795649288; x=1827185288;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=y8mcSebwY5eKeXjXnnCFxIxKa4n6hyrKiEm/j6ZRtBw=;
  b=DNvqHAyXA2hrXK/3db13/0sU1vbb7NPBbrKJRE2igB/dqEf8iS88f4Yt
   ng6Fk9LpkHSS7PyuuEt9p8gOG507rJFiaD/zrm2KNhddAsTrCxX3TDspS
   6SMSkfUsD12HZiYWIlm5Bzu/G3smQt4Va5sjGLSonJLFeYCXFoKlu5WJA
   52apFQwNiFC2hy7QS+PRF6EViBnh9jvez14c0nynG7Vkatwc0wr95xJqZ
   5bFfjLbTLWFh2Mk5/3WiMolcaTN9R16+3E2pH8nUHb8pN6eSZt2tTGnp0
   DvIXlntZYPC7r2/av1ptCq1SkPTm9abwnGRWp5y3hzBemlSpM/2bYdmky
   Q==;
X-CSE-ConnectionGUID: GodJ8HnKQim0lPk6SuAEPQ==
X-CSE-MsgGUID: AGv7HQf3Q7OuF+FY3Cme2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4539554"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4539554"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:28:08 -0800
X-CSE-ConnectionGUID: 2hXHwZiDSySdPerh+dkHUg==
X-CSE-MsgGUID: 5Z4qKyZERiWWMLRuAqfPnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11869090"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.96])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:28:05 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Alex Hung <alexhung@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 NanamiKite <nanami@yosoro.hk>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <tencent_2751C9C0C0CAA52856E076AA078060A13B06@qq.com>
References: <tencent_2751C9C0C0CAA52856E076AA078060A13B06@qq.com>
Subject: Re: [PATCH] platform/x86: intel-hid: Add H3C MegaBook 14 to
 dmi_auto_add_switch
Message-Id: <179564928034.9828.16938315256522129360.b4-ty@b4>
Date: Thu, 26 Nov 2026 01:28:00 +0200
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Thu, 19 Nov 2026 10:22:01 +0800, NanamiKite wrote:

> The H3C MegaBook 14 is a detachable 2-in-1 device with a magnetic USB
> keyboard, but its SMBIOS table reports chassis_type 10 (Notebook)
> instead of 31 (Convertible) or 32 (Detachable). As a result, intel-hid
> leaves SW_TABLET_MODE reporting disabled by default.
> 
> Its ACPI HIDD._DSM function 8 (VGBS) unconditionally returns 0, so
> probing initial switch state via dmi_vgbs_allow_list would falsely
> report tablet mode when booted with the keyboard attached. However, its
> EC properly sends ACPI notifications 0xCC on keyboard detach (_QF3) and
> 0xCD on keyboard attach (_QF2) to INTC107B.
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
[1/1] platform/x86: intel-hid: Add H3C MegaBook 14 to dmi_auto_add_switch
      commit: f17a7ec5d68b34275071d3bf2e33cc5995d02e51

--
 i.

