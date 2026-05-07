Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06C43A9615;
	Thu,  7 May 2026 14:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163940; cv=none; b=MAubr/Ot23uOA9mQHv+ykfJ/Ngt9WQYxplh3PLHIRJJSxZNJ7gkOzfZeEl01SOEifRJfJkqA9+Zyr+6hmxD1wBKTiPR8NwS6yqNLsKDvooDQM8HgKVr3KdcUJDr1bNjxV2v1Sm9w9fRRTW5O58+20cpiwm/kCTCzdppVb2k484U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163940; c=relaxed/simple;
	bh=UARCWdHCEToOugT/2imhzgXMnU+jf180paL8RoyNkJc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ux2/E4Hhyfx8es+KW5qtWorqtyIGj2EE1K1AslIMWI6JbAC0imrgNieONtEkkt7RhDrSfWpNOUtVzyzo/M+5DyLios9aLDSRbIz23H+Ih4t5H1trTbEzu6zys+xoWYs7uLjemijY1A+1RWDYGDCIac/FYFcoQieziZDcukGUnPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWbzcumk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWbzcumk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778163939; x=1809699939;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=UARCWdHCEToOugT/2imhzgXMnU+jf180paL8RoyNkJc=;
  b=JWbzcumk9mSLna8nAavgypV1PU5mmqQqArFww6/Dk7VndsDBIn2tl/lB
   Kqj97J/OJ1sZYwH/zXQqTX6z8EQgIFZMRZuhgkw4RRGomK0lNz/CryXk1
   gP/q1jHUbBPoESl3x1rZTJ38oNLRxZE4B6rNAXHqWl1Hkgta9YKfewi+/
   fW0+Hfj8f3biu279/gvaKVW2NtitQrDvTh0wiM5Pjli5BJ189pJ+eADw5
   yRTCyEjA5LgASUJjq53c9pZLUiNpg1ySPzSMR7hwqvSwzIoIbN1vXh9jx
   xCiAPjyq5bo4aG3IRzzW09CGTQ7Cim/EyrP8+I/0QcnApaFeT5hraNp9c
   g==;
X-CSE-ConnectionGUID: bMqUfJekTEaFGogNB4mwOA==
X-CSE-MsgGUID: zFWig3egSK2adEefmoJG1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="90574417"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="90574417"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 07:25:38 -0700
X-CSE-ConnectionGUID: NspOBWjOQTKzR1DAvSlncQ==
X-CSE-MsgGUID: JNDJoeNTTzGu2HDedwfvlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="232122300"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.116])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 07:25:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Cc: ayaanmirza788@gmail.com, josh@joshuagrisham.com, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
In-Reply-To: <20260418004613.93981-2-ayaanmirzabaig85@gmail.com>
References: <c46938e0-02f0-22b1-1730-4ce87603667c@linux.intel.com>
 <20260418004613.93981-2-ayaanmirzabaig85@gmail.com>
Subject: Re: [PATCH v5 1/2] platform/x86: samsung-galaxybook: Refactor
 camera lens cover input device
Message-Id: <177816393109.9113.699842466203418253.b4-ty@linux.intel.com>
Date: Thu, 07 May 2026 17:25:31 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sat, 18 Apr 2026 00:46:13 +0000, Ayaan Mirza Baig wrote:

> Rename the camera_lens_cover_switch input device to a generic input
> device which can be used for multiple input events. Move input device
> allocation and registration into a dedicated galaxybook_input_init()
> helper which is called early in probe so that the device is available
> to all features.
> 
> No functional change.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86: samsung-galaxybook: Refactor camera lens cover input device
      commit: 72d52bac023b376b73277804b24315ea2a49ad1e
[2/2] platform/x86: samsung-galaxybook: Handle ACPI hotkey notifications
      commit: 90dc96c61be35a1f81b56dfc5dcb80d50debbf89

--
 i.

