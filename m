Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD76E3914ED;
	Thu,  8 Oct 2026 11:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791459801; cv=pass; b=DV+e0bCDDytZDw8FPCkvteuMKGaWRSJasLUKoZrlrs1N7Z4lWN9kAYQUXrDOwk1W7O8zJWs0XVt+fjjQ7A8e3hd1z/XGvziPo+DyxVaRaEEvlS/4cZLDqKGrAikAz2OsTfkdrCSc6YQRtGQ+/4EPz5cGHO4MvbCv21OgJFg/Wqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791459801; c=relaxed/simple;
	bh=ERZG1vpdw6q+z+MVI86BAgEgcXXDkEl/RKEh86N0j1I=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=c4aK+66kJ96InhmOYPJOeJw2fDx0klVl2vbn/OoaAkyeLdeej1WT4zHVlJY2dGfg4TG+bYd1fDEblujrh8cZLnmv4By9Gd08Oi5MhrmgUW8ds9svEZs6PolY3TQqVDbPPZLWfuFzgz/sJHmk46BCuu2zTXFcF1SbX/39hNOEeCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=e1Xg7Qnh; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="e1Xg7Qnh"
ARC-Seal: i=1; a=rsa-sha256; t=1791459791; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Lc5U79v+yCRZhflK/eNvsKmDckRvyVqPYfFJHdvx9yX0NYo4acpzzXl9P6nGY9cZ299vmY3mt/STNUp4OvjqTI3EU5wx/vCBeCTVeXYZgTfncd1aP+KATrR4PJl3aruPH9HNVkVQJ4H7amWsvrY5BWFwOrd5zNNJw/5nkv7F3Cc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791459791; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zbxGQYvXyqn9eHvkPj2tOHAm7mRAI9y12+rpy+Bt0rI=; 
	b=gxPSm5C2WLVbRE/Lb6+lWIlVngmBVN5WQ9YuiLn436e+6anwRClKtCJAKm2nR57JYF1lSA8xhtzolynDpj1Z1R6yWqaHIHdsXwGM98MFWgGZcmiE37gTgXoaNRakAcVIEb8UmqB/jUwCsTZ4Ov9g9ICMUfqkQRVTf65aHQc2tCE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791459791;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=zbxGQYvXyqn9eHvkPj2tOHAm7mRAI9y12+rpy+Bt0rI=;
	b=e1Xg7QnhA4QNf+5JFTUMVisGhCYDuy7jYwmUNjcnCgOqx4z+Yl1qlxFPDQOFrvoY
	LFaCJgeiljWHsDdQw029WvkVfQfMi2tBDSjZHlFokvXRBHahCvMVjiGWfJNKVU8NqoB
	XDuDr8qYgp5cKVkr6uzzEd0L2IQOQJkn5M1VatTjqcPBaQGveUaYiWYKQkRlQg86huc
	IWVN1m8O0cto1Y1i1Pk4sHSWxqvcQzKJigzlsDYU8fUeDA4Irz0cjIwbaAE4RK4yixd
	9Bm3o1iKb11GFkHpZDn93FLjWmzhHRhUG9Rg0nittdkxkYi2L05iofYNF+zIkov2XAl
	Sd3ri0nOcA==
Received: by smtp.zohomail.com with SMTPS id 179145978997674.77383831735176;
	Thu, 8 Oct 2026 04:43:09 -0700 (PDT)
Message-ID: <372185f86fc1f5fbeddde42b1378a5d454f91e60.camel@rong.moe>
Subject: Re: [PATCH 0/9] platform/x86: lenovo-wmi-{other,capdata,helpers}:
 Improve robustness on buggy firmware
From: Rong Zhang <i@rong.moe>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Hans de Goede <hansg@kernel.org>, Charles <hanker007@gmail.com>,
 "platform-driver-x86@vger.kernel.org"	
 <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
  Navon John Lukose <navonjohnlukose@gmail.com>
