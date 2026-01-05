Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F7986348
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Jan 2026 17:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767632522; cv=none; b=NY8tlkjesRMw7fGyz2kYs8kBExwGxJWxuaak96EUdxhE/s5ZrkwxfQ0N6PqeSXyGwixTH7gBzrV5F5Rl+MaPx/sEC81srnMWsJ+J9P10SsGFDjTUE+bWo74jSwHBuWMNocIWkqu81U9yg7PyxMdo+cXA3qjn2/FKdBBBuMLKtTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767632522; c=relaxed/simple;
	bh=6hcb7eMs6DcF6dNEVOKWzxlZfxbC2U1s6U+ivLrENbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PxWCKGKItiiTMbQeErSESsf0WZ84GKHHZAPXkyeCGLRDeYU4lwMR8Xx469MgKMD2dyf/UqNuYM4v2Gr5mEw4fjEFl6BGFpOIc6HNO2C5h/hoMkgNpj8988Yk2gfbEek+mHb1fjp95FUL//mIms7OwKnyswBRxzIw9t2y4KBFA8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=sXZsqmtR; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="sXZsqmtR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767632516; x=1768237316; i=w_armin@gmx.de;
	bh=6hcb7eMs6DcF6dNEVOKWzxlZfxbC2U1s6U+ivLrENbw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=sXZsqmtRY7GaTPTgYT22EGBGf0mr70GalTH5bQ7TdfSkDnItdyDrNN/CnAGI97r3
	 Mbzu1Io3u+/3wvmCHsOu44PBTjAQWKEm2y5fV0fIEAUcrrSOpgIDiIP/f9ilUx2jS
	 qZlDdEUjNDblJtm7DtBS/nW+CoiGYBF9MZkf9Qoh3lb4/qKCodcc0TnutUA7nw1aL
	 kgL33UAp1Fix0H5wR+nUgcwrNtqmDryLyxL1HJfHnwJg1f/l7wAdjF9QNldpPHxDm
	 5viwalotlc7kIXFACV3BinQTnRfghnHs+ZWMMwlQtLMVXPAbpyH796yBsu/EM+xNp
	 AbfWKUg0f5w/3JjCTA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.24] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFsYx-1vfFUJ2Kvn-00DbIN; Mon, 05
 Jan 2026 18:01:56 +0100
Message-ID: <655738e4-6128-4b43-aabe-b0eb0da0a0c7@gmx.de>
Date: Mon, 5 Jan 2026 18:01:55 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: platform/x86: acer-wmi: Missing max fan speed (7000+ RPM) on Acer
 Nitro AN515-58
To: Pranay Pawar <pranaypawarofficial@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CACy5qBaFv_L5y_nGJU_3pd3CXbFZrUAE18y5Fc-hnAmrd8bSLA@mail.gmail.com>
 <1e4fe52c-d044-4869-a583-fa14f9740de0@gmx.de>
 <CACy5qBZW1pbYrrTc-1tcNwzGTuty=aovnrK17==CaSppXuBurg@mail.gmail.com>
 <abeb08c2-5aa5-4919-8016-d714c04c508b@gmx.de>
 <CACy5qBY-6v7_jRizJ=dJkeKGF+4fVUwmX9oaP=8XHGROEYOgCA@mail.gmail.com>
 <CACy5qBbgvgLa-y-TXz9ChaC1pvCAgKjQbU+=0Zd3gm-qyHHW_Q@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CACy5qBbgvgLa-y-TXz9ChaC1pvCAgKjQbU+=0Zd3gm-qyHHW_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Xv6tblqp3PnjVPdBoJD7hU+gsqROTLRwAMXMezEmTTMe0Sk0W6Q
 4dLTpTiLTBvVPxjYGj3xuo4jxGtaIdy6ouniWBPEWiTYfeLzjLC+Wa+iuBrSpHu4oX3qkWf
 tvplnLoTouUmiB2IMJOincixBbkJ2YXvOHjglyTvCwTM7/8dGT5s4TM3HbmcdQ49cURgdFV
 Bp7Ylvgc8DBZx4bjG62/w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qvX7l4vTPTM=;NDOv56rcrlp1+JWZDWj/pyqOpNh
 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
 QLxfTyVg=

Am 30.12.25 um 06:54 schrieb Pranay Pawar:

> Sorry for the confusion earlier =E2=80=94 after rechecking the behavior
> without the new patch, I=E2=80=99d like to clarify the results.
>
> ** Without the patch:
> 1. The fans are able to reach maximum RPM only when using the
> balanced-performance profile.
> 2. When selecting the performance profile, the fan speed remains
> capped at ~4500 RPM.
>
> ** With the patch applied:
> 1. Manual fan control is unlocked, which makes this patch important
> and effective.
> 2. The fans are able to reach maximum RPM only when using the
> balanced-performance profile.
>
> So the issue is specifically that the performance profile still keeps
> the fans capped, even though it is expected to be more aggressive than
> balanced-performance.

I see. Can you check if the fans reach their max. speed if you set the pwm=
X_enable
sysfs attributes below the associated hwmon device to "0"? This should swi=
tch them
into turbo mode.

Thanks,
Armin Wolf

>
> Apologies for the misunderstanding.
>
> Best regards,
> Pranay Pawar (Bugaddr)
>
> On Mon, Dec 29, 2025 at 1:47=E2=80=AFPM Pranay <pranaypawarofficial@gmai=
l.com> wrote:
>> Yes this patch is making the driver work as expected. I had modified
>> the acer-wmi driver and loaded it, then changed platform profile to
>> balanced-performance & now fans are able to reach max RPM's. But in
>> performance mode (Which is supposed to be powerful than
>> balanced-performance) the fans are still max locked at 4500 rpm only.
>>
>> Thanks & Regards,
>> Bugaddr (Pranay Pawar)
>>
>> On Mon, Dec 29, 2025 at 2:10=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wro=
te:
>>> Am 25.12.25 um 22:51 schrieb Pranay:
>>>
>>>> Sure here you go, in attachments
>>>>
>>>> Thanks,
>>>> Bugaddr
>>> I attached an experimental patch that should whitelist fan control for=
 your model. Can you
>>> test that fan control and the nitro button works?
>>>
>>> Thanks,
>>> Armin Wolf
>>>
>>>> On Thu, Dec 25, 2025 at 11:14=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> =
wrote:
>>>>> Am 24.12.25 um 20:40 schrieb Pranay:
>>>>>
>>>>>> Dear Maintainers,
>>>>>>
>>>>>> I am reporting a limitation in the acer-wmi driver regarding fan sp=
eed
>>>>>> control on the Acer Nitro AN515-58.
>>>>>>
>>>>>> The Issue: On Windows, enabling "Performance" mode via NitroSense
>>>>>> ramps the fans up to 7000+ RPM. On Linux, selecting the "Performanc=
e"
>>>>>> platform profile boosts the CPU power correctly, but the fans remai=
n
>>>>>> capped at maximum 3500-4000 RPM.
>>>>>>
>>>>>> Observation: This laptop model lacks a physical "Turbo" button. tho=
ugh
>>>>>> there is a nitrosense button which is useless in linux.
>>>>>>
>>>>>> I am requesting that support be added to fix the maximum fan speed =
state issue.
>>>>> Sure thing, can you share the output of "acpidump" to i can whitelis=
t your model
>>>>> for fan control?
>>>>>
>>>>> Thanks,
>>>>> Armin Wolf
>>>>>
>>>>>> Best regards,
>>>>>>
>>>>>> bugaddr
>>>>>>
