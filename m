Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFEDFBF0
	for <platform-driver-x86@vger.kernel.org>; Sat, 31 May 2025 05:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748668717; cv=none; b=ql5bB5VDK6y55AyYuKUZvolULHtNN5KQkYzvuEsc6i/7MCUOFyDpj+q1Jx4th6ejAlliQIRRzZa59Qjxh0Zps3sgLj9AXAHs36nYfXHSca+yD64on/IduYU3eRfECLgdIs4tTwq2oUg2IhurW9py70S+7H6SzQX+n4iv7hjcP7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748668717; c=relaxed/simple;
	bh=k6lp8PGJmQYXrLuz9iSc6mMdKyyw5XtLUBtHYzih1lk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UKxuRZvr3EyqEDEV2xRArJy6ItMmTfiesJdVHJPofJBzmjzRe33Ybq6YvamCeHH5DkFQZizGtHaet4U9w0FYYy5iww+CPIDta0ppLrU2x+TZEMI9Gk4rw6s9pzGP1tpStLQ+Tur800eBgV5rqZzWH1ZCMe11HNk/7lC+5+7JhuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BTPcZS4n; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BTPcZS4n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748668716; x=1780204716;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=k6lp8PGJmQYXrLuz9iSc6mMdKyyw5XtLUBtHYzih1lk=;
  b=BTPcZS4nc6lhVS+ILNwWBA7Vi9e+66ke9d023fNtR0pPmqbcmoII3mIN
   U1hQ/Izm1U/vEO5PXBjXVLN0DD+3ivZBc2IjnDDzFGTi9MhTbCNqoUyRn
   G+s71dHxe+pOqahGndNYcVQLrT6fq7dcsjqRbpFG/l0J+/YNT7smIbAli
   7g68m/bfdAdf8ZWaSod71gq/JiIzZN3EwZaTa35hLrSwunMLu44jYcmyz
   y20H3i+cB9bK/Kb863A+/rzY69MRA6+XVOCYhT7RfuAheIOSDZtztJWIU
   C3mrmG3a9YxVB7hAEKeajXsobWai2LisotVUkYt6uYtALeKkGgOBC5LiX
   A==;
X-CSE-ConnectionGUID: moWz/Z70RFGGiUdXs2LOQw==
X-CSE-MsgGUID: G9Wg79fBRAasIDRL4FQDEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="68310951"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="68310951"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 22:18:35 -0700
X-CSE-ConnectionGUID: 8CjfYzNMRBygC0ERqZSSlA==
X-CSE-MsgGUID: jC54h+QLSjWxU/1lW4KUtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="144706188"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 22:18:33 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sat, 31 May 2025 08:18:29 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hdegoede@redhat.com>, lucas.demarchi@intel.com, 
    rodrigo.vivi@intel.com
Subject: Re: [PATCH 01/10] drm/xe: Correct BMG VSEC header sizing
In-Reply-To: <72b57d0f-c4e6-3515-bd46-062f159c4456@linux.intel.com>
Message-ID: <34d09d49-6ce1-9f54-8ecb-61a0ba1400c6@linux.intel.com>
References: <20250530203356.190234-1-michael.j.ruhl@intel.com> <72b57d0f-c4e6-3515-bd46-062f159c4456@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1355139707-1748668709=:937"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1355139707-1748668709=:937
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 31 May 2025, Ilpo J=E4rvinen wrote:

> On Fri, 30 May 2025, Michael J. Ruhl wrote:
>=20
> > The intel_vsec_header information for the crashlog feature
> > is incorrect.
> >
> > Update the VSEC header with correct sizing and count.
>=20
> Does this warrant a Fixes tag?
> =20
> > Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vsec.c | 20 +++++---------------
> >  1 file changed, 5 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.=
c
> > index 3e573b0b7ebd..67238fc57a4d 100644
> > --- a/drivers/gpu/drm/xe/xe_vsec.c
> > +++ b/drivers/gpu/drm/xe/xe_vsec.c
> > @@ -32,28 +32,18 @@ static struct intel_vsec_header bmg_telemetry =3D {
> >  =09.offset =3D BMG_DISCOVERY_OFFSET,
> >  };
> > =20
> > -static struct intel_vsec_header bmg_punit_crashlog =3D {
> > -=09.length =3D 0x10,
> > +static struct intel_vsec_header bmg_crashlog =3D {
> > +=09.length =3D 0x18,
> >  =09.id =3D VSEC_ID_CRASHLOG,
> > -=09.num_entries =3D 1,
> > -=09.entry_size =3D 4,
> > +=09.num_entries =3D 2,
> > +=09.entry_size =3D 6,
> >  =09.tbir =3D 0,
> >  =09.offset =3D BMG_DISCOVERY_OFFSET + 0x60,
> >  };
> > =20
> > -static struct intel_vsec_header bmg_oobmsm_crashlog =3D {
> > -=09.length =3D 0x10,
> > -=09.id =3D VSEC_ID_CRASHLOG,
> > -=09.num_entries =3D 1,
> > -=09.entry_size =3D 4,
> > -=09.tbir =3D 0,
> > -=09.offset =3D BMG_DISCOVERY_OFFSET + 0x78,
> > -};
> > -
> >  static struct intel_vsec_header *bmg_capabilities[] =3D {
> >  =09&bmg_telemetry,
> > -=09&bmg_punit_crashlog,
> > -=09&bmg_oobmsm_crashlog,
> > +=09&bmg_crashlog,
>=20
> Eh, this change goes way beyond what you said in the changelog, was that=
=20
> intentional? If yes, please describe and justify all the changes (and=20
> consider if some of them belong to a separate patch as it sounds like=20
> there are two or more changes mixed up into this patch).

In addition, please send the next version to all relevant parties as=20
indicated by the get_maintainers.pl script.

--=20
 i.

--8323328-1355139707-1748668709=:937--
