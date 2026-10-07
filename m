Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2324E378F
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 19:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791401177; cv=none; b=MXExFNzg1no7CjM8AAFmPXfnZT4i62St1aDJdAYfipP/OA4esDag7lOUQWi+WzwWuY3KBHgUHERYHAkdRaCw1/IgqZiQd41IcYc5aUdfzm8rLDRygeCPkdfoPNjLnCpR546JwhBz/oLmdLEOpaqrqc66giIEIpujVAujETWMrw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791401177; c=relaxed/simple;
	bh=WzX605J6b/rvgqkHBzpnOfsw0btdfH60FunC87rQCPg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=RdEn+ZcFSOHcU43TJg1WNWn1pecP4nnkiUcKALw8MCa5nsHtK42Iy0IlYFaOLqc979Qs6RjsJByZ7USrH7GygZofEOUusJaMStJA0SCrgNmjZ7P2/FdTaOM4Lq/jz1Ht/Qgmnjggs5PvXM6X9pae2R1zmNxj96wzha2Qn3oxjGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=a8lF0dHt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ny6jWIk/; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="a8lF0dHt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ny6jWIk/"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 071811400112
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 15:26:03 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Wed, 07 Oct 2026 15:26:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1791401161;
	 x=1791487561; bh=LtB8jjXRMkrhWwfEm1RpP+44WsKUBOHfF2LfBNaebqU=; b=
	a8lF0dHt3YaGZwGWF92wogdluxAGQ4iPryPmx2/3DfAqvSFUCqgWSPrlWj0oU72b
	JUFOjYKQke03Y//KE0FoiF9j6i+XuOmDIuq8icpjTexL7WVyjKF1/F/zEXV1rnE4
	1BN0U+mUss/JpQZRV34j43KtkFT0FNOX71Ja0K4lHeiBhsiyTX7/e+xeUxV3QQpI
	vaJDXqqoDARzNqKbavaZXWQAABvS0NtAyo3BNuyc9lLOpFq5Cf3MOzVNgZiswhyv
	cNQVFMnX7qfa5hN6xPixUnh169QLCM49y2nStJFfZzWhnFXv3OEl5VgH7uRzfT4G
	JVXb/YpGLOFwodIuVpTQ1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791401161; x=
	1791487561; bh=LtB8jjXRMkrhWwfEm1RpP+44WsKUBOHfF2LfBNaebqU=; b=N
	y6jWIk/Xqo3Cb7csWjglVxuZJ3ri2JRPVJwENEHrdnrgsjtMUQsu6tbS1yw4aUdC
	gX/YY8j8J1v43JbfuhtE/gRXA7TUYb+yeKuG+GiirdisFn5fRDAiAOiIa/6cVakx
	lbbd5xHyjHcq7pBB4r/U9YN8u9uC8N0CcNIws6S2puwtUdUbQ3lW3wMcRoXA5BRS
	K/xhXhloaO22nhFQGotM3aHwyCtO++N3nIKMN/f/cC7zvCjm/ByV9ddTEgBuBW9c
	uKbJcN+fP+cLEKJsyeo1WXDa1RlHEyvbQNBwTJvba+yZ2HKrVQ6NWM43ngaeZsJS
	gRE8EI861HNj2/kQsQTjg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791401161; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm3:rsa-sha256:Tr1U45ZJuno0bFEBIrQSpIQM5brJxrpyNCiXrq9P9HB/MSv
	Xsg9EVSMsXg9cK5H5FqQaSgGJmhcy5VdopYX8Trs+f+j6fL3G9YMiVqCm3mbgphD
	bEMj3o/Npv0jsxww/mh6I6mVzpMqBx3lzBzio1QCRR4SUfibxdkK8d+BdT5IJEe3
	8jY6k0gxc+4zvW1gG/yX+Nh9BOpedxMNZ0JH1lbSPpQ2M3MeWXJtfAhM4cbNz62J
	Atmrbe4TV7siZGyAp1/TE6XXjr7pTEWgQCLE7ceS4ywRDnp7z8I72dHqOOzd8Jqp
	TOu0wcolNK5mb9H0d7F5kJ3D37evvYjC2fSbkMA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:ffnKCFFpwtnreVOgsmgarNcg7YtPz1dJVYBuILEKqSQ=:WzX605J6b/rvgqkHBzpnOfsw0btdfH60FunC87rQCPg=;
X-ME-Sender: <xms:yJzGaq518HUqEYEfD6knN54gvTKkh9jbkKadLjTAMVy9A_91lYW6fQ>
    <xme:yJzGautCE30obwnP_qmb3jww87Yz1sQNvvrz-ABMuvwUiQWdiLWJ58gY-yUt0dfzo
    9dAAToMDHuhbWtIdxvcM0AbfSI_UbZK957F8GK-fF7uIB8QYxGqD67s>
