Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8751FA859;
	Mon,  5 Oct 2026 15:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214648; cv=none; b=L6I07P1Gi5T234VdOqUQ1T70E7yYtamAGsoFWjcWtydvyOMpo6sIWcjjUDLZ4glzFwp9Spm7sJ5ieYJWcLwl7MG1rlqZV/Cku2BQGONXsRuHTBi8KxqVLdq3if2QYaPl+R2iQ/QQrIH77xygs4B1gLJwA9anNpsn4mpATDszDpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214648; c=relaxed/simple;
	bh=7nIYgaNXx5R6yZ6L1oC+Fn6fHYTn3KhW/0zQFvgNmNM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eleaGPxuL+PXO+aWO9azXONEbOM/XK9DgYRIzm6ZPN/co+oUqthvxAs03nlZ8chbkltOMdJbdg6Oh/k3DVB/qiIoxh8Hu3tbClkELfazhf4v6KT0mqBmNY9qL6YOz/Vx1s2PQZq7v593hMD31NLC42s5NLRAa96in/XmIsHI0U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=REjafX7l; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="REjafX7l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791214646; x=1822750646;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=7nIYgaNXx5R6yZ6L1oC+Fn6fHYTn3KhW/0zQFvgNmNM=;
  b=REjafX7lcEnBLra50uHPlKyxhsYx1BTbasyfPhrkJCLcg9DOWRxzM+KW
   Ej55CGF1p+u53oAri2l5lnPCTfLT5NdChtFSSQV+fvvbPZgdyC9e5y42j
   rkNc9vrxWnfsNVQoEmI4dm2Wh+jPrHTwRpWQNmiV5R6v6uQHXfO2PEviP
   KK4BJvv/jK6VNTGXcsxhJlSY8FWUYyt5vPYtvLanZ4ZZ3XE4Z0UbYU2kJ
   K/e7M5YiSsGgzYJGnuf1Prz4V4v/ANkQ7A+hWrOscDGsTDFmN5BwoPAM5
   Bmoym5eJPCEyhsJlJNEwkhRi7Dt6S9bVx6eO9rnt9hM9XqmBo8v39Wtez
   w==;
X-CSE-ConnectionGUID: o92b6/KbT4mHJh4YkvpgPQ==
X-CSE-MsgGUID: hvDzYQZhTG+nVe9RuhFRjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="91995626"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="91995626"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 08:37:25 -0700
X-CSE-ConnectionGUID: GkbyNIrwQRWQkM8a8t07XQ==
X-CSE-MsgGUID: UyJS79hBTE2GWlnzkGsDCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="873913"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 08:37:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
 Werner Sembach <wse@tuxedocomputers.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260822003012.851574-1-wse@tuxedocomputers.com>
References: <20260822003012.851574-1-wse@tuxedocomputers.com>
Subject: Re: [PATCH v3 1/2] platform/x86: uniwill-laptop: Fix brightness
 notify for 3 level keyboards
Message-Id: <179121463882.12659.16687091928056823717.b4-ty@b4>
Date: Mon, 05 Oct 2026 18:37:18 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sat, 22 Aug 2026 02:28:39 +0200, Werner Sembach wrote:

> The devices with 3 brightness level keyboards send
> UNIWILL_OSD_KB_LED_LEVEL0, UNIWILL_OSD_KB_LED_LEVEL2, and
> UNIWILL_OSD_KB_LED_LEVEL4 and not UNIWILL_OSD_KB_LED_LEVEL0,
> UNIWILL_OSD_KB_LED_LEVEL1, and UNIWILL_OSD_KB_LED_LEVEL2.
> 
> This patch maps the events correctly to brightness levels 0, 1, and 2.
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
[1/2] platform/x86: uniwill-laptop: Fix brightness notify for 3 level keyboards
      commit: d8ccaadcd39497870233ed7c160c51db332b7a82
[2/2] platform/x86: uniwill-laptop: Enable kb backlight and lightbar for TUXEDO
      commit: f0da86d5222d8e10b2c79782cb5a174157c24049

--
 i.

