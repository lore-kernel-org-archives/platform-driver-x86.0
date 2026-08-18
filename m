Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8982B37F728;
	Tue, 18 Aug 2026 11:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052052; cv=none; b=Mv1tihTyRGqdrdoDZkxeadVMxFuv4BW1t6Z0skBjZA+erg+oPswzmjbQqSD3qPSR6uYEUJgsYBT2Cn7e1N1q1SMTWuH8bQT+FEIq7cql53tHM6Hq9mxPpheSfoVasgqBp03Li8Lxm6KiwyWWUUoB54fsJj8Ur5Htc3iDZ0R8UXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052052; c=relaxed/simple;
	bh=FEu3a32CKCtSmTjiZjiACsX86a8SwMqQFggA+jiAAK8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=q3s9gIeWy/pYBzsbDuRoIY2scnbICxGFCupmcMONnNpSxs/N8y+/BxzpeXD+VCnC7ZQLlarsMDhWv7zhqsEzxm3I5MafHCSP6sp4aQ3+fGtoptpkzUX/QhhyWEvDI9Ve6yRAz1Saurwj5mjvQjfIzGCBu9qwt80MbHd3HN1zzs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iexhCXHa; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iexhCXHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787052052; x=1818588052;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=FEu3a32CKCtSmTjiZjiACsX86a8SwMqQFggA+jiAAK8=;
  b=iexhCXHaOz6u26+te2Pb9Dxjucw1CvDqZRtV4ZXL+ZcVzf5M4cy+BH4k
   AdBQnIrPU+2X+WVnO9yuDDrjvEwlsNoSbBC26EkEqXdcBbBbGTji/DbUx
   Fi0o1g11qPzr2LcOa8vLcs9oXuhMuCgV6k40fRURTakB8SQGPebtFTH2N
   E+4xsQ4/XHaOO7vFjapd6AzY2vygT3+r8Pj+KcZdcOu/JR68nkGYzx0CY
   Cd0wz14wX+cC6bHsniEfQJsm5zBOUP7kDgHcPAg5OsZp3PeNgy6B7veIB
   UVzWBchXqL9d8UyNo57huDFugRSMSwmUgYpKHXeB3MolCIeqqFVDTRCkJ
   g==;
X-CSE-ConnectionGUID: GKrGtt9EQKafmxrGxbbPYA==
X-CSE-MsgGUID: Dps0b6g3QH6OUO1dsyBZ5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="99061528"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="99061528"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:20:51 -0700
X-CSE-ConnectionGUID: HJGbUDH+RvOHRe1mpLUOMg==
X-CSE-MsgGUID: yj93PnVXTQW7Rusb0/hmyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="290009182"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:20:47 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Prasanth Ksr <prasanth.ksr@dell.com>, Hans de Goede <hansg@kernel.org>, 
 HyeongJun An <sammiee5311@gmail.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
 Divya Bharathi <divya.bharathi@dell.com>, Dell.Client.Kernel@dell.com, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260814132535.4169956-1-sammiee5311@gmail.com>
References: <20260814132535.4169956-1-sammiee5311@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: Fix instance ID bounds
Message-Id: <178705204267.11998.4686250837251701.b4-ty@b4>
Date: Tue, 18 Aug 2026 14:20:42 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 14 Aug 2026 22:25:35 +0900, HyeongJun An wrote:

> The get_instance_id() macro walks the per-type attribute array with
> 'i <= instances_count'.  Each array is allocated with exactly
> instances_count entries, so the valid range is [0, instances_count)
> and the last iteration reads one element past the end.  On a name miss
> that out-of-bounds attribute_name is handed to strcmp(), which reads on
> until it finds a NUL byte.
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
[1/1] platform/x86: dell-wmi-sysman: Fix instance ID bounds
      commit: 5ab078e3241da0beec2022254b5811a8a52cff84

--
 i.

