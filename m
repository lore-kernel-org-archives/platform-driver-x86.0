Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B6A2D9ECD
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Jan 2026 15:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767886559; cv=none; b=jqs8ZxxcaKATtHVtxoyGiFPGE5X35RNjMdmwgix4AIKWrd+VSedk6yTBIqf0ry5T9F4cHDexfSlqqOKWAr01Pgw1CVxL+OfQEXiFXoJ13gFp5xIXO9RZVZxlf9VJtTc8cNsO/Yp1QSDgDQmi1FtxucCUTveqvgAQXK1yRMj19yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767886559; c=relaxed/simple;
	bh=PdhKRy0xVdPFKzKJGBkB0U5bi8W75ToO0Qs7AA9piho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DF/uT4867Z+gQllC3Ip9AsSYqc2tSsG01jsUyKWHMNZRUleM3/6jpjRclN9u2tt6YO9xbldp15kyFRcaEt2OW1+R7Chp+xoMz+nuRoXmhXwbkj7RhIacUHZikgXBX5Nxxz7bD4VSM6kbk7Upslk+IP5zz2ha/ZNcbj0SEIJ9sk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=kAtqRVUp; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="kAtqRVUp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767886554; x=1768491354; i=w_armin@gmx.de;
	bh=PdhKRy0xVdPFKzKJGBkB0U5bi8W75ToO0Qs7AA9piho=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=kAtqRVUp7Odoc0tOnBjI9lUqKYIfFafLP5TYRyBJLvYv07wTXnsVB92HI++sVPdj
	 sucChM2VU8RnbBsRG7VpOABtnsgz44m3ZuqqT45DyHpsm42LzLEV2G/4MnHPpSyXO
	 yAWVSTTYohc4e3jxjqz4LejOvHyyHfaOsFIlGDtL1SiwEc9jpcZQ0cmk7N7iEBbvd
	 ZA+r4pwL4XacGsTKWzPTWn7YQl83dFhSDiAnwUF7XIpJoemdVg4knn7FyJ9qpt3o/
	 BOQcm0iOQ5zAywodoOtbeKdLZ8LxRLciAoxe+DA569NW0gBh9HHmPqehHom6BbKTu
	 BeMc8ZIDW8/+bcm8iw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.90.225] ([141.76.8.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOiHf-1vDgJx2PT5-00MIJt; Thu, 08
 Jan 2026 16:35:54 +0100
Message-ID: <fec3a103-1205-4584-8975-c8765f8a2efa@gmx.de>
Date: Thu, 8 Jan 2026 16:35:54 +0100
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
 <655738e4-6128-4b43-aabe-b0eb0da0a0c7@gmx.de>
 <CACy5qBZmA47D1G9Ma5V+yn4bcZZYg98JCGtXeKX212FFUoo13Q@mail.gmail.com>
 <CACy5qBaPBFwZ6d735fNbtC6_U4r9imzgeLuYpBuj0ckBXVDhPg@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CACy5qBaPBFwZ6d735fNbtC6_U4r9imzgeLuYpBuj0ckBXVDhPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wAER3EEoymz+AisT6skwIl9U0fq9VtbC+RV4beJdXz0GB5uFJVc
 +LfpHnrwF9KpCi+rUFgOBVmQZ+bj+5djFX+nNAyNyYmqkw/uOVXP6h6h04LVn7mqYTmnag+
 PqXSoHs+pbYcIPkMt8XAUtRPDVYN4Eu0HCxV4VXzZ0S4NOwoIwUVCbWtGpSA8LvY0hS3ACD
 V2R7G0mf4mc8b9x7IscRw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OicFOrCMKDo=;Jody/EEmmMJgAaGZl/m4GRqJYII
 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

Am 08.01.26 um 15:38 schrieb Pranay Pawar:

> Hi Armin,
>
> I have tested the suggested sysfs attributes with the patched driver,
> and here are the results:
>
> Mode: balanced, pwmX_enable=3D0
> Setting this to "0" successfully puts both fans at maximum speed.
>
> Mode: balanced-performance, pwmX_enable=3D0
> Setting this to "0" also puts both fans at maximum speed.
>
> Mode: performance, pwmX_enable=3D0
> Setting this to "0" also puts both fans at maximum speed.
>
> It appears that switching the attributes to "0" does correctly trigger
> the turbo mode for the fans.
>
> Thanks,
> Pranay Pawar (Bugaddr)

Perfect, i will send the associated patch upstream then.

Thanks,
Armin Wolf

>
>> On Mon, Jan 5, 2026 at 10:31=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wro=
te:
>>> Am 30.12.25 um 06:54 schrieb Pranay Pawar:
>>>
>>>> Sorry for the confusion earlier =E2=80=94 after rechecking the behavi=
or
>>>> without the new patch, I=E2=80=99d like to clarify the results.
>>>>
>>>> ** Without the patch:
>>>> 1. The fans are able to reach maximum RPM only when using the
>>>> balanced-performance profile.
>>>> 2. When selecting the performance profile, the fan speed remains
>>>> capped at ~4500 RPM.
>>>>
>>>> ** With the patch applied:
>>>> 1. Manual fan control is unlocked, which makes this patch important
>>>> and effective.
>>>> 2. The fans are able to reach maximum RPM only when using the
>>>> balanced-performance profile.
>>>>
>>>> So the issue is specifically that the performance profile still keeps
>>>> the fans capped, even though it is expected to be more aggressive tha=
n
>>>> balanced-performance.
>>> I see. Can you check if the fans reach their max. speed if you set the=
 pwmX_enable
>>> sysfs attributes below the associated hwmon device to "0"? This should=
 switch them
>>> into turbo mode.
>>>
>>> Thanks,
>>> Armin Wolf
>>>
>>>> Apologies for the misunderstanding.
>>>>
>>>> Best regards,
>>>> Pranay Pawar (Bugaddr)
>>>>
>>>> On Mon, Dec 29, 2025 at 1:47=E2=80=AFPM Pranay <pranaypawarofficial@g=
mail.com> wrote:
>>>>> Yes this patch is making the driver work as expected. I had modified
>>>>> the acer-wmi driver and loaded it, then changed platform profile to
>>>>> balanced-performance & now fans are able to reach max RPM's. But in
>>>>> performance mode (Which is supposed to be powerful than
>>>>> balanced-performance) the fans are still max locked at 4500 rpm only=
.
>>>>>
>>>>> Thanks & Regards,
>>>>> Bugaddr (Pranay Pawar)
>>>>>
>>>>> On Mon, Dec 29, 2025 at 2:10=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> =
wrote:
>>>>>> Am 25.12.25 um 22:51 schrieb Pranay:
>>>>>>
>>>>>>> Sure here you go, in attachments
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Bugaddr
>>>>>> I attached an experimental patch that should whitelist fan control =
for your model. Can you
>>>>>> test that fan control and the nitro button works?
>>>>>>
>>>>>> Thanks,
>>>>>> Armin Wolf
>>>>>>
>>>>>>> On Thu, Dec 25, 2025 at 11:14=E2=80=AFPM Armin Wolf <W_Armin@gmx.d=
e> wrote:
>>>>>>>> Am 24.12.25 um 20:40 schrieb Pranay:
>>>>>>>>
>>>>>>>>> Dear Maintainers,
>>>>>>>>>
>>>>>>>>> I am reporting a limitation in the acer-wmi driver regarding fan=
 speed
>>>>>>>>> control on the Acer Nitro AN515-58.
>>>>>>>>>
>>>>>>>>> The Issue: On Windows, enabling "Performance" mode via NitroSens=
e
>>>>>>>>> ramps the fans up to 7000+ RPM. On Linux, selecting the "Perform=
ance"
>>>>>>>>> platform profile boosts the CPU power correctly, but the fans re=
main
>>>>>>>>> capped at maximum 3500-4000 RPM.
>>>>>>>>>
>>>>>>>>> Observation: This laptop model lacks a physical "Turbo" button. =
though
>>>>>>>>> there is a nitrosense button which is useless in linux.
>>>>>>>>>
>>>>>>>>> I am requesting that support be added to fix the maximum fan spe=
ed state issue.
>>>>>>>> Sure thing, can you share the output of "acpidump" to i can white=
list your model
>>>>>>>> for fan control?
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Armin Wolf
>>>>>>>>
>>>>>>>>> Best regards,
>>>>>>>>>
>>>>>>>>> bugaddr
>>>>>>>>>
