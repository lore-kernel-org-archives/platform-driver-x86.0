Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F873DAACF
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 20:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791405465; cv=none; b=mIGn41if38fJBjvr1NDn6Wp7aZAQbTL4HXJqSiK5rSXMYG4vFUHw+h8pwvJ4jn97lgFGs0vkwmPdnZHKqkwiJtcpB5Xjht5CL7/6tpYT6/M4AttQuw4VmexRgjG4WyneHrp+T41ETaKwZfO3h8g+xHCdAvlg9OEDt5KV2H590M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791405465; c=relaxed/simple;
	bh=9yQ19hnwyWyn/a1jZT02R6cjM5oyMDWd2fzmgjmvg8E=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ZckUeIfXmgiPOHRMi+AoZCuJ5P3c27TNZiRXMQvdMwiZhO27aOslrR8GYz03D6pTkms5y9dQNR7xjW5Mr6KBpIhpxFhrJjMoQqYPVR/Dbg2qX+tk0LIXW8EMziJHDzOqWmLvI/uAWEVt+jASfRO7MgAGmJjyKL20fkG8bya4Kas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wv6Qhh2L; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wv6Qhh2L"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-34ceab2900eso3960279eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2026 13:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791405464; x=1792010264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p7lyLTO/J7+Cz3ZuJ+NoTTicnyi6AVEDOl7hjTpTPeY=;
        b=Wv6Qhh2LQKd4wuqBTL4IH1BPZ3dx6Sz2uuTTikhVVagM6vlACTTi7bB4Miku9H+p3z
         KDg/1aIOxRxr39b2fZfs+q+RjDmjPnkYB87eoEZjitQ2mN1GRPXu9QJLtfgzA0gQsLln
         Kpot3VGeIVzzD8Y3Qz5XjzvQ7o0+FRQLJwmmEYNPpzARO2daIpwZi9m2GQt3X7KB5eG6
         eoU7qokkzzpJ43Jxz2EjR5ZyZw4JJaoxwNMYOR60lV2hdWSuhzmPVO7q3v1sWGaYL8pa
         pwpJeAZXxza/nisy5zw3VuWapLaor9l5cBaRgMpJWlXnndx2H3jgQyg/EGDplq+X34m1
         lBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791405464; x=1792010264;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7lyLTO/J7+Cz3ZuJ+NoTTicnyi6AVEDOl7hjTpTPeY=;
        b=I1vDvRYsmmD1nHbI1Lcne3pF/Fc1taHefmlR/ZmJeWG704MTYgHF6g3hBVorAmGINK
         /CAbijInSCeeIO7wmFJm8XpjV0/aGP45TjrYz8t/Bo2UcSKtqxKJxUN9DmAQUbddb2Mf
         JG2LGLCuPDYdEl9yRjFqIjWol3+IdSIVjE3kDWg8Bd+5gCl8Slo2NPeW5ZQtbdspxjhy
         /spF6IQQhrf71IPsOk13Gtdgd8bnDAr/1DqCX6pTdreWgiu7NQSkViMIlyvBoOPiMG/5
         gnxHi0bYbKzxQnfbDYeSkiBRb6SVYEEfuDw7V7iMe9jkOcW0DK4+I/iFjgP9FFgIeg/x
         kcLw==
X-Forwarded-Encrypted: i=1; AKwUvBw1Ku9z1PCtw3RfmaLfcpMrHNEKTkYSfUMExRt+7xp0pL50p0/L9k1tEkHbyFo8hBHFCB0D0Do5PE4+M4L3TUOGLmjc@vger.kernel.org
X-Gm-Message-State: AFuF++kRN0wh6HqqLUUv+XPQa6H6wD3zfm1clafgRTW/b+2rKPzLd+GC
	fPyGaDImaQwJH9w9qnCPEHpqhkezlHTSvtXZE7m978Sg5ZAHQ76VJlQa
