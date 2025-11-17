Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16534A0C
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Nov 2025 00:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763339387; cv=none; b=pWbMXF6ybkJvIdMOSt8z4biDrsk5cHF5torjMMA/fQQe6B+jOZwNblGSgmc7MbrqXcbNyFaDve0Vf8TqrapZLYswprY7DtgNEugvagUenWvCzC4mq9JhoVuP593N/OZh8ix9l0TbpR6AT3uylLjeX2/6jldzm1FLxR1cR7La3Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763339387; c=relaxed/simple;
	bh=6WNXAEy11YyLP8P91Ki6LiI/D4JLZEN863ngpPTpDfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T4tIptMd7Gbq3uz4yGmcoZ/iBd0Z8pGtfzffyeVitWpVT5fgSHU+dIyZyI2FYK+fE/z3LImfZ6mVwbgidBeZ69F1as/RVWb7tlVwMkf1A4K8b46gZjIo1yfygIres3Qthy27lSDvbGNvmMENFXwpy5/2fXXVLFF8EI+TOd01Qjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Wmk1MUpF; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Wmk1MUpF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763339366; x=1763944166; i=w_armin@gmx.de;
	bh=hU0JS4BP0KrImAt/fRUxYVgzFtDhIzfdC8urmf5ALS0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Wmk1MUpFWkhsNtaRnzOmkncOgrKUIW9jU8Op1N12VwOFc67VaYXy8Iofk1dcedYc
	 DygLW3F9tRUnhR2cfmOyWePSZlBQfnt17lf/ua0OK1ritU+0N/oyP3ozDvhEgcIfC
	 rCmduJsWr4Mdco6Zemr0SqpyiOfPpFWTDyegKiYpZYmlOVDlN0cSen9ABwWHxsBvN
	 0A/obl611Pj1OXi5aZlp5sOB6QCbPnYHXWmCZPk3h2Ve0yYmHnqIyolJIP9137Prv
	 tJzq0vveVTOIJKIMS52OUgD2rGBJ4EHZVI1mDyz3H+us0JSJpiK3LfqtPv0dqRs93
	 hvh/rbysAEquDf1hPQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIMfc-1vQGlG1ttE-006REQ; Mon, 17
 Nov 2025 01:29:26 +0100
Message-ID: <44a8cee2-c193-4cba-b33c-e3937a9a59b6@gmx.de>
Date: Mon, 17 Nov 2025 01:29:25 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug] Acer AN515-58: Fn+F10 affects display brightness
 unexpectedly
To: Bugaddr <Bugaddr@protonmail.com>, Hans de Goede <hansg@kernel.org>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
References: <cwCuSGwTSU4nQ_hM-qWPNAzJwU2x4qLe_eo0tkxIFIycTeRWmDKjX7IzxJHcOVUPx_xAwjYC3GOV7MSk_LIqPs4HElFbPoSzYIZV5BHWe8Q=@protonmail.com>
 <1536ce4a-5844-447f-9e86-197c71c6d364@gmx.de>
 <0RyizLnGQaxXLOtK-q6h-mHCTA2ergYBAIS-DkF1MPD9T5nx79rlaKdIOUBRft7Ghpy11OPo2OZM4waIjDbdnv2fnafWBDxWEYL75XZKtUo=@protonmail.com>
 <0b485b76-fb44-44a4-afab-d35fa31043db@gmx.de>
 <UyWxc6DtIYzBAkoHTnMQqR6ZTP_TVtFKEpJ1kFmuTP7jKLXmh5MJxU-qD7zLFosJPBpmpLN6Cl79prEADSrrvBQX4Wi6sltWot-u6i-RigI=@protonmail.com>
 <1854119a-c257-4954-81e0-6aa07538d0c5@gmx.de>
 <43a0661f-f70d-4a02-a89a-9686190ed3de@kernel.org>
 <xEdzYmxBwMOpzb0oiIr1q-SXgVMntKFDOqeoW1Q1wshnw7o-MZjLstwuSkj2Bc6E8DSEIMghxzhAKLbO8FtY4ABQHjYxG8SreVDidptyg2k=@protonmail.com>
 <tPQumZng3Py_n2et4MLRKu_-M-xqv-nzkFCCtnVryRamgSs5020dXq67qWVdrTG6mrFCDTGVDLGvoVvvnJZ_nQszJDQ4PWYCPbflKqGlqNs=@protonmail.com>
 <1szuDGB7r2yubTWirjmsulWXtSkOdmTU2dmYrMbB6Wp2Y2PzBxbJ63OT4BWW_zDRp8QnPhH0VGKG7UyjWzEnFITEo1QjD10ksXtTG44K7Ts=@protonmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <1szuDGB7r2yubTWirjmsulWXtSkOdmTU2dmYrMbB6Wp2Y2PzBxbJ63OT4BWW_zDRp8QnPhH0VGKG7UyjWzEnFITEo1QjD10ksXtTG44K7Ts=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RaJYbD3i3LP25L01zPb8oK6FxAqyyAZ4yjkAVIsq4OJ1b8iC6K2
 mojbPackZSvRz+Nt08lF1t7PQSorLUrHvw6iRBFyVYqSwr32Sdx+VjZCoRonrq/CLUGbSfb
 1LwggXFdqZSFhJV1L/aLGi0FNQinuuASAQCYI+dvPyzSvH2vUBhJOukVDmMS0+vaI4w6BA+
 N9mPgtvGxVmVd7VIuk/EA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UQZUiz1hzHs=;khFOKqs6xcaZ+yZOG9fnDaejLot
 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

