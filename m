Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5271228E0F;
	Sun, 27 Sep 2026 03:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790478130; cv=pass; b=K+B8QKRjTfCdzd++uFdtpn/DkGTebbKV4Z5sDIQaoui3RYnx/M8Or6A8rwy3un+N5IufJWG+DevTBbvmB7H2yCd1ML3/S8RiKCR+OuOuqUKJjo7X91nKWkhBFwVGORGGbBgQP9jpRCwiczhAlsYLOpdE9TwuTWKRohfI0uHsTxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790478130; c=relaxed/simple;
	bh=M6Al3tJSkYdadZYm5i9oNpl26qO/JcIlQcd0axEW8Uk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=mkuq5PtgeY90bTHOWTias/38gZbjHS1GcZilGQmadrpfGyh1ijlGDnYVm4Pux0g3DxV3OP6h1wyA50bb3DTCwegCNipeJE2m30BYMU561h1VwzLKSBFPgpKH6VA8KyCe0o4hpu8yvjyokKr4mtfymrM5AfTbfKf5EqrWg9EelZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=WQ7CPJr5; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="WQ7CPJr5"
ARC-Seal: i=1; a=rsa-sha256; t=1790478120; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=k2uMdp+EeQmmg+KzzyCZjqBt1dttGGNdcFeq/QGCJs2PEJTW4XGprNNFIUgMY1SY7aG72+9xLK730wgPjOTKNw62B9L7fMYWCMoWQCTYxAZmQjIYJaVtv+525vJKM1vmA5VqRYytJE7RsCl910MF5lNUwmQ5bl5R9lgCibiEdXQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790478120; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uCFcO0wTrMm3SxGJTzduXVXmAZQ1xhvtC793IWYLU2o=; 
	b=eskzKeUK9N88wEAm/2FKu+z/N0KHQlL8Y1UBEs6U7SQyWmmH/RY9a0eG9NET5+7UGH3XuZPw1KOm4+nMSTFdAR9B+Nfllh2QZXtPYSjxjzuAi5QVFusEdb2ZN4QUbMegITv3j385yLMUWrGGoMRXeHWUlFUVwsTo7maROM5FX58=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790478120;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=uCFcO0wTrMm3SxGJTzduXVXmAZQ1xhvtC793IWYLU2o=;
	b=WQ7CPJr5seIIGCzxK0EUncoI5xIZt8J77+l5xr6fE7td+S7GDSDexyFX05400k+I
	0rs1231ACofkPpZxJsaQVhbWO+/+jZYaoraTT5hNWdBmFpPHk5Ind4k1TOZfYyRq8uN
	x2mBfVPi49PEFPjRqXBLmc4hD8Q5ooqem+9Fw2APtcu1X0eZCxo2b1oWEVGrlqBcGGW
	XHE/6hysjxJO+E1JTDcJaliC7KRhn96yrz1RR9u6eVS5haBHyzdyOabj64xG2RiSdMU
	bQmwrj80tmUyXZYRnmDP6X7KSYh4w6GsaHDR5GPuSsigEQT22O0DRzmZaLxgSPtO86K
	6AH40CMF8g==
Received: by smtp.zohomail.com with SMTPS id 1790478118056127.13666599785586;
	Sat, 26 Sep 2026 20:01:58 -0700 (PDT)
Date: Sun, 27 Sep 2026 11:01:50 +0800
From: Rong Zhang <i@rong.moe>
To: Navon John Lukose <navonjohnlukose@gmail.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>
CC: Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Armin Wolf <W_Armin@gmx.de>, Charles <hanker007@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_0/9=5D_platform/?=
 =?US-ASCII?Q?x86=3A_lenovo-wmi-=7Bother=2Ccap?=
 =?US-ASCII?Q?data=2Chelpers=7D=3A_Improve_robustness_on_buggy_firmware?=
User-Agent: Thunderbird for Android
In-Reply-To: <20260926210415.3465939-1-navonjohnlukose@gmail.com>
References: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe> <20260926210415.3465939-1-navonjohnlukose@gmail.com>
Message-ID: <E2EDCF4A-09BB-4FE7-9E67-5086401C0848@rong.moe>
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

Hi Navon,

Thanks a lot for your test=2E=20


