Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE0D3E5EF1;
	Thu, 28 May 2026 12:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779970254; cv=none; b=pPziiZ7H9QoYjvZt2wK99RC6GpMo3TdC8t8qsKXpWFvN5uWWcKHvJNJN489UYXRmSZxjrOBoMrHkG8V0VS9yk4Anl2tUmlac9q3iNKte77VC9HoGZF/Tr55Ixx0oWCUxVaR23sUwfKcUyhLA7l5kHuUcYcDEkF2uAIMFGakuiHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779970254; c=relaxed/simple;
	bh=I1H3Jxdjasf4wrMV2p6e+cR+V3lkvdFdLQJpg+hbJIE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gU79fId/lGiftuDexuk5JWklat+TB2quJu7mbE2HuzuIZMek73oxMRe0S7y+CJwG7PESARxfRB4AcCR3dwjZrVELWXlJQRntWFM7bCybaoIDYyTzeXTPWK8c5870Kpdzb9n0lg37DSToH2TZuLmx/+pkVt4MRs4aQk5lo7gGVRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A0iG1Svq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0iG1Svq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779970252; x=1811506252;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=I1H3Jxdjasf4wrMV2p6e+cR+V3lkvdFdLQJpg+hbJIE=;
  b=A0iG1SvqYuehrXvKz4lvrM4CA4tPuZ52r9aT9BbxSMiFvRe+JWD9nYZ2
   w+lGH3ZiEDVQ8KFbl6cbD7AMhzK/JHoFekgf3bPhNaVIC/RIMkZwahEsg
   vECqmrNMQpGHvYrQZFnO1JSovgvlsw14v+tiJdpBbSGwJjW8JRE8uZmRY
   LR/VH4bVo9t7bl2jC1gwq2QGBt78sN0eQne6yP3Q6yaI8wFOPzd0CAyTO
   YGK6SnSTYPTO37PeLzLBdbFwAHWILfJ0ntBrbKyB8C2dow2hxxENfjrGt
   cfsLv9mhEUdXNVEctVtXUx+/jVmlXv6fgFB+h4o8N4WsF0FIvLe/dlLtk
   Q==;
X-CSE-ConnectionGUID: K96m/HYkTg6MNbOEkqSvDw==
X-CSE-MsgGUID: ZDA/7CINQgK1pPKtz02FmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="84699084"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="84699084"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 05:10:52 -0700
X-CSE-ConnectionGUID: HKrjVmH8R8iglDw5mu3+FQ==
X-CSE-MsgGUID: 0B/hCRubQUuEdn9SdJzZjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="266139212"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.187])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 05:10:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Armin Wolf <W_Armin@gmx.de>
Cc: wse@tuxedocomputers.com, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260512232145.329260-1-W_Armin@gmx.de>
References: <20260512232145.329260-1-W_Armin@gmx.de>
Subject: Re: [PATCH v3 0/8] platform/x86: uniwill-laptop: Charging-related
 improvements
Message-Id: <177997024494.9687.12139391667072558748.b4-ty@linux.intel.com>
Date: Thu, 28 May 2026 15:10:44 +0300
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
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/8] platform/x86: uniwill-laptop: Properly initialize charging threshold
      (no commit info)
[2/8] platform/x86: uniwill-laptop: Accept charging threshold of 0
      (no commit info)
[3/8] platform/x86: uniwill-laptop: Fix behavior of "force" module param
      (no commit info)
[4/8] platform/x86: uniwill-laptop: Do not enable the charging limit even when forced
      (no commit info)
[5/8] platform/x86: uniwill-laptop: Rework FN lock/super key suspend handling
      commit: 4d86e384c164abeee17da09fe6cd24a37973e628
[6/8] platform/x86: uniwill-laptop: Mark EC_ADDR_OEM_4 as volatile
      commit: f7bcba269143230923e40cd88b9169ed27f178ae
[7/8] platform/x86: uniwill-laptop: Add support for battery charge modes
      commit: 73fa957a05e9fd43f204225497d4c98d7c0d0490
[8/8] platform/x86: uniwill-laptop: Enable battery charge modes on supported devices
      commit: 2c5d91f35d0d564c8b4c062b67526e0d2d27fae9

--
 i.

