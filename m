Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E973B6C05;
	Tue, 22 Sep 2026 18:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102909; cv=pass; b=BIl6HEvp0a6XqLhE7I+Qsv24/jFt4AgC1ZVp5tiSlwRy9ImlLxEuKNq5DZ37LdPNeHgbCMli6nvF2pbXZJadaG4XmdeB2UejVGNb3HSn9fM1vozl51is/B3a5cqvGmxeaoa5uvC7Y6Br5kzTSHpl9rQrg3gxnuuRn1KZX6S7iBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102909; c=relaxed/simple;
	bh=uBPFKAzLxDrfoIyfJ0VD/LA0IQKdJ//1oc9XxCkHg1Q=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=GSult9jI4tyYOVGF+okkmlOtNnK51uDwzzgbHB/I9OKp4BLgKCzHmbZC9GKKgIkUSG1fI6tkcwQzbd0udvMXl7g07IamBDHT90bRuslfQE07U7nh42pTY6bGhe0Cz4fCelCI4F//3JYYe6+j0Wnn+pbkoHrA6DBAy94xPPfRvs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=V39onfdR; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="V39onfdR"
ARC-Seal: i=1; a=rsa-sha256; t=1790102888; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E1MEIJbu0Z6M8Fkc8+kev2LbjbKrLMHpYRwjZnXJQnB0PwDCpEgwfBDxI3/mY6DGwg/6aZD/5GnmV7VDr/6YINFELGk57lLL0nnIhEvidmyaj28xo3um0Abdh3eHlvlKXFs4FANzRffH0LdUXc+k2xAeg0I+7WVi45J0tRuHWzk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790102888; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gFO6OKVdECYcID8G1vWbNV5+f4EgEUBXLONhqy6tga8=; 
	b=jXQqE9icDFdW+AOehgp9RYk+v3Dzum+D1Usb1I/aMkIK5zgWNiz+IA9uz8OYWQU1JEWBpbpDtiYg9wcGR936jiZZAFH9XA/RUOqtn8jIxbYYrnRRw7eGfHDNoLLYmB5B8E5wHnt7Z49tkgQ+fdHm+JbfrG9mqmTlG5UJxxCUfa0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790102888;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=gFO6OKVdECYcID8G1vWbNV5+f4EgEUBXLONhqy6tga8=;
	b=V39onfdRnvANfYS5ripd0GE+3qaChaQkxhvUyX8gP/yBmZs1qupcUEjUORs7MWYi
	U+rbOCiEBsvJUNO9phdE38kdmvpZUH7wGtc1uDsgWkYzo4nCjhNOgH4D2P+UexP+Mvo
	Isa2RLMTX/jI8zFrjKuL4oXSH+FBUJfhFSNbtJm8wUYMgK9aCQ3bAE1pQeKIbI/rKxO
	kvnQr+OQ6c2byeti5tqlMkdmfC6VR4CCXn9auK2h8IehRmwEYdnqSqtf4KsIRCyLNly
	fIeSG7JsXhCDkO/7zpL/qDdC4dfwcNxi3s0YzxRIjflWWQS2f7YEyuwrVV2O/McAT7E
	SyxaBV4jVA==
Received: by smtp.zohomail.com with SMTPS id 1790102885465814.0831108184503;
	Tue, 22 Sep 2026 11:48:05 -0700 (PDT)
Date: Wed, 23 Sep 2026 02:47:57 +0800
From: Rong Zhang <i@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
 Marco Giunta <marco_giunta@outlook.it>
CC: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hansg@kernel.org>, Huang Wei <huangwei@kylinos.cn>,
 Ike Panhc <ikepanhc@gmail.com>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_platform/x86=3A_ideapad-laptop=3A?=
 =?US-ASCII?Q?_Report_camera_switch_as_SW=5FCAMERA=5FLENS=5FCOVER?=