In-Reply-To: <8e0f9c12-2e6a-089b-387e-25fbdc3dd5d8@linux.intel.com>
References: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe>
	 <20260926210415.3465939-1-navonjohnlukose@gmail.com>
	 <E2EDCF4A-09BB-4FE7-9E67-5086401C0848@rong.moe>
	 <9789f452-d7eb-4f1e-8a13-7335332193a7@app.fastmail.com>
	 <55927121-62DB-43D7-B1BD-19519A775659@rong.moe>
	 <83776200-4A60-4756-A99F-D5A3BB4D834A@rong.moe>
	 <584854BC-16C5-44A1-83D1-63F6FDD51BEF@gmail.com>
	 <8e0f9c12-2e6a-089b-387e-25fbdc3dd5d8@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 19:38:04 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Ilpo,

On Wed, 2026-10-07 at 23:54 +0300, Ilpo J=C3=A4rvinen wrote:
> On Wed, 7 Oct 2026, Derek J. Clark wrote:
>=20
> > On October 7, 2026 11:30:00 AM PDT, Rong Zhang <i@rong.moe> wrote:
> > > Hi Mark, Armin,
> > >=20
> > > =E4=BA=8E 2026=E5=B9=B49=E6=9C=8829=E6=97=A5 GMT+08:00 01:53:18=EF=BC=
=8CRong Zhang <i@rong.moe> =E5=86=99=E9=81=93=EF=BC=9A
> > > > Hi Mark,=20
> > > >=20
> > > > Thanks for the information.=20
> > > >=20
> > > > =E4=BA=8E 2026=E5=B9=B49=E6=9C=8829=E6=97=A5 GMT+08:00 00:04:14=EF=
=BC=8CMark Pearson <mpearson-lenovo@squebb.ca> =E5=86=99=E9=81=93=EF=BC=9A
> > > > >=20
> > > > >=20
> > > > > On Sat, Sep 26, 2026, at 11:01 PM, Rong Zhang wrote:
> > > > > > Hi Navon,
> > > > > >=20
> > > > > > Thanks a lot for your test.=20
> > > > > >=20
> > > > > >=20
> > > > > > =E4=BA=8E 2026=E5=B9=B49=E6=9C=8827=E6=97=A5 GMT+08:00 05:04:15=
=EF=BC=8CNavon John Lukose=20
> > > > > > <navonjohnlukose@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
> > > > > > > Tested on a Yoga Pro 7 14IAH10 (83KF, BIOS QGCN35WW). Neither=
 mainline
