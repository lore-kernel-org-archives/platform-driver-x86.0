Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E848430EF8F;
	Wed, 25 Mar 2026 13:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774445116; cv=none; b=R2IlRmlJRO+kd//4oz+z+ncfY5auyvN46imgZ6Nh1wHUHZvbkF4cctKa7U7y1IjX/fC+G0Vp2a4Wl8ibeHz7P4oMpcDEMarJvlBQyRsb60jnVc1FP+Ed1SW51Yj4sIdbrwj9u8YjB0a4L4f8xrcvpUf12EG8S1/TTOfk9HSckbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774445116; c=relaxed/simple;
	bh=RJL6l6yfvLemoQJTHcbF/0EnU2nVp2+u97Rlz5M7muM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UgepXn4CMRKG6oEdIYmVTUfBK71FN5Li/OGnsRocGKHAI9pCmq97EkBV8mn3RI/8QlOosvXb0Q3rpK74Q1mKpQSOYGp1kC+T2+jaj023qD0slWFPDi2Pwj3lfJ6aLjC+NDKaLMP5lh4ootXwfxHmg6iVXBnVvSaV8PCnMUNEQi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mP8TOrAR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mP8TOrAR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774445115; x=1805981115;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=RJL6l6yfvLemoQJTHcbF/0EnU2nVp2+u97Rlz5M7muM=;
  b=mP8TOrAR42qefwYq7tw2yew/X2jt+GuIS6BGuJbUsZRQmg8tF56v65QQ
   zH4fqyhzdfflFrpOiRUm3ihEDzx0qNfhWLFm92TTsV2U98MU9og3d4Py2
   A3HyrmvWEOzggqhnY088pitDPM0TN0OYIgoq3+lWXE5MK2gJtufHaSbod
   STpceihUDaYECxNnTJOfvbjQZ+9tjB1JG4s730KsG0vjQlsqEqGUAVQb2
   3/IqM/V3Ntanx5u3Kl/c/gEr2CqFEaFQ2Iych0Ul9Znx4OoeW3bmTIQf8
   H1kyStdWQDd27bvcsLCYH/P1dUiM8ptEgpZnZXjZCOOZ4kII8FbUIo3n7
   g==;
X-CSE-ConnectionGUID: i+MdMy8MQy6xVQmI7AjjaQ==
X-CSE-MsgGUID: vnHgnHSnTdetLVIy7+8VsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86956849"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="86956849"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 06:25:14 -0700
X-CSE-ConnectionGUID: HwU2HgbzSFOzcXALwZvx7w==
X-CSE-MsgGUID: CMuykZPxR8Ou5B2thSSKQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="224635590"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 06:25:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 25 Mar 2026 15:25:08 +0200 (EET)
To: Werner Sembach <wse@tuxedocomputers.com>
cc: W_Armin@gmx.de, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 0/5] platform/x86: uniwill-laptop: More support for
 TUXEDO devices
In-Reply-To: <894b03aa-2fe3-4f1b-b91d-330133855830@tuxedocomputers.com>
Message-ID: <150490b2-e009-470e-b755-989a62d6f24d@linux.intel.com>
References: <20260324203413.454361-1-wse@tuxedocomputers.com> <704a7de4-ee2e-5f1b-56e1-452fbb1af242@linux.intel.com> <84878980-ff70-42bc-8556-0a21f30a5290@tuxedocomputers.com> <d89927ca-db50-f060-0ad9-804e91126656@linux.intel.com>
 <894b03aa-2fe3-4f1b-b91d-330133855830@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-500248093-1774445108=:976"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-500248093-1774445108=:976
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 25 Mar 2026, Werner Sembach wrote:

> Hi,
>=20
> Am 25.03.26 um 14:06 schrieb Ilpo J=C3=A4rvinen:
> > On Wed, 25 Mar 2026, Werner Sembach wrote:
> >=20
> > > Hi,
> > >=20
> > > Am 25.03.26 um 13:40 schrieb Ilpo J=C3=A4rvinen:
> > > > On Tue, 24 Mar 2026, Werner Sembach wrote:
> > > >=20
> > > > > v2: Incorporate Armins feedback.
> > > > > v3: Incorporate more of Armins feedback.
> > > > >       Rework USB-C power prio functions
> > > > > v4: Readd system vendor SchenkerTechnologiesGmbH for XMG FUSION (=
L19)
> > > > >       Replace for loops with if statements for USB-C power priori=
ty
> > > > > functions
> > > > >       Add missing mutex in usb_c_power_priority_restore
> > > > > v5: Restructure patch around new entry for XMG Fusion
> > > > >       Add missing Reviewed-by and Tested-by
> > > > >       Spelling fixes in documentation
> > > > > v6: Fix small format error in docs
> > > > >       Fix Reviewed-by line
> > > > > v7: Variable rename to lowercase
> > > > > v8: Move USB-C power priority init to after probe call
> > > > >       Clarify documentation
> > > > Hi,
> > > >=20
> > > > Does this conflict with something that went through the fixes branc=
h? I
> > > > tried applying this through for-next and get fails so I guess I'll =
have
> > > > to merge fixes to for-next before I can apply this.
> > > >=20
> > > > It would be nice to mention any known conflicts in the coverletter.
> > > sorry, I thought the base-commit line was enough
> > >=20
> > > it applies cleanly to v7.0-rc3 and v7.0-rc4
> > >=20
> > > earlier rc versions of 7.0 are missing a required patch
> > Okay, so there's a dependency for some commit that went through 'fixes'=
?
> >=20
> > > maybe for-next is not yet rebased on the latest rc?
> > 'fixes' and 'for-next' are sort of independent normally. Both are based=
 at
> > -rc1.
>=20
> Ah sorry didn't know that, thought for-next moves along the different rc
> releases and so I only checked if it applies to torvalds/master.
>=20
> Quick checked the missing patchset is this one:
> https://lore.kernel.org/all/20260218005101.73680-1-W_Armin@gmx.de/ it cam=
e in
> between rc2 and rc3.

Thanks, for taking a look. I assumed it that series might be the cause.

I'll pull fixes into for-next once Linus has pulled in the PR I just sent=
=20
(so I know the commit IDs remain cast into the stone), and then apply your=
=20
on top into for-next (a tentative plan).

> > I don't rebase 'for-next' from -rc1. If there's a conflict or some 'fix=
es'
> > commit needed for a work to be done in 'for-next', I'll resolve those b=
y
> > merging 'fixes' changes back into 'for-next.
> >=20
> > > I will have a look

--=20
 i.

--8323328-500248093-1774445108=:976--