User-Agent: Thunderbird for Android
In-Reply-To: <5997344f-b3ff-4694-9563-762061295a57@app.fastmail.com>
References: <d867a4f6b798809776164542972e68d724f29fd5.camel@rong.moe> <SN6PR19MB2303278926469783FA99824CFC842@SN6PR19MB2303.namprd19.prod.outlook.com> <9be0971e7f84162bc57e01eb4cde508ed15e3096.camel@rong.moe> <048278d5-8c58-415f-890a-3ca45f3d31c9@app.fastmail.com> <271a88b113a0734b150d5a0d812c4c6e2a6418e3.camel@rong.moe> <63afee899ccf13730af1b6b281c528ecdfa568c3.camel@rong.moe> <5997344f-b3ff-4694-9563-762061295a57@app.fastmail.com>
Message-ID: <22C70C72-1C43-4777-AD11-D5A6EA85A0F1@rong.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

Hi Mark,=20

Thanks for your information=2E=20


=E4=BA=8E 2026=E5=B9=B49=E6=9C=8823=E6=97=A5 GMT+08:00 01:32:41=EF=BC=8CMa=
rk Pearson <mpearson-lenovo@squebb=2Eca> =E5=86=99=E9=81=93=EF=BC=9A
> Hi Rong
>=20
> On Tue, Sep 22, 2026, at 12:42 PM, Rong Zhang wrote:
> > Hi Mark,
> >
> > On Tue, 2026-09-22 at 23:58 +0800, Rong Zhang wrote:
> >> Hi Mark,
> >>=20
> >> On Tue, 2026-09-22 at 11:52 -0400, Mark Pearson wrote:

[=2E=2E=2E]
=20
> >> > I'm way behind on my emails and trying to get through my inbox a bi=
t=2E=2E=2Eso apologies if I've missed subtleties as I skim read this a bit
> >> >=20
> >> > Reading the internal spec - there are some WMI calls I can see that=
 return C status:
> >> > LENOVO_OTHER_METHOD (GUID dc2a8805-3a8c-41ba-a6f7-092e0089cd3b)
> >> > Get CV DSP Camera Shutter Status - Input ID 0x00200000 - returns 0 =
(closed) or 1 (open)
> >> > Get Normal Camera Shutter Status - Input ID 0x00201000 - returns 0 =
(closed) or 1 (open)
> >> >=20
> >> > I can't find the Utility GUIDs mentioned at all I'm afraid=2E Is th=
e above useful?
> >>=20
> >> Thanks for the information=2E It's useful! I will cross-check with th=
e DSL
> >> code of the correlated WMI method=2E
> >
> > I just checked a DSDT dump from 83JR [1], and it does implement
> > 0x00200000!
> >
> > In detail, LENOVO_CAPABILITY_DATA_00 exposes 0x00200000 as
> > valid+read+write conditionally, while LENOVO_OTHER_METHOD can be used =
to
> > get/set the camera shutter=2E
> >
> > Still, I have three questions=2E Could you kindly check the internal
> > specification and shed some light?
> >
> > What's the difference between "CV DSP Camera Shutter" and the "Normal"
> > one? I guess the former is a firmware switch while the latter is a
> > hardware switch, am I correct?
> >
> The Normal ID is new and was just added in the latest version of the spe=
c=2E
> It's possible it is on a not-released platform yet=2E
> As a note - the 'Normal" entry is get only=2E

Got it=2E The latter being get-only really makes it sound like a hardware =
switch=2E But yeah, we will see when the relevant platform is released=2E