> > > > > > > nor the series binds here. This firmware has no
> > > > > > > LENOVO_CAPABILITY_DATA_01 in _WDG at all, so no component eve=
r
> > > > > > > registers for that match and lwmi_om_master_bind() never runs=
. Skipping
> > > > > > > the match for GUIDs the firmware doesn't declare fixes it:
> > > > > > >=20
> > > > > > > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/driv=
ers/platform/x86/lenovo/wmi-capdata.c
> > > > > > > index 805e36ef7..d64520be1 100644
> > > > > > > --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> > > > > > > +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> > > > > > > @@ -76,11 +76,13 @@ enum lwmi_cd_type {
> > > > > > >  #define LWMI_CD_TABLE_ITEM(_type)		\
> > > > > > >  	[_type] =3D {				\
> > > > > > >  		.name =3D #_type,			\
> > > > > > > +		.guid =3D _type##_GUID,		\
> > > > > > >  		.type =3D _type,			\
> > > > > > >  	}
> > > > > > > =20
> > > > > > >  static const struct lwmi_cd_info {
> > > > > > >  	const char *name;
> > > > > > > +	const char *guid;
> > > > > > >  	enum lwmi_cd_type type;
> > > > > > >  } lwmi_cd_table[] =3D {
> > > > > > >  	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
> > > > > > > @@ -166,6 +168,14 @@ void lwmi_cd_match_add_all(struct device=
 *master, struct component_match **match
> > > > > > >  		if (lwmi_cd_table[i].type =3D=3D LENOVO_FAN_TEST_DATA)
> > > > > > >  			continue;
> > > > > > > =20
> > > > > > > +		/*
> > > > > > > +		 * Some firmware does not declare every capdata GUID at al=
l, in
> > > > > > > +		 * which case no component would ever register for it and =
the
> > > > > > > +		 * master could never bind.
> > > > > > > +		 */
> > > > > > > +		if (!wmi_has_guid(lwmi_cd_table[i].guid))
> > > > > > > +			continue;
> > > > > >=20
> > > > > > This was exactly what I did in the earlier revision while I was=
=20
> > > > > > introducing the support for capdata00 and capdata_fan.
> > > > > >=20
> > > > > > The wmi_has_guid() approach was eventually replaced by the=20
> > > > > > sub-component approach, because the use of the former is strong=
ly=20
> > > > > > discouraged.
> > > > > >=20
> > > > > > In the next revision I am going to convert capdata01 into a=20
> > > > > > sub-component, too. In this manner some heavy and complex work =
in the=20
> > > > > > series will become needless and can be simplified. While the=
=20
> > > > > > sub-component approach itself is complex, we've had the infrast=
ructure=20
> > > > > > to make it work. Therefore wiring it up should be a trivial wor=
k.
> > > > > >=20
> > > > > > Mark, Derek,
> > > > > >=20
> > > > > > Do you know if there is any way to determine the existence of c=
apdata01=20
> > > > > > using capdata00?=20
> > > > > >=20
> > > > > Note that I can see I'm afraid
> > >=20
> > > So there is no way to determine the existence of capdata01 using capd=
ata00, correct?
> > >=20
> > > > >=20
> > > > > I'm guessing the patch Armin posted on my thread "[RFC PATCH 5/7]=
 platform/x86: think-lmi: Initial ThinkLMI v2 driver" to check if it exists=
 won't help here?
> > > >=20
> > > > After some consideration, it seems that we don't really need to det=
ermine the existence of capdata01 if we take the sub-component approach, th=
anks to the fact that every functionality either depends on capdata00 or de=
pends on capdata01, but never both.
> > >=20
> > > Unfortunately, it turned out that it can't resolve the issue by simpl=
y converting capdata01 into a sub-component, unless a virtual device is als=
o created to split the component matching list into two, which is more like=
 a dirty workaround.
> > >=20
> > > So yeah, the series needs the wmidev_exists() patch from Armin.=20
> > > Considering that the ThinkLMI v2 series is probably still at the RFC=
=20
> > > stage, do you mind if I integrate the wmidev_exists() patch into my=
=20
> > > series?=20
> >=20
> > Rong/Mark,
> >=20
> > My $0.02, I don't think it matters who sends it up. If Ilpo is okay wit=
h=20
> > it of course, both series should include it as a prerequisite 1/X and=
=20
> > whichever gets picked up first will get into next. Then that patch can=
=20
> > be omitted from the other series when it gets picked. That way both=20
> > series will build if you apply the mbox onto next until one is merged.
>=20
> Hi,
>=20
> For me it's fine either way:
>=20
> 1) Have the same patch in both series.
>=20
> 2) If we know for sure we need the API anyway, just add it as a standalon=
e=20
> in advance.
>=20
> I suppose 2 would be slightly simpler but it's up to you which way you=
=20
> prefer.
>=20
> Lets not make things more complicated than they have to be. :-)

Thanks for you suggestion.

The v2 patch is almost ready, and I will submit it today or tomorrow. It
will anyway depend on the wmidev_exists() patch to build, so I'd prefer
1.

Or we can combine 1 and 2 -- do a subset apply with the wmidev_exists()
patch if it looks good but my v2 series has issues. Then Mark and I can
rebase and resubmit.

Thanks,
Rong
