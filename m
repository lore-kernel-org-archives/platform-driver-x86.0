Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D044E06F6;
	Wed,  7 Oct 2026 18:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791397820; cv=pass; b=RfWwNrIbljwUxlHX0F6WMy/KjuWSC4MgREpGMIlOOPjlHkVvrnao0ll/NB2iGsGk2V0xtFSaIxC54Vkprg+OoAk8B0WIq7i/VKFA4mfrdsVXYoRSFQalUi5g/4Ic1kIR846/Z2Bk3gP4KVWdTTlgiXU4nr1DhWJau6SYj5nPgjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791397820; c=relaxed/simple;
	bh=N61s1ggtx/iPC+pmgyJ3w8WjvsPnB2HQl5Cpi4HFsSY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=aGVWfIZsxGhvyebeUzyE41MHiBIwBZuyOYyZPDAgkt7l7EF60AFebT5d7xQ/sC5PqBbkaqsA3LZBze0+CYZ3hq3ikFvcQYBf+gHBfQ93+KF2WI3qT9Cgi0AkX6eVm+giQm8w8Rp27nVNG8ssAwWsBYEF+VcgBZQY5mzJVpKxqPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=XQbGbz/f; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="XQbGbz/f"
ARC-Seal: i=1; a=rsa-sha256; t=1791397810; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L9k+CdvaXlFxJ0nyym6PzgM3jrL5DX6U+4Z3kQG6yOPZAravT1RHjFvKxHvLAHDfKabGrhUIrYvBxATR60nQ7+OkXzE3BAB1JEyiMgWV/R7i+9kawdpFyx+dUIwc/tq/R16D8qPhm+8ROqgqV4/aIugHxMStBSeAuFuaLA3JXrc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791397810; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FI8a3pRg9FBE8JI+WESeGW178/l9qC1mCdVO5FDKiAg=; 
	b=TwOQjFnmjabeZRILGhu9iT3j9KKH0X77Qa2irWgDwelcwjWaHrCWXLRrCtj2EHaaMUfClY2uOb3USALyZZjG4nJNvo/pVBbyvNZnORleGJKCGONodwDOzqf+NvjN3Es1qwrc+PmcWOzXiRaY2XkOCURgiepLS64ACRpR/cRxbYA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791397810;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=FI8a3pRg9FBE8JI+WESeGW178/l9qC1mCdVO5FDKiAg=;
	b=XQbGbz/foj6jrNzvmkfLfaaObv3nVx/LCOdUdWg4BDIygvrzfJAzWmsSAFzX2gQl
	nkZMDXR472FhQ6sQIK2hWrVCX7ErxwmeL7zLgM92U7Y4AELeMT02tmaltg7IZOrdWFA
	UmhxjE3Ci0nSfLO4BrJkF6tScJEow5f4KrmISiDpc34D9+f3AxB8TkIAsBt4nY5XlkP
	Z9OQCLI/cOpdQMqH80Uq+Bm19PNUyAPCPhkrYOFhBxq92Gpz4DAjh07FTKfdVlmY4Y7
	KxbFIKtY7NeT4/U8kD4mvzV1QScYG+dDJggsqt4i4/cU+hzoLHYO9Zt9fIDcYYjaefO
	jg4cRnC4zw==
Received: by smtp.zohomail.com with SMTPS id 1791397808125130.9812995455103;
	Wed, 7 Oct 2026 11:30:08 -0700 (PDT)
Date: Thu, 08 Oct 2026 02:30:00 +0800
From: Rong Zhang <i@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>
CC: Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Charles <hanker007@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Navon John Lukose <navonjohnlukose@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_0/9=5D_platform/?=
 =?US-ASCII?Q?x86=3A_lenovo-wmi-=7Bother=2Ccap?=
 =?US-ASCII?Q?data=2Chelpers=7D=3A_Improve_robustness_on_buggy_firmware?=
User-Agent: Thunderbird for Android
In-Reply-To: <55927121-62DB-43D7-B1BD-19519A775659@rong.moe>
References: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe> <20260926210415.3465939-1-navonjohnlukose@gmail.com> <E2EDCF4A-09BB-4FE7-9E67-5086401C0848@rong.moe> <9789f452-d7eb-4f1e-8a13-7335332193a7@app.fastmail.com> <55927121-62DB-43D7-B1BD-19519A775659@rong.moe>
Message-ID: <83776200-4A60-4756-A99F-D5A3BB4D834A@rong.moe>
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

Hi Mark, Armin,

