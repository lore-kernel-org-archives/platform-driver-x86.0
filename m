Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0A951E43C;
	Fri, 18 Sep 2026 18:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755912; cv=none; b=X1PQa3zZzgcKMRWqi01SrMvLaaeVN0i0UgGhI/s1HJToxBdpPVzpxQrAFOWQEwMxCbY4JOTvMTf6KuAe06D2/wmK0ELzEtj68MTO3pf8GXDkOB1YwyspS8siaTnBMQcqRWlk88HmPHxTBuNOj1tjaMgGGr0IsfB4PRHOFPS05M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755912; c=relaxed/simple;
	bh=FT87b94tCVsXNPjWxhKPXSymMVrlhxUOFMyLADMRmkk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mYo+JagmzP6I/w5SGNHrJ/vBLoWAeLdLS4C9sEJ28p2ReDYUQK4ti1qOJJShxXP1O26skfmFdP3iVxgPrRluk7ix8hvLj8MmmBN6YZfzt4iSd6gswI5jDFzhD3qSWmhcjjOfsgEHX9qUM1O54IzMsgVNdxv3yBN+TbMzJFfVNYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aNd6vvA2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aNd6vvA2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789755911; x=1821291911;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=FT87b94tCVsXNPjWxhKPXSymMVrlhxUOFMyLADMRmkk=;
  b=aNd6vvA242zGab2pGTCAxoCmoBhevdATdDwFSfqZ6nnZFzUOoqaTJxjM
   rTg8E4aF1K8LMczyY3xxERHjl81VC8Puo66dKRob3rl91ICAwQKaV+x4A
   oYzHUKf+7p0ZMOqCK4dDttCcWQAIiboaeJPFcXc9YdMNAngz4X2d1xrFR
   stpGVI/Zj+J0lPyiEaTpT3rAz+Qjvv3qUIiscCUdW9GygsbCAA7a9hdxx
   lJHXScmyoayTu3im2mmjBVfProZJIB6dMB9DxdOkkk53qAkUe3w8piVH/
   npgASpwOR16HHLQpnicPKoP3i86weec2SvUn6JJvzB/BFHGdCB61Wp84q
   w==;
X-CSE-ConnectionGUID: DHZRCZztQv+Y8k/JzJaz5A==
X-CSE-MsgGUID: u7YDAVJqSxK3GTCXSEdwRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="90297737"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="90297737"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:25:10 -0700
X-CSE-ConnectionGUID: NEMJZqpsR6GrQsNlWjUUgw==
X-CSE-MsgGUID: //n06lcQToG2wPvDMgnw9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="268252669"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:25:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Huang Wei <huangwei@kylinos.cn>
Cc: mpearson-lenovo@squebb.ca, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, thisisamirv@gmail.com
In-Reply-To: <20260918161539.2676619-1-huangwei@kylinos.cn>
References: <20260918161539.2676619-1-huangwei@kylinos.cn>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Add X9-14 Gen 1 to
 non-standard thermal/fan quirk tables
Message-Id: <178975590278.29716.17309474720733695095.b4-ty@b4>
Date: Fri, 18 Sep 2026 21:25:02 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sat, 19 Sep 2026 00:15:39 +0800, Huang Wei wrote:

> The Lenovo ThinkPad X9-14 Gen 1 uses a non-standard Embedded Controller
> firmware (ECFW) whose thermal and fan registers are not located at the
> classic addresses. On this model the thermal registers sit at 0xA8-0xAF /
> 0xB8-0xBF and the fan registers use the non-standard offsets, instead of
> the legacy 0x78-0x7F / 0xC0-0xC7 (thermal) and 0x2f / 0x84 (fan).
> 
> Because the model is not covered by the existing quirk tables, the driver
> probes the legacy thermal addresses during init, reads back 0x00 from
> every register, concludes the EC is "misbehaving" and disables all
> thermal sensor access:
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
[1/1] platform/x86: thinkpad_acpi: Add X9-14 Gen 1 to non-standard thermal/fan quirk tables
      commit: bb0f3a5d6b9844b70ad696b9470762028f6d86ec

--
 i.

