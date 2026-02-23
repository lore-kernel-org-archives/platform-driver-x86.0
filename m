Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F735314D0E;
	Mon, 23 Feb 2026 16:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771864485; cv=none; b=TEb8h3Cgk67RMXAGtKqVT7SBzTuCadPc/BoW8Oj8DTwQWaewIED0yx5mqVk4qSfj/zkz+RtLEOTYstdzYxfwGnLuaD/9QYAxB2tA3RSyvZNE9jHEhDi1Gn7nURO4M+UmrmQ7u+4sjSjJTn75DykymSz+As7nv5YM/d5WKI1Cg/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771864485; c=relaxed/simple;
	bh=Rc7pJ1lvYaGUbn9m851Tkbdihm5zO5PCX5XShBP0d28=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=L4RDdhbptA0bY1/4F/WdVQbC8BEFKX1XKYFvzoKpWaZEdD7Cxf+OWkLGG5tITbRXNszE3Qd12KXIP2gR/waBPaX0smKkkVBJHLwWJGQQp7sUbIoVmzii1VKjtmMKA4yG8JEVGC2bVRPKT2bhaGSOBYCeoDzvEjBb2yNuNmKnx/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j7FVFlK9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j7FVFlK9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771864484; x=1803400484;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Rc7pJ1lvYaGUbn9m851Tkbdihm5zO5PCX5XShBP0d28=;
  b=j7FVFlK9xaNRUV0m0rbplEvlGWFG7GDPsOI564mIZ0H/w4vP8PtfoFbc
   XYfAP+CZdYBojC/A2+m35GmOC6omSAtA5k3oSDTlzzRE/AfADlIb4EA9a
   H0EXEfbXqCdQMrI9XONtaX+uiPrL4X5l7ki6/++Z/EZSwHNFlWVzsYjGt
   v/BlHJUIQ6ZopD6ySpVNtir5o57THLJ/E5/SCjUKHHXQbOZoy4oPazrq0
   nTz9//xPiQ/R/4c7KHafuUKPfSviAmX/RulOP7WKpA0/1Jw0igtpfrggT
   dkABPXa/5Bckt8DVWRD0v7JSBKXhYjJYp7x1LlXb1zV2S0gEYMpPephxW
   Q==;
X-CSE-ConnectionGUID: rgIwcADrSA6V9iYixfvvQQ==
X-CSE-MsgGUID: cm3GeppVRniEitDoXTvEUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72073930"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="72073930"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:34:44 -0800
X-CSE-ConnectionGUID: zumdkzSlTLqPbOLXK0AEUg==
X-CSE-MsgGUID: D05HKH5/R9m2niUyJlrpJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="220163250"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.30])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:34:42 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Victor Lattaro Volpini <victorlattaro@proton.me>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260210000048.250280-1-victorlattaro@proton.me>
References: <20260210000048.250280-1-victorlattaro@proton.me>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add Victus 16-d0xxx support
Message-Id: <177186447587.17917.3562372495713747760.b4-ty@linux.intel.com>
Date: Mon, 23 Feb 2026 18:34:35 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 10 Feb 2026 00:00:52 +0000, Victor Lattaro Volpini wrote:

> This patch enables Victus thermal profile support for the HP
> Victus 16-d0xxx. It does so by adding model's DMI board name 88F8 to
> victus_thermal_profile_boards.
> 
> Tested on a Victus 16-d0xxx:
>   - Victus thermal profile choices available (quiet, balanced, performance)
>     instead of the default ones (cool, quiet, balanced, performance);
>   - Profile switching works correctly;
>   - About 4% increase in FPS using benchmark Cyberpunk 2077 on
>   performance profile;
>   - No noticeable regressions.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: hp-wmi: Add Victus 16-d0xxx support
      commit: 249f05e625c6e6c14b27fd34a2f06a1afb9b456d

--
 i.

