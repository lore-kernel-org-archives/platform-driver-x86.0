Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894533FE666;
	Tue, 31 Mar 2026 14:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774968915; cv=none; b=Uwa/SOWWxleAKT2Oq+mRhZFqAFaU7badn9poUNOKlJgLdOu5P9f08Dc08DXLUYZ0fQrW6hV6IV+XlyRCJZt7A3qy6Y6BG47VxyT0/NQonvXu79rWA04s5p8Z7DVNkh5aNa/2iEsXB+pOXcKmuZgz5oT/QjxofW9JtV+Iv0P6M6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774968915; c=relaxed/simple;
	bh=cTv3x2vo0Yu+AIdNDxWR0n1FyxlNmVy0LkKjTia2seY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=d/2iTo6d0Va7bvngAyL9wpfS6NoS1yY0TI3y6yBeYVMmwOPvAzVb5wI+hWurtYShWC/SamtUlI6bszsXOk8XudTOer8jAqbJn8W2+kN9SKxDunLjfCugtS3AC8dqDHMcaLLXvYsRt1wH7WkayNyxVkqDJ10d36fYSDIuPVkPn8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NMrr5mtn; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NMrr5mtn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774968911; x=1806504911;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=cTv3x2vo0Yu+AIdNDxWR0n1FyxlNmVy0LkKjTia2seY=;
  b=NMrr5mtn31HiQsVpF3/tq8vYPQq6fbQyX183MJa2eM7YtmpVmMTfg9jL
   DV4C7gCZOWrygsGkp1Yu4pysbxfrggBWjl0tv4pCaAktYdvOf0FnaO/cm
   Zv2P45Anh7V6kwol+J925+9wuCTbz0Uk//z0xZwwK72BDKfbwkRQ/YNSC
   YHKsg7XUgvkGo5UNrmR6Q3EbIgJUyVVXI9RPqBcUjUajxYRAsiEV1tlZj
   iP6PpD/G2ZXufmkt0xtMJdbO1++UnEujo3lVmcWXdq7dMi9HpIbf5Fmn1
   ShdQQb+0oMjY3117GosGMjJwVFbkGLDjoz8zTU6WP0wPulYwiIcl8iNGb
   A==;
X-CSE-ConnectionGUID: 1Ur4UQqCS4C78zzr4zVjtg==
X-CSE-MsgGUID: I3a+uYseRIuoZj02aZLczw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86681053"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="86681053"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 07:55:10 -0700
X-CSE-ConnectionGUID: yc916jgKQfuBa6JCPLmH5g==
X-CSE-MsgGUID: TWfbt13UQyu4DLzx/lVPCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="226366341"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.6])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 07:55:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 31 Mar 2026 17:55:04 +0300 (EEST)
To: Thorsten Blum <thorsten.blum@linux.dev>
cc: Prasanth Ksr <prasanth.ksr@dell.com>, Hans de Goede <hansg@kernel.org>, 
    Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: Clean up security buffer
 helpers
In-Reply-To: <acve8iuIuycAtHyS@linux.dev>
Message-ID: <2524c3f1-9400-5ad1-6613-987283c66887@linux.intel.com>
References: <20260309211811.82403-3-thorsten.blum@linux.dev> <ec9be8c3-6946-5edb-0879-53b150c95ddb@linux.intel.com> <acve8iuIuycAtHyS@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1757097082-1774968666=:989"
Content-ID: <30461753-173c-77da-2e0b-da88dc409c74@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1757097082-1774968666=:989
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <b31f3b1b-a626-3120-9c4d-aef46b96459b@linux.intel.com>

On Tue, 31 Mar 2026, Thorsten Blum wrote:

> On Tue, Mar 31, 2026 at 03:46:11PM +0300, Ilpo J=E4rvinen wrote:
> > On Mon, 9 Mar 2026, Thorsten Blum wrote:
> > > In calculate_security_buffer(), call strlen() once and use ALIGN() to
> > > round up to an even size.
> > >=20
> > > In populate_security_buffer(), also avoid recomputing strlen(), renam=
e
> > > the u32 pointer from 'seclen' to 'seclenp' to avoid confusion with th=
e
> > > new length variable, and drop the memcpy() guard since calling it wit=
h
> > > size 0 is a no-op and therefore safe.
> > >=20
> > > Use 'const char *' for the read-only source string in both helpers.
> > >=20
> > > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> > > ---
> > >  .../dell/dell-wmi-sysman/dell-wmi-sysman.h    |  4 ++--
> > >  .../x86/dell/dell-wmi-sysman/sysman.c         | 20 ++++++++---------=
--
> > >  2 files changed, 10 insertions(+), 14 deletions(-)
> > >=20
> > > [...]
> >=20
> > Logicwise this change seem fine to me but I wonder why is buffer char *
> > (again, this is a pre-existing problem). It seems u8 * would be more=20
> > appropriate given how it's handled here as something else than characte=
rs.
>=20
> Yes, I agree. However, using u8 * would also require changing the call
> sites in biosattr-interface.c and passwordattr-interface.c. Happy to
> change it, but it would probably be better as a follow-up patch.

A follow-up patch is fine.

> > Also, you don't need resend if your patch is still listed in the=20
> > patchwork, it's not lost as long as it remains in patchwork and I'll=20
> > eventually get to it.
>=20
> I wasn't aware of the patchwork instance - is it this one?
>=20
> https://patchwork.kernel.org/project/platform-driver-x86/list/

Correct.

You can find that URL from MAINTAINERS.

> I see 67 patches in total, but this one is not part of the list, afaict.

It was there until today but I marked it changes required after noting it=
=20
lacks the header so I'm expecting a new version.

--=20
 i.
--8323328-1757097082-1774968666=:989--
