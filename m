Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FC1395ACE
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 18:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787769054; cv=none; b=VfCtPsjWUS0rSvNeCPQqmiXS4gK5168WR8pSYreli1LyO9EEkq/O03NSEaTwHFMDA7bG3nsKlYpjQX+wii5CYPALErjICZrZvZdwfxFoZG7jvAZ20r0Yw1p18Oom1W0zKIKTQk3thz/lGsp+yOzo5qOS7hiS3ziS6vOp5fLke4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787769054; c=relaxed/simple;
	bh=gL6jEvgRMM4mFI7TsMKvNFZQN24/j1daPD+LGgOZw7k=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XouUXNGXuSV3XOs5L5iZpHDf2VANHxWKMAJmpuIIXy8sSX3PW0eGx1iYJUw9mkG6FMkdZEL2azxGCcxaV5qC972ZzbZiQAH5XTh03Ww8DOobeU5/fSdECoAGjfMuR0XVT7QX3KODtwZ+h0JpJiIy8U3zapJ2e1iml7Z3qDjhyuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hYd0Cw4m; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hYd0Cw4m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787769045; x=1819305045;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=gL6jEvgRMM4mFI7TsMKvNFZQN24/j1daPD+LGgOZw7k=;
  b=hYd0Cw4m/J6CNgJpFrVkMgOgMQFvwzgzpMbu4GcWcT7zJb4sl8iUBv/k
   wYGMmZTRcFCz3gN9wk6JIQDjmSaMjILzQL/B/jJMA5dw6kyJveCamOjKL
   xq1MF5smhX4VE2BK7UW9/U1YilwPMsGioWA3yO6Fx0NVxByBdegJoLIP8
   gZtIeaHxIiad/scvVBDN1FcWHykSso+LxRpd5Lz+UFy61OfFGGhZC/hHr
   zGaVyzmmRkwtiy4mURZF+m2ajnu4NAcQnYvfwDhUGLjSOEjgxmgRSkW4g
   WUrbynln8YZifSywbnuPF0xuebMzvpnRFFyqe9pbtcELdaeKkeHlrwdBf
   w==;
X-CSE-ConnectionGUID: QIJhy7+6RFGAyBpRY6/82w==
X-CSE-MsgGUID: VHxprEn3T/iypzMSTW63Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88288616"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="88288616"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 11:30:31 -0700
X-CSE-ConnectionGUID: 8BVkoX+nTkad+qc6pNkd0Q==
X-CSE-MsgGUID: w8+Y4yFDQMGv+i/AYQ0wkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="268223637"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.247])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 11:30:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 26 Aug 2026 21:30:24 +0300 (EEST)
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
    Hans de Goede <hansg@kernel.org>, 
    "Brost, Matthew" <matthew.brost@intel.com>, 
    "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
    "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>, 
    "airlied@gmail.com" <airlied@gmail.com>, 
    "simona@ffwll.ch" <simona@ffwll.ch>, 
    "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>, 
    "Vijay, Anoop C" <anoop.c.vijay@intel.com>, 
    "Nilawar, Badal" <badal.nilawar@intel.com>, 
    "Roper, Matthew D" <matthew.d.roper@intel.com>, 
    "Ausmus, James" <james.ausmus@intel.com>, 
    "Poosa, Karthik" <karthik.poosa@intel.com>
Subject: RE: [PATCH v3 02/10] platform/x86/intel/pmt: Add register access
 callbacks
In-Reply-To: <CH3PR11MB04614971FF5B6E71CC17E77AE3C1AE2@CH3PR11MB046149.namprd11.prod.outlook.com>
Message-ID: <e76729c8-6e54-6c97-756a-d14bef40ae0a@linux.intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com> <20260824162317.2450380-14-michael.j.ruhl@intel.com> <d86e5e19-e6fe-468f-1a9e-cf51c0b2da2f@linux.intel.com>
 <CH3PR11MB04614971FF5B6E71CC17E77AE3C1AE2@CH3PR11MB046149.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-175742419-1787769024=:1168"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-175742419-1787769024=:1168
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 26 Aug 2026, Ruhl, Michael J wrote:

> >-----Original Message-----
> >From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> >Sent: Tuesday, August 25, 2026 5:35 AM
> >To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> >Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org;=
 Hans