X-Gm-Gg: AYBFou2afJmogzlfbddnQUg+Zh4cGqngkYyc7UJHdmEWwebfizHr6piMMEJcoDA8LNq
	VL2YSL6xXN4YKA9+CcW/JPbnvDNJ4pmY5PDR3hzNhV+zfD+I9XgjSNcugJCvpN/+AqCLkw9cSg3
	Jn5qVgKVfatyWI0tk2pMgKjcdZ7bX65ykJqmaCG328mVppT6MA6m5gGmarhtRkE8UKYoSqarwAj
	oduUx0ISooNKGJN2gIHOsgjNha5dvbwCpt3HTpxmG5+OaVSJV9DEItrPX2oguB/PMoHLGGCkCEw
	XCSz7wWC7iEFu9DHbPqYlPy1ORssGvgQl27mECZhZnDMheO8sj9AosoQhBsvj3ooBq1sPulbHhJ
	g3Y4w/cw5/Fsnq0YGlzkcaAGF4r5XSsg7FoQYYeSuazSEUrdlkmXfMnhSAywz68uDdJzMAPptkB
	fOTKvcGCHNpwXYH+EnbkL9426/jOhXlBb4yC76RqycV1bGnbYVPcBRhU1CPVyRIYuQ5YaYC9axy
	YBEtdJmn4Rl1QbC6X9PAfmVpthxnw09MDQ1ZBgzTqANzQusr2jkCtfKK5IOtDrWn7/g
X-Received: by 2002:a05:701b:2514:b0:14a:5284:1bf5 with SMTP id a92af1059eb24-162043c7da1mr3852721c88.13.1791405463506;
        Wed, 07 Oct 2026 13:37:43 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-161680e191esm8257005c88.11.2026.10.07.13.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 13:37:43 -0700 (PDT)
Date: Wed, 07 Oct 2026 13:37:42 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Armin Wolf <W_Armin@gmx.de>
CC: Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Charles <hanker007@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Navon John Lukose <navonjohnlukose@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_0/9=5D_platform/?=
 =?US-ASCII?Q?x86=3A_lenovo-wmi-=7Bother=2Ccap?=
 =?US-ASCII?Q?data=2Chelpers=7D=3A_Improve_robustness_on_buggy_firmware?=
