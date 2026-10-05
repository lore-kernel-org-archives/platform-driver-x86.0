Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32484D9915;
	Mon,  5 Oct 2026 18:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791224696; cv=none; b=TUausS1eTJl23N2078PRSFMEDREJ5z+oQjNiD2FOjPqHG54BCuE8C/caRWFjA1t4zzwwprwIp/tPq8RCbH3wizbJGuhPRa9bg2sztMyZYkQ83IjDjSoqwtwWSYOQGu0hO8EXsEM1Af8O0TVKftndmWkPobm0GsgHjNKE3gdbqmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791224696; c=relaxed/simple;
	bh=3YlN3K6+XQIgNonbrC1Zb7Tg08xDkVAU8qA0nbplGxI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=f0hKYMduwbnsVFJb8ywWX1KmVajXSiT3J8NpVlwvYWHBpkHLtzUSJZhZtfLjZCnpLIzMxC+Y1xui61Lc3YTAXWqVRct8CnlXurKKuxqd2lUM36TUzbOnkDUXwUPVz499zmJUVLc9rCNdTEXJgeN3/BwA7Rll6HAPeA6eMMNWzxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GiXFx/Ym; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GiXFx/Ym"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791224695; x=1822760695;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=3YlN3K6+XQIgNonbrC1Zb7Tg08xDkVAU8qA0nbplGxI=;
  b=GiXFx/Ymu+TtFh0RSgDo5O2Clbv3OxST/vEJ4xq5ZVIduNm3I+k1O6CA
   1x9icKoNwqZ56YsgfZ1fSv7e+YUpSivaVwUUg5GfCbF8YjiJho6QYBYL+
   ddsnvwgVZ0caZDGMHgZ1/31JxoqSIddgWnsVci07CMaoLlaBg3D6qZrWH
   5XSKYG79/NYv60q/CIcsRh5F4q2M7m4RkLcsxQX0jKO4cMZBQfQ6RuPdX
   JET4oDHhkA855RJzZ3IZevFvhjWtfrXE2CRKEnwZDB32bySIEFJ87nJyA
   ChVyr00BbjhvCxfxgEsAayHq5ewuThJfQAQNMEKCgQAP3mtH8nq84bp74
   w==;
X-CSE-ConnectionGUID: K5T8Q5hjROeAAfkbz4HbmQ==
X-CSE-MsgGUID: 5VA0kRc+S1ySC8CBqMIkIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="101226434"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="101226434"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:24:55 -0700
X-CSE-ConnectionGUID: FWB7z2EtQtCzBpwGQjjALQ==
X-CSE-MsgGUID: dMf715ePTq+8XUJMzc0niQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="306396480"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:24:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tiago Silva <tiago.paulo@live.com>
In-Reply-To: <20260920185759.3426627-1-lkml@antheas.dev>
References: <20260920185759.3426627-1-lkml@antheas.dev>
Subject: Re: [PATCH v1] platform/x86: ayaneo-ec: Add AYANEO 2S charge
 control
Message-Id: <179122468793.34664.17578356170651612601.b4-ty@b4>
Date: Mon, 05 Oct 2026 21:24:47 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sun, 20 Sep 2026 20:57:59 +0200, Antheas Kapenekakis wrote:

> The AYANEO 2S uses the same EC fan interface as the AYANEO 2 and
> additionally supports charge limiting. Add an exact match ahead of the
> broader AYANEO 2 match so the charge-control quirk is selected.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: ayaneo-ec: Add AYANEO 2S charge control
      commit: d5c20bcc5a20f073027cef7fcf79dcc445ee37b3

--
 i.

