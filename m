Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B74145348
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Jan 2026 13:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768571133; cv=none; b=cg/triyRF2EkMR4QGliKeebpnKZEbRkaKxWgPQfjmdeD68OoTMhwiXjsVSm20bJqtD7h20Dkpvy4t4+PwahGWYrCYo70Wg7cJr4gaIt9cNEoZa/sQTBrmaMe1gs7mEBh+KIHYdtvwosFAqvy7NS1Mjembug32Q0bYNvaMw2oqbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768571133; c=relaxed/simple;
	bh=kSdfTOaSQOEWekCPnJ72minDC2Ysz0vnLrX/N4lKcMI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EyFZ76aVLnwBnFgi/5L44o9CMYMcC0RwXzIbTwI4k3lTtvDIhB4OSj57f+XygRJNaRf8kP140zhTRcHZ1c5nVblv9+/5eRKqKn5+vAqDbHN4cS1UKxv9aeZvuHRgHfmW7H1pjK9b9TgVUXO8bbxCgwXxcuSvpfC+7JeHsOMXhbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KmYWCifW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KmYWCifW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768571131; x=1800107131;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=kSdfTOaSQOEWekCPnJ72minDC2Ysz0vnLrX/N4lKcMI=;
  b=KmYWCifWq9dSpAleR6RaPFx7RN4TiOn0UT/FtMTwss4ZjPpknFdjptQv
   RYz4/mXgSyyw35tPQBgVmv1OSG9MvlH0Ssz+gNNqWr78r7oPgxytmS9Tm
   hF+psDxCVH1qs2cJmyhN1ak0x/g2HwCsdu0OId6LFbUy4WF0LUI81Sdz1
   BEfhqmRf3UhyjufrB/YiccJIhtIKIqMyhP/0qgGOtQq64vEApT1OnFQLm
   25v2ZntaLrcIayyEehRUd+CEaK4Bw1uHZN3DBL65xyu9RqUKPqov1mDj8
   Ch8VIHql9Ke13F7DWGXJu9AK8jyKTQ4XgHWBtDrVZ061LpUc8PyKCiCMy
   w==;
X-CSE-ConnectionGUID: Orkj5fYjQ5SROMwII7YBFQ==
X-CSE-MsgGUID: pWFEp4+SRvODQ7u5DYYgTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69616255"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="69616255"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 05:45:30 -0800
X-CSE-ConnectionGUID: jQDxIXaQQY2F6e71WRob1g==
X-CSE-MsgGUID: q22lsZq5RbmHjW0SbZB/xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="236507641"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.178])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 05:45:27 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, jorge.lopez2@hp.com, linux@weissschuh.net, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20260115203725.828434-1-mario.limonciello@amd.com>
References: <20260115203725.828434-1-mario.limonciello@amd.com>
Subject: Re: [PATCH v2 0/3] Fixes for hp-bioscfg
Message-Id: <176857112253.7205.11242951143287770501.b4-ty@linux.intel.com>
Date: Fri, 16 Jan 2026 15:45:22 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 15 Jan 2026 14:31:09 -0600, Mario Limonciello wrote:

> When working on fwupd code on an HP system I noticed that all the BIOS
> settings were missing in fwupd.  I thought I forgot to compile the
> hp-bioscfg module, but actually it was compiled just not loading.
> 
> Once I loaded it, I found various problems with boundary handling and
> attributes on an HP Z2 Mini G1a.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/3] platform/x86: hp-bioscfg: Fix kobject warnings for empty attribute names
      commit: fdee1b09721605f532352628d0a24623e7062efb
[2/3] platform/x86: hp-bioscfg: Fix kernel panic in GET_INSTANCE_ID macro
      commit: bb820f17b68f624547357e207ce9a8c7af3e7845
[3/3] platform/x86: hp-bioscfg: Fix automatic module loading
      commit: 791c3c82091eecd862f0d55a7c7a3302a518f599

--
 i.

