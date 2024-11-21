Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D741ABEB0
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 22:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732227677; cv=none; b=XSTCa2W2Knc9YtXYjprgHYZZaRN7MQdogkXII5yCQrpWjSIFy8yfsLPlDTAL2osmxIs39ykMXMtLJmIYjxUzxIL7LpaQfnkoVyWO0bQlWEJrEoIK+KLH6/QCO8tam2AmLvaogplP2CAPy86eB1jUJwpeT25sHJQPQn8GMaUgHFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732227677; c=relaxed/simple;
	bh=XQ4xqVRklioa2SiIdvsOccplHhQ4JRP2gd4jDK31608=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kCgUFS0+14dlCzDrkBB0vk8pOtAuiDKxp5JKWY6Abwk5s7tvlBbTxaUQRtdXjPzARQZ08AUlURkRB6kxFeozmCUL7HScN+Obi1Ei1lbm6VDKdmJy1SFan7TmG2wiMz2nijXwtzIyzHCAcipzucpwll+vj+tCESpxRcuQih2SdMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=rwfMmkK4; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="rwfMmkK4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1732227663; x=1732832463; i=w_armin@gmx.de;
	bh=ntHJZvsovuX3l7aISfSyUqmdt52gmbikJtRDlsxOw2U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=rwfMmkK4OgIvFgcyAIDK2vZ4hkdpwoTwHQQXMJ5+28JVv+33xbs0y2nkqyTKpF+e
	 Yg/bW8/sKDEQM6SDGWonXobni1HVoheGb5l5poobyLBy1HkwUC66Q9lXrSVFfCDUV
	 vvN0CzFeh/3Z+CnkB/y7kOjl1+jtWvi7aDqy0g+5CeLGlbl2sbQw/dA4D07Xsz2FI
	 sNPdVYQtNwPi8T+ZyyeVQZpVHRywsKJ+qk8PBtzaRCWV6Xh24OLT/XjFvzozswhp4
	 OlxtGA4iPW8zjY4y5TLN01IwIk4PF1qn86UVR5n0lrBY/iaYlEjMuXwv3LdXKGwo2
	 s8mRzsGuUZ0goY0e0Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.129.90] ([176.6.148.212]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8XPt-1trSAw0TEP-015J6O; Thu, 21
 Nov 2024 23:21:03 +0100
Message-ID: <e01dfd1b-1981-47a3-a33f-5afa321b7a10@gmx.de>
Date: Thu, 21 Nov 2024 23:20:59 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 13/22] ACPI: platform_profile: Add profile attribute
 for class interface
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Limonciello, Mario" <mario.limonciello@amd.com>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
References: <20241119171739.77028-1-mario.limonciello@amd.com>
 <20241119171739.77028-14-mario.limonciello@amd.com>
 <afff4d12-b611-68f0-07a0-2d22bc57fc06@linux.intel.com>
 <080ad77b-aa87-4541-8aec-bc74a6c2c0a7@app.fastmail.com>
 <42828c2f-4653-590f-0879-0ecdd00953ed@linux.intel.com>
 <249d2e7d-e859-4344-8bf6-f73641b009b9@app.fastmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <249d2e7d-e859-4344-8bf6-f73641b009b9@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MvnZnIWiHPSMky/qwpXvr+UcKs6/Yu7iL1UshAU5+e6fO/OtyQi
 9aRejCNTN9RmwHO3R1lazBUAEV1DAh4FQ+Vw2l/3MysDeZ0chCkB1u6/FpAhIyJiTGVqXcM
 QFw9oTmoS9JskzE+rOqxMY/fbpLy2gbkP/wGuI3W/1jX1gdi07v4LlYn27G9jZ5DJLUYoGy
 RDIAJtMnBffUmQrHwGx6A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sXCzkzZtijY=;1yKW20AxTXRewVGO6NRBHglC2wj
 lsp4BtAbYvxGCKExzmAGz/HLvS0G4YwvrtAy6GgDIDWmYdf0uO1cXVbwGwCqGV2igukzNM80k
 6b/TsBe09thdi7VAc3ay2aGlDUtJoXT3K3JzQznKCLjfYVlhJGgKIGLaJQP6tVonyk6zhG+qJ
 lvgHLrj32u/7N/Nx7DM1kkZWYhxjwPDuvWyKN95o4v/c/d5YPmWjsGUQQek8FRw7nODMyCq9Q
 es1SgE5NeVKdBBg+r4o3wdQfrMH23hO8CRsc8+/leHv+ZYQJvCyvVSc/6MmSMx7mJbnoORqfk
 BNrawUeRaqAfJjmpqbXz7TR1Wb/FOd9qBjagrl8AN/HHCLtwxsTqc+jyLXzXGXvovSbtU9kOc
 fOZ61T/+mX7zxaDtvnPyxxU8qlhNsQTSZIjZDlWgjz1Yw6jYDJGiNqhV9X0BivhgZXhFH5aaf
 SAAt5A1YavJXVxrkgqPb6GYu/qzRNh6Rif3IiQh/W8tJ+/wu7bZFYmsLyotxz79yb3CDK/V8g
 OGsHtBiEBaqqfh9/yNRDPABABe/hF5lwWTLa0LjOJg98A47U940wt1oVwL+TnBRaFlWLc874H
 r78hACOhNfGFOyoBVEQV0WP5CkJVCIOddUZYHBbmHuFpA0Q9DJ69hsuNBiNWjOWNb6aCN0iw3
 7HRVFFVY7RxRWqsbbMEREBesa3BxJ3LFLT4MZuRjk7JKfUt3Jjt9rvA2a5sqE0OiVolYQ8+JQ
 B85b5jr1sORVW73JiAhywtgt5EZpTDwF3/l7tKuHxHNMcWsed2N1Xpdp/q6at+GodUZE8a6MX
 7+bfgMZ4voBIke4mwndORToWTOce7zEfO1AfOYfe313IcY0iqUBwmb1D9b/fvxv5UoxWC3Phg
 1oCiPIL/tOOBZ+GMXS3ThQ8w9Cb0Ff/GOKrp3P2iYQFIdwFwJ+Lk69MtcRx1GJVR1bUeOTzs6
 hMp6qVvcFBLNsNrxdPU81B3Nf5YN+BW8QwZxdQqp0rQYjKE6OMSVa241bVZCbGSofZ4d54ySq
 jRrPaAJdNfKEmeM5ywgSq6ma//vKn4uVmsChnpkT/6DBPCdWjzbsDOlOe93PNM4Usknu9zzM9
 1DZZSsSDFJY//OOomhPFsOilL9mRD9