> >de Goede <hansg@kernel.org>; Brost, Matthew <matthew.brost@intel.com>;
> >Vivi, Rodrigo <rodrigo.vivi@intel.com>; thomas.hellstrom@linux.intel.com=
;
> >airlied@gmail.com; simona@ffwll.ch; david.e.box@linux.intel.com; Vijay,
> >Anoop C <anoop.c.vijay@intel.com>; Nilawar, Badal
> ><badal.nilawar@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>;
> >Ausmus, James <james.ausmus@intel.com>; Poosa, Karthik
> ><karthik.poosa@intel.com>
> >Subject: Re: [PATCH v3 02/10] platform/x86/intel/pmt: Add register acces=
s
> >callbacks
> >
> >On Mon, 24 Aug 2026, Michael J. Ruhl wrote:
> >
> >> Some HW does not have direct MMIO access to PMT control and data
> >> features.
> >>
> >> Augment the current callback infrastructure (data access) to allow
> >> a registered driver to customize read/write access to the control
> >> paths for PMT usage.
> >>
> >> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> >> ---
> >>  drivers/platform/x86/intel/pmt/crashlog.c | 39 +++++++++++++++++++++-
> >-
> >>  include/linux/intel_vsec.h                | 14 +++++++-
> >>  2 files changed, 49 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
> >b/drivers/platform/x86/intel/pmt/crashlog.c
> >> index f936daf99e4d..5923ad7abbd9 100644
> >> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> >> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> >> @@ -129,7 +129,19 @@ static void pmt_crashlog_rmw(struct
> >crashlog_entry *crashlog, u32 bit, bool set)
> >>  {
> >>  =09const struct crashlog_control *control =3D &crashlog->info->contro=
l;
> >>  =09struct intel_pmt_entry *entry =3D &crashlog->entry;
> >> -=09u32 reg =3D readl(entry->disc_table + control->offset);
> >> +=09u32 guid =3D entry->header.guid;
> >> +=09u32 reg;
> >> +=09int err;
> >> +
> >> +=09if (entry->cb && entry->cb->read_reg) {
> >> +=09=09err =3D entry->cb->read_reg(entry->dev, guid, &reg, control-
> >>offset);
> >> +=09=09if (err) {
> >> +=09=09=09pr_err("%s: failed to read reg: %d\n", __func__, err);
> >
> >Never print __func__ in any user consumable message (level > debug) but
> >write the message in plain English.
> >
> >Also, this needs include.
> >
> >> +=09=09=09return;
> >> +=09=09}
> >> +=09} else {
> >> +=09=09reg =3D readl(entry->disc_table + control->offset);
> >
> >Add include.
>=20
> I have added the linux/printk.h include... I am not clear on the correct =
readl inclued.
>=20
> Should this be <linux/io.h> or <include/asm-generic/io.h>?

Usually it's better to use linux/ one, except in headers that are used=20
in many .c files where it may be helpful to use as precise include as=20
possible to limit the number of things one include ends up pulling in.

> >> +=09}
> >>
> >>  =09reg &=3D ~control->trigger_mask;
> >>
> >> @@ -138,14 +150,35 @@ static void pmt_crashlog_rmw(struct
> >crashlog_entry *crashlog, u32 bit, bool set)
> >>  =09else
> >>  =09=09reg &=3D ~bit;
> >>
> >> -=09writel(reg, entry->disc_table + control->offset);
> >> +=09if (entry->cb && entry->cb->write_reg) {
> >> +=09=09err =3D entry->cb->write_reg(entry->dev, guid, reg, control-
> >>offset);
> >> +=09=09if (err) {
> >> +=09=09=09pr_err("%s: failed to write reg: %d\n", __func__, err);
> >
> >Rephrase without using __func__.
>=20
> This was for my internal debugging and should have been cleaned up.  Remo=
ved.
>=20
> >> +=09=09=09return;
> >> +=09=09}
> >> +=09} else {
> >> +=09=09writel(reg, entry->disc_table + control->offset);
> >> +=09}
> >>  }
> >>
> >>  /* Read the status register and see if the specified @bit is set */
> >>  static bool pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit)
> >>  {
> >>  =09const struct crashlog_status *status =3D &crashlog->info->status;
> >> -=09u32 reg =3D readl(crashlog->entry.disc_table + status->offset);
> >> +=09struct intel_pmt_entry *entry =3D &crashlog->entry;
> >> +=09u32 guid =3D entry->header.guid;
> >> +=09u32 reg;
> >> +=09int err;
> >> +
> >> +=09if (entry->cb && entry->cb->read_reg) {
> >> +=09=09err =3D entry->cb->read_reg(entry->dev, guid, &reg, status-
> >>offset);
> >> +=09=09if (err) {
> >> +=09=09=09pr_err("%s: failed to read reg: %d\n", __func__, err);
> >> +=09=09=09return false;
> >
> >It seems you need a lerger rework here to properly return error codes.
>=20
> Yes, there would be a significant rework (almost all internal functions=
=20
> will need to be updated) to return the error codes.  This seems out of=20
> scope for these updates.

Your series adds a call that can fail (before there wasn't one) so it=20
should be part of this effort. bool -> int conversion should be mostly=20
simple (though admittedly a bit tedious) as it mainly just adds the=20
error handling ifs to the callchains.

> Does this need to be addressed to make progress on this patch set?  Or ca=
n we work on that
> in the future?

I think it should be part of this effort because of the forementioned=20
reason.


--=20
 i.

--8323328-175742419-1787769024=:1168--
