Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253193;
	b=MXO61Qddefe3NhnGAcv3q+50MkyyENlctWA8k7G786VVUAiPoQpaq27cb+TMJSosCmX0
	 FyC18sa1FCbscsqub9LgT6xo737wXLxhS12xAH6n+1XdTSKIF3YMIab0rbJIqs4x2bMFb
	 fguzXSczSEKVTKW5+pOSAe6uxDE2tQ8EPE/AVNxr8jfvNT6pVm9r8SgnqHmSAOZfb4OUB
	 Dk/6dZuepY//gtF5uQ3Fpvn6auqWnk2VdYLXtpgYS+VCZzQ+IpEKc7dX2o8joS5RFKN3r
	 3A0uBwqytGoKaPgg2WN6+3muv2pzDnzlYRPoS2s1drA9YJoPfDMal+MXA26XZYWW/3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253193;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=YRFhtF09hJR+ysMDP8txfaUhZijimmAOGt1NLZVC0xg=;
	b=iy+vRyP9u3WcLPkNbiNT/HCpKqc2EhqSgqxoffd6Qz1mjizWgL7rc2uCz/CLVXWdLkuS
	 oyicSaEz067dDsaaBqk7djNRpjqTku2nGZJpFLNL9BH9u79wqpzypjiziQgUzjdSq9QFU
	 DlWdBDJOgnyJmY0Vf8exwrk4F0RqlvvudtIR8VxB6ievseJXWaOmJ2d9dpXLDnTR3kNbW
	 hbD2UDOo3JpEypSyhqnrn7uAKpxkgWVE51T7jaFLlHBjNFdawAHob32TNN3gdOSLs/234
	 WqAuxIs2hsRPTXanXsJgoAoq04NhU6jo0ZqmYcKDwOvA+iQBM2lADUB2d8p65gn4HhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FkZZyPyY;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961B4606A335;
	Mon,  9 Nov 2026 19:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 961B4606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FkZZyPyY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794253193; x=1825789193;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=/zLpEtTT1he5uIuCCnJD+NSKC0jNoXysMM0dsBnGWOs=;
  b=FkZZyPyYVAIBm3v6w7l1ET9TDKxdPUIV17l0J4dxzOortmdmNHC0mNAW
   n3x867DjvPz6k1lPv1dglrkr3e2mZd/JUv77rHtF9GPjCVa4kH2v5raSz
   FPbdWU5Awd83Laz1t6mNDuGpChVjBCW0T/W+qv/uJamlpnGBWiDtC4Drq
   UITagkQ5LBQP0ryyCb3FzOrr2EaOOeX2u5ia39JO3HvwVKRIeOqtT4GvE
   EkJdcZ5C2ip9j7jHXTYl0XyFLDX03c7jhCfQxuSLv37xDQop/vJ1skdPz
   bumVVEOvBgqNMCbWpnp7xDlOheMMGi5My481zlllBeSJK35AEzmLA2kYg
   A==;
X-CSE-ConnectionGUID: IwxDm78zRP24le+RakMLDA==
X-CSE-MsgGUID: AQCFFcqTQ9moE3SvHXL44A==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2867512"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2867512"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 11:39:52 -0800
X-CSE-ConnectionGUID: NnZAd6EwQJ6t+VOjezK0og==
X-CSE-MsgGUID: qyGXcv5+R0ObgyVPadoHfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="9727693"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.139])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 11:39:50 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, chitranshmandhaniya@gmail.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chitransh_Mandhaniya@dell.com
In-Reply-To: <20261026042310.596206-1-chitranshmandhaniya@gmail.com>
References: <20261026042310.596206-1-chitranshmandhaniya@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-uart-backlight: switch to
 devm_mutex_init()
Message-Id: <179425318537.10927.4747538247269208184.b4-ty@b4>
Date: Mon, 09 Nov 2026 21:39:45 +0200
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 26 Oct 2026 09:53:10 +0530, chitranshmandhaniya@gmail.com wrote:

> Replace mutex_init() with devm_mutex_init() so that the mutex is
> automatically destroyed on driver removal via devres. The driver was
> missing a mutex_destroy() call on the teardown path.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: dell-uart-backlight: switch to devm_mutex_init()
      commit: b2ee01b0b19b3e7b3f1facfdad30c73bc69a3e51

--
 i.

