Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814902FF160;
	Tue, 14 Apr 2026 16:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776183375; cv=none; b=u/KESAsk3HOHrt5jrQ1w0/Wnb7isVRRQQkFA7bYR7irRY0eWnW/DwraQVC7tUw0c1wXFV0KLYZforhctXvB7Ol/VjZvAgpuAf64lCMm/k1KXd5Z+tzdSQ8LDkrBj9z6N8C/szNpGeaU2V4hKgaqPRnQIKbDaU64cAdIsmzsopP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776183375; c=relaxed/simple;
	bh=GC1uGDv5tYCYb2JILEnCqGvOaxW1yC6WDQFVkCVTsh8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=W7Az31CqkvoAU0DSB+dyXpsv8oaLXI4f+22AHdKmvgFesXABJ5r3Yh2oosly4qYnvkHaqaG5TI8uQzeLc7R02OxSv8KnYLx/utEFX8qKQMAyx3naHOS+JANF0vNcYmYlT7LLobKQ7C2ETIN1ppVbYjJEA0B0kCj4ekk5UjNurgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZMowww96; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZMowww96"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776183373; x=1807719373;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=GC1uGDv5tYCYb2JILEnCqGvOaxW1yC6WDQFVkCVTsh8=;
  b=ZMowww96UN+T2YYlsh8MZ0YC/c7fLijBykCgeyk0uDvt8BE8xtd9EiE0
   Do7DjJW/+UzOMh+j2B+z6370/Tz7FxdNv2U4lNZRFGX8VjU6OfbqQ5x5W
   Q+FGFr/J4E5Vr3lupMIfEaGOkfgpxq9SUMghpfJZskzflE0ISt45RPQxw
   uD0bxgDbDWi9gAT17ciZ/Kv7Voev9UBeQpmcsErSR/Ju5NLnHc8KM3HRV
   to+XANtGT6ON0xuSCpA0doRNt17eNS6lyFfAqD+gX70o3afBTdWWByw31
   LRiH2qEu8WKpMhyfXKKjWzRwiFPIJV98g0leAwIQb/9XYQbFgzJBHKeMW
   w==;
X-CSE-ConnectionGUID: mIzjpmFJSf6438yyR/DLZQ==
X-CSE-MsgGUID: rYe5bstNT9mFfOV89/zV0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="88527228"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="88527228"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 09:16:13 -0700
X-CSE-ConnectionGUID: KMP2snBxQDGVb9RuVO/XiQ==
X-CSE-MsgGUID: kNLl4fcBRcuxYtcR8u/NBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="223631814"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.237])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 09:16:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jakie101@proton.me, prasoon5050@outlook.com, absolute3d86@gmail.com
In-Reply-To: <20260410191039.125659-1-krishna.chomal108@gmail.com>
References: <20260410191039.125659-1-krishna.chomal108@gmail.com>
Subject: Re: [PATCH v2 0/4] platform/x86: hp-wmi: Improve support for some
 HP boards
Message-Id: <177618336232.3262.2023149338438803302.b4-ty@linux.intel.com>
Date: Tue, 14 Apr 2026 19:16:02 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sat, 11 Apr 2026 00:40:35 +0530, Krishna Chomal wrote:

> This series improves support for some HP boards.
> 
> The first patch fixes an incorrect assumption in the fan table header
> which leads to a parsing error and eventually failure to load the driver
> in some devices.
> 
> The second patch adds support for board 8D87 by adding it to Victus S
> list. Unlike other boards, here the EC does not expose platform profile
> value, so EC readback is disabled.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/4] platform/x86: hp-wmi: fix fan table parsing
      commit: 9d317a54e46d3b6420567dc5b63e9d7ff5c064a3
[2/4] platform/x86: hp-wmi: Add support for OMEN MAX 16-ak0xxx (8D87)
      commit: 5badf5ebcd1476f4bb38c5909c5020e14384ad7d
[3/4] platform/x86: hp-wmi: Add support for Omen 16-n0xxx (8A44)
      commit: 899225257e78585e2e10b0f7ba472b3c212a8d16
[4/4] platform/x86: hp-wmi: Add support for Omen 16-wf1xxx (8C77)
      commit: 344bf523d441d44c75c429ea6cdcfa8f12efde4d

--
 i.

