Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6D725B0A3;
	Wed,  7 Oct 2026 23:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791416655; cv=none; b=oIc6jPA+dFRToO7tsy/pl9FzQ9hUff33mQDiU1If264cVIODfIUS/HytLIwUUzwJQ8bsiV5nfDv4/FrtiSjO03dJqVSg6pERjNtMKtMM4mVK7kXyr9GAU3yw8ogkx6LQH33IuEkXDfax19fB+bCUSG0kd1qMCn+5RKuKsTZf+T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791416655; c=relaxed/simple;
	bh=hZUQTBvTntYZs5u4UA0Wuig0RWefRaDVQOgeEa9hVSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GReEuNSSH9PTCG4HURi81VZ5zQv+hKW10rd0oGDkvT7q+S3EYaK3eAZSllq1z8QEDjOWCCivWokuDYjt5NgPtb3HhYJbcqi460fzJHfk0RWTssHGfPyzt4Ac6LU5mpOaudV2Rl15eqxugdzukJkZYKM4SJmBDhpKV0p9NUp4jzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=MYtxKXC+; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="MYtxKXC+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1791416642; x=1792021442; i=w_armin@gmx.de;
	bh=mJPm7JAXv3BGT32sDIBt+jvuD6OBugXLbQSo/S2cw9Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MYtxKXC+m0nOIKnZNBXqXR8VFiaMBLLYORyh1MgC9d+L4+CbcZ0CPLYEM1Re09hy
	 SRCmz0mUZpKYwIEPd/aZX1+eeAYMhvIAXjxKcaHW4T1hjcpEGlHAC5sT8CM3eslhv
	 OZHfM/vEQGXbWclo+QdhG6wf+11sewMNgkm29BhxLCPD/Rj/qo0FMAXXoK7oC5WgY
	 SS8ArJ5/IhxLxOO+iasTQw2lME/y/t1t2NHftbPR7b+Q4oiAp+e63+iD54A81d0Uf
	 6ec9GDq2Bowv4b1xPa34iB0UXE865oJXrMhoOa1lvR0dlTsvsDIlPGDkFlNX41N7y
	 9fM6yE0f2wL8ElT/+A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpDNl-1wtIvW3hPT-00eCV1; Thu, 08
 Oct 2026 01:44:01 +0200
Message-ID: <a0130834-fc61-48ca-ac0a-d065ce3bfeae@gmx.de>
Date: Thu, 8 Oct 2026 01:44:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] platform/x86: lenovo-wmi-{other,capdata,helpers}:
 Improve robustness on buggy firmware
To: Mark Pearson <mpearson-lenovo@squebb.ca>, Rong Zhang <i@rong.moe>
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Charles <hanker007@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Navon John Lukose <navonjohnlukose@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>
References: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe>
 <20260926210415.3465939-1-navonjohnlukose@gmail.com>
 <E2EDCF4A-09BB-4FE7-9E67-5086401C0848@rong.moe>
 <9789f452-d7eb-4f1e-8a13-7335332193a7@app.fastmail.com>
 <55927121-62DB-43D7-B1BD-19519A775659@rong.moe>
 <83776200-4A60-4756-A99F-D5A3BB4D834A@rong.moe>
 <5a450006-528b-454b-b3b9-01c1639d8fdf@app.fastmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <5a450006-528b-454b-b3b9-01c1639d8fdf@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jmbBBuInSpS4IGwj9XoXzbLN0MAytBE6ojT1QdckAhK4p4/Nb6U
 9VaRgrNVpLJfLpCllMufUFj7Bv/Xpi/HE064qqc/au3jvU82J0AFyeXW2q85HTs5qVRMlVh
 5W/j4V0ev5kNdI7+oqKlat/WlYnfcvV3Q1Mk3fW9ugAMlE9py0RaTQ+SEMpYJAH218HDWWh
 LTojuRqCzOZFdlSEVqS2g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UxEWXSFNAsw=;bydRAjtCJHTzOEe3xjvWVn166Mm
 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
 MAKca1OkbOA=

Am 07.10.26 um 21:25 schrieb Mark Pearson:

>
> On Wed, Oct 7, 2026, at 2:30 PM, Rong Zhang wrote:
>> Hi Mark, Armin,
>>
>> =E4=BA=8E 2026=E5=B9=B49=E6=9C=8829=E6=97=A5 GMT+08:00 01:53:18=EF=BC=
=8CRong Zhang <i@rong.moe> =E5=86=99=E9=81=93=EF=BC=9A
>>> Hi Mark,
>>>
>>> Thanks for the information.
>>>
>>> =E4=BA=8E 2026=E5=B9=B49=E6=9C=8829=E6=97=A5 GMT+08:00 00:04:14=EF=BC=
=8CMark Pearson <mpearson-lenovo@squebb.ca> =E5=86=99=E9=81=93=EF=BC=9A
>>>>
>>>> On Sat, Sep 26, 2026, at 11:01 PM, Rong Zhang wrote:
>>>>> Hi Navon,
>>>>>
>>>>> Thanks a lot for your test.
>>>>>
>>>>>
>>>>> =E4=BA=8E 2026=E5=B9=B49=E6=9C=8827=E6=97=A5 GMT+08:00 05:04:15=EF=
=BC=8CNavon John Lukose
>>>>> <navonjohnlukose@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>>>>>> Tested on a Yoga Pro 7 14IAH10 (83KF, BIOS QGCN35WW). Neither mainl=
ine
>>>>>> nor the series binds here. This firmware has no
>>>>>> LENOVO_CAPABILITY_DATA_01 in _WDG at all, so no component ever
>>>>>> registers for that match and lwmi_om_master_bind() never runs. Skip=
ping
>>>>>> the match for GUIDs the firmware doesn't declare fixes it:
>>>>>>
>>>>>> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/pl=
atform/x86/lenovo/wmi-capdata.c
>>>>>> index 805e36ef7..d64520be1 100644
>>>>>> --- a/drivers/platform/x86/lenovo/wmi-capdata.c
>>>>>> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
>>>>>> @@ -76,11 +76,13 @@ enum lwmi_cd_type {
>>>>>>   #define LWMI_CD_TABLE_ITEM(_type)		\
>>>>>>   	[_type] =3D {				\
>>>>>>   		.name =3D #_type,			\
>>>>>> +		.guid =3D _type##_GUID,		\
>>>>>>   		.type =3D _type,			\
>>>>>>   	}
>>>>>>  =20
>>>>>>   static const struct lwmi_cd_info {
>>>>>>   	const char *name;
>>>>>> +	const char *guid;
>>>>>>   	enum lwmi_cd_type type;
>>>>>>   } lwmi_cd_table[] =3D {
>>>>>>   	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
>>>>>> @@ -166,6 +168,14 @@ void lwmi_cd_match_add_all(struct device *mast=
er, struct component_match **match
>>>>>>   		if (lwmi_cd_table[i].type =3D=3D LENOVO_FAN_TEST_DATA)
>>>>>>   			continue;
>>>>>>  =20
>>>>>> +		/*
>>>>>> +		 * Some firmware does not declare every capdata GUID at all, in
>>>>>> +		 * which case no component would ever register for it and the
>>>>>> +		 * master could never bind.
>>>>>> +		 */
>>>>>> +		if (!wmi_has_guid(lwmi_cd_table[i].guid))
>>>>>> +			continue;
>>>>> This was exactly what I did in the earlier revision while I was
>>>>> introducing the support for capdata00 and capdata_fan.
>>>>>
>>>>> The wmi_has_guid() approach was eventually replaced by the
>>>>> sub-component approach, because the use of the former is strongly
>>>>> discouraged.
>>>>>
>>>>> In the next revision I am going to convert capdata01 into a
>>>>> sub-component, too. In this manner some heavy and complex work in th=
e
>>>>> series will become needless and can be simplified. While the
>>>>> sub-component approach itself is complex, we've had the infrastructu=
re
>>>>> to make it work. Therefore wiring it up should be a trivial work.
>>>>>
>>>>> Mark, Derek,
>>>>>
>>>>> Do you know if there is any way to determine the existence of capdat=
a01
>>>>> using capdata00?
>>>>>
>>>> Note that I can see I'm afraid
>> So there is no way to determine the existence of capdata01 using
>> capdata00, correct?
>>
>>>> I'm guessing the patch Armin posted on my thread "[RFC PATCH 5/7] pla=
tform/x86: think-lmi: Initial ThinkLMI v2 driver" to check if it exists wo=
n't help here?
>>> After some consideration, it seems that we don't really need to determ=
ine the existence of capdata01 if we take the sub-component approach, than=
ks to the fact that every functionality either depends on capdata00 or dep=
ends on capdata01, but never both.
>> Unfortunately, it turned out that it can't resolve the issue by simply
>> converting capdata01 into a sub-component, unless a virtual device is
>> also created to split the component matching list into two, which is
>> more like a dirty workaround.
>>
>> So yeah, the series needs the wmidev_exists() patch from Armin.
>> Considering that the ThinkLMI v2 series is probably still at the RFC
>> stage, do you mind if I integrate the wmidev_exists() patch into my
>> series?
>>
> Making good progress on that series but it's going to be a bit before it=
's ready for v1 submit as it's a significant rewrite.
>
> No issues with wmidev_exists going in beforehand, but suggest we do it a=
s a standalone all by itself patch so it doesn't get tied in to either of =
our review chains. Armin - does it make sense for you to push it? I'll hap=
pily add a tested-by tag.
>
> Rong - As a note, I made a change to use a GUID string as input (I'll pa=
ste below to save you having to hunt for the email thread). If Armin is OK=
 with it, I'd rather use this version.
>
> Mark
>
> bool wmidev_exists(const char *guid_string)
> {
>          guid_t guid;
>          int ret;
>
>          ret =3D guid_parse(guid_string, &guid);
>          if (ret < 0)
>                  return false;
>
>          return bus_for_each_dev(&wmi_bus_type, NULL, (void *)&guid, wmi=
dev_match_guid) =3D=3D 1;
> }

I would prefer to use guid_t, because i intent for the WMI subsystem to mo=
ve away from GUID strings
in the future.

Thanks,
Armin Wolf

