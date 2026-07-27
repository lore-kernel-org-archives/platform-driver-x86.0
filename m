Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D563FB060;
	Mon, 27 Jul 2026 12:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785153962; cv=none; b=Xrsr0XmX/yQh7xEW0mjrh2qG3PygPZ0jmG13KCeFYiiwi/fp8RknBbLfTd//2LE3UZV/2mL6NdKMa/SKiGfQgadZTLCgQARvoMGwsWU3xdugmNlbQvXYW42i0hEoDayxWkv/urWRtDHB+01MtA+LrH032Rjq7tDRQ3AAVxovOZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785153962; c=relaxed/simple;
	bh=LgLMCJO4xNBukLg+Vtzydo68MwcDG8B6xynjXmiD+zw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DSLHMiBqvz/7YGNUNhsWhtzMIxX9WR+0CZJpvJNBxhHAbe6TfWKPQaNBbWRo1yx4ll4HliSi/Qca4koEE0xOH/Xu1pWNNynrdiIJVnKGgydc1PZHg2gK2mxDzH9STnMKBieEt6E5ItXvl+Cnn/BNWx7/MCh+MWUXj7U2o+yyo6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dyMYXzAE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dyMYXzAE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785153961; x=1816689961;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=LgLMCJO4xNBukLg+Vtzydo68MwcDG8B6xynjXmiD+zw=;
  b=dyMYXzAEFRsGMISlthyBmr3GMtJHgY72HduUwMIdYXTcVecdHvtMdKSU
   D2z4HMbWLf485J2tIO8iATKVpONuL6/RpT75Mfo26VbZRUZJq5jkCvAUI
   AFFqLWGB3nfYJHrW6g49XNYvqrrF/KX0MRgbmQVPyKGCp+opvjt6NMFvO
   I9AngdGCfS4I2drgeVko0uGVPhs7ScUxoxh5L9GdqdiITi2mwj1Gj27mZ
   5hp0QfCKQ2pMaJXXOjbjhFiXE7bJA0FQJ4maXeJWf7v49ZM0rRFSRlLyI
   5N9z0CyBRWylFDmeBqW1mDEWtgwoyv29k9nZjFZ07UkS6smam9m+kpNYB
   g==;
X-CSE-ConnectionGUID: 5ocmpegNSSG7E8DlwriOFQ==
X-CSE-MsgGUID: aKGCwpRWS/SlJczeOOIuzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11857"; a="96077149"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="96077149"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 05:06:00 -0700
X-CSE-ConnectionGUID: jELr+r3ITeqIOu6uG3r5ww==
X-CSE-MsgGUID: wEuUYPYjTq+fUU3qUvcdHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="256034982"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.226])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 05:05:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Hans de Goede <hansg@kernel.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>, 
 Francis De Brabandere <francisdb@gmail.com>
In-Reply-To: <20260721181756.143084-1-mario.limonciello@amd.com>
References: <20260721181756.143084-1-mario.limonciello@amd.com>
Subject: Re: [PATCH v2 0/6] Some fixes for amd-pmc handling of the STB
Message-Id: <178515395117.10740.15838370160037516630.b4-ty@b4>
Date: Mon, 27 Jul 2026 15:05:51 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 21 Jul 2026 13:17:50 -0500, Mario Limonciello wrote:

> Not all platforms support STB, and by activating it on a platform without
> support a few bugs were exposed.
> 
> This series cleans them up and also cleans up some existing cleanup path
> errors.
> 
> Cc: Francis De Brabandere <francisdb@gmail.com>
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
[1/6] platform/x86/amd/pmc: Restore msg_port on amd_stb_s2d_init() error paths
      commit: 9cef693bce96bb4c6952f48d855284cf7fa4f367
[2/6] platform/x86/amd/pmc: Fix msg_port restoration in amd_stb_debugfs_open_v2()
      commit: cbb32ff92f8a62212e0f7384b1de986ced92082b
[3/6] platform/x86/amd/pmc: Propagate SMU errors and validate S2D address
      commit: 0225c1d637687b03726f00ac65b6def843d2c464
[4/6] platform/x86/amd/pmc: Only expose stb_read after telemetry buffer is mapped
      commit: 34d145254ca655ead49d00025981f2f5b200a62f
[5/6] platform/x86/amd/pmc: Fix LPS0 and debugfs leaks when STB init fails
      commit: 76f650a76d6a36a4bee79d94db90a0e935a95477
[6/6] platform/x86/amd/pmc: Do not fail probe when STB init fails
      commit: 29412292e4fbe6cf4dfd36711fb056ab2b6c52b4

--
 i.