Am 16.11.25 um 23:14 schrieb Bugaddr:

> On Sunday, November 16th, 2025 at 9:58 PM, Bugaddr <Bugaddr@protonmail.c=
om> wrote:
>
>> Hi Hans and Armin,
>> Could you please review the logs I shared? The issue persists across al=
l backlight modes, and I=E2=80=99d appreciate your guidance on the next st=
eps.
>> Thanks,
>> Bugaddr
>>
>>
>> On Saturday, October 25th, 2025 at 1:11 AM, Bugaddr Bugaddr@protonmail.=
com wrote:
>>
>>> On Wednesday, October 15th, 2025 at 3:43 PM, Hans de Goede hansg@kerne=
l.org wrote:
>>>
>>>> Hi,
>>>>
>>>> On 11-Oct-25 5:08 PM, Armin Wolf wrote:
>>>>
>>>>> Am 04.10.25 um 18:33 schrieb Bugaddr:
>>>>>
>>>>>> Sent with Proton Mail secure email.
>>>>>>
>>>>>> On Thursday, October 2nd, 2025 at 3:26 AM, Armin Wolf W_Armin@gmx.d=
e wrote:
>>>>>>
>>>>>>> Am 18.09.25 um 21:18 schrieb Bugaddr:
>>>>>>>
>>>>>>>>> Am 13.06.25 um 19:12 schrieb Bugaddr:
>>>>>>>>>
>>>>>>>>>> Hello,
>>>>>>>>>> I'm writing to report what appears to be a bug affecting the Ac=
er AN515-58 laptop, and I would appreciate any assistance in investigating=
 or resolving it.
>>>>>>>>>>
>>>>>>>>>> When I press Fn + F10=E2=80=94which is intended to increase the=
 keyboard backlight brightness=E2=80=94the display brightness unexpectedly=
 decreases along with it. Furthermore, the display brightness continues to=
 lower incrementally, until I manually press Fn + Brightness Up to stop an=
