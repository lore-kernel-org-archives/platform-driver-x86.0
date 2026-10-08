Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63192D2381
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 14:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468085; cv=none; b=YIon/AFl7J5dm2D83nISjlfo3GpmfLZ/eQCtiKxojAv69tUbtgUD59VQZTIpOPcdfUjxdyLujRM6q/kUZdUQ6OeJQEOP96GHCqCwX+ZfRrJ6FY42AtsESAbAfIuAYcRUYZPGQ8MZBVAyp41u82cLQX8ydmgrkt4NxAlMQ+/5JUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468085; c=relaxed/simple;
	bh=wtsgXzdzW772t462jGglI26xUtnXk8tAMQT9HuAFRcI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=krMnaAXMKtatneCC9yIRBzJLaeHCRMwnZL/WJ2Wk1WQL6j3PPD1KrXoINkdbIgmMsU7WALC2G7drMJB7Dtt+iwD88fBt900i38cV9CIdNENL+K/TqZvZvr6JwDNC6Kj/Aaubur/HP1ttzKZM8JJVErH5d1DwfKz2mkjYW0AASDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=B5hsaUYM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=V5y5UuNQ; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="B5hsaUYM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="V5y5UuNQ"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 18A567A011A
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 10:01:23 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Thu, 08 Oct 2026 10:01:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1791468082;
	 x=1791554482; bh=r5MCL2Ka3EEO4/PrwUxyt9JzsOTCfxWKgRcWIq0sB58=; b=
	B5hsaUYMRn6PKm64g9O6d4tA/5ruQKrn4QyN7tkXqjGLZV809ZaFqnJUEQ4zv3mD
	GenWLTTR7AO9IyX1Z862BeXf2WpkvYySM3h/iUEmAHgyYPxZRzuOIQkuEd1PqO78
	U9O/fGQ5yX5FwOtBapOUdypW/PIVgTXWQxGKcQOIwbFFurT1NOKtImCp+yK1jHNz
	QbhzNmFcxrNCB+664xIp5cenST+Wqph+7dUvCPewV59Ipoe/Ndcq3BGnJagZ7Ab6
	UAL9L0FYcT4oZmOesu0KWfTaXSvmtMipIFfoZRAYGNOTl0g6JFQEkJQSqG3eW1EG
	QmnQtENjNsYolskuglcL7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791468082; x=
	1791554482; bh=r5MCL2Ka3EEO4/PrwUxyt9JzsOTCfxWKgRcWIq0sB58=; b=V
	5y5UuNQIFjEskbBYTz2QqRUsNiVJ2NTYE+1lymx6U76EfFC6EUF/kF8mA4bK9EHS
	5nizpTKo5tVw3vc6R3pPSUKlNk5dv/CuoQpKXtZA3++ZM7U6KtJcU5KchszISzfp
	UTQELVcfDNRyTDGiqdGbFLQqD4uKVP8z9xH4k13uvLErun8i7ChPvToRSz4eflZe
	nG+Z08y0MmLM43j5FOVC5MWQCb5BzH3P0bgOjF594fIrhIXjW+QsbpArBdH1YgTn
	VcCYenH6HSJa6Y3PHAZNSY54T34QdbAoPp1fJPSD1ilDcg4SA5MYWPwQ9HiOtaK5
	ji1sXffYr8cmKVLktLlIg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791468082; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm3:rsa-sha256:BB9jZW5/LqhBAopuyjYEFSR+xG15w4L8E8n+7Lr44j0aA9A
	0T9ZfVMGXEUqZ4kYCSXnFE9KmOaO2e/T8oLE/cDz75SXzmbNGrZfHKf8NU+9xx20
	nfaMbINPUu1iW7m+JydYsU1VFILQqlvSIbSQKGRlWHUOU7QUMLP3ReLDgyAgg15X
	Ow9spU4JzYSOefB4L8OQ/xItuphSHVRVvaCME5cdQZxo0N6qM+cOVPCF8PIu5QH4
	Va1P9xTPcGOvZINWQYRzxUWKZHEDQO7st6zJIYeWtY/VCmAsuLehDaaNKSfgkH/M
	duQ0OjVcb4LCzKKzcqwXHiOO/VBaJRaXzqzT/qg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:vASxxLqrbQ+WSM3jaCjlzGRqME/biHEqrSeTIyGxoNg=:wtsgXzdzW772t462jGglI26xUtnXk8tAMQT9HuAFRcI=;
