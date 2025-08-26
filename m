Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4AC286D76
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 Aug 2025 20:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756240145; cv=none; b=VfZWG+XDRnVdEFPJ6iBGXWSyoBZHNYF2YP/8jvZkPG8KF7qGsUEWEHmWMWEIDoHo3KYsZmBXa3co+ByxJYOir67/mDDih2YO0/E+66tgdmPttoEwrdbeDM0mf2If24TarDgukOzOJ0GDnotxE17NxCPOD+mlO23c3rcRX0NhhpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756240145; c=relaxed/simple;
	bh=aR/IIkt40/e1sC8qscAJstk4c0TuoBd/p0GIfDEXoXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=F9lXLreWvqF8211TPVmY9NOx1Ti+wEZzhKJH622Ot00bTiLdnxoLGyQZQ9Fo2xKPUT7XxXi3CHQkd7jzPbuPJ4XLESJPn3KeVyWQIXZjvTkYfZz5CKJbI95//u2JGQ80iSbVfuo1fbfACuHr5szaifUsbm7at31vJf0H8aZ9cB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=WdzbJZb+; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="WdzbJZb+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1756240141; x=1756844941; i=w_armin@gmx.de;
	bh=aR/IIkt40/e1sC8qscAJstk4c0TuoBd/p0GIfDEXoXE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WdzbJZb+orPX3RNAwVYvUwJBPdyfChDFeU5z7h3/BAwc5HkZhOauh0vO5LYQ8Sxq
	 fU5b7ROJiwmH2ywV62RzF2DPzGXN2vyh9VDf4/jhGkJ0q5yrFgEQs+67RVptnIxK8
	 t3pr/CbJ7qPjwU21XWOLtzzuRYL0gmDWqo5u2MRGo6SQJbYqZCZ7O8mQmaX0HDmkh
	 B6UvhJg8CV85BrYWxwiFUlSDwdEAp93tl9ldVTaA+T28Q2L5ri+hm+/nWLMqjcQUr
	 XilKTUqTlTDnXmEQ6itW7+5CX2fZPnOWhRWbdQ3XT/jpzNMZu6Q+HPq+McuIHLPXB
	 6PU8wuae1jYYgAC+dg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.49.234.1] ([176.2.184.62]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhlGk-1uMKJ23vuq-00fb11; Tue, 26
 Aug 2025 22:29:01 +0200
Message-ID: <ed4d6056-4616-4a5d-8067-2fc748ac3bbd@gmx.de>
Date: Tue, 26 Aug 2025 22:28:58 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: acer-wmi driver fails to initialise with Linux kernel
 >6.14
To: Lynne Megido <lynne@bune.city>, platform-driver-x86@vger.kernel.org
References: <3f56e68f-85df-4c0a-982c-43f9d635be38@bune.city>
 <13f268a6-ec17-4a97-ae69-4aec723d4329@gmx.de>
 <a720d568-ea56-4e27-9d28-66b60a681e69@bune.city>
 <b56c74bc-ce71-4ab8-a804-3d5d3de247b1@gmx.de>
 <5cbe2fe6-dc96-4f92-9c06-12c309c63185@bune.city>
 <8c08ade6-3b33-438d-b734-a82623c5ba7f@gmx.de>
 <290b8e1a-1d7d-48a3-a8e2-0cba711f6848@bune.city>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <290b8e1a-1d7d-48a3-a8e2-0cba711f6848@bune.city>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MjeNi+NAzUVeAEe2UbdIm/HdcUbZQhMJBMmxe/jK+IMIWnG77yo
 nxZ6b3dv7PVaDvYN6fmZ6SQOezmfa+CGYqkefw0WD9NDbuzeVej7MiKTX/nW1vsGlJuKGeI
 Ps46Mtyq+2YaiOR3feI20EU1ed6SjcXgL75MFQsswtozlWsgHxqWgRZsm0J+6WUfcO12AgC
 /V/NkB+3OfmBKqgQqPS6w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nn2umAtwxiE=;m1C3aTH17WLqfNIljZM+tA/eax6
 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
 CR2bSGh+D3U579u1Eas

Am 24.08.25 um 05:35 schrieb Lynne Megido:

>
> On 22/8/25 22:28, Armin Wolf wrote:
>> Am 15.08.25 um 04:57 schrieb Lynne Megido:
>>
>>>
>>> On 14/8/25 22:11, Armin Wolf wrote:
>>>> Am 13.08.25 um 00:41 schrieb Lynne Megido:
>>>>
>>>>> > Can you first load this driver and share the dmesg output then?
>>>>>
>>>>> Sure, I've done that:
>>>>>
>>>>> lynne@pasiphael:~/Downloads/acer-wmi 45ms 8.51% 7GiB/31GiB
>>>>> =E2=9D=AF make
>>>>> make -C /lib/modules/`uname -r`/build M=3D`pwd` modules
>>>>> make[1]: Entering directory '/usr/src/kernels/6.15.9-201.fc42.x86_64=
'
>>>>> make[2]: Entering directory '/home/lynne/Downloads/acer-wmi'
>>>>> =C2=A0 CC [M]=C2=A0 acer-wmi.o
>>>>> =C2=A0 MODPOST Module.symvers
>>>>> =C2=A0 CC [M]=C2=A0 acer-wmi.mod.o
>>>>> =C2=A0 CC [M]=C2=A0 .module-common.o
>>>>> =C2=A0 LD [M]=C2=A0 acer-wmi.ko
>>>>> =C2=A0 BTF [M] acer-wmi.ko
>>>>> Skipping BTF generation for acer-wmi.ko due to unavailability of=20
>>>>> vmlinux
>>>>> make[2]: Leaving directory '/home/lynne/Downloads/acer-wmi'
>>>>> make[1]: Leaving directory '/usr/src/kernels/6.15.9-201.fc42.x86_64'
>>>>> lynne@pasiphael:~/Downloads/acer-wmi 66ms 1.87% 9GiB/31GiB
>>>>> =E2=9D=AF sudo modprobe -r acer-wmi
>>>>> lynne@pasiphael:~/Downloads/acer-wmi 40ms 2.45% 8GiB/31GiB
>>>>> =E2=9D=AF sudo modprobe sparse_keymap
>>>>> lynne@pasiphael:~/Downloads/acer-wmi 36ms 1.15% 8GiB/31GiB
>>>>> =E2=9D=AF sudo modprobe platform_profile
>>>>> lynne@pasiphael:~/Downloads/acer-wmi 33ms 1.22% 8GiB/31GiB
>>>>> =E2=9D=AF sudo modprobe wmi_bmof
>>>>> lynne@pasiphael:~/Downloads/acer-wmi 42ms 2.76% 8GiB/31GiB
>>>>> =E2=9D=AF sudo insmod acer-wmi.ko
>>>>> lynne@pasiphael:~/Downloads/acer-wmi 43ms 2.37% 10GiB/31GiB
>>>>> =E2=9D=AF sudo dmesg | tail -n 6
>>>>> [=C2=A0 179.600745] acer_wmi: Acer Laptop ACPI-WMI Extras
>>>>> [=C2=A0 179.600775] acer_wmi: Function bitmap for Communication Butt=
on:=20
>>>>> 0x801
>>>>> [=C2=A0 179.610473] input: Acer WMI hotkeys as=20
>>>>> /devices/virtual/input/input36
>>>>> [=C2=A0 179.629948] acer_wmi: Supported platform profiles: 0
>>>>> [=C2=A0 179.629951] acer-wmi acer-wmi: Failed to register=20
>>>>> platform_profile class device with empty choices
>>>>> [=C2=A0 179.634840] acer-wmi acer-wmi: probe with driver acer-wmi=20
>>>>> failed with error -22
>>>>>
>>>> I see, did the platform profile interface work on your machine=20
>>>> before kernel 6.14?
>>>>
>>> I'm currently running Linux 6.12 from this COPR:
>>> https://copr.fedorainfracloud.org/coprs/kwizart/kernel-longterm-6.12/
>>>
>>>
>>> The built-in acer-wmi driver functions properly with this kernel.
>>>
>>> The modified version you sent to me fails to build for 6.12, however -
>>> although I assume this is to be expected.
>>>
>>> Unloading (modprobe -r) and loading (modprobe) the built-in driver on
>>> 6.12 produces this output:
>>>
>>>
>>> ```
>>> [ =C2=A0252.074562] acer_wmi: Acer Laptop WMI Extras unloaded
>>> [ =C2=A0255.247887] acer_wmi: Acer Laptop ACPI-WMI Extras
>>> [ =C2=A0255.247945] acer_wmi: Function bitmap for Communication Button=
:=20
>>> 0x801
>>> [ =C2=A0255.261125] input: Acer WMI hotkeys as=20
>>> /devices/virtual/input/input34
>>>
>>> ```
>>
>> Alright, i attached another version of the acer-wmi driver for you to=
=20
>> test that
>> should properly load on your machine. Can you test that all platform=20
>> profiles
>> supported by this driver work as expected?
>>
>
> Ah, that works!
>
> ```
> =E2=9D=AFsudo dmesg | tail -n 3
> [ =C2=A0126.945282] acer_wmi: Acer Laptop ACPI-WMI Extras
> [ =C2=A0126.945323] acer_wmi: Function bitmap for Communication Button: =
0x801
> [ =C2=A0126.955315] input: Acer WMI hotkeys as /devices/virtual/input/in=
put35
> ```
>
> Pressing the button now cycles between profiles as it did before.
>
>
>>>
>>>>> > Additionally could you share the output of "acpidump"?
>>>>>
>>>> Thanks, but next time please attach the resulting text file to the=20
>>>> email instead.
>>>>
>>>> Armin Wolf
>>>>
>>> My apologies, I'm not familiar with mailing list etiquette. I'll do=20
>>> that in future.
>>> Thanks for your patience and effort in troubleshooting this issue.
>>>
>>> Lynne
>>
>> No problem, but please use reply-all so that everyone including the=20
>> mailing list gets this message
>> (could also have been my fault).
>>
>> Thanks,
>> Armin Wolf
>
>
> Whoops, my bad.
>
>
> Thank you so much for all your help, Armin. The provided acer-wmi=20
> version works great on
> Linux 6.15.10.
>
> Lynne
>
Nice, i will send the necessary patch right away.

Thanks,
Armin Wolf

