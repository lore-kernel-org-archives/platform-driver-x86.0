Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31098405C;
	Mon, 24 Nov 2025 13:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763990926; cv=none; b=C8dGGgSGUZ59qliC9dhMiNX58WMVO78HFT0XPRnuNLuJ/8+k9vTpIN7wC4C4SFfqsEzHK48qic0krWG+OpZ+izzub1Rr2khzb6oOxO4evsZNPsjXxYAiebQ7ujtrff57WzPQAz3vzkmD82hU54fr0t898keMBo8+bGxW/D5X3LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763990926; c=relaxed/simple;
	bh=Fc3BNyupWR8PjfsyjU1qpINR8s7LUzojvSadEdHSxM4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uxsVhQwZk50tCl/Ge2HCur5hly9r039yY0UUbjcfvATlNfY/rGQuFQEReabLeDf4DHEtXeUFrOGjZRQoFBaXJE6fwfC1yQ03n2RhxFGihGF6S08Ys3IzfOQALhNgoRna8HvY2IYhMKGSRYa1sUZZTwC8CQbNu1hVGfqBm2+V3b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aPzfNk2r; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aPzfNk2r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763990925; x=1795526925;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Fc3BNyupWR8PjfsyjU1qpINR8s7LUzojvSadEdHSxM4=;
  b=aPzfNk2rMjjb7m1FNDKqnAH5wKTO5PeApToHyHzymFQmneSUMjmx6pSv
   Wg7tWasBYULB9Ls1BItSKq28gGyN0jPSCvYsa4xL7fWZ7UfhmDbuFvSb0
   kIy04fDgcpRT/+xY54r2SW7EkV6CXyadvuMbVhfYd/w+eoQR6LAGcn0Va
   3vHwmF2rkBFhP7RD8yHUbudXT3PLSe6QOFYUZtXtpf0yanPjAlRdQsjGk
   n7j3Wt9xS7qdWzWmsuh80Qg6uYrqSfI/JTxtpZkV8BXEA1anMm03tkBr7
   Y1SrlX7oyCTL+BiiKKxFGgNAnADltyRvpqGyedrBaw0nITcKEVpiiizKQ
   w==;
X-CSE-ConnectionGUID: vlnKG6zzSmKwYvD88MsymA==
X-CSE-MsgGUID: 2Iwu9ob3TEO8KFDrkuxt3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="76315219"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="76315219"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 05:28:44 -0800
X-CSE-ConnectionGUID: YEq8bMhmQ72TO5FSXcBbUw==
X-CSE-MsgGUID: vp72HCTeQVKVaNffZDRudA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="192433121"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.97])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 05:28:40 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 24 Nov 2025 15:28:37 +0200 (EET)
To: Denis Benato <benato.denis96@gmail.com>
cc: Denis Benato <denis.benato@linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    "Limonciello, Mario" <mario.limonciello@amd.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Alok Tiwari <alok.a.tiwari@oracle.com>, 
    Derek John Clark <derekjohn.clark@gmail.com>, 
    Mateusz Schyboll <dragonn@op.pl>, porfet828@gmail.com
Subject: Re: [PATCH] platform/x86: asus-armoury: fix only DC tunables being
 available
In-Reply-To: <d2cd2ed3-6f0d-41c1-86bb-dfe57646262a@gmail.com>
Message-ID: <073f7f84-cd31-2e34-e282-05ae95375b04@linux.intel.com>
References: <20251123150535.267339-1-denis.benato@linux.dev> <d2cd2ed3-6f0d-41c1-86bb-dfe57646262a@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 23 Nov 2025, Denis Benato wrote:
> On 11/23/25 16:05, Denis Benato wrote:
> > Module asus-armoury must use  AC tunables to check availability
> No idea why I missed the double space here.
> 
> Do I resend a corrected version? Should checkpatch.pl also check for this?

Thanks for the heads up.

I can take care of it while applying (and if I happen to forget the sky 
is not going to fall :-)).

-- 
 i.


> > of power-related firmware attributes: fix missing attributes
> > by using AC attributes instead of DC.
> >
> > Signed-off-by: Denis Benato <denis.benato@linux.dev>
> > ---
> >  drivers/platform/x86/asus-armoury.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> > index 5106e8a41e25..9c1a9ad42bc4 100644
> > --- a/drivers/platform/x86/asus-armoury.c
> > +++ b/drivers/platform/x86/asus-armoury.c
> > @@ -869,7 +869,8 @@ static bool has_valid_limit(const char *name, const struct power_limits *limits)
> >  
> >  static int asus_fw_attr_add(void)
> >  {
> > -	const struct rog_tunables *const ac_rog_tunables = asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC];
> > +	const struct rog_tunables *const ac_rog_tunables =
> > +		asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC];
> >  	const struct power_limits *limits;
> >  	bool should_create;
> >  	const char *name;
> 
