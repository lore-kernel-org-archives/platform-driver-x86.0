Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9B93E49C0;
	Wed,  7 Oct 2026 20:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791406471; cv=none; b=X902DbAdSrAbDE6oydpq52Mcw/k5fNVrvhBWnMGqSES+mfpaQr75XYemYm2cjZ77oRcvMNlu9kKjHojaOwwfr02HClU8Vim7VC2yMgxnZw67qVQCczOxFJiFAEr01PmwfzQBxvNZTK06OeaB9YdcAlELSXyd2Rs+lTvvN6EQgog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791406471; c=relaxed/simple;
	bh=vhmbggM20ZrpMRpGErdq4mXov8XVeqMajknL9LBKLXs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KXE228w70+L+AEVlRDewvqGmqwYHMBLo3dw4Lrr+6iNPbtMY8GVg3kATRVCV+p3TCmEalxAua5hlbGzmdgq4k6QMRF6pabMZzKF2aREho6wMK4rbfc4lXD4uJup/NTY9FXTrkhyGdVQfUK06aps6FcA7t0WW4EbYevZhSHQ9UbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WWrvSGMG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WWrvSGMG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791406470; x=1822942470;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=vhmbggM20ZrpMRpGErdq4mXov8XVeqMajknL9LBKLXs=;
  b=WWrvSGMGVmolgxzcxLIkDeD027SjLiuJj5j7qMBQvgETjv8nQgBd2Gx9
   rqCUd5kWS4DHcu0+L/wHATDpoCEeDnnxUS8dz8n1Rspaq5eU8ZyaO7SWw
   qOHbLhlAmOMAzCLb1JYxHpfC0aAPl1lyluIRr7rj3w0w6EZaZyYWGF1Qp
   EG+EGFIaNfBz07S4hCxgY/hJmELI88p9bTd+cuL+6r2HTtaH3SOGI2O3h
   UhhAqK72Ihjj4Fw7KJ6uAYikanrg11JucdLMT46PjEn3p/XaOwJAeXDb4
   jWj+NiIgR9a4XtioQc1/M5GC4+v9TZYYfODJqvzkm3Ihdosa1KZXkuxvf
   g==;
X-CSE-ConnectionGUID: CuT6LX3yRpWiM3QA6/HgOQ==
X-CSE-MsgGUID: sEex1kJISz2iD3qQzMbRZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="177311"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="177311"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 13:54:29 -0700
X-CSE-ConnectionGUID: kRYfZuzeSVeNMg3oYs4G7Q==
X-CSE-MsgGUID: iK2EQFEOQaOJNLGQ4YpLgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="303808639"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.38])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 13:54:25 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 7 Oct 2026 23:54:22 +0300 (EEST)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
    Charles <hanker007@gmail.com>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, 
    Navon John Lukose <navonjohnlukose@gmail.com>
Subject: Re: [PATCH 0/9] platform/x86: lenovo-wmi-{other,capdata,helpers}:
 Improve robustness on buggy firmware
In-Reply-To: <584854BC-16C5-44A1-83D1-63F6FDD51BEF@gmail.com>
Message-ID: <8e0f9c12-2e6a-089b-387e-25fbdc3dd5d8@linux.intel.com>
References: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe> <20260926210415.3465939-1-navonjohnlukose@gmail.com> <E2EDCF4A-09BB-4FE7-9E67-5086401C0848@rong.moe> <9789f452-d7eb-4f1e-8a13-7335332193a7@app.fastmail.com> <55927121-62DB-43D7-B1BD-19519A775659@rong.moe>
 <83776200-4A60-4756-A99F-D5A3BB4D834A@rong.moe> <584854BC-16C5-44A1-83D1-63F6FDD51BEF@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2111293454-1791406462=:1171"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2111293454-1791406462=:1171
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 7 Oct 2026, Derek J. Clark wrote:

> On October 7, 2026 11:30:00 AM PDT, Rong Zhang <i@rong.moe> wrote:
> >Hi Mark, Armin,
> >
> >=E4=BA=8E 2026=E5=B9=B49=E6=9C=8829=E6=97=A5 GMT+08:00 01:53:18=EF=BC=8C=
Rong Zhang <i@rong.moe> =E5=86=99=E9=81=93=EF=BC=9A
> >> Hi Mark,=20
> >>=20
> >> Thanks for the information.=20
> >>=20
> >> =E4=BA=8E 2026=E5=B9=B49=E6=9C=8829=E6=97=A5 GMT+08:00 00:04:14=EF=BC=
=8CMark Pearson <mpearson-lenovo@squebb.ca> =E5=86=99=E9=81=93=EF=BC=9A
> >> >=20
> >> >=20
> >> > On Sat, Sep 26, 2026, at 11:01 PM, Rong Zhang wrote:
> >> > > Hi Navon,
> >> > >
> >> > > Thanks a lot for your test.=20
> >> > >
> >> > >
> >> > > =E4=BA=8E 2026=E5=B9=B49=E6=9C=8827=E6=97=A5 GMT+08:00 05:04:15=EF=
=BC=8CNavon John Lukose=20
> >> > > <navonjohnlukose@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
> >> > >> Tested on a Yoga Pro 7 14IAH10 (83KF, BIOS QGCN35WW). Neither mai=
nline
> >> > >> nor the series binds here. This firmware has no
> >> > >> LENOVO_CAPABILITY_DATA_01 in _WDG at all, so no component ever
> >> > >> registers for that match and lwmi_om_master_bind() never runs. Sk=
ipping
> >> > >> the match for GUIDs the firmware doesn't declare fixes it:
> >> > >>=20
> >> > >> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/=
platform/x86/lenovo/wmi-capdata.c
> >> > >> index 805e36ef7..d64520be1 100644
> >> > >> --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> >> > >> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> >> > >> @@ -76,11 +76,13 @@ enum lwmi_cd_type {
> >> > >>  #define LWMI_CD_TABLE_ITEM(_type)=09=09\
> >> > >>  =09[_type] =3D {=09=09=09=09\
> >> > >>  =09=09.name =3D #_type,=09=09=09\
> >> > >> +=09=09.guid =3D _type##_GUID,=09=09\
> >> > >>  =09=09.type =3D _type,=09=09=09\
> >> > >>  =09}
> >> > >> =20
> >> > >>  static const struct lwmi_cd_info {
> >> > >>  =09const char *name;
> >> > >> +=09const char *guid;
> >> > >>  =09enum lwmi_cd_type type;
> >> > >>  } lwmi_cd_table[] =3D {
> >> > >>  =09LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
> >> > >> @@ -166,6 +168,14 @@ void lwmi_cd_match_add_all(struct device *ma=
ster, struct component_match **match
> >> > >>  =09=09if (lwmi_cd_table[i].type =3D=3D LENOVO_FAN_TEST_DATA)
> >> > >>  =09=09=09continue;
> >> > >> =20
> >> > >> +=09=09/*
> >> > >> +=09=09 * Some firmware does not declare every capdata GUID at al=
l, in
> >> > >> +=09=09 * which case no component would ever register for it and =
the
> >> > >> +=09=09 * master could never bind.
> >> > >> +=09=09 */
> >> > >> +=09=09if (!wmi_has_guid(lwmi_cd_table[i].guid))
> >> > >> +=09=09=09continue;
> >> > >
> >> > > This was exactly what I did in the earlier revision while I was=20
> >> > > introducing the support for capdata00 and capdata_fan.
> >> > >
> >> > > The wmi_has_guid() approach was eventually replaced by the=20
> >> > > sub-component approach, because the use of the former is strongly=
=20
> >> > > discouraged.
> >> > >
> >> > > In the next revision I am going to convert capdata01 into a=20
> >> > > sub-component, too. In this manner some heavy and complex work in =
the=20
> >> > > series will become needless and can be simplified. While the=20
> >> > > sub-component approach itself is complex, we've had the infrastruc=
ture=20
> >> > > to make it work. Therefore wiring it up should be a trivial work.
> >> > >
> >> > > Mark, Derek,
> >> > >
> >> > > Do you know if there is any way to determine the existence of capd=
ata01=20
> >> > > using capdata00?=20
> >> > >
> >> > Note that I can see I'm afraid
> >
> >So there is no way to determine the existence of capdata01 using capdata=
00, correct?
> >
> >> >=20
> >> > I'm guessing the patch Armin posted on my thread "[RFC PATCH 5/7] pl=
atform/x86: think-lmi: Initial ThinkLMI v2 driver" to check if it exists wo=
n't help here?
> >>=20
> >> After some consideration, it seems that we don't really need to determ=
ine the existence of capdata01 if we take the sub-component approach, thank=
s to the fact that every functionality either depends on capdata00 or depen=
ds on capdata01, but never both.
> >
> >Unfortunately, it turned out that it can't resolve the issue by simply c=
onverting capdata01 into a sub-component, unless a virtual device is also c=
reated to split the component matching list into two, which is more like a =
dirty workaround.
> >
> >So yeah, the series needs the wmidev_exists() patch from Armin.=20
> > Considering that the ThinkLMI v2 series is probably still at the RFC=20
> >stage, do you mind if I integrate the wmidev_exists() patch into my=20
> > series?=20
>=20
> Rong/Mark,
>=20
> My $0.02, I don't think it matters who sends it up. If Ilpo is okay with=
=20
> it of course, both series should include it as a prerequisite 1/X and=20
> whichever gets picked up first will get into next. Then that patch can=20
> be omitted from the other series when it gets picked. That way both=20
> series will build if you apply the mbox onto next until one is merged.

Hi,

For me it's fine either way:

1) Have the same patch in both series.

2) If we know for sure we need the API anyway, just add it as a standalone=
=20
in advance.

I suppose 2 would be slightly simpler but it's up to you which way you=20
prefer.

Lets not make things more complicated than they have to be. :-)

--=20
 i.

--8323328-2111293454-1791406462=:1171--