=E4=BA=8E 2026=E5=B9=B49=E6=9C=8829=E6=97=A5 GMT+08:00 01:53:18=EF=BC=8CRo=
ng Zhang <i@rong=2Emoe> =E5=86=99=E9=81=93=EF=BC=9A
> Hi Mark,=20
>=20
> Thanks for the information=2E=20
>=20
> =E4=BA=8E 2026=E5=B9=B49=E6=9C=8829=E6=97=A5 GMT+08:00 00:04:14=EF=BC=8C=
Mark Pearson <mpearson-lenovo@squebb=2Eca> =E5=86=99=E9=81=93=EF=BC=9A
> >=20
> >=20
> > On Sat, Sep 26, 2026, at 11:01 PM, Rong Zhang wrote:
> > > Hi Navon,
> > >
> > > Thanks a lot for your test=2E=20
> > >
> > >
> > > =E4=BA=8E 2026=E5=B9=B49=E6=9C=8827=E6=97=A5 GMT+08:00 05:04:15=EF=
=BC=8CNavon John Lukose=20
> > > <navonjohnlukose@gmail=2Ecom> =E5=86=99=E9=81=93=EF=BC=9A
> > >> Tested on a Yoga Pro 7 14IAH10 (83KF, BIOS QGCN35WW)=2E Neither mai=
nline
> > >> nor the series binds here=2E This firmware has no
> > >> LENOVO_CAPABILITY_DATA_01 in _WDG at all, so no component ever
> > >> registers for that match and lwmi_om_master_bind() never runs=2E Sk=
ipping
> > >> the match for GUIDs the firmware doesn't declare fixes it:
> > >>=20
> > >> diff --git a/drivers/platform/x86/lenovo/wmi-capdata=2Ec b/drivers/=
platform/x86/lenovo/wmi-capdata=2Ec
> > >> index 805e36ef7=2E=2Ed64520be1 100644
> > >> --- a/drivers/platform/x86/lenovo/wmi-capdata=2Ec
> > >> +++ b/drivers/platform/x86/lenovo/wmi-capdata=2Ec
> > >> @@ -76,11 +76,13 @@ enum lwmi_cd_type {
> > >>  #define LWMI_CD_TABLE_ITEM(_type)		\
> > >>  	[_type] =3D {				\
> > >>  		=2Ename =3D #_type,			\
> > >> +		=2Eguid =3D _type##_GUID,		\
> > >>  		=2Etype =3D _type,			\
> > >>  	}
> > >> =20
> > >>  static const struct lwmi_cd_info {
> > >>  	const char *name;
> > >> +	const char *guid;
> > >>  	enum lwmi_cd_type type;
> > >>  } lwmi_cd_table[] =3D {
> > >>  	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
> > >> @@ -166,6 +168,14 @@ void lwmi_cd_match_add_all(struct device *mast=
er, struct component_match **match
> > >>  		if (lwmi_cd_table[i]=2Etype =3D=3D LENOVO_FAN_TEST_DATA)
> > >>  			continue;
> > >> =20
> > >> +		/*
> > >> +		 * Some firmware does not declare every capdata GUID at all, in
> > >> +		 * which case no component would ever register for it and the
> > >> +		 * master could never bind=2E
> > >> +		 */
> > >> +		if (!wmi_has_guid(lwmi_cd_table[i]=2Eguid))
> > >> +			continue;
> > >
> > > This was exactly what I did in the earlier revision while I was=20
> > > introducing the support for capdata00 and capdata_fan=2E
> > >
> > > The wmi_has_guid() approach was eventually replaced by the=20
> > > sub-component approach, because the use of the former is strongly=20
> > > discouraged=2E
> > >
> > > In the next revision I am going to convert capdata01 into a=20
> > > sub-component, too=2E In this manner some heavy and complex work in =
the=20
> > > series will become needless and can be simplified=2E While the=20
> > > sub-component approach itself is complex, we've had the infrastructu=
re=20
> > > to make it work=2E Therefore wiring it up should be a trivial work=
=2E
> > >
> > > Mark, Derek,
> > >
> > > Do you know if there is any way to determine the existence of capdat=
a01=20
> > > using capdata00?=20
> > >
> > Note that I can see I'm afraid

So there is no way to determine the existence of capdata01 using capdata00=
, correct?

> >=20
> > I'm guessing the patch Armin posted on my thread "[RFC PATCH 5/7] plat=
form/x86: think-lmi: Initial ThinkLMI v2 driver" to check if it exists won'=
t help here?
>=20
> After some consideration, it seems that we don't really need to determin=
e the existence of capdata01 if we take the sub-component approach, thanks =
to the fact that every functionality either depends on capdata00 or depends=
 on capdata01, but never both=2E

Unfortunately, it turned out that it can't resolve the issue by simply con=
verting capdata01 into a sub-component, unless a virtual device is also cre=
ated to split the component matching list into two, which is more like a di=
rty workaround=2E

So yeah, the series needs the wmidev_exists() patch from Armin=2E Consider=
ing that the ThinkLMI v2 series is probably still at the RFC stage, do you =
mind if I integrate the wmidev_exists() patch into my series?

Thanks,
Rong

>=20
> I will find some time to refresh the series=2E
>=20
> Thanks,
> Rong
>=20
> >=20
> > Mark