X-ME-Proxy-Cause: dmFkZTFpDoEr5VhtvtLSQ2ZhAaxN5w9M1MvCRowyR8QaRELu5LCrqQsHgzQCxZWo15Ligc
    0oRqF2PjFyb00yslIBF3UY8AhjUonRMgNpZD341hoDp+ruHLnKWqiu20RPMTGINb8+grjY
    Xs+MgUMu3x5vxB47/Blx6btYytzOW33R0UUK6IogKOTQjFG2GwuX6KO9IvysOyZAdvAGnX
    qgnWeOg8V89HgDGA86nzJ8zHRrCcxY9t4Cwi1vkze9Uma8mpGpE8jT2nQcXEEBT3XSwdkp
    tlIyq0NhGW4Ym3CG6YP0/WFGew5AGodBB9xjGLJ3NZRPo6jpKVufMs7/aOJTS7SuoRD3MY
    OMO1J2oiX5sFKGx4FfzuhdgdGBtRwNwe9+vz47ZVkt8o8esYot2Ouh6d5Ld89Rs1pE8FZp
    VUicmsqWA988aXnW8XFaCh+aq06olhod5twb6OzjKr9G9IYvkfwquT8YCGN+HfgbKyOD5i
    XdxPYnInPu05TqcvlIWUSzUPbphCXLX/FxcpAkmW8yIdm8lRuxw0+TEz79oLPJ5Z1/I4i8
    R6Ua17BZxr2JcdXQaHYLJDegv59v9jNalUo7kJkj4vOj/CEWuCORR//0ipjFObAPAlanyr
    wh0ip2JCnfNzd56AmudjbLknxvpq84cUKfnmqo64iKUt4OvfV/86v+awHjBg
X-ME-Proxy: <xmx:yZzGavZrQ8L0aMCV7iHQZz6bATag_8QYgM3EBjTTl9guQlKJqfJMSw>
    <xmx:yZzGaq_iR5zKaKdqy8yg20QktoHxmghpwQbl17dl-6J_T8yh-lRe3w>
    <xmx:yZzGamb3Pk8y2CBN2-W1UR9M4Arj5Vq4g3Gpd4QGIfF2A528LkBHyg>
    <xmx:yZzGasf7kQYFC9XpNh6w3hK61bxkKy1cywur1qSkSz6TcwIIUpiolA>
    <xmx:yZzGahGJeOhx5t02x8eN0sdKvx8t_d1lix6azWWgK1TcIRSnUCcjVSZF>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id DEC662C00076; Wed,  7 Oct 2026 15:26:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AroOoK2VWtDw
Date: Wed, 07 Oct 2026 15:25:40 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Armin Wolf" <W_Armin@gmx.de>
Cc: "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Charles <hanker007@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "Navon John Lukose" <navonjohnlukose@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>
Message-Id: <5a450006-528b-454b-b3b9-01c1639d8fdf@app.fastmail.com>
In-Reply-To: <83776200-4A60-4756-A99F-D5A3BB4D834A@rong.moe>
References: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe>
 <20260926210415.3465939-1-navonjohnlukose@gmail.com>
 <E2EDCF4A-09BB-4FE7-9E67-5086401C0848@rong.moe>
 <9789f452-d7eb-4f1e-8a13-7335332193a7@app.fastmail.com>
 <55927121-62DB-43D7-B1BD-19519A775659@rong.moe>
 <83776200-4A60-4756-A99F-D5A3BB4D834A@rong.moe>