=E4=BA=8E 2026=E5=B9=B49=E6=9C=8827=E6=97=A5 GMT+08:00 05:04:15=EF=BC=8CNa=
von John Lukose <navonjohnlukose@gmail=2Ecom> =E5=86=99=E9=81=93=EF=BC=9A
> Tested on a Yoga Pro 7 14IAH10 (83KF, BIOS QGCN35WW)=2E Neither mainline
> nor the series binds here=2E This firmware has no
> LENOVO_CAPABILITY_DATA_01 in _WDG at all, so no component ever
> registers for that match and lwmi_om_master_bind() never runs=2E Skippin=
g
> the match for GUIDs the firmware doesn't declare fixes it:
>=20
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata=2Ec b/drivers/platf=
orm/x86/lenovo/wmi-capdata=2Ec
> index 805e36ef7=2E=2Ed64520be1 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata=2Ec
> +++ b/drivers/platform/x86/lenovo/wmi-capdata=2Ec
> @@ -76,11 +76,13 @@ enum lwmi_cd_type {
>  #define LWMI_CD_TABLE_ITEM(_type)		\
>  	[_type] =3D {				\
>  		=2Ename =3D #_type,			\
> +		=2Eguid =3D _type##_GUID,		\
>  		=2Etype =3D _type,			\
>  	}
> =20
>  static const struct lwmi_cd_info {
>  	const char *name;
> +	const char *guid;
>  	enum lwmi_cd_type type;
>  } lwmi_cd_table[] =3D {
>  	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
> @@ -166,6 +168,14 @@ void lwmi_cd_match_add_all(struct device *master, s=
truct component_match **match
>  		if (lwmi_cd_table[i]=2Etype =3D=3D LENOVO_FAN_TEST_DATA)
>  			continue;
> =20
> +		/*
> +		 * Some firmware does not declare every capdata GUID at all, in
> +		 * which case no component would ever register for it and the
> +		 * master could never bind=2E
> +		 */
> +		if (!wmi_has_guid(lwmi_cd_table[i]=2Eguid))
> +			continue;

This was exactly what I did in the earlier revision while I was introducin=
g the support for capdata00 and capdata_fan=2E

The wmi_has_guid() approach was eventually replaced by the sub-component a=
pproach, because the use of the former is strongly discouraged=2E

In the next revision I am going to convert capdata01 into a sub-component,=
 too=2E In this manner some heavy and complex work in the series will becom=
e needless and can be simplified=2E While the sub-component approach itself=
 is complex, we've had the infrastructure to make it work=2E Therefore wiri=
ng it up should be a trivial work=2E

Mark, Derek,

Do you know if there is any way to determine the existence of capdata01 us=
ing capdata00?=20

> +
>  		component_match_add(master, matchptr, lwmi_cd_match,
>  				    (void *)&lwmi_cd_table[i]=2Etype);
>  		if (IS_ERR(*matchptr))
> diff --git a/drivers/platform/x86/lenovo/wmi-other=2Ec b/drivers/platfor=
m/x86/lenovo/wmi-other=2Ec
> index e6c8f6bcf=2E=2Eb196e9926 100644
> --- a/drivers/platform/x86/lenovo/wmi-other=2Ec
> +++ b/drivers/platform/x86/lenovo/wmi-other=2Ec
> @@ -1704,6 +1704,8 @@ static int lwmi_other_probe(struct wmi_device *wde=
v, const void *context)
>  	lwmi_cd_match_add_all(&wdev->dev, &master_match);
>  	if (IS_ERR(master_match))
>  		return PTR_ERR(master_match);
> +	if (!master_match)
> +		return -ENODEV;
> =20
>  	return component_master_add_with_match(&wdev->dev, &lwmi_om_master_ops=
,
>  					       master_match);
>=20
> With that on top (built out of tree against 7=2E2=2E5), lenovo_wmi_other
> binds and exposes fan1 and fan4 (min 1500/1800, max 5100/5400, input
> matching the EC tach fields)=2E fanX_target pins both fans, 0 hands them
> back to the firmware curve, and out-of-range writes get -EINVAL=2E With
> the change above:
>=20
> Tested-by: Navon John Lukose <navonjohnlukose@gmail=2Ecom>

Good to know fan control works on your device=2E

Thanks,
Rong
