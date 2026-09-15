Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DCC3F4829;
	Tue, 15 Sep 2026 23:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789514512; cv=none; b=XKhxlvNcy5xpAR4sTcSdGCsDNRKUdOP+Hcaton21aLpeoP6YazuMBXZMXWLMAR1+8c06KhOmckhRQFC8C0dfXViyVU1sE3eQZhwxnzjDNWd2uc+L0gzjAbksJ59SqSp9SZjitZYFnZVFqF19D9Atz7w2yrtBjAJlzhzjnCtIKeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789514512; c=relaxed/simple;
	bh=/4ZKUZWTE2Jo+6bTdtIB7ywYdYoXUhPHZs7Hl1k50HU=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DNME2QBdn+zYC+zl79Nj1pRvJsuHZWYIwyg1pcw3zrzAo54/a5iNm0u9Is+Dg3rQBJXTs5YoEGY/49iy4ZateTwBGohiFDSmt+RXK9k218HpNhT4tf9OOIqjG1oljJiR2CNva9GpSRGLHvRT5x7bO19583RMckLUGPMeOS1M7qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jXxP2Gf/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jXxP2Gf/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789514511; x=1821050511;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=/4ZKUZWTE2Jo+6bTdtIB7ywYdYoXUhPHZs7Hl1k50HU=;
  b=jXxP2Gf/nDLiCWXJTHTvv+q1ghxTwb+ATMdED3yEBwH14f224/8wiPUb
   omYuJflWpfA1DNKKfBZS45CwgFwVthRHRM1PALp6ySfGlt5eiRiLRewa3
   Ezba/moc0pcdZ5fyZNCOzcRtGqpc6iWWQMEGDsW1Qwf4HDQxtDUfheRC8
   hNTMoSP81Jlaum6KgV+S6AZyhc8P2jyjJl6D96uR/QyfPJTu479263C+O
   KBEs/ljxsKovzt4h5Ly8fX5QAhVZfCmXBBfDAHaspM54q623vhTOa5EGC
   ceghp8f4UTnTVzL3EhbxUzALkz5Nhc1eM7QjUh5XAt8zgPKonHd7+N0ZW
   Q==;
X-CSE-ConnectionGUID: ytNsdiiIQ0G7UCrAy/XHwA==
X-CSE-MsgGUID: txiHKzNxQFiXSc/EBAuiZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92398118"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92398118"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 16:21:50 -0700
X-CSE-ConnectionGUID: MQR/3ykDQWe0wiWYCjSdUg==
X-CSE-MsgGUID: 0RWcCMiLQr2yKsvWhNedBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1378518"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 16:21:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: herton@canonical.com, hansg@kernel.org, rafael.j.wysocki@intel.com, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xueqin Luo <luoxueqin@kylinos.cn>
In-Reply-To: <20260811022115.338595-1-luoxueqin@kylinos.cn>
References: <20260811022115.338595-1-luoxueqin@kylinos.cn>
Subject: Re: [PATCH] platform/x86: Add ACPI_COMPANION() NULL check in
 topstar_acpi_probe
Message-Id: <178951450299.41627.12588028319505610480.b4-ty@b4>
Date: Wed, 16 Sep 2026 02:21:42 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 11 Aug 2026 10:21:15 +0800, Xueqin Luo wrote:

> Add NULL check for ACPI_COMPANION() in topstar_acpi_probe() to prevent
> NULL pointer dereference when driver_override matches a device without
> ACPI companion.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: Add ACPI_COMPANION() NULL check in topstar_acpi_probe
      commit: 17d0f874b1f8774c61ad495a4ad20ed8c829dfae

--
 i.

