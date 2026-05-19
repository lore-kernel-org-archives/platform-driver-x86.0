Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119063769E0;
	Tue, 19 May 2026 14:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779201942; cv=none; b=MIHXdHrrYQIf4Jpzsg4u7i3+K23WTcBE1bv3p1iLQYijJKFHwaaLrFvldK8SYhv1e9SR89yHkjeuqGegeWOdwyhfkxt6lkIy8eSNySTxZLui9Qor+oHH1Q0psyBzyr6vxbKq/yhvJvN+eWYRGIkPlKKmAleSe6xosmWohuFVOeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779201942; c=relaxed/simple;
	bh=gjuog5jtlBgGVNimu63hAJrNFdO9QfjyzXDf6gVwS4Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=V7bk7854hB/H8UDwP2NUBybxEhxvp7Uf6K/K5wrCTE4dHecuyC1JubhVlUgaDHHK/ea/ntCtB1qxCzMD3Zi+G9CAbsPZ2kRZBLuYOhsKIYKGECHr3aXJw/JESbmid4F/zRo6j8wpXZyx6ttLH3pYebVpV/i1PQtNM4R8DnFav+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Py/8KM+8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Py/8KM+8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779201941; x=1810737941;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=gjuog5jtlBgGVNimu63hAJrNFdO9QfjyzXDf6gVwS4Y=;
  b=Py/8KM+8rPT1IirQH0JtZE/O52v4QpC/JfsFbmivfv5BNdi7LJWM0z7z
   ZKFlF2z4Azhw3lgq3Cvb8hbXLbiH7Ar70EoKEczc04q5QEVYv/N+LVJTu
   3cAZvrLaCumhCqdxpGpxtigBCDO4VmzuhmCnZ8PubBfN23+BLOdk5hdVO
   z978ylB0fiLcJurSKsYWQMgbUx45icYeZnqkMNBEBC36tnxRK1DbuH77w
   JKsNdmwgHp2OmAMaUgjid3kOamc+ymeJtrdUOa53YYQckWM45UI9s33lc
   p9YPmtW33STInFyvMWBLPoSuA9Sg6n71rrOzTmrOcVH2RRdHFC//dA33K
   g==;
X-CSE-ConnectionGUID: b//PjabCQgq/AqD95+O8wg==
X-CSE-MsgGUID: 2NmOmwxHTsWAacUw7jn/xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="90383146"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="90383146"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 07:45:41 -0700
X-CSE-ConnectionGUID: UVmtVK8PQtuHpshX5b1qWw==
X-CSE-MsgGUID: wdwc2MJJR02rvMImBs+9Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="238793279"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 07:45:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Armin Wolf <W_Armin@gmx.de>
Cc: wse@tuxedocomputers.com, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260512232145.329260-1-W_Armin@gmx.de>
References: <20260512232145.329260-1-W_Armin@gmx.de>
Subject: Re: [PATCH v3 0/8] platform/x86: uniwill-laptop: Charging-related
 improvements
Message-Id: <177920193411.22546.9855747319755001624.b4-ty@linux.intel.com>
Date: Tue, 19 May 2026 17:45:34 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 13 May 2026 01:21:37 +0200, Armin Wolf wrote:

> This patch series contains various charging-related improvements
> for the uniwill-laptop driver. The first two patches fix some minor
> issues inside the charging threshold code, while the third patch
> fixes an issue inside the module initialization code. The next two
> patches contain some preparations for the main patch. Said patch
> introduces support for controlling the charging modes available
> on many Uniwill-based devices not sold by Intel. The last patch
> whitelists most Tuxedo devices for using the battery charge modes.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/8] platform/x86: uniwill-laptop: Properly initialize charging threshold
      commit: c12cc42dadd85dea210d5699d4f21def827382eb
[2/8] platform/x86: uniwill-laptop: Accept charging threshold of 0
      commit: c16a4823cc60a32b891f7a148bb30c0f51d12cf4
[3/8] platform/x86: uniwill-laptop: Fix behavior of "force" module param
      commit: fb4b67c44557cb4cbb15900083d4e1af22320339
[4/8] platform/x86: uniwill-laptop: Do not enable the charging limit even when forced
      commit: 26cbe119f99c86dcb4a0136d2bc73c0c716d80e4
[5/8] platform/x86: uniwill-laptop: Rework FN lock/super key suspend handling
      (no commit info)
[6/8] platform/x86: uniwill-laptop: Mark EC_ADDR_OEM_4 as volatile
      (no commit info)
[7/8] platform/x86: uniwill-laptop: Add support for battery charge modes
      (no commit info)
[8/8] platform/x86: uniwill-laptop: Enable battery charge modes on supported devices
      (no commit info)

--
 i.