>=20
> Afraid my hooks into the Yoga and Legion team are still quite new and we=
're figuring out some of the pieces needed at the moment :)
> The WMI spec seems to cover a lot of different platforms that I've not h=
ad much experience with too=2E
>=20
> > The device does not implement LENOVO_CAPABILITY_DATA_01 at all=2E Is i=
t
> > possible to determine its existence programmatically using
> > LENOVO_CAPABILITY_DATA_00? Missing the former is fatal in the current
> > lenovo-wmi-capdata and lenovo-wmi-other implementations, resulting in
> > both driver non-functional=2E We need a programmatic way to tolerate i=
ts
> > non-existence so that we can bind the two drivers via the component
> > framework in any case=2E
> >
> It should be under CAPABILITY DATA_00, at least from what I'm seeing (pa=
sting a table in text=2E=2E=2E=2E):
>=20
> CV DSP Camera Shutter
> uint32 IDs //0x00200000
> uint32 Capability // 7 :by project
> bit 2: 0: not support SetFeatureValue(), 1: support SetFeatureValue()
> bit 1: 0: not support GetFeatureValue(), 1: support GetFeatureValue()
> bit 0: 0: not support CV DSP Camera Shutter, 1: support CV DSP Camera Sh=
utter
> uint32 DefaultValue // 0 : by project
>=20
> Normal Camera Shutter Status
> uint32 IDs //0x00201000
> uint32 Capability // 3 :by project
> bit 2: 0: not support SetFeatureValue(), 1: support SetFeatureValue()
> bit 1: 0: not support GetFeatureValue(), 1: support GetFeatureValue()
> bit 0: 0: not support Normal Camera Shutter Status, 1: support Normal Ca=
mera Shutter Status
> uint32 DefaultValue // 1 : by project

While the information is also useful, it seems that I didn't express the q=
uestion well in the last reply=2E Sorry for causing the misunderstanding=2E

I was asking about:

Is it possible to determine the existence of LENOVO_CAPABILITY_DATA_*01* u=
sing *00*?

Full story:

The two drivers (wmi-capdata and wmi-other) make a strong assumption that =
both 00 and 01 must be present=2E Missing anyone causes the two drivers non=
-functional=2E

Some platforms stub 01=2E The two drivers still work properly on these pla=
tforms, as the WMI GUID of 01 is still there=2E

Some platforms don't support 01 at all, but somehow forgot to stub it=2E T=
he two drivers become non-functional in this case=2E It's easy to fix as th=
e WMI GUID of 01 is still there, too=2E I've sent a series to fix that (it =
hasn't received any review yet, hint hint ;-P), see https://lore=2Ekernel=
=2Eorg/all/20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong=2Emoe/

Not until the last reply did I realize that 01 could be completely missing=
=2E Unfortunately, it becomes very tricky as the use of wmi_has_guid() is s=
trongly discouraged, so we need to figure out an approach to determine the =
existence of 01 using other capability data, e=2Eg=2E 00=2E

>=20
> > There is an WMI query in the DSDT dump that looks like
> > LENOVO_CAPABILITY_DATA_03=2E What is it?
> >
> No idea - my spec sheet doesn't have 03 defined=2E
> Scanning through my doc I'm not spotting anything that looks like a matc=
h for WQC either

Fine, it's not a big deal=2E I am just curious about how many capability d=
ata GUIDs have been defined=2E

Thanks,
Rong

