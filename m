Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27C1318BB3;
	Mon,  5 Oct 2026 18:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791224673; cv=none; b=KHmmpp5MqKlvSGgqLtM+943eKJ0bdI2YlYu4WCtpdZILvyoOUwI6qlD2CxBRFjd80btT3Ek0+U5wuSuU/h4dR6O2X/dFkBJZlI/wJ8796Of5Adu+uU51Iq37qCiNfbti+6BkT5B0KrUod7zy1sT7aAnWR0YpU6izwl8fQMhgfOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791224673; c=relaxed/simple;
	bh=0PyK0mjNM+4nKHA0ytcrCVl6CHgfHjRDtLgO3Qu8vpo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PaiTlZDuMV2Ukd+X/8wNn+kXLKco7g7WcRmJxyhWoRgKLt5UCKu5ELuNW97x++xzf+5FspuQBTM58MkBg87Y6In2xDU7IE4xCe4yJ0JX6t+N+itVZTtrmsnS5/xyX/F0cODSeEzLjenXBYXWZCRH/kw1lCbT9zBgR56sLKaKQpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WZ2LeL2x; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WZ2LeL2x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791224672; x=1822760672;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=0PyK0mjNM+4nKHA0ytcrCVl6CHgfHjRDtLgO3Qu8vpo=;
  b=WZ2LeL2x5pN45JXBDk95QOfVxV0i8yHHD+ceiaMMVsiNqCtoAhbmUpNc
   +kwiDyw5NxsPnFeT6ObAq25+bsSokoFaBzxpwmS4pY8G+gW2Oz2sKvO8f
   twR0Zw9eLQRxM8irTw/hsoaug+qoQE/OhHAdw2AWwc0KhwViTb5Jfy2it
   8VUMZIMT01XouaqaNqzXkQzzzhivUZowTzT2qZXGBaktnO9C++nnKNv3P
   oMexU4DI0QvuDpICuNpAiItAhZoeE4DgvHBWHtLA8IGiIKvDi0mWCiYU2
   AKmo/uA1LVvPiifNfq7KbOkrSPQ7qKKLy2y0qhQPRlht/UVv+8b3Ebwgx
   g==;
X-CSE-ConnectionGUID: v5UtDl1xSKiKvBkurWPSVw==
X-CSE-MsgGUID: peBDjV1ES8iwFrkEnV0S6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="101226413"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="101226413"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:24:32 -0700
X-CSE-ConnectionGUID: Dmkq/DGNS8ivVoPjrUm4ZA==
X-CSE-MsgGUID: FExX/YOvR2e7cIUor4oxIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="306396351"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:24:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: jlee@suse.com, hansg@kernel.org, Justin Vargas <justinyvar@gmail.com>
Cc: W_Armin@gmx.de, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260920053918.1888-1-justinyvar@gmail.com>
References: <20260920053918.1888-1-justinyvar@gmail.com>
Subject: Re: [PATCH v4] platform/x86: acer-wmi: Add support for Acer Nitro
 ANV15-51
Message-Id: <179122466377.34664.13721419819742452894.b4-ty@b4>
Date: Mon, 05 Oct 2026 21:24:23 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sun, 20 Sep 2026 01:39:18 -0400, Justin Vargas wrote:

> The Acer Nitro ANV15-51 uses the Predator V4 WMI interface for thermal
> profile handling, hardware monitoring and fan control, but has no quirk
> entry, so none of these features are available.
> 
> Add a quirk entry for this model.
> 
> Note that this machine does not support the turbo thermal profile:
> writing PLATFORM_PROFILE_PERFORMANCE is rejected by the firmware with
> -EIO. The four remaining profiles work as expected.
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
[1/1] platform/x86: acer-wmi: Add support for Acer Nitro ANV15-51
      commit: 71019d2a13e0766ca174846e68dc5c0bde2e6494

--
 i.

