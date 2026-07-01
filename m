Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DD447DD44;
	Wed,  1 Jul 2026 11:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905424; cv=none; b=CAJIobyHsyp0yl6QuVONK5/Cel8vqs3cPLkqIo99OnFD70eIugrqLbg09p6cAZUlaW7t0XNtxcFtiYlLrLgkJjewIppgxaKGKHTjYYHpX6B6yB7octyyQfzDchIZScWgsrHi7PQbqomhVYANSiU3objM8fkX46FubpnphKH7lP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905424; c=relaxed/simple;
	bh=IGeSk+992RYZixUjXVZE507errT1qLlK5E6CH/2MSlQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Vh6djKevkDDmLmiOFnBcr5PJI6JN9GurFct9xjUxmokPUQdOGKL862NsTCAmQkVvFD6fgYLRr45BGseR0nRVf2dfwvs5QyANo0gNs2GdEj1Uefcz83FO6Ow9Y/cEDCje1faISLvflle4ge5T0sxOlu6axhVpAiCrTRtOQCvfaPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V8EkpTmI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V8EkpTmI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782905421; x=1814441421;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=IGeSk+992RYZixUjXVZE507errT1qLlK5E6CH/2MSlQ=;
  b=V8EkpTmIiF70CbfyBbkAjy3it1v8gNPGmBnpLTOiUnPLlcVAtNP/faME
   kwWcLzlfLfWriuKzqZcHS6TjUdTBBmmlxGFB/QH3nnrLlObMaiCfEWLro
   rxFvlL9sS1BSl2PWeWcGaxU0eFSovyA8boBDZ2wqlQZYYIwKDcei5/sqP
   OEkncfXGWCet6Uu3u41OJzg2DragJpzsE/7kuWslnGLyEYn5Cr2JTOAKx
   GBTVvNfDNbgdoxoFK8r57Ll9wixywfCDWJ7dNk//gU/NyK2ZKgqXCEqdI
   a/EViq5MbCDvrU/eRNcLufmAMaKTfMmO1Ds4S9MQbGqwJGEbx7MHicvMC
   g==;
X-CSE-ConnectionGUID: I0Dj/dULR02aKMSGq9B7Iw==
X-CSE-MsgGUID: rLcN0R78RCGVnpFzEYYdjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="87548617"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="87548617"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:30:21 -0700
X-CSE-ConnectionGUID: YL7MrprWSH6SnqE/bkbd4w==
X-CSE-MsgGUID: +y0jTaWsQO2QH4pCoxgK0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="248568114"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:30:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 wse@tuxedocomputers.com
In-Reply-To: <20260530170813.10166-1-W_Armin@gmx.de>
References: <20260530170813.10166-1-W_Armin@gmx.de>
Subject: Re: [PATCH 0/7] platform/x86: uniwill-laptop: Support additional
 features
Message-Id: <178290541404.22449.8889275439954671744.b4-ty@b4>
Date: Wed, 01 Jul 2026 14:30:14 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sat, 30 May 2026 19:08:06 +0200, Armin Wolf wrote:

> This patch series adds support for various new features to the
> uniwill-laptop driver. The first patch adds support for the keyboard
> backlight available on some models, while the next three patches
> add support for additional WMI events, USB powershare and AC auto
> boot. The last four patches finally add support for additional devices.
> 
> The patch series depends on commit b1a9b7a904af ("leds: Introduce the multi_max_intensity sysfs attribute")
> currently sitting inside the for-leds-next branch of the LED subsystem
> tree. Without said commit the first patch will apply but not build.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent or clearly a regression fix.

The list of commits applied:
[1/7] platform/x86: uniwill-laptop: Add keyboard backlight support
      commit: 2d79283eec8dbdca246ca22154d84cebcb2780c4
[2/7] platform/x86: uniwill-laptop: Handle screen-related events
      commit: c7f3d21c8f50d64202e191f0ced40190ca1f45f7
[3/7] platform/x86: uniwill-laptop: Add AC auto boot support
      commit: e8a41051b95bc8a2dfda3a32b23528d098a7e907
[4/7] platform/x86: uniwill-laptop: Add support for USB powershare
      commit: 58d88f08ab1ff8da359b78e3421566669f0d1dcd
[5/7] platform/x86: uniwill-laptop: Add support for the MACHENIKE L16 Pro
      commit: c1c6633e3f1f9e38b5b9a26137f87a997445d306
[6/7] platform/x86: uniwill-laptop: Add support for the AiStone X4SP4NAL
      commit: 62f334005d59723bcef864b82e95f6da6bbca41d
[7/7] platform/x86: uniwill-laptop: Add lightbar support for LAPQC71A/B
      commit: e451ae739a2c6fa4e9cc1be44678f6ff9223430d

--
 i.

