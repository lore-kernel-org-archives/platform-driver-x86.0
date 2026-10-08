Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D023A430CD8;
	Thu,  8 Oct 2026 11:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460030; cv=none; b=g2jkMOYQaBWCcDpRwGYLueJg81Myv4/MB9l3WtEG3sFLGkrOcFsv2I3Bv45l5uLX1rT67Fkgz/PVIL7bvvPbfW8BJOLafIFoDYvlqsXEH8bqByEHJ1itkSb5OMFY8wDJKMYpXwQ2ePUotUGJjEc3CjloQi78IbLRCHrs+XF/5n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460030; c=relaxed/simple;
	bh=f6NaVjYjEH7tntHky0OJUM7sFhrZNGVbAGXHqPFGfbg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NqDGgTVT1e8swsDskhB3I+KW7XwKkFAL9imudxdlhdKGi71Nq1e8/Z5tKRHjaCG3kFo5FKwCCVjAuhE1akvMQA7r5bwNdFQKuw5513aYFYLzbtLz69dhdpzS3gdAL8x2XRpGPp0YXS+DzbdYNxH+rfQpuklc/IwxTlZktIFZjyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WbW3cMZ6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WbW3cMZ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791460029; x=1822996029;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=f6NaVjYjEH7tntHky0OJUM7sFhrZNGVbAGXHqPFGfbg=;
  b=WbW3cMZ68XUbEyOSn4WinlCrmlcC3wS5tkIquqjlF/cqDMG5CFu9mjv0
   jelhY5pvaCWX6Cc+/I2OFLFgdSHKvfTNDCghxQj4zyVDTr/zTt+eDkuhn
   G7twWzRku2ak/aSNjJ0Sv5YIDKaDzKwOyGU681o0cFaO5hCo4/CDdQh2V
   rlOqmkdzdYWkn7ci65dq09uRs64q+b3qkZsocjRha2+G0qzUM+Uu230G4
   /+e4ChPmkrghm/WCz9qrW7ETr5x/rqpPelpeN/FIh92ak3h5c8OA750kn
   Ua2ZheAnWFvp079eAmB8YOZpPLTFK0886eANIaqsQzbsBS7ix+9GlBd4O
   Q==;
X-CSE-ConnectionGUID: JfO9V8O5SVecDumWBLjilQ==
X-CSE-MsgGUID: 2J5naLMFSR+dEiY/BjBW9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="251036"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="251036"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 04:47:08 -0700
X-CSE-ConnectionGUID: ooIp05pKQbSWWwLTVkwg3w==
X-CSE-MsgGUID: qmnMBNXPRk2Q+5z1FXathw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="473651"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.140])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 04:47:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 8 Oct 2026 14:47:01 +0300 (EEST)
To: Rong Zhang <i@rong.moe>
cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
    Hans de Goede <hansg@kernel.org>, Charles <hanker007@gmail.com>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, 
    Navon John Lukose <navonjohnlukose@gmail.com>
Subject: Re: [PATCH 0/9] platform/x86: lenovo-wmi-{other,capdata,helpers}:
 Improve robustness on buggy firmware
In-Reply-To: <372185f86fc1f5fbeddde42b1378a5d454f91e60.camel@rong.moe>
Message-ID: <65e44beb-740a-8d41-9e3e-2ef1fa6cd6f1@linux.intel.com>
References: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe>  <20260926210415.3465939-1-navonjohnlukose@gmail.com>  <E2EDCF4A-09BB-4FE7-9E67-5086401C0848@rong.moe>  <9789f452-d7eb-4f1e-8a13-7335332193a7@app.fastmail.com>  <55927121-62DB-43D7-B1BD-19519A775659@rong.moe>
  <83776200-4A60-4756-A99F-D5A3BB4D834A@rong.moe>  <584854BC-16C5-44A1-83D1-63F6FDD51BEF@gmail.com>  <8e0f9c12-2e6a-089b-387e-25fbdc3dd5d8@linux.intel.com> <372185f86fc1f5fbeddde42b1378a5d454f91e60.camel@rong.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1185811386-1791460021=:1159"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1185811386-1791460021=:1159
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 8 Oct 2026, Rong Zhang wrote:

> Hi Ilpo,
>=20
> On Wed, 2026-10-07 at 23:54 +0300, Ilpo J=C3=A4rvinen wrote:
> > On Wed, 7 Oct 2026, Derek J. Clark wrote:
> >=20
> > > On October 7, 2026 11:30:00 AM PDT, Rong Zhang <i@rong.moe> wrote:
> > > > Hi Mark, Armin,
> > > >=20
> > > > =E4=BA=8E 2026=E5=B9=B49=E6=9C=8829=E6=97=A5 GMT+08:00 01:53:18=EF=
=BC=8CRong Zhang <i@rong.moe> =E5=86=99=E9=81=93=EF=BC=9A
> > > > > Hi Mark,=20
> > > > >=20
> > > > > Thanks for the information.=20
> > > > >=20
> > > > > =E4=BA=8E 2026=E5=B9=B49=E6=9C=8829=E6=97=A5 GMT+08:00 00:04:14=
=EF=BC=8CMark Pearson <mpearson-lenovo@squebb.ca> =E5=86=99=E9=81=93=EF=BC=
=9A
> > > > > >=20
> > > > > >=20
> > > > > > On Sat, Sep 26, 2026, at 11:01 PM, Rong Zhang wrote:
> > > > > > > Hi Navon,
> > > > > > >=20
> > > > > > > Thanks a lot for your test.=20
> > > > > > >=20
> > > > > > >=20
> > > > > > > =E4=BA=8E 2026=E5=B9=B49=E6=9C=8827=E6=97=A5 GMT+08:00 05:04:=
15=EF=BC=8CNavon John Lukose=20
> > > > > > > <navonjohnlukose@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
> > > > > > > > Tested on a Yoga Pro 7 14IAH10 (83KF, BIOS QGCN35WW). Neith=
er mainline
> > > > > > > > nor the series binds here. This firmware has no
> > > > > > > > LENOVO_CAPABILITY_DATA_01 in _WDG at all, so no component e=
ver
> > > > > > > > registers for that match and lwmi_om_master_bind() never ru=
ns. Skipping
> > > > > > > > the match for GUIDs the firmware doesn't declare fixes it:
> > > > > > > >=20
> > > > > > > > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/dr=
ivers/platform/x86/lenovo/wmi-capdata.c
> > > > > > > > index 805e36ef7..d64520be1 100644
> > > > > > > > --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> > > > > > > > +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> > > > > > > > @@ -76,11 +76,13 @@ enum lwmi_cd_type {
> > > > > > > >  #define LWMI_CD_TABLE_ITEM(_type)=09=09\
> > > > > > > >  =09[_type] =3D {=09=09=09=09\
> > > > > > > >  =09=09.name =3D #_type,=09=09=09\
> > > > > > > > +=09=09.guid =3D _type##_GUID,=09=09\
> > > > > > > >  =09=09.type =3D _type,=09=09=09\
> > > > > > > >  =09}
> > > > > > > > =20
> > > > > > > >  static const struct lwmi_cd_info {
> > > > > > > >  =09const char *name;
> > > > > > > > +=09const char *guid;
> > > > > > > >  =09enum lwmi_cd_type type;
> > > > > > > >  } lwmi_cd_table[] =3D {
> > > > > > > >  =09LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
> > > > > > > > @@ -166,6 +168,14 @@ void lwmi_cd_match_add_all(struct devi=
ce *master, struct component_match **match
> > > > > > > >  =09=09if (lwmi_cd_table[i].type =3D=3D LENOVO_FAN_TEST_DAT=
A)
> > > > > > > >  =09=09=09continue;
> > > > > > > > =20
> > > > > > > > +=09=09/*
> > > > > > > > +=09=09 * Some firmware does not declare every capdata GUID=
 at all, in
> > > > > > > > +=09=09 * which case no component would ever register for i=
t and the
> > > > > > > > +=09=09 * master could never bind.
> > > > > > > > +=09=09 */
> > > > > > > > +=09=09if (!wmi_has_guid(lwmi_cd_table[i].guid))
> > > > > > > > +=09=09=09continue;
> > > > > > >=20
> > > > > > > This was exactly what I did in the earlier revision while I w=
as=20
> > > > > > > introducing the support for capdata00 and capdata_fan.
> > > > > > >=20
> > > > > > > The wmi_has_guid() approach was eventually replaced by the=20
> > > > > > > sub-component approach, because the use of the former is stro=
ngly=20
> > > > > > > discouraged.
> > > > > > >=20
> > > > > > > In the next revision I am going to convert capdata01 into a=
=20
> > > > > > > sub-component, too. In this manner some heavy and complex wor=
k in the=20
> > > > > > > series will become needless and can be simplified. While the=
=20
> > > > > > > sub-component approach itself is complex, we've had the infra=
structure=20
> > > > > > > to make it work. Therefore wiring it up should be a trivial w=
ork.
> > > > > > >=20
> > > > > > > Mark, Derek,
> > > > > > >=20
> > > > > > > Do you know if there is any way to determine the existence of=
 capdata01=20
> > > > > > > using capdata00?=20
> > > > > > >=20
> > > > > > Note that I can see I'm afraid
> > > >=20
> > > > So there is no way to determine the existence of capdata01 using ca=
pdata00, correct?
> > > >=20
> > > > > >=20
> > > > > > I'm guessing the patch Armin posted on my thread "[RFC PATCH 5/=
7] platform/x86: think-lmi: Initial ThinkLMI v2 driver" to check if it exis=
ts won't help here?
> > > > >=20
> > > > > After some consideration, it seems that we don't really need to d=
etermine the existence of capdata01 if we take the sub-component approach, =
thanks to the fact that every functionality either depends on capdata00 or =
depends on capdata01, but never both.
> > > >=20
> > > > Unfortunately, it turned out that it can't resolve the issue by sim=
ply converting capdata01 into a sub-component, unless a virtual device is a=
lso created to split the component matching list into two, which is more li=
ke a dirty workaround.
> > > >=20
> > > > So yeah, the series needs the wmidev_exists() patch from Armin.=20
> > > > Considering that the ThinkLMI v2 series is probably still at the RF=
C=20
> > > > stage, do you mind if I integrate the wmidev_exists() patch into my=
=20
> > > > series?=20
> > >=20
> > > Rong/Mark,
> > >=20
> > > My $0.02, I don't think it matters who sends it up. If Ilpo is okay w=
ith=20
> > > it of course, both series should include it as a prerequisite 1/X and=
=20
> > > whichever gets picked up first will get into next. Then that patch ca=
n=20
> > > be omitted from the other series when it gets picked. That way both=
=20
> > > series will build if you apply the mbox onto next until one is merged=
=2E
> >=20
> > Hi,
> >=20
> > For me it's fine either way:
> >=20
> > 1) Have the same patch in both series.
> >=20
> > 2) If we know for sure we need the API anyway, just add it as a standal=
one=20
> > in advance.
> >=20
> > I suppose 2 would be slightly simpler but it's up to you which way you=
=20
> > prefer.
> >=20
> > Lets not make things more complicated than they have to be. :-)
>=20
> Thanks for you suggestion.
>=20
> The v2 patch is almost ready, and I will submit it today or tomorrow. It
> will anyway depend on the wmidev_exists() patch to build, so I'd prefer
> 1.
>=20
> Or we can combine 1 and 2 -- do a subset apply with the wmidev_exists()
> patch if it looks good but my v2 series has issues. Then Mark and I can
> rebase and resubmit.

I've no problem in taking only a part of series as needed, if you prefer=20
that.

Armin had something to say about the interface but I suppose you saw that=
=20
already.

--=20
 i.

--8323328-1185811386-1791460021=:1159--