User-Agent: Thunderbird for Android
In-Reply-To: <83776200-4A60-4756-A99F-D5A3BB4D834A@rong.moe>
References: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe> <20260926210415.3465939-1-navonjohnlukose@gmail.com> <E2EDCF4A-09BB-4FE7-9E67-5086401C0848@rong.moe> <9789f452-d7eb-4f1e-8a13-7335332193a7@app.fastmail.com> <55927121-62DB-43D7-B1BD-19519A775659@rong.moe> <83776200-4A60-4756-A99F-D5A3BB4D834A@rong.moe>
Message-ID: <584854BC-16C5-44A1-83D1-63F6FDD51BEF@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 7, 2026 11:30:00 AM PDT, Rong Zhang <i@rong=2Emoe> wrote:
>Hi Mark, Armin,
>
>=E4=BA=8E 2026=E5=B9=B49=E6=9C=8829=E6=97=A5 GMT+08:00 01:53:18=EF=BC=8CR=
ong Zhang <i@rong=2Emoe> =E5=86=99=E9=81=93=EF=BC=9A
>> Hi Mark,=20
>>=20
>> Thanks for the information=2E=20
>>=20
>> =E4=BA=8E 2026=E5=B9=B49=E6=9C=8829=E6=97=A5 GMT+08:00 00:04:14=EF=BC=
=8CMark Pearson <mpearson-lenovo@squebb=2Eca> =E5=86=99=E9=81=93=EF=BC=9A
>> >=20
>> >=20
>> > On Sat, Sep 26, 2026, at 11:01 PM, Rong Zhang wrote:
>> > > Hi Navon,
>> > >
>> > > Thanks a lot for your test=2E=20
>> > >
>> > >
>> > > =E4=BA=8E 2026=E5=B9=B49=E6=9C=8827=E6=97=A5 GMT+08:00 05:04:15=EF=
=BC=8CNavon John Lukose=20
>> > > <navonjohnlukose@gmail=2Ecom> =E5=86=99=E9=81=93=EF=BC=9A
>> > >> Tested on a Yoga Pro 7 14IAH10 (83KF, BIOS QGCN35WW)=2E Neither ma=
inline
>> > >> nor the series binds here=2E This firmware has no
>> > >> LENOVO_CAPABILITY_DATA_01 in _WDG at all, so no component ever
>> > >> registers for that match and lwmi_om_master_bind() never runs=2E S=
kipping
>> > >> the match for GUIDs the firmware doesn't declare fixes it:
>> > >>=20
>> > >> diff --git a/drivers/platform/x86/lenovo/wmi-capdata=2Ec b/drivers=
/platform/x86/lenovo/wmi-capdata=2Ec
>> > >> index 805e36ef7=2E=2Ed64520be1 100644
>> > >> --- a/drivers/platform/x86/lenovo/wmi-capdata=2Ec
>> > >> +++ b/drivers/platform/x86/lenovo/wmi-capdata=2Ec
>> > >> @@ -76,11 +76,13 @@ enum lwmi_cd_type {
>> > >>  #define LWMI_CD_TABLE_ITEM(_type)		\
>> > >>  	[_type] =3D {				\
>> > >>  		=2Ename =3D #_type,			\
>> > >> +		=2Eguid =3D _type##_GUID,		\
>> > >>  		=2Etype =3D _type,			\
>> > >>  	}
>> > >> =20
>> > >>  static const struct lwmi_cd_info {
>> > >>  	const char *name;
>> > >> +	const char *guid;
>> > >>  	enum lwmi_cd_type type;
>> > >>  } lwmi_cd_table[] =3D {
>> > >>  	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
>> > >> @@ -166,6 +168,14 @@ void lwmi_cd_match_add_all(struct device *mas=
ter, struct component_match **match
>> > >>  		if (lwmi_cd_table[i]=2Etype =3D=3D LENOVO_FAN_TEST_DATA)
>> > >>  			continue;
>> > >> =20
>> > >> +		/*
>> > >> +		 * Some firmware does not declare every capdata GUID at all, in
>> > >> +		 * which case no component would ever register for it and the
>> > >> +		 * master could never bind=2E
>> > >> +		 */
>> > >> +		if (!wmi_has_guid(lwmi_cd_table[i]=2Eguid))
>> > >> +			continue;
>> > >
>> > > This was exactly what I did in the earlier revision while I was=20
>> > > introducing the support for capdata00 and capdata_fan=2E
>> > >
>> > > The wmi_has_guid() approach was eventually replaced by the=20
>> > > sub-component approach, because the use of the former is strongly=
=20
>> > > discouraged=2E
>> > >
>> > > In the next revision I am going to convert capdata01 into a=20
>> > > sub-component, too=2E In this manner some heavy and complex work in=
 the=20
>> > > series will become needless and can be simplified=2E While the=20
>> > > sub-component approach itself is complex, we've had the infrastruct=
ure=20
>> > > to make it work=2E Therefore wiring it up should be a trivial work=
=2E
>> > >
>> > > Mark, Derek,
>> > >
>> > > Do you know if there is any way to determine the existence of capda=
ta01=20
>> > > using capdata00?=20
>> > >
>> > Note that I can see I'm afraid
>
>So there is no way to determine the existence of capdata01 using capdata0=
0, correct?
>
>> >=20
>> > I'm guessing the patch Armin posted on my thread "[RFC PATCH 5/7] pla=
tform/x86: think-lmi: Initial ThinkLMI v2 driver" to check if it exists won=
't help here?
>>=20
>> After some consideration, it seems that we don't really need to determi=
ne the existence of capdata01 if we take the sub-component approach, thanks=
 to the fact that every functionality either depends on capdata00 or depend=
s on capdata01, but never both=2E
>
>Unfortunately, it turned out that it can't resolve the issue by simply co=
nverting capdata01 into a sub-component, unless a virtual device is also cr=
eated to split the component matching list into two, which is more like a d=
irty workaround=2E
>
>So yeah, the series needs the wmidev_exists() patch from Armin=2E Conside=
ring that the ThinkLMI v2 series is probably still at the RFC stage, do you=
 mind if I integrate the wmidev_exists() patch into my series?

Rong/Mark,

My $0=2E02, I don't think it matters who sends it up=2E If Ilpo is okay wi=
th it of course, both series should include it as a prerequisite 1/X and wh=
ichever gets picked up first will get into next=2E Then that patch can be o=
mitted from the other series when it gets picked=2E That way both series wi=
ll build if you apply the mbox onto next until one is merged=2E

- Derek

>Thanks,
>Rong
>
>>=20
>> I will find some time to refresh the series=2E
>>=20
>> Thanks,
>> Rong
>>=20
>> >=20
>> > Mark