d reverse it.
>>>>>>>>>>
>>>>>>>>>> After pressing Fn + Brightness Up, the display brightness behav=
ior returns to normal, and the issue does not reoccur=E2=80=94however, fro=
m that point onward, the Brightness Down key no longer works.
>>>>>>>>>>
>>>>>>>>>> This behavior is consistent and reproducible. I'm happy to assi=
st with any debugging, log collection, or kernel testing as needed.
>>>>>>>>>>
>>>>>>>>>> Best regards,
>>>>>>>>>> Bugaddr
>>>>>>>>>> Hi,
>>>>>>>>>> can you share the output of "acpidump"?
>>>>>>>>> Thanks,
>>>>>>>>> Armin Wolf
>>>>>>>>> Sorry for late reply, but checkout this:
>>>>>>>>> https://paste.rs/Nqca3
>>>>>>>>> Thanks,
>>>>>>>>> Bugaddr
>>>>>>> Hi,
>>>>>>>
>>>>>>> sorry for the late response. It seems that you forgot to paste par=
ts of the DSDT table. Could you please store the output
>>>>>>> of acpidump inside a file (sudo acpidump > acpidump.log) and attac=
h it to the email? Also please put the whole mailing list
>>>>>>>
>>>>>>> on the CC next time.
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Armin Wolf
>>>>>>> Hey, please checkout the attached acpidump
>>>>>> Thanks,
>>>>>> Bugaddr
>>>>> Alright, the following ACPI bytecode is likely responsible for sendi=
ng those brightness down events:
>>>>>
>>>>> Method (_Q11, 0, NotSerialized) // _Qxx: EC Query, xx=3D0x00-0xFF
>>>>> {
>>>>> Debug =3D "=3D=3D=3D=3D=3DQUERY_11=3D=3D=3D=3D=3D"
>>>>> ^^^WMID.FEBC [Zero] =3D One /* Acer hotkey event
>>>>> ^^^WMID.FEBC [One] =3D HTBN /* Hotkey scancode /
>>>>> ^^^WMID.FEBC [One] =3D BRTS / Unknown, BIOS error? /
>>>>> ^^^WMID.FEBC [Zero] =3D 0x04 / Unknown, BIOS error? /
>>>>> Notify (WMID, 0xBC) / Notify acer-wmi driver /
>>>>> If (IGDS) / Integrated GPU device state? /
>>>>> {
>>>>> Notify (^^^GFX0.DD1F, 0x87) / Decrease brightness on Intel iGPU /
>>>>> }
>>>>> Else
>>>>> {
>>>>> Notify (^^^PEG1.PEGP.LCD0, 0x87) / Decrease brightness on discrete G=
PU */
>>>>> }
>>>>> }
>>>>>
>>>>> I think the brightness problems are caused by the kernel using the w=
rong backlight interface.
>>>>> Can you please try the following things:
>>>>>
>>>>> 1. Unload the acer-wmi driver using "modprobe -r acer-wmi".
>>>>> 2. Boot the kernel with "acpi_backlight=3Dvendor" if the problem sti=
ll occurs.
>>>> Using acpi_backlight=3Dvendor on a recent laptop-model like this one =
is unlikely
>>>> to be the right thing to do. acpi_backlight=3Dvendor is for vendor sp=
ecific
>>>> backlight control firmware interfaces from before things were standar=
dized
>>>> on using the ACPI video firmware interface around Windows XP (IIRC), =
not
>>>> sure if it was XP or some other Windows release but standardizing on
>>>> the API video firmware interface happened a long long time ago and th=
en
>>>> things moved to mostly using direct hw access (acpi_backlight=3Dnativ=
e)
>>>> starting with Windows Vista.
>>>>
>>>> acpi_backlight=3Dvideo could still be something which might be the pr=
eferred
>>>> way on some devices and also goes through ACPI calls, but using
>>>> acpi_backlight=3Dvendor is weird.
>>>>
>>>> OTOH I learned a while ago that apparently if multiple backlight inte=
rfaces
>>>> are present Windows simply sends the new brightness value to all inte=
rfaces.
>>>>
>>>> Anyways Bugaddr please do give acpi_backlight=3Dvendor (and maybe als=
o
>>>> acpi_backlight=3Dvideo) a try as asked by Armin, this will still be
>>>> a good data point to have.
>>>>
>>>> Regards,
>>>>
>>>> Hans
>>> Here are the logs:
>>>
>>> # Logs after setting acpi_backlight=3Dvendor & removing acer-wmi
>>>
>>> 1. I am unable to change the display brightness either up/down
>>> 2. Caps_lock light turns on automatically when pressing fn+brightness_=
up key & turned off automatically as soon as other keys are pressed
>>> 3. Was able to change the keyboard brightness
>>> 4. no logs while pressing fn+keyboard_brightness_up/down
>>>
>>> wmi PNP0C14:00 000000bc 00000000
>>> video/brightnessup BRTUP 00000086 00000000
>>> wmi PNP0C14:00 000000bc 00000000
>>> wmi PNP0C14:00 000000bc 00000000
>>> video/brightnessdown BRTDN 00000087 00000000
>>> wmi PNP0C14:00 000000bc 00000000
>>>
>>> # Logs after setting acpi_backlight=3Dvideo
>>>
>>> ## Logs while testing the brightnes buttons first time after boot afte=
r removing acer-wmi, was able to change the display brightness
>>>
>>> wmi PNP0C14:00 000000bc 00000000
>>> video/brightnessup BRTUP 00000086 00000000
>>> wmi PNP0C14:00 000000bc 00000000
>>> wmi PNP0C14:00 000000bc 00000000
>>> video/brightnessdown BRTDN 00000087 00000000
>>> wmi PNP0C14:00 000000bc 00000000
>>>
>>> ## Logs after pressing fn+keyboard_brightness_up (the display brightne=
ss suddenly goes to 0) & keyboard brightness also changes
>>>
>>> video/brightnessdown BRTDN 00000087 00000000 K
>>>
>>> ** I am on latest bios update & acpi_backlight=3Dnative also dont work
>>>
>>> Regards,
>>> Bugaddr
> Hi everyone,
>
> I've debugged and fixed the annoying Fn+F10 bug on Acer Nitro 5 AN515-58=
.
>
> ROOT CAUSE:
> Firmware sends wrong scancode (0xef) which Linux maps to KEY_BRIGHTNESSD=
OWN instead of keyboard backlight control.
>
> SOLUTION:
> Install this udev hwdb rule:
>
> sudo tee /etc/udev/hwdb.d/90-acer-nitro5-an515-58.hwdb > /dev/null << 'E=
OF'
> # Acer Nitro 5 AN515-58 - Fix Fn+F10 scancode 0xef
> evdev:atkbd:dmi:bvn*:bvr*:bd*:svnAcer*:pnNitro*AN515-58*
>   KEYBOARD_KEY_ef=3Dreserved
> EOF
>
> sudo systemd-hwdb update && sudo udevadm trigger --sysname-match=3D"even=
t*"
>
> TESTED ON:
> - Kernel: 6.17.8-arch1-1
> - Distribution: Arch Linux
> - Desktop: KDE Plasma (Wayland)
>
> I have blogged my full analysis here: https://bugaddr.tech/posts/2025-11=
-16-debugging-the-acer-nitro-5-an515-58-fn-f10-keyboard-backlight-bug-on-l=
inux/
>
> Thanks & regards,
> Bugaddr

Sorry for not responding earlier, i kind of forgot about this bug report :=
/.

But thanks for figuring that out, maybe you can contribute this fix to hwd=
b so that other users of this device
can benefit for it?

Thanks,
Armin Wolf

