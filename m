Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1305F3B52F8;
	Tue, 13 Oct 2026 09:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882667; cv=none; b=dCOaapNuAsxNuT59Ls+W2Pr8o8Y0rIxp7SnWhYtsXqGp7jyamw30pVkX/UE+BdbPJypyvuDSr/3eks9YyHTyQmbL9HCV/V8/3q/Kb5aDDgbhIDV7S+2YoramTiMwn1FRC2/DXU7ojMec3c/S1WZf89RTKQosFZp1qQXzgllmAQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882667; c=relaxed/simple;
	bh=wEkKnl14EWDac6YT/V5RPV0TcwtWSsadHLQpgVHtVDg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=S6GahL3526qaqM3ck/CVCTLtdbPG454ZWJN02KL99g3PkMFqhiCJO7YZCyMmpISw8JOjdIGgvNqIbSyszAuvoIXp+XMtEkV8Q8LzmEDhZV8A718fcKtF6awwMXxGzrZUHWGsXS413eMogyZFut3oXilHe7OJtKuHpyNy2J6QBXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YrJ6B9jZ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YrJ6B9jZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791882666; x=1823418666;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=wEkKnl14EWDac6YT/V5RPV0TcwtWSsadHLQpgVHtVDg=;
  b=YrJ6B9jZrEjfzWzAIaDpT3DFKuUn0LXXVWQ+I71fiDa/CmWFOSPxWtGb
   CqB8XU7okkAkhPmBuMmLU63bS/Up4WdHNwTx1pMyRVzfupGK/jnrUbdgl
   9A+2yOtu2aGPJxgDBYuf3xLNlhCkcQjj5LF3qomLP8QZNcQCXtkZZ96nQ
   qglDRJiVsLKzrZcoMWHDed9PWyA7nrZBpQ7d9XtMxYHk2y34JMhGBkY/7
   VYOWVBFLxEEV49ZuktoluWGp4xfxojZE9K8cgMn9Rgppa2Jh6fY6zcz4s
   HEKkQ2XDjCui6hFce+FUm77ZV5rt+LqoGLSiT4e8gGV4/D20is03/Bdx5
   Q==;
X-CSE-ConnectionGUID: kVqkJqK8Q4aIHO4nEZ7Uuw==
X-CSE-MsgGUID: J3Ee3IfFQ3ylXckqlmam5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="499142"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="499142"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 02:11:05 -0700
X-CSE-ConnectionGUID: meKhYLfJSKiSndj1n/6ziA==
X-CSE-MsgGUID: C5/LtQBlTziiMzaCwSe7YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1071020"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 02:11:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 13 Oct 2026 12:10:57 +0300 (EEST)
To: Armandas Kvietkus <armandas.kvietkus@proton.me>
cc: luke@ljones.dev, denis.benato@linux.dev, Hans de Goede <hansg@kernel.org>, 
    corentin.chary@gmail.com, fxzxaxon@outlook.com, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] platform/x86: asus-wmi: suppress -ENODEV warning in
 fan_curve_get_factory_default()
In-Reply-To: <178975588661.29716.3167848890407727242.b4-ty@b4>
Message-ID: <52694840-d2ee-e860-3e89-133cb577d730@linux.intel.com>
References: <20260825-fan-curve-v3-1-617f8e661e9c@proton.me> <178975588661.29716.3167848890407727242.b4-ty@b4>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2118916778-1791882657=:1237"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2118916778-1791882657=:1237
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 18 Sep 2026, Ilpo J=C3=A4rvinen wrote:

> On Tue, 25 Aug 2026 00:47:07 +0200, Armandas Kvietkus wrote:
>=20
> > When firmware does not support the fan curve WMI method,
> > asus_wmi_evaluate_method_buf() returns -ENODEV. Callers treat this
> > as non-fatal, but the pr_warn() here still fires, producing
> > spurious boot noise on unsupported hardware. Downgrade the message
> > to pr_debug().
> >=20
> >=20
> > [...]
>=20
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
>=20
> FYI [if applicable to your patch], as per Linus' policy change, also
> fixes are mostly routed through for-next unless the fix is for a
> commit introduced in the most recent cycle or is clearly a regression
> fix.
>=20
> The list of commits applied:
> [1/1] platform/x86: asus-wmi: suppress -ENODEV warning in fan_curve_get_f=
actory_default()
>       commit: 9af7fddef448d649fa1332d86a14465a1d1fafe3

I had to dropped this patch because it's lacking a proper Signed-off-by=20
tag.

Please see Documentation/process/submitting-patches.rst for more=20
information on what is required and send a new version with the problem=20
corrected.


--=20
 i.

--8323328-2118916778-1791882657=:1237--
