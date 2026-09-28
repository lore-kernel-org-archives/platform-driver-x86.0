Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEC24E9C35;
	Mon, 28 Sep 2026 16:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611481; cv=none; b=g8mGQ9cwL3twn0Ty4JX4ADBab9hqYS5cjkp0IrRtEfXei4L6bHtHH11pKgStVBsoIHcXFh7yEmwJXkIOAWFxJbeRmQDZbItamTpL/GvfOLJbCxoYcd0xo/afrUrvZespIaTjb8AbcuCAuv0lyG1vJJJEJhu097GnDc1ork+ZbtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611481; c=relaxed/simple;
	bh=kLAEqDfcOEQkYPaPET7sqGm5ZgtB69lUgsMpgvGJVuI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=l9eTsWuy/fj+6Kd+u2ii7Y6jxEJqwQNSHsYauO0yKyTU7ymMVQhHaT07UiioEQty2S68FfvLw5ygCd5lJEbhrpaoZM0uQcFy2lHbOmaE8pqeSl0+DOlmqv52/NKnHO7j7hIK+K7/MqOKV11mOkgeYXNlxUkymbCpfaKBLSqz0Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=AHuv0fKJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NDzFJj3d; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="AHuv0fKJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NDzFJj3d"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.phl.internal (Postfix) with ESMTP id A7D18EC01A7;
	Mon, 28 Sep 2026 12:04:35 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Mon, 28 Sep 2026 12:04:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1790611475;
	 x=1790697875; bh=FBClQ+EexY9feoQdkCK7Xc+PSc1xhp686fs+Ui5fngQ=; b=
	AHuv0fKJwTyUYX7rBzg0V3CKKGPTw1642PxJ5dALtySm/LFcLRCRKg8J8FKzLK/2
	qSMUoW2uxuSlBQHRD6hTYhu02GfgrfqV9FIBjMr0I++l1jLSU6zwmaYLN08ep1Jm
	c8v7/LHJ+0Tvo/n0AyeSsmn/YGnz7sZvYFEeyBRQuP7kNkPDvAaAn5Vr/ePyMckS
	VLKuiSTBzUNtt/K+QhlTG69luoq5Zr9CyCJxohBNWsix5gimxS//ES4ZBBBZXIh2
	PR7yThXflvvsPC4Loz7rzsX0+Eec8MAv/uuN4Fb1mPhYFpC3c/QYRQh+I3OVofil
	tY9D4Q6sGZMNfDyOxDq6ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790611475; x=
	1790697875; bh=FBClQ+EexY9feoQdkCK7Xc+PSc1xhp686fs+Ui5fngQ=; b=N
	DzFJj3dejjgO8Lf4JMBff9ODhbd4f+mWdpTBQNj78qUeX4ozzQ3I7nK4pze42vu+
	NMKi67mG6ao5EPqYz+uP2s+7UpWWR5cGiwjG9+bRIqcDU/gAcqAAMeiBSUMOnN34
	eAjGd4Y8KLmeM9DHF1T6VRrHipHq3hOgTk1AQfkRMftFtzRM2HxkORmlqiN3oJtT
	2nndAoVYsW69LLFKkKGKDdtkhWMz+pCPkaZtcJ07dYhD1n/Iq82yZMZLsOPmQVCs
	Y17I3Kfu32J+Zl9OtDrFvzBnHZ+1ptG6AO35FdXl1AJFLo+yY8tFO48WuX8KYNYz
	1BFQ10+cZfHRb8DF07k0Q==
X-ME-Sender: <xms:E5C6ajZxKFhSzv_Y-vUOMYErkw1gHJvlEs5cYLTPrfwWX5NjfpBoxQ>
    <xme:E5C6atOLRewmywHRv-qsfB7468p_syT5YjtarZMW8e4_-c_XtFwp12UAijYyR71Kd
    qxGLGDUemc1lSvmenXWhPWz-Dzelttux36a8RqwkKra2qDiutOwFILQ>
X-ME-Proxy-Cause: dmFkZTFMvyW5IyQ+AiVUIx/VcIGi15l0kCSJVcp2PvhquDuHMkTPJtvqAiJiH3hTIG8zch
    nKHcOFC/KQwBSQubL/cIHDt7G4qoDTZgKx0caURUc0XxiG7U/24+fHx4EutLyBfn4D45Jr
    ac2Vc+gKgx7QP4ck89tG6FBH3c+O5vwdHeH7z3mOY5bwOcGR9GvmyYp7EfcnYH0USlUAxO
    DdORm1w743S11FTH8Xyhu+T8TTe24S0NfGRYVQQkts0ExV2W3JeZPr0KmXWEQldjK0d4p4
    ZwjwzeIKjl98pvNeGQ2xyWa2/TIXTWCYnsyRxeDSWyh1ZTkO4bog1WnfWotUXZukWuCKnM
    3ZbI5GXGiPBmwqd9oL9LO+tW9YaMXl7tP3L7MRO6U4fq0kgxhQLfx6fFt1TC6aVPoNyUEX
    gmlBonyInsOraauYG9hxDb4e+iB0TIIkORGuUgWZSP8vl5g8w3UURoIfkGufnIvP1J9+TO
    9gv0Dre684faX4OcTDbz8VRlYdCar1AqJK/64N9d8Xju7HUZWrbohmCQ1ZqyFo1x61JenN
    b51pr9Q88BUzOQVQDjsD8ZkR5KBuMoALOZZouofbcrgAylWt6vivLPATJs6K3bQDv2yc9G
    nd+DvhfQeB1bL/GHEhebrAlkoCmukhUfImuUT6Cw9ElPEBCYerAU6ZV+C8DA