X-ME-Sender: <xms:MqLHajI7eOKuY7TSEOswCX325NO4iljPmTJTrivdXSGFtkWWzkQmtw>
    <xme:MqLHah_0Bjzey-NgB-evkb1chVoVhtYi5d3P-CJ75GvmO4afKTXC86wT_X8iKFQwC
    PI51HuGqHbvEMb1rbcJZ7HuKA-tYw5aaJ1iM0Y3C1XhJ87vK8qNIZnJ>
X-ME-Proxy-Cause: dmFkZTFZ2Uc++oD7btFoBcevN6p250JYIi2Giz7UZrkDsbEdgyWwV6HmLNPPdtKwD0vmlx
    0iEg3GaGt3Hxb4p0JS1flQ1bO5cuPEyNzu/P32ZDEkyrtJS5eVC7NJeZz7+jFdCxraCsBc
    7dafM1B0qmmWcSka4PtuMU4ZKKW22CVivCxrpCjrnXpGCLdWA6vR/KmRUzMFf/11s0KrSl
    otBsgdqVoxh0/U+3a/MIKOupKX6Q1qQrVA5OV8BFwp7qUPQf/8chX6rfspP2mIxRABWhRQ
    7062fPrcxB8+oUDR2U99jfkLKbSt7EEQZ6+oPokr6kUIguVJKMU8cyr7qy0COa8M3H37lu
    1928Ny4enN403QBXS+KYogayiC34/XUTi1YhZvMpIrTh/5DBPprL0LeSd+NRP2VhgspSv8
    cNb2CeT3S4bSB1MhPyrK33nCsF5PbAtXyIB5f6cI9jqLLD8zl9osPMp84FmqZ+eAwVvXUD
    bgOnNCeYOPu7IgQdzQCvzaUKkUaSJ4OW+VgvmA/jqX3AIzw4b0gNWJhfOcz84RYjj/OFL8
    LD9NMUt9mO4g7bqNdyg93m+e/bWlYoYq00P2PKiYksWjfqUwB5SsRhNUMzi+JvFvP4Xebh
    S1mJHIhTKgG7lpJDNu4wvgeeqU2Veub1J/qgQbx6LMx1W7RmfS52VDe/4aCQ
X-ME-Proxy: <xmx:MqLHatpwk1dAi19uqZ2nQr7aCOnof4OWnhy-19Umcn8FsCJCPyVOeA>
    <xmx:MqLHasPP7k3KGQH0_L3pdFxjp-tl_b979e7BgqXKGp8hQHNkfmSYsg>
    <xmx:MqLHaurgwdKoQP7JAR8v4NEHEGrxYP21S71wnMrWqgBO-IYuEjLNMQ>
    <xmx:MqLHavsAzGBiVrvKHrrBABLIjchNZeuh6fDGEXI4gNe609407zsVDg>
    <xmx:MqLHapW6PSsvBRF8SN02RDKQ5XKMH3kp3tAcZ2gaXcGTcbLiw-u_apF7>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id E9DBD2C00076; Thu,  8 Oct 2026 10:01:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AroOoK2VWtDw
Date: Thu, 08 Oct 2026 10:01:01 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Rong Zhang" <i@rong.moe>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Armin Wolf" <W_Armin@gmx.de>, "Hans de Goede" <hansg@kernel.org>,
 Charles <hanker007@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "Navon John Lukose" <navonjohnlukose@gmail.com>
Message-Id: <aebd2a7e-dc65-43dd-8768-68d069d0786e@app.fastmail.com>
In-Reply-To: <65e44beb-740a-8d41-9e3e-2ef1fa6cd6f1@linux.intel.com>
References: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe>
 <20260926210415.3465939-1-navonjohnlukose@gmail.com>
 <E2EDCF4A-09BB-4FE7-9E67-5086401C0848@rong.moe>
 <9789f452-d7eb-4f1e-8a13-7335332193a7@app.fastmail.com>
 <55927121-62DB-43D7-B1BD-19519A775659@rong.moe>
 <83776200-4A60-4756-A99F-D5A3BB4D834A@rong.moe>
 <584854BC-16C5-44A1-83D1-63F6FDD51BEF@gmail.com>
 <8e0f9c12-2e6a-089b-387e-25fbdc3dd5d8@linux.intel.com>
 <372185f86fc1f5fbeddde42b1378a5d454f91e60.camel@rong.moe>
 <65e44beb-740a-8d41-9e3e-2ef1fa6cd6f1@linux.intel.com>
