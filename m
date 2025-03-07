Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F090211477
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Mar 2025 10:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741343964; cv=none; b=jZOF04PC4nT9gkaGmczQAHYf7EQaQMf3b5udZivXVBQiL8gZpRZ+OTqCAtt4TrOqwZbQPP0xLWpgJqxV8DGLqxE2UckeN0p/0Dcr87vbFliMUUiB5Yiik0BvwD7gXLLohwJ7yTmFXYcwhkIBs1MFUZNX2QwMW8xpqiXmEIT4RUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741343964; c=relaxed/simple;
	bh=CAVdb/iYLWOxEB7nKl9WajfoGuYtfXWGFHOQlbxUJ0w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=McqltvM2ATZF5DfSwgBs+R+VVPwItiC1H1qfDL3dxXqC5xUttm6od26VzeDXiNkMlNnDG0VP6MgP56gxJiJxel/aQCVDLWsb4C4KI+pLKNTzuFL/844dOmFnbISgepXFTjkol8sh3GJQt2Jj53Lr5k2t5Jt1pf4UZmA9Kl/2GYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OXBknZ+O; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OXBknZ+O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741343962; x=1772879962;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=CAVdb/iYLWOxEB7nKl9WajfoGuYtfXWGFHOQlbxUJ0w=;
  b=OXBknZ+Oy0wmJE3GZ/30vcLS5fam6YFx/Js8cX0X8fqQJKlNlmeXtkUp
   LQb6/Z5+EXNJztXn7KF7++bOT9hJO9ItCTEyvNFCubVIPiosyckXxoTJv
   BtpC+POn70aHHIPSl5lmDNIeChtaafGeoH4ou6BVzeSY7Knuv8FpT+Hpf
   7oaHktpBCokk/1hbbEE9P9bIkkIZkls65HuxI/IjgUAWGEmnBFp0BPAyA
   ghTSn1fXUJxV6Vb21v1Jrbt1dfOYXue9CY/J1IUdiES6aoEnbybBE6YbC
   HOAqgDnOVOLf+JQ+ck/V5mWthAwl6RCkeJMhSXQ2Djw8F/PRceajxPXHO
   A==;
X-CSE-ConnectionGUID: BalZJ6LaR1K5uybHhoMQqw==
X-CSE-MsgGUID: Kgs3zuN2RNKpz4+l25wDYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="29968944"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="29968944"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 02:39:22 -0800
X-CSE-ConnectionGUID: qmmFl9zsQzqWrFnB58TLVQ==
X-CSE-MsgGUID: NnArxSl8RMi6jMEleDTbBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="142520131"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.120])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 02:39:20 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org, 
 Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250305142615.410178-1-Shyam-sundar.S-k@amd.com>
References: <20250305142615.410178-1-Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v2 1/4] platform/x86/amd/pmc: Notify user when platform
 does not support s0ix transition
Message-Id: <174134395637.2047.9785111809423469800.b4-ty@linux.intel.com>
Date: Fri, 07 Mar 2025 12:39:16 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 05 Mar 2025 19:56:12 +0530, Shyam Sundar S K wrote:

> Some of the AMD platforms do not support modern standby, so when such
> CPU ID is detected, a warning message will be displayed to the user.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/4] platform/x86/amd/pmc: Notify user when platform does not support s0ix transition
      commit: 351f3d9a05504a5c6d6be39eee8e17fbafa89df7
[2/4] platform/x86/amd/pmc: Move macros and structures to the PMC header file
      commit: e3f1fe98983ea801ac509f7bf3fb5da4a17e29b4
[3/4] platform/x86/amd/pmc: Remove unnecessary line breaks
      commit: c183cf6c5398f7b31b4fb67a5326f045c51d783a
[4/4] platform/x86/amd/pmc: Use managed APIs for mutex
      commit: 6ad1b2dc0f2a76b23a31fc7a52ed4ec06e4344a3

--
 i.