Am 21.11.24 um 15:27 schrieb Mark Pearson:

> On Thu, Nov 21, 2024, at 6:10 AM, Ilpo J=C3=A4rvinen wrote:
>> I don't know why you dropped Mario and the list, I reinstanstated those
>> two.
> Unintentional - sorry. Hit the reply button instead of reply-all and did=
n't notice. Doh.
>
>> On Wed, 20 Nov 2024, Mark Pearson wrote:
>>> On Wed, Nov 20, 2024, at 9:56 AM, Ilpo J=C3=A4rvinen wrote:
>>>> On Tue, 19 Nov 2024, Mario Limonciello wrote:
>>>>
>>>>> Reading and writing the `profile` sysfs file will use the callbacks =
for
>>>>> the platform profile handler to read or set the given profile.
>>>>>
>>>>> Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>> ---
>>>>> v7:
>>>>>   * Remove extra handler set
>>>>>   * Remove err variable
>>>>> v6:
>>>>>   * Fix return
>>>>> v5:
>>>>>   * Drop recovery flow
>>>>>   * Don't get profile before setting (not needed)
>>>>>   * Simplify casting for call to _store_class_profile()
>>>>>   * Only notify legacy interface of changes
>>>>>   * Adjust mutex use
>>>>> ---
>>>>>   drivers/acpi/platform_profile.c | 100 ++++++++++++++++++++++++++++=
++++
>>>>>   1 file changed, 100 insertions(+)
>>>>>
>>>>> diff --git a/drivers/acpi/platform_profile.c b/drivers/acpi/platform=
_profile.c
>>>>> index 9d6ead043994c..1530e6096cd39 100644
>>>>> --- a/drivers/acpi/platform_profile.c
>>>>> +++ b/drivers/acpi/platform_profile.c
>>>>>   static struct attribute *profile_attrs[] =3D {
>>>>>   	&dev_attr_name.attr,
>>>>>   	&dev_attr_choices.attr,
>>>>> +	&dev_attr_profile.attr,
>>>> I started to wonder if "choices" is good name for the other attribute=
 as
>>>> it is the set of values "profile" accepts? Should they be bound by th=
e
>>>> naming too like "profile_choices" or something along those lines so t=
he
>>>> connection between the two is very evident?
>>>>
>>> Wouldn't it be weird to not have it in sync with the main sysfs entry
>>> (which I don't think we can change at that point without messing up
>>> userspace).
>>>
>>> I think it would be more confusing to have different naming as it woul=
d
>>> imply they're different things.
>> Ah, I didn't realize there's a pre-existing convention. Then just
>> disregard what I suggested.
>>
> No idea if it's a convention - I just would think it would be confusing =
for users.
>
> Thanks
> Mark

I personally would prefer the attribute name "choices", but i would also a=
ccept if the attribute was
named "profile_choices". I think adding the "profile" prefix to the attrib=
ute when it is already handled
by the platform-profile class is silly.

Either way:
Reviewed-by: Armin Wolf <W_Armin@gmx.de>