Subject: Re: [PATCH 0/9] platform/x86: lenovo-wmi-{other,capdata,helpers}: Improve
 robustness on buggy firmware
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Thu, Oct 8, 2026, at 7:47 AM, Ilpo J=C3=A4rvinen wrote:
> On Thu, 8 Oct 2026, Rong Zhang wrote:
>
>> Hi Ilpo,
>>=20
>> On Wed, 2026-10-07 at 23:54 +0300, Ilpo J=C3=A4rvinen wrote:
>> > On Wed, 7 Oct 2026, Derek J. Clark wrote:
>> >=20
>> > > On October 7, 2026 11:30:00 AM PDT, Rong Zhang <i@rong.moe> wrote:
>> > > > Hi Mark, Armin,
>> > > >=20
>> > > > =E4=BA=8E 2026=E5=B9=B49=E6=9C=8829=E6=97=A5 GMT+08:00 01:53:18=
=EF=BC=8CRong Zhang <i@rong.moe> =E5=86=99=E9=81=93=EF=BC=9A
>> > > > > Hi Mark,=20
>> > > > >=20
>> > > > > Thanks for the information.=20
>> > > > >=20
>> > > > > =E4=BA=8E 2026=E5=B9=B49=E6=9C=8829=E6=97=A5 GMT+08:00 00:04:=
14=EF=BC=8CMark Pearson <mpearson-lenovo@squebb.ca> =E5=86=99=E9=81=93=EF=
=BC=9A
>> > > > > >=20
>> > > > > >=20
>> > > > > > On Sat, Sep 26, 2026, at 11:01 PM, Rong Zhang wrote:
>> > > > > > > Hi Navon,
>> > > > > > >=20
>> > > > > > > Thanks a lot for your test.=20
>> > > > > > >=20
>> > > > > > >=20
>> > > > > > > =E4=BA=8E 2026=E5=B9=B49=E6=9C=8827=E6=97=A5 GMT+08:00 05=
:04:15=EF=BC=8CNavon John Lukose=20
>> > > > > > > <navonjohnlukose@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>> > > > > > > > Tested on a Yoga Pro 7 14IAH10 (83KF, BIOS QGCN35WW). N=
either mainline
>> > > > > > > > nor the series binds here. This firmware has no
>> > > > > > > > LENOVO_CAPABILITY_DATA_01 in _WDG at all, so no compone=
nt ever
>> > > > > > > > registers for that match and lwmi_om_master_bind() neve=
r runs. Skipping
>> > > > > > > > the match for GUIDs the firmware doesn't declare fixes =
it:
>> > > > > > > >=20
>> > > > > > > > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c =
b/drivers/platform/x86/lenovo/wmi-capdata.c
>> > > > > > > > index 805e36ef7..d64520be1 100644
>> > > > > > > > --- a/drivers/platform/x86/lenovo/wmi-capdata.c
>> > > > > > > > +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
>> > > > > > > > @@ -76,11 +76,13 @@ enum lwmi_cd_type {
>> > > > > > > >  #define LWMI_CD_TABLE_ITEM(_type)		\
>> > > > > > > >  	[_type] =3D {				\
>> > > > > > > >  		.name =3D #_type,			\
>> > > > > > > > +		.guid =3D _type##_GUID,		\
>> > > > > > > >  		.type =3D _type,			\
>> > > > > > > >  	}
>> > > > > > > > =20
>> > > > > > > >  static const struct lwmi_cd_info {
>> > > > > > > >  	const char *name;
>> > > > > > > > +	const char *guid;
>> > > > > > > >  	enum lwmi_cd_type type;
>> > > > > > > >  } lwmi_cd_table[] =3D {
>> > > > > > > >  	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
>> > > > > > > > @@ -166,6 +168,14 @@ void lwmi_cd_match_add_all(struct =
device *master, struct component_match **match
>> > > > > > > >  		if (lwmi_cd_table[i].type =3D=3D LENOVO_FAN_TEST_DAT=
A)
>> > > > > > > >  			continue;
>> > > > > > > > =20
>> > > > > > > > +		/*
>> > > > > > > > +		 * Some firmware does not declare every capdata GUID=
 at all, in
>> > > > > > > > +		 * which case no component would ever register for i=
t and the
>> > > > > > > > +		 * master could never bind.
>> > > > > > > > +		 */
>> > > > > > > > +		if (!wmi_has_guid(lwmi_cd_table[i].guid))
>> > > > > > > > +			continue;
>> > > > > > >=20
>> > > > > > > This was exactly what I did in the earlier revision while=
 I was=20
>> > > > > > > introducing the support for capdata00 and capdata_fan.
>> > > > > > >=20
>> > > > > > > The wmi_has_guid() approach was eventually replaced by th=
e=20
>> > > > > > > sub-component approach, because the use of the former is =
strongly=20
>> > > > > > > discouraged.
>> > > > > > >=20
>> > > > > > > In the next revision I am going to convert capdata01 into=
 a=20
>> > > > > > > sub-component, too. In this manner some heavy and complex=
 work in the=20
>> > > > > > > series will become needless and can be simplified. While =
the=20
>> > > > > > > sub-component approach itself is complex, we've had the i=
nfrastructure=20
>> > > > > > > to make it work. Therefore wiring it up should be a trivi=
al work.
>> > > > > > >=20
>> > > > > > > Mark, Derek,
>> > > > > > >=20
>> > > > > > > Do you know if there is any way to determine the existenc=
e of capdata01=20
>> > > > > > > using capdata00?=20
>> > > > > > >=20
>> > > > > > Note that I can see I'm afraid
>> > > >=20
>> > > > So there is no way to determine the existence of capdata01 usin=
g capdata00, correct?
>> > > >=20
>> > > > > >=20
>> > > > > > I'm guessing the patch Armin posted on my thread "[RFC PATC=
H 5/7] platform/x86: think-lmi: Initial ThinkLMI v2 driver" to check if =
it exists won't help here?
>> > > > >=20
>> > > > > After some consideration, it seems that we don't really need =
to determine the existence of capdata01 if we take the sub-component app=
roach, thanks to the fact that every functionality either depends on cap=
data00 or depends on capdata01, but never both.
>> > > >=20
>> > > > Unfortunately, it turned out that it can't resolve the issue by=
 simply converting capdata01 into a sub-component, unless a virtual devi=
ce is also created to split the component matching list into two, which =
is more like a dirty workaround.
>> > > >=20
>> > > > So yeah, the series needs the wmidev_exists() patch from Armin.=20
>> > > > Considering that the ThinkLMI v2 series is probably still at th=
e RFC=20
>> > > > stage, do you mind if I integrate the wmidev_exists() patch int=
o my=20
>> > > > series?=20
>> > >=20
>> > > Rong/Mark,
>> > >=20
>> > > My $0.02, I don't think it matters who sends it up. If Ilpo is ok=
ay with=20
>> > > it of course, both series should include it as a prerequisite 1/X=
 and=20
>> > > whichever gets picked up first will get into next. Then that patc=
h can=20
>> > > be omitted from the other series when it gets picked. That way bo=
th=20
>> > > series will build if you apply the mbox onto next until one is me=
rged.
>> >=20
>> > Hi,
>> >=20
>> > For me it's fine either way:
>> >=20
>> > 1) Have the same patch in both series.
>> >=20
>> > 2) If we know for sure we need the API anyway, just add it as a sta=
ndalone=20
>> > in advance.
>> >=20
>> > I suppose 2 would be slightly simpler but it's up to you which way =
you=20
>> > prefer.
>> >=20
>> > Lets not make things more complicated than they have to be. :-)
>>=20
>> Thanks for you suggestion.
>>=20
>> The v2 patch is almost ready, and I will submit it today or tomorrow.=
 It
>> will anyway depend on the wmidev_exists() patch to build, so I'd pref=
er
>> 1.
>>=20
>> Or we can combine 1 and 2 -- do a subset apply with the wmidev_exists=
()
>> patch if it looks good but my v2 series has issues. Then Mark and I c=
an
>> rebase and resubmit.
>
> I've no problem in taking only a part of series as needed, if you pref=
er=20
> that.
>
> Armin had something to say about the interface but I suppose you saw t=
hat=20
> already.
>

I'm still a bit away from having it ready on my side so Rong, go for it =
(with Armin's original - I'll just have to refactor to handle that)

Mark
