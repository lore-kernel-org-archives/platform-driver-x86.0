Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A413C6A22;
	Tue, 17 Mar 2026 13:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752412; cv=none; b=PKRqHqHeLUNSaG4GlBEgfmt8Fd0HiiY7ZvduzfudtIkGSfUyGpY2Pm2+MKy9dkea7HXC76StEsxuwo6lkoUpzU6E1WeSbu+uImaDo6wEgYpRGpJHDQ+Lb9BYLhm+vcZQQqU8LIZx5vaYmlCxn2myYfursfl5DlxebbpYuANVlP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752412; c=relaxed/simple;
	bh=rbVcCCPIEzH51sClC7PqCKiUpkyuD2orXmITtnRsF/Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UZUQfuPT83otkBjewhVyud4z5J3H9ADDdAqN/0pfAIV6lKr3giQdSSLmbP603cxwslaZN5wq2DSBVeCBACVy4exbrxf2tpZHH/pm4Th3jaXS/+qbfjCUZaAgP2aPf4eNuMSP0UJQ/XTsjgnEpLz+44HYF84hOFj8XH/jvyIB/+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FNz1TCHS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FNz1TCHS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773752411; x=1805288411;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=rbVcCCPIEzH51sClC7PqCKiUpkyuD2orXmITtnRsF/Y=;
  b=FNz1TCHSEuMQy+RQ0MnhPH4A0MsPsnJIK6/dHsmOTzTeIClB6HvB68VO
   uCEVuybzx132D/snhpsIHlBJW3eCOOmZN5w6litxplb+APd39ah+5BaA3
   oI2vJ4NcOu4XVPU0qt3kogA3roiLZvlJ4q9A1uzihgyThRoy+YbekFcEy
   ZRtarXxIRuq4x6i5WTOcsIAGXwQLO3JpDYYBRa7kozgp3H7vFuLVAUO2i
   IqOAVyAPBHzKudN9ltZpi6TChGXc666JVQWuIA8SCaPwiDlP4Vykstp4F
   WWFaHDfz/3PU7UmiSLbrerrz5xnyKUag7pSIEybOhYkabhHeS9Ic18B6G
   w==;
X-CSE-ConnectionGUID: Cdbllia8Rhqo5BVMj3LlRw==
X-CSE-MsgGUID: lahKWOh7TkWN6t4QLH47ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85409120"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85409120"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:00:11 -0700
X-CSE-ConnectionGUID: z2ryeQ5ySXKpw3rZuqIjCQ==
X-CSE-MsgGUID: mdAJ98OCSpizbb84cQy2Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221490634"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.161])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:00:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
 "Luke D . Jones" <luke@ljones.dev>, Mateusz Schyboll <dragonn@op.pl>, 
 Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20260309183559.433555-1-denis.benato@linux.dev>
References: <20260309183559.433555-1-denis.benato@linux.dev>
Subject: Re: [PATCH 0/2] platform/x86: asus-armoury: add more ppt data
Message-Id: <177375240356.9137.13046791450460193020.b4-ty@linux.intel.com>
Date: Tue, 17 Mar 2026 15:00:03 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 09 Mar 2026 19:35:56 +0100, Denis Benato wrote:

> this patch series includes PPT data for the models: GA503QM and G614FP.
> 
> Cheers,
> Denis
> 
> Denis Benato (2):
>   platform/x86: asus-armoury: add support for GA503QM
>   platform/x86: asus-armoury: add support for G614FP
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86: asus-armoury: add support for GA503QM
      commit: 229a45dc893a1acbdd9083341db60d2e7d1bcef2
[2/2] platform/x86: asus-armoury: add support for G614FP
      commit: 94fcbfa9ddcb70d6aa59ed84f5d25c45ffc994b5

--
 i.

