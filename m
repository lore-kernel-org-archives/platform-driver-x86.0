Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D773D4E3243;
	Mon, 28 Sep 2026 17:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618053; cv=pass; b=taQz+5GAMXt8lcsbchBuE4lF/4RcdU0MLqxKvg5xybN/ZN3f3txwMy9ZVsy1IkVR+jNC81KINcFxNo5ed4wHSi+11k4Xp4551fgyVYfey18HYnQluxTki5fowlUmlM/1CEPLb4FJApZIHfy6u0oegEifjde3alsqtZiVDXy4+3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618053; c=relaxed/simple;
	bh=PY1Top1KDF6JkJ+Yjd4fqMgqlT4hJwRYEaxaRMQLjwQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=B1PCBL+FMRjZ+qUIz5k35CGIH0gxgQYLeXgcGBNKvuhaWnTOAFKR6Edk/UcrSyGi5g+LiP/tGktn5o3m5l/74EmRg6FDX8Y0l10jvB7b0Wv8oANe3n/qfzufg7Z0Q5zVvTF+V3MP7qDmWopnTI3tGlAZ7is/Q677QW9b35xkQvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=dSfs6UBG; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="dSfs6UBG"
ARC-Seal: i=1; a=rsa-sha256; t=1790618007; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XvRBkQK6vT5fc4Gl93sCqXelqryCchByJzODmWauXsIdokMXRJLe6HC1hnZzO1NCrrj3cAYJp9AWNyTSZy2m1rdZoPswL9WW2jJiDOtoZ7YX+fUduPCw8qc5fkC7F/oOkD6V+1CH2gW8vZpaEX4eLg1KcxVpNQEXObytVcMVlI8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790618007; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hYmFAtmYndXmkOUKeDAM9worn2YK/d83OPFRpAjAfpA=; 
	b=S46fHPtkX0IVp1wds/nvM9gEFeL9sj3FNT9gTsLfNYmXlg2wrU5Tnx45bGCU790NJhLP8gsSbxkY2rKc1Djz4cPrLJqo/C/RWqjcOeuP/eOaBt5lpNAf+cnUspCiPbKMkH3vNffahlOOb/ypr7PjBWPP1ccwL3mcJROtwkNh3k4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790618007;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=hYmFAtmYndXmkOUKeDAM9worn2YK/d83OPFRpAjAfpA=;
	b=dSfs6UBGJZMxQpbCbg0QyXfWP6os6eFjRVlpGB+Kpe14pEXemCuPZ4wrTgegCadq
	MV7VBthm45FLJaxjfW/dGT/9O/JEf3Fzz97nmPvt0fQxHztJ0GduFjLwr7psO0zmaQT
	h28WqPjWnNsSWdg/a4hhlL8/0c0gF3xAoRpiaSBIV88ONwfRZ2gloU404jcJm5g2sn1
	XgJhG39vknMeBnBE+0IdiJbv3I34fmcu4B/6FNxPgzuF/m5oBdo/ELEYdaU+eFReBKv
	Y/KHbS51r5IJ7u8tbWl/j44O4y37xUTN9nLLM42TRzvXqSYgYdc7iWy2WAc0mpDFZYb
	Jqywt9If9w==
Received: by smtp.zohomail.com with SMTPS id 1790618005745563.8190794704351;
	Mon, 28 Sep 2026 10:53:25 -0700 (PDT)
Date: Tue, 29 Sep 2026 01:53:18 +0800
From: Rong Zhang <i@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
 Navon John Lukose <navonjohnlukose@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>
CC: Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Armin Wolf <W_Armin@gmx.de>, Charles <hanker007@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_0/9=5D_platform/?=
 =?US-ASCII?Q?x86=3A_lenovo-wmi-=7Bother=2Ccap?=
 =?US-ASCII?Q?data=2Chelpers=7D=3A_Improve_robustness_on_buggy_firmware?=
User-Agent: Thunderbird for Android
In-Reply-To: <9789f452-d7eb-4f1e-8a13-7335332193a7@app.fastmail.com>
References: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe> <20260926210415.3465939-1-navonjohnlukose@gmail.com> <E2EDCF4A-09BB-4FE7-9E67-5086401C0848@rong.moe> <9789f452-d7eb-4f1e-8a13-7335332193a7@app.fastmail.com>
Message-ID: <55927121-62DB-43D7-B1BD-19519A775659@rong.moe>
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