>=20
> Mark
>=20
>=20
> > [1]: I never have such a device=2E I got the dump when fixing
> > https://bugzilla=2Ekernel=2Eorg/show_bug=2Ecgi?id=3D221065
> >
> > Appendix (DSDT snippet):
> >
> >                     Device (GZFD)
> >                     {
> >                         Name (_HID, "PNP0C14" /* Windows Management=20
> > Instrumentation Device */)  // _HID: Hardware ID
> >                         Name (_UID, "GMZN")  // _UID: Unique ID
> > [=2E=2E]
> > /* This is LENOVO_OTHER_METHOD=2E */
> >                         Method (WMAE, 3, NotSerialized)
> >                         {
> >                             Local0 =3D Arg1
> >                             CreateDWordField (Arg2, Zero, SIDS)
> >                             CreateDWordField (Arg2, 0x04, SVAL)
> > [=2E=2E]
> >                             If ((Arg1 =3D=3D 0x11))
> >                             {
> > [=2E=2E]
> > /* Get 0x00200000=2E */
> >                                 If ((SIDS =3D=3D 0x00200000))
> >                                 {
> >                                     Local0 =3D ^^PCI0=2ELPC0=2EEC0=2ED=
CSS /*=20
> > \_SB_=2EPCI0=2ELPC0=2EEC0_=2EDCSS */
> >                                     Return (Local0)
> >                                 }
> > [=2E=2E]
> >                             }
> >
> >                             If ((Arg1 =3D=3D 0x12))
> >                             {
> > [=2E=2E]
> > /* Set 0x00200000=2E */
> >                                 If ((SIDS =3D=3D 0x00200000))
> >                                 {
> >                                     Local0 =3D ToInteger (SVAL)
> >                                     ^^PCI0=2ELPC0=2EEC0=2EDCSS =3D Loc=
al0
> >                                     Return (Zero)
> >                                 }
> >                             }
> > [=2E=2E]
> >                         }
> > /* The device has no LENOVO_CAPABILITY_DATA_01=2E */
> >
> > /* Is this something like LENOVO_CAPABILITY_DATA_03? */
> >                         Method (WQC3, 1, NotSerialized)
> >                         {
> >                             If ((Arg0 =3D=3D Zero))
> >                             {
> >                                 Return (Buffer (0x10)
> >                                 {
> >                                     /* 0000 */  0x01, 0x00, 0x00, 0x00=
,=20
> > 0x01, 0x00, 0x00, 0x00,  // =2E=2E=2E=2E=2E=2E=2E=2E
> >                                     /* 0008 */  0x10, 0x27, 0x00, 0x00=
,=20
> > 0xDC, 0x05, 0x00, 0x00   // =2E'=2E=2E=2E=2E=2E=2E
> >                                 })
> >                             }
> >                         }
> > [=2E=2E]
> > /* This is LENOVO_CAPABILITY_DATA_00=2E */
> >                         Name (CPD0, Buffer (0x0C)
> >                         {
> >                              0x00                                     =
 =20
> >       // =2E
> >                         })
> >                         CreateDWordField (CPD0, Zero, C0ID)
> >                         CreateDWordField (CPD0, 0x04, C0CP)
> >                         CreateDWordField (CPD0, 0x08, C0DV)
> >                         Method (WQC0, 1, NotSerialized)
> >                         {
> >                             If ((Arg0 =3D=3D Zero))
> >                             {
> >                                 Return (Buffer (0x0C)
> >                                 {
> >                                     /* 0000 */  0x00, 0x00, 0x05, 0x04=
,=20
> > 0x07, 0x00, 0x00, 0x00,  // =2E=2E=2E=2E=2E=2E=2E=2E
> >                                     /* 0008 */  0x00, 0x00, 0x00, 0x00=
 =20
> >                          // =2E=2E=2E=2E
> >                                 })
> >                             }
> >
> >                             If ((Arg0 =3D=3D One))
> >                             {
> > /* 0x00200000 is exposed conditionally=2E */
> >                                 C0ID =3D 0x00200000
> >                                 C0DV =3D Zero
> >                                 If ((^^PCI0=2ELPC0=2EEC0=2ECVSP =3D=3D=
 One))
> >                                 {
> >                                     C0CP =3D 0x07
> >                                 }
> >                                 Else
> >                                 {
> >                                     C0CP =3D Zero
> >                                 }
> >                             }
> >
> >                             Return (CPD0) /* \_SB_=2EGZFD=2ECPD0 */
> >                         }
> > [=2E=2E]
> >                     }
> >
> > Thanks,
> > Rong
> >
> >>=20
> >> >=20
> >> > When I get a chance I'll check this out on a Legion platform I have=
 that has this switch and confirm=2E=2E=2E=2Ebut it might take a little whi=
le=2E
> >>=20
> >> Take your time and don't worry :-)
> >>=20
> >> Thanks,
> >> Rong
> >>=20
> >> >=20
> >> > Mark