Subject: Re: [PATCH 0/9] platform/x86: lenovo-wmi-{other,capdata,helpers}: Improve
 robustness on buggy firmware
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Wed, Oct 7, 2026, at 2:30 PM, Rong Zhang wrote:
> Hi Mark, Armin,
>
> =E4=BA=8E 2026=E5=B9=B49=E6=9C=8829=E6=97=A5 GMT+08:00 01:53:18=EF=BC=8C=
Rong Zhang <i@rong.moe> =E5=86=99=E9=81=93=EF=BC=9A
>> Hi Mark,=20
>>=20
>> Thanks for the information.=20
>>=20
>> =E4=BA=8E 2026=E5=B9=B49=E6=9C=8829=E6=97=A5 GMT+08:00 00:04:14=EF=BC=
=8CMark Pearson <mpearson-lenovo@squebb.ca> =E5=86=99=E9=81=93=EF=BC=9A
>> >=20
>> >=20
>> > On Sat, Sep 26, 2026, at 11:01 PM, Rong Zhang wrote:
>> > > Hi Navon,
>> > >
>> > > Thanks a lot for your test.=20
>> > >
>> > >
>> > > =E4=BA=8E 2026=E5=B9=B49=E6=9C=8827=E6=97=A5 GMT+08:00 05:04:15=EF=
=BC=8CNavon John Lukose=20
>> > > <navonjohnlukose@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>> > >> Tested on a Yoga Pro 7 14IAH10 (83KF, BIOS QGCN35WW). Neither ma=
inline
>> > >> nor the series binds here. This firmware has no
>> > >> LENOVO_CAPABILITY_DATA_01 in _WDG at all, so no component ever
>> > >> registers for that match and lwmi_om_master_bind() never runs. S=
kipping
>> > >> the match for GUIDs the firmware doesn't declare fixes it:
>> > >>=20
>> > >> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers=
/platform/x86/lenovo/wmi-capdata.c
>> > >> index 805e36ef7..d64520be1 100644
>> > >> --- a/drivers/platform/x86/lenovo/wmi-capdata.c
>> > >> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
>> > >> @@ -76,11 +76,13 @@ enum lwmi_cd_type {
>> > >>  #define LWMI_CD_TABLE_ITEM(_type)		\
>> > >>  	[_type] =3D {				\
>> > >>  		.name =3D #_type,			\
>> > >> +		.guid =3D _type##_GUID,		\
>> > >>  		.type =3D _type,			\
>> > >>  	}
>> > >> =20
>> > >>  static const struct lwmi_cd_info {
>> > >>  	const char *name;
>> > >> +	const char *guid;
>> > >>  	enum lwmi_cd_type type;
>> > >>  } lwmi_cd_table[] =3D {
>> > >>  	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
>> > >> @@ -166,6 +168,14 @@ void lwmi_cd_match_add_all(struct device *m=
aster, struct component_match **match
>> > >>  		if (lwmi_cd_table[i].type =3D=3D LENOVO_FAN_TEST_DATA)
>> > >>  			continue;
>> > >> =20
>> > >> +		/*
>> > >> +		 * Some firmware does not declare every capdata GUID at all, =
in
>> > >> +		 * which case no component would ever register for it and the
>> > >> +		 * master could never bind.
>> > >> +		 */
>> > >> +		if (!wmi_has_guid(lwmi_cd_table[i].guid))
>> > >> +			continue;
>> > >
>> > > This was exactly what I did in the earlier revision while I was=20
>> > > introducing the support for capdata00 and capdata_fan.
>> > >
>> > > The wmi_has_guid() approach was eventually replaced by the=20
>> > > sub-component approach, because the use of the former is strongly=20
>> > > discouraged.
>> > >
>> > > In the next revision I am going to convert capdata01 into a=20
>> > > sub-component, too. In this manner some heavy and complex work in=
 the=20
>> > > series will become needless and can be simplified. While the=20
>> > > sub-component approach itself is complex, we've had the infrastru=
cture=20
>> > > to make it work. Therefore wiring it up should be a trivial work.
>> > >
>> > > Mark, Derek,
>> > >
>> > > Do you know if there is any way to determine the existence of cap=
data01=20
>> > > using capdata00?=20
>> > >
>> > Note that I can see I'm afraid
>
> So there is no way to determine the existence of capdata01 using=20
> capdata00, correct?
>
>> >=20
>> > I'm guessing the patch Armin posted on my thread "[RFC PATCH 5/7] p=
latform/x86: think-lmi: Initial ThinkLMI v2 driver" to check if it exist=
s won't help here?
>>=20
>> After some consideration, it seems that we don't really need to deter=
mine the existence of capdata01 if we take the sub-component approach, t=
hanks to the fact that every functionality either depends on capdata00 o=
r depends on capdata01, but never both.
>
> Unfortunately, it turned out that it can't resolve the issue by simply=20
> converting capdata01 into a sub-component, unless a virtual device is=20
> also created to split the component matching list into two, which is=20
> more like a dirty workaround.
>
> So yeah, the series needs the wmidev_exists() patch from Armin.=20
> Considering that the ThinkLMI v2 series is probably still at the RFC=20
> stage, do you mind if I integrate the wmidev_exists() patch into my=20
> series?
>

Making good progress on that series but it's going to be a bit before it=
's ready for v1 submit as it's a significant rewrite.

No issues with wmidev_exists going in beforehand, but suggest we do it a=
s a standalone all by itself patch so it doesn't get tied in to either o=
f our review chains. Armin - does it make sense for you to push it? I'll=
 happily add a tested-by tag.

Rong - As a note, I made a change to use a GUID string as input (I'll pa=
ste below to save you having to hunt for the email thread). If Armin is =
OK with it, I'd rather use this version.

Mark

bool wmidev_exists(const char *guid_string)
{
        guid_t guid;
        int ret;

        ret =3D guid_parse(guid_string, &guid);
        if (ret < 0)
                return false;

        return bus_for_each_dev(&wmi_bus_type, NULL, (void *)&guid, wmid=
ev_match_guid) =3D=3D 1;
}
