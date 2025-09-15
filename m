Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C5514A4F9;
	Mon, 15 Sep 2025 21:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757973275; cv=none; b=iXBiE4Ct70BTrIyuRTaO1GvI0+nGo7QV5P1sW8O3Zo6SvRDhRlEkA1ifeAWS5uu5p7asiC4Q2Gn6dTPcRtRQh6pq/qBdsOg2Yg8DaIpIUvkKinwBea/XMUeeqFwOP1omn2yW4q/uFOzkk1riJYH2dKj4B3f3c3uvbpEzaYyVqdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757973275; c=relaxed/simple;
	bh=n48jciww2X0fn0vaR7T+mpGEYCvSTNzQI6VrrkWGUHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rZ32zsqT6721ouia47ApxI94QGEelm7puNiptLmLJT2YeBJO2EmUTRSE3VvD8Es1VGX0VR1xgZB/J4DdC81A5SPZ5KlpuL0gmjyBXbUZiBGc99gpKX8Eb3eQi4E2uUh8XtZR3abBbyx95cHrbYnkOqr6eg6L0+r+R5kjDxuh8Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=eD9ze4Q6; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="eD9ze4Q6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1757973267; x=1758578067; i=w_armin@gmx.de;
	bh=E6hgzD5Pj/WlFlOBbRw7Y6W8q2wyU02oCUPJafOdY+o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=eD9ze4Q6xR3ty69l8mQBqPnD4DCfXeXXtTWeTcIUsPdq/wKY6Vz48a/ZxBSmLUS9
	 AbxJHpNhO5jjGEfrnJxlwt2zuU9bUbcshjmd3MP+Up425sBfjnM/EbFeENjoC+cgM
	 iJlBqBIaCUeeaVhGMhsA5NIDXqW6OSmWHmBVMfvXdEAduLcmn+yBX8M6nc/T48tRq
	 Bcb9NZBq6QmKQZEPDDHPTqVu3iRYLjkh7kCTcu18ZdzX8QfWrULcjTQuvM0nOHXWm
	 ZPHl4CmNn51W0ih55dRa8yByYwaKP5Dzu98qak9OCPkOez/It68gbGeMvZqwSF3tP
	 sCI73PMPpebQpU/WEw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4hvb-1uIAfF3jDb-015RoQ; Mon, 15
 Sep 2025 23:54:27 +0200
Message-ID: <cfd7977e-d612-4e08-a68a-65fed8e164b6@gmx.de>
Date: Mon, 15 Sep 2025 23:54:22 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/wmi: Fix Typo in lenovo-wmi-gamezone
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: rakuram <rakuram.e96@gmail.com>, linux-doc@vger.kernel.org,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
References: <20250817170644.5855-1-rakuram.e96@gmail.com>
 <31b895a4-edd0-4ce5-a20a-7d0fb67e9721@app.fastmail.com>
 <444b64a7-631e-4acf-d2c8-2f0acd379d61@linux.intel.com>
 <4d218ba7-71ba-4dfe-9a6f-a1997345c35a@app.fastmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <4d218ba7-71ba-4dfe-9a6f-a1997345c35a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:K5DiFh4BcFNZ2fXX030eACasbxJBIdVF2QKAQt4aEhqpEG+Fmx4
 Vvs8dkbUTh65FVYl+hhLQshvt0ndbWyEa85H/9tRqNl+NTH4o0CpBeXL06y5C7AidtqYUjG
 JuHXyM3PwuV7zF6ZmCaWHbt9dTXmZdeuV0Eg2cMOZnBohB1YdFlAf08ZkgYQN5RSz/LOEak
 eKHw8db81B18kIUfniaXw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Mx8nyuxMykw=;vFnl63moYclMmgVi9ryqVAALbcG
 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
 zRuOoeXsmmF4cvyegXPWPDTAs8PuONGw==

Am 15.09.25 um 20:23 schrieb Mark Pearson:

> Hi Ilpo,
>
> On Mon, Sep 15, 2025, at 6:32 AM, Ilpo J=C3=A4rvinen wrote:
>> On Wed, 20 Aug 2025, Mark Pearson wrote:
>>> On Sun, Aug 17, 2025, at 1:06 PM, rakuram wrote:
>>>> Fixed the below typo error
>>>>
>>>> freqency =3D=3D> frequency
>>>> in Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>>>>
>>>> Signed-off-by: rakuram <rakuram.e96@gmail.com>
>>>> ---
>>>>   Documentation/wmi/devices/lenovo-wmi-gamezone.rst | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>>>> b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>>>> index 997263e51a7d..22040250a97d 100644
>>>> --- a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>>>> +++ b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>>>> @@ -153,7 +153,7 @@ data using the `bmfdec
>>>> <https://github.com/pali/bmfdec>`_ utility:
>>>>       [WmiDataId(1), read, Description("P-State ID.")] uint32 PStateI=
D;
>>>>       [WmiDataId(2), read, Description("CLOCK ID.")] uint32 ClockID;
>>>>       [WmiDataId(3), read, Description("Default value.")] uint32
>>>> defaultvalue;
>>>> -    [WmiDataId(4), read, Description("OC Offset freqency.")] uint32
>>>> OCOffsetFreq;
>>>> +    [WmiDataId(4), read, Description("OC Offset frequency.")] uint32
>>>> OCOffsetFreq;
>>>>       [WmiDataId(5), read, Description("OC Min offset value.")] uint3=
2
>>>> OCMinOffset;
>>>>       [WmiDataId(6), read, Description("OC Max offset value.")] uint3=
2
>>>> OCMaxOffset;
>>>>       [WmiDataId(7), read, Description("OC Offset Scale.")] uint32
>>>> OCOffsetScale;
>>>> --=20
>>>> 2.43.0
>>> Looks good to me.
>>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Hi,
>>
>> Isn't the typo in the original interface as well? I'm not very keen in
>> accepting this kind of patches as this part is not really user
>> documentation to begin with.
>>
> I haven't had a chance to double check - but it's kinda bad that we had =
that typo in the original implementation to be honest. I can ask to get th=
at fixed, but it will likely take a long time for something minor.
> I defer to you on the preference for kernel documentation - I suspect we=
'll get a bunch of these though (part of the 'getting started to contribut=
ing to the kernel' is always typos and documentation right?).
>
> Mark

I agree, the typo is inside the WMI MOF definition which is included insid=
e the documentation for future developers. Since this MOF definition shoul=
d
match the actual MOF definition reported by the ACPI firmware, i suggest t=
hat we ignore any spelling mistakes inside those.

Thanks,
Armin Wolf