Thanks for the information=2E=20

=E4=BA=8E 2026=E5=B9=B49=E6=9C=8829=E6=97=A5 GMT+08:00 00:04:14=EF=BC=8CMa=
rk Pearson <mpearson-lenovo@squebb=2Eca> =E5=86=99=E9=81=93=EF=BC=9A
>=20
>=20
> On Sat, Sep 26, 2026, at 11:01 PM, Rong Zhang wrote:
> > Hi Navon,
> >
> > Thanks a lot for your test=2E=20
> >
> >
> > =E4=BA=8E 2026=E5=B9=B49=E6=9C=8827=E6=97=A5 GMT+08:00 05:04:15=EF=BC=
=8CNavon John Lukose=20
> > <navonjohnlukose@gmail=2Ecom> =E5=86=99=E9=81=93=EF=BC=9A
> >> Tested on a Yoga Pro 7 14IAH10 (83KF, BIOS QGCN35WW)=2E Neither mainl=
ine
> >> nor the series binds here=2E This firmware has no
> >> LENOVO_CAPABILITY_DATA_01 in _WDG at all, so no component ever
> >> registers for that match and lwmi_om_master_bind() never runs=2E Skip=
ping
> >> the match for GUIDs the firmware doesn't declare fixes it:
> >>=20
> >> diff --git a/drivers/platform/x86/lenovo/wmi-capdata=2Ec b/drivers/pl=
atform/x86/lenovo/wmi-capdata=2Ec
> >> index 805e36ef7=2E=2Ed64520be1 100644
> >> --- a/drivers/platform/x86/lenovo/wmi-capdata=2Ec
> >> +++ b/drivers/platform/x86/lenovo/wmi-capdata=2Ec
> >> @@ -76,11 +76,13 @@ enum lwmi_cd_type {
> >>  #define LWMI_CD_TABLE_ITEM(_type)		\
> >>  	[_type] =3D {				\
> >>  		=2Ename =3D #_type,			\
> >> +		=2Eguid =3D _type##_GUID,		\
> >>  		=2Etype =3D _type,			\
> >>  	}
> >> =20
> >>  static const struct lwmi_cd_info {
> >>  	const char *name;
> >> +	const char *guid;
> >>  	enum lwmi_cd_type type;
> >>  } lwmi_cd_table[] =3D {
> >>  	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
> >> @@ -166,6 +168,14 @@ void lwmi_cd_match_add_all(struct device *master=
, struct component_match **match
> >>  		if (lwmi_cd_table[i]=2Etype =3D=3D LENOVO_FAN_TEST_DATA)
> >>  			continue;
> >> =20
> >> +		/*
> >> +		 * Some firmware does not declare every capdata GUID at all, in
> >> +		 * which case no component would ever register for it and the
> >> +		 * master could never bind=2E
> >> +		 */
> >> +		if (!wmi_has_guid(lwmi_cd_table[i]=2Eguid))
> >> +			continue;
> >
> > This was exactly what I did in the earlier revision while I was=20
> > introducing the support for capdata00 and capdata_fan=2E
> >
> > The wmi_has_guid() approach was eventually replaced by the=20
> > sub-component approach, because the use of the former is strongly=20
> > discouraged=2E
> >
> > In the next revision I am going to convert capdata01 into a=20
> > sub-component, too=2E In this manner some heavy and complex work in th=
e=20
> > series will become needless and can be simplified=2E While the=20
> > sub-component approach itself is complex, we've had the infrastructure=
=20
> > to make it work=2E Therefore wiring it up should be a trivial work=2E
> >
> > Mark, Derek,
> >
> > Do you know if there is any way to determine the existence of capdata0=
1=20
> > using capdata00?=20
> >
> Note that I can see I'm afraid
>=20
> I'm guessing the patch Armin posted on my thread "[RFC PATCH 5/7] platfo=
rm/x86: think-lmi: Initial ThinkLMI v2 driver" to check if it exists won't =
help here?

After some consideration, it seems that we don't really need to determine =
the existence of capdata01 if we take the sub-component approach, thanks to=
 the fact that every functionality either depends on capdata00 or depends o=
n capdata01, but never both=2E

I will find some time to refresh the series=2E

Thanks,
Rong

>=20
> Mark
