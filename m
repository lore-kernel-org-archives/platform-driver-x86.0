Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CA87E794
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 12:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bOlKeZzv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702903346; x=1734439346;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=A9pqCDwAFUv6hkL9Id+eoAK5NSe4cHb7j0QosISshwM=;
  b=bOlKeZzvhFhb1UDCGejZw0luWG1i64aHmpKNLdtm205zymcOwtDJRCNM
   CzPKy7OS/Ym2MVhaOpuesetI7Bmx5onSHCStBVH4cbutoD4vOSPOtipEw
   m9B0Is1DKzbC8DytVW7zBvLe57qqf37SH8jJen266HyO8UeNK8pBe/IEO
   Jzs666TkA78kRf1yp6Meet38Ht6QzGQ/lIjbuF5TCatCVqa0bM7Ealh4X
   6+cbzHRyrnD1RTEDiG1vMe6b+osyxVkeEJ8aYgFx8Ezjkc/fFaprRchbB
   Jhr7sX670hnHaXHLBc8dLQF+F2fkobWnqwnwM2LBkmoUS7VsXql1I8RaP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="2591686"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="2591686"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 04:42:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="809821092"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="809821092"
Received: from gmarin-mobl1.ger.corp.intel.com ([10.252.34.78])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 04:42:24 -0800
Date: Mon, 18 Dec 2023 14:42:21 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
cc: =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas@t-8ch.de>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>, 
    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Goswami Sanket <Sanket.Goswami@amd.com>
Subject: Re: [PATCH 0/4] Add a workaround for Framework 13 spurious IRQ1
In-Reply-To: <53d6933e-e5e8-4db1-b2e3-b931dc8bf0bd@redhat.com>
Message-ID: <0d3fb62-b5e8-228a-dfa9-55ae63089db@linux.intel.com>
References: <20231212045006.97581-1-mario.limonciello@amd.com> <85397fdb-b093-4c03-8613-3815352f2b2c@t-8ch.de> <53d6933e-e5e8-4db1-b2e3-b931dc8bf0bd@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1093409967-1702903152=:2348"
Content-ID: <4540913c-8967-3c5c-629e-124bc09c2a69@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1093409967-1702903152=:2348
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <f1d8ccf2-61a7-f9b7-8a8-6bcf2638e6b@linux.intel.com>

On Mon, 18 Dec 2023, Hans de Goede wrote:
> On 12/12/23 21:19, Thomas Weiﬂschuh wrote:
> > On 2023-12-11 22:50:02-0600, Mario Limonciello wrote:
> >> The 13" Framework laptop EC emits a spurious keyboard interrupt on every
> >> resume from hardware sleep.  When a user closes the lid on an already
> >> suspended system this causes the system to wake up.
> >>
> >> This series adjusts the previous Cezanne quirk (which has a much different
> >> root cause) to be able to apply to other systems too. The Framework 13"
> >> system is added to the list it will apply to.
> >>
> >> Mario Limonciello (4):
> >>   platform/x86/amd/pmc: Move platform defines to header
> >>   platform/x86/amd/pmc: Only run IRQ1 firmware version check on Cezanne
> >>   platform/x86/amd/pmc: Move keyboard wakeup disablement detection to
> >>     pmc-quirks
> >>   platform/x86/amd/pmc: Disable keyboard wakeup on AMD Framework 13
> >>
> >>  drivers/platform/x86/amd/pmc/pmc-quirks.c | 20 ++++++++++++++
> >>  drivers/platform/x86/amd/pmc/pmc.c        | 33 +++++++++--------------
> >>  drivers/platform/x86/amd/pmc/pmc.h        | 12 +++++++++
> >>  3 files changed, 45 insertions(+), 20 deletions(-)
> > 
> > For the full series:
> > 
> > Reviewed-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> > Tested-by: Thomas Weiﬂschuh <linux@weissschuh.net> # on AMD Framework 13
> > 
> > The device now only wakes up when opening the lid.
> 
> Thomas, thank you for the review and testing.
> 
> The series looks good to me too:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Ilpo, do you plan on sending out one more fixes pull-req for 6.7
> and if yes, can you add this series to that; or shall I merge
> this into for-next so that it gets included in 6.8-rc1 ?

I was thinking not to but that was because I for some reason had missed 
this series in the pending queue over the entire last week.

So I'll make make more pr taking this series, the thinkpad fan thing and 
1/2 intel pmc fix, 2/2 intel pmc is for material that is in next only. 
Hopefully LKP cooperates slightly better this week than it has been over
the last month :-).


-- 
 i.
--8323329-1093409967-1702903152=:2348--