X-ME-Proxy: <xmx:E5C6aj7S3Q0Ef15LU_AO4fNaBgRwnE5_8jLVCFekGGso4ABEcJw-ew>
    <xmx:E5C6alcfSj8fIpkKmi4na2OvmtpYrZAfvo4bxj8oxwgDfUkYuyOG_g>
    <xmx:E5C6au66kVSAaeP7HmQnz0kn8KIhkL6y4hnoPlJzpw3ppzECXTIfQA>
    <xmx:E5C6aq9s29e48mFZXYrV1GedwthOa_U01z4NZNamNDLxSKD6DzbApA>
    <xmx:E5C6apncGMCBlSdwoevlAfXqFH8JTyRHdeI_8f6WXMpwVxXhJJOBA13C>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 2848F2C00071; Mon, 28 Sep 2026 12:04:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AroOoK2VWtDw
Date: Mon, 28 Sep 2026 12:04:14 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>,
 "Navon John Lukose" <navonjohnlukose@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>
Cc: "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Armin Wolf" <W_Armin@gmx.de>, Charles <hanker007@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <9789f452-d7eb-4f1e-8a13-7335332193a7@app.fastmail.com>
In-Reply-To: <E2EDCF4A-09BB-4FE7-9E67-5086401C0848@rong.moe>
References: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe>
 <20260926210415.3465939-1-navonjohnlukose@gmail.com>
 <E2EDCF4A-09BB-4FE7-9E67-5086401C0848@rong.moe>
Subject: Re: [PATCH 0/9] platform/x86: lenovo-wmi-{other,capdata,helpers}: Improve
 robustness on buggy firmware
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Sat, Sep 26, 2026, at 11:01 PM, Rong Zhang wrote:
> Hi Navon,
>
> Thanks a lot for your test.=20
>
>
> =E4=BA=8E 2026=E5=B9=B49=E6=9C=8827=E6=97=A5 GMT+08:00 05:04:15=EF=BC=8C=
Navon John Lukose=20
> <navonjohnlukose@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>> Tested on a Yoga Pro 7 14IAH10 (83KF, BIOS QGCN35WW). Neither mainline
>> nor the series binds here. This firmware has no
>> LENOVO_CAPABILITY_DATA_01 in _WDG at all, so no component ever
>> registers for that match and lwmi_om_master_bind() never runs. Skippi=
ng
>> the match for GUIDs the firmware doesn't declare fixes it:
>>=20
>> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/plat=
form/x86/lenovo/wmi-capdata.c
>> index 805e36ef7..d64520be1 100644
>> --- a/drivers/platform/x86/lenovo/wmi-capdata.c
>> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
>> @@ -76,11 +76,13 @@ enum lwmi_cd_type {
>>  #define LWMI_CD_TABLE_ITEM(_type)		\
>>  	[_type] =3D {				\
>>  		.name =3D #_type,			\
>> +		.guid =3D _type##_GUID,		\
>>  		.type =3D _type,			\
>>  	}
>> =20
>>  static const struct lwmi_cd_info {
>>  	const char *name;
>> +	const char *guid;
>>  	enum lwmi_cd_type type;
>>  } lwmi_cd_table[] =3D {
>>  	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
>> @@ -166,6 +168,14 @@ void lwmi_cd_match_add_all(struct device *master=
, struct component_match **match
>>  		if (lwmi_cd_table[i].type =3D=3D LENOVO_FAN_TEST_DATA)
>>  			continue;
>> =20
>> +		/*
>> +		 * Some firmware does not declare every capdata GUID at all, in
>> +		 * which case no component would ever register for it and the
>> +		 * master could never bind.
>> +		 */
>> +		if (!wmi_has_guid(lwmi_cd_table[i].guid))
>> +			continue;
>
> This was exactly what I did in the earlier revision while I was=20
> introducing the support for capdata00 and capdata_fan.
>
> The wmi_has_guid() approach was eventually replaced by the=20
> sub-component approach, because the use of the former is strongly=20
> discouraged.
>
> In the next revision I am going to convert capdata01 into a=20
> sub-component, too. In this manner some heavy and complex work in the=20
> series will become needless and can be simplified. While the=20
> sub-component approach itself is complex, we've had the infrastructure=20
> to make it work. Therefore wiring it up should be a trivial work.
>
> Mark, Derek,
>
> Do you know if there is any way to determine the existence of capdata0=
1=20
> using capdata00?=20
>
Note that I can see I'm afraid

I'm guessing the patch Armin posted on my thread "[RFC PATCH 5/7] platfo=
rm/x86: think-lmi: Initial ThinkLMI v2 driver" to check if it exists won=
't help here?

Mark
