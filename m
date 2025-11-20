Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D239C36B05B;
	Thu, 20 Nov 2025 16:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763656287; cv=none; b=rP36zN3hikIzu42OdzVrHjzCXPQW/pRKvWNkZ+9m2waKKDYuFrlzKEei4dzGD9F4xl30HKGq+7j2o5RkYp0Vhw2TtBoL08DZ35kmKmxyPnwKnFSVfg4UizIrrPAosl2h98iz5NWGI/Lbhlv6nhnut84XdchzRLRRZxL2UiOAsXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763656287; c=relaxed/simple;
	bh=Js7Aad3T7zogSf2Ju9fLftDsKJnWePbDNPsoQwxzZac=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uM1+pL3KPhICMqUMxRIiwmeoHYXpYOurMZZapeD+i4Oa1WkTyUGZMBrKSZpjRsK7yyWsXhMdUHF0rRqS9SFbgfjmmi09rCn8wT7qvtVYVsm2lmVblpFHqscOWnweBRxI8LhwjunvomkxiHlhAlly1natQjd7VRh7h6MnCVrxcJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YHA3jqPT; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHA3jqPT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763656284; x=1795192284;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=Js7Aad3T7zogSf2Ju9fLftDsKJnWePbDNPsoQwxzZac=;
  b=YHA3jqPT4KzivapVowiVkTBeFNR8NoYhQ/baXzL3g9faRKNN6FQgcf3z
   N6taf0oyTe3w3LJ6JDQo3ZZfJX6JxJRzEFax1Rbx2y4oQiM6dlM+Gank7
   p2JmxSZzKwbgZgQPGg2icCv1rInHTJN0G23PZqe+L9Ltjtio4Udshebnn
   aRlW4H3/UoBTHABDzCcS+KGrQCHpGPAy1delxIjwU++JHdSDrfpH8FEit
   eA2M6bSHam7xjfzE1hjzRHOHI3duolCU+d1mHQRs8dpfXwKgstP34UeQA
   UxLFqGkDK2yW+mgaEoTv16eagY6BlKcFfBGZhm8LBEXOu+V/uY6DqcaTL
   A==;
X-CSE-ConnectionGUID: VxenCgUjS6uaVMlL8Pjr8g==
X-CSE-MsgGUID: hvHc1VXeSNi9ZiG5z82OxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="53302125"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="53302125"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 08:31:21 -0800
X-CSE-ConnectionGUID: OIVjSnZNSVqMLUyqgy3Ojw==
X-CSE-MsgGUID: R3TuYh+BSPqd6EFvYtCQ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="196560755"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.161])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 08:31:19 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 20 Nov 2025 18:31:15 +0200 (EET)
To: Werner Sembach <wse@tuxedocomputers.com>
cc: W_Armin@gmx.de, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] platform/x86/uniwill: Handle more WMI events
 required for TUXEDO devices
In-Reply-To: <ed4d19d3-a438-4e0a-9feb-1c62edef46d1@tuxedocomputers.com>
Message-ID: <cd10630c-cfc3-4462-0ff4-0554e9ddb596@linux.intel.com>
References: <20251118150839.55336-1-wse@tuxedocomputers.com> <20251118150839.55336-2-wse@tuxedocomputers.com> <69819b2c-9deb-481b-b404-fc6523c87a3f@tuxedocomputers.com> <2b7d8dca-b476-19c8-0bfb-7f3c0ccd2323@linux.intel.com> <ecc8e175-af33-4607-a720-5c380f7b5622@tuxedocomputers.com>
 <ed4d19d3-a438-4e0a-9feb-1c62edef46d1@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-298649444-1763655352=:5326"
Content-ID: <2e6396a8-c154-c4b6-21d4-1a2da3dd7205@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-298649444-1763655352=:5326
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <ec660b40-50e8-f5e6-aa42-4a7fd2d9ea00@linux.intel.com>

On Thu, 20 Nov 2025, Werner Sembach wrote:
> Am 20.11.25 um 11:59 schrieb Werner Sembach:
> > Am 20.11.25 um 11:44 schrieb Ilpo J=E4rvinen:
> > > On Wed, 19 Nov 2025, Werner Sembach wrote:
> > >=20
> > > > Am 18.11.25 um 16:02 schrieb Werner Sembach:
> > > > > Handle some more WMI events that are triggered on TUXEDO devices.
> > > To avoid another round-trip and a version, please write a bit more wh=
at
> > > this is about than extremely vague "some".
> > >=20
> > ofc:
> >=20
> > I tested 3 more devices (InfinityBook 15 Gen9 Intel, Stellaris 16 Gen5 =
AMD
> > and Intel) and found that these send additional WMI events that the dev=
ices
> > Armin tested didn't.
> >=20
> > These are: UNIWILL_OSD_MUTE, UNIWILL_OSD_WEBCAM_TOGGLE, and
> > UNIWILL_OSD_DC_ADAPTER_CHANGED
> >=20
> > I also went through our out-of-tree driver where additional WMI events =
are
> > bound: UNIWILL_OSD_RADIOON, UNIWILL_OSD_RADIOOFF, and
> > UNIWILL_OSD_KB_LED_LEVEL*
> >=20
> > While I don't know which devices exactly use them, at least one device =
does,
> > otherwise we wouldn't have them there. Also I don't see any harm in bin=
ding
> > them, so I did.
>
> Forgot the most important part: Why i bound them even when some are just
> ignored: This avoids warning spam in dmesg about unbound events.

Hi Werner,

I've actually no problem with the diff itself :-) but what I want is us=20
to explain what we're doing in the changelog text. E.g., if you add code=20
ignore something to avoid warning spam, please state that in the=20
changelog (not just "handle" which is actually quite different than=20
"ignore" if we start to really go into language details, yeah,=20
"ignoring" is kind of "handling" too but must less precise, I think you=20
get the point).

Some things can be read from the patch itself, but it usually means more=20
work and we rarely can infer motivations behind any non-trivial change so
it's always useful to record such otherwise hidden details to the=20
changelog. Nobody is perfect in this, I don't expect that, but please try=
=20
to avoid vague expressions when writing the description.

Stating why they're ignored (beyond just warning spam itself) is even=20
better when e.g. you know something else handles the same=20
event already. But it's understandable if you don't always know such=20
details which itself might be useful knowledge for somebody wanting to=20
change the code later (was something done on purpose or just because=20
we did not know better at that time? is often what I'm left to ponder=20
after reading a change from history, if changelog doesn't give that=20
detail, I'll haveto guess and hope for the best).

In general, if somebody asks about some detail from a submitter, it's=20
worth to stop to consider if it's something should be added to the=20
changelog (when no change to the diff itself is asked). It could point out=
=20
something in the change that is not obvious enough. We're not writing=20
these changelogs just for the people around now but also for the people=20
that come after us (and might only see the change from the commit history
as there's no guarantee any of us will be there then and/or doesn't=20
remember anyway).

That also means if I don't seem to be directly asking a question, I=20
usually don't expect email reply (other than in a form of a new version of=
=20
the patch that addresses the feedback :-)).

--=20
 i.
--8323328-298649444-1763655352=:5326--
