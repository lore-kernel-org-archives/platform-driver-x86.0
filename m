Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C372F4CEE55;
	Mon,  5 Oct 2026 18:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791226394; cv=none; b=p2xl7ppssLlWyEZgEGsFi4u25QCAxuwYZctpWO08qy/2E4v5ljPM1ljzAiKdnmXvYmVgvk65lmxB1anKQb+OwsGxK+NpOxSlnYUNrlXmnL05kmHdFB3VYsPz+OezKjf58DlggAYQFDP4MVdQvIwaM/aWv46EZnQIdOTevF5HlqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791226394; c=relaxed/simple;
	bh=NlCs6SUL2bbVer7UI2BD+BnVmN0+R0C7pVP1oQK6hkY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TqISM4m1n1+lIFrouFgf20cKNV54jZfYGuX/riZhczpSw8N/mzmREDTjPWrOxc8wGHyMxODXoSAAK2/EpXHson8MHph5TgmPhhAHsVqdJwTAZhbE4+O0PVGW0qZT5ZWm4mj7/CfuopgRzqPeXex8idMhe2uCPd5f66USm8hWRDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GYlKzB8k; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GYlKzB8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791226393; x=1822762393;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=NlCs6SUL2bbVer7UI2BD+BnVmN0+R0C7pVP1oQK6hkY=;
  b=GYlKzB8kcYHfu63TbWAroDmAmfRjvMULO6L3J8NiMSpgkTnGIaIylJ8c
   dc2upylpa24sW3u5acodMog1qsdb0rqhefaG91N5ERS4NFbodwKW09lTS
   rGX9KnoX/X499HZSIOMdY96VMeUqVQBTDRSKNqM8gMaQRAnaJhplFoluR
   lOwJUZy+j4LaEAP3eAJ3NU+vC2Mh/bxucDUlNxnVbJMfDF/HPkItMyeBq
   T/gjY5Vw4SE4YSGIZBaQ8JDhQyBNsd2F2YUdFW1vJ/+YrUALLke1wiXxM
   jOOolmgCfagdpUEvhYwBqV4xwyAGvCZnbnDdTD4eiz15HyCp1z3lc+fWy
   g==;
X-CSE-ConnectionGUID: Sd+qTyHLT2+xILjLLOM7Cg==
X-CSE-MsgGUID: /uMC6pLnQWazNZqmU3r4cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="90861006"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="90861006"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:53:12 -0700
X-CSE-ConnectionGUID: xP5XdLGfRLu9r5KigpcLIw==
X-CSE-MsgGUID: KRS5FyU8RRK8oVGxkMOCgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="303160536"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:53:09 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 Nikolay Plastinin <plaztininikolai@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260924-gv302-tablet-v1-1-a45dd3a383f1@gmail.com>
References: <20260924-gv302-tablet-v1-1-a45dd3a383f1@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: add tablet mode quirk for
 ROG Flow X13 GV302X
Message-Id: <179122637795.41716.12390840321750878442.b4-ty@b4>
Date: Mon, 05 Oct 2026 21:52:57 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Thu, 24 Sep 2026 01:48:02 +0800, Nikolay Plastinin wrote:

> The 2023 ROG Flow X13 (GV302X*) is a 360-degree convertible like the
> GV301, but the existing "GV301" DMI entry does not match it, so the
> driver does not register SW_TABLET_MODE and the desktop does not switch
> to tablet mode when the screen is folded back.
> 
> With asus_nb_wmi.tablet_mode_sw=3 (lid-flip-rog) the "Asus WMI hotkeys"
> input device reports SW_TABLET_MODE on every fold and unfold, so apply
> quirk_asus_tablet_mode to GV302X* too. Apart from the tablet switch this
> quirk is the same as quirk_asus_unknown, which these models get today.
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
[1/1] platform/x86: asus-nb-wmi: add tablet mode quirk for ROG Flow X13 GV302X
      commit: 2622c23b7b640476a06d767b6ae63315ba5993a8

--
 i.

