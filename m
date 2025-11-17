Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3062C0293
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Nov 2025 16:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763395429; cv=none; b=LY7c1dtgFSkCbioU7TltCa4ly+DeaZh7sBmNN6VPNQVGGTZNFNGVVKizUfStcQW15Kjf3FHdrfvc1Bb8hm+elCq66qeKkKnFubVQY/lcXaM+copOPlI+/zJ+BgnR+Md4QhVnlB1JemPPEmbczBvXfPDls04VAlFDcIb4dDQYOq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763395429; c=relaxed/simple;
	bh=c27Qk5yu42H7t7acHkQ4d/LomT9W4cLIreUXiEboGLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LSli3fnKOMgENWXMLHDbwxO0EamRKWRaB04wxQPlIrD+hJbNTgnloFsvoiJQAep+LXCNrwNbCS8b35o0WQFi6h1Pw/83PPVHu22dd5nYCywfFU9j/0EDE3KnSRNUlI975Q+OECGNYLjw8F4BWiPo2kRMg9Mp3JA/Qco3u8mxZXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=TXr0dKVX; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="TXr0dKVX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763395423; x=1764000223; i=w_armin@gmx.de;
	bh=NKo+NjwU1ySaozyzQ2M1YEWwJiRxndwUD6uPCkConUk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=TXr0dKVX10od1LiLzbhfx9qVqb0aqv8FDHNbxCG2QBf0BP22UbWHPXH/KWAzEQob
	 bGgnrpK6+iSHxBSHeWGL2Ozm+PYmgHjDTNqH/pqQ+kqZ4GVrFjltNf7aA8TxIf2U4
	 RqnvchnTLEsRRbefv82RTW0C3Nd32xC0LrJZNN2i32t9focPpK1ae+PGhgqi+6vNG
	 bZkm5TbaJheuNDEYrbNwj6XK2yIUiudqRagHIxKwaoitIkG7hj0Jzs6d1VkN76gxG
	 uyRd28AH9a3kmAdZjob1qbk9rj7ni4j3f0PY0tHJ43JfknKZDlWVRoyfaVCVxeVd0
	 4rJVZ7h2/b4kCv7R0Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.24] ([93.202.247.91]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MulmF-1wB41c18qJ-00zlW2; Mon, 17
 Nov 2025 17:03:43 +0100
Message-ID: <2c733a76-a622-48f5-ba0f-01773f6a7a7a@gmx.de>
Date: Mon, 17 Nov 2025 17:03:42 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug] Acer AN515-58: Fn+F10 affects display brightness
 unexpectedly
To: Bugaddr <Bugaddr@protonmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <cwCuSGwTSU4nQ_hM-qWPNAzJwU2x4qLe_eo0tkxIFIycTeRWmDKjX7IzxJHcOVUPx_xAwjYC3GOV7MSk_LIqPs4HElFbPoSzYIZV5BHWe8Q=@protonmail.com>
 <UyWxc6DtIYzBAkoHTnMQqR6ZTP_TVtFKEpJ1kFmuTP7jKLXmh5MJxU-qD7zLFosJPBpmpLN6Cl79prEADSrrvBQX4Wi6sltWot-u6i-RigI=@protonmail.com>
 <1854119a-c257-4954-81e0-6aa07538d0c5@gmx.de>
 <43a0661f-f70d-4a02-a89a-9686190ed3de@kernel.org>
 <xEdzYmxBwMOpzb0oiIr1q-SXgVMntKFDOqeoW1Q1wshnw7o-MZjLstwuSkj2Bc6E8DSEIMghxzhAKLbO8FtY4ABQHjYxG8SreVDidptyg2k=@protonmail.com>
 <tPQumZng3Py_n2et4MLRKu_-M-xqv-nzkFCCtnVryRamgSs5020dXq67qWVdrTG6mrFCDTGVDLGvoVvvnJZ_nQszJDQ4PWYCPbflKqGlqNs=@protonmail.com>
 <1szuDGB7r2yubTWirjmsulWXtSkOdmTU2dmYrMbB6Wp2Y2PzBxbJ63OT4BWW_zDRp8QnPhH0VGKG7UyjWzEnFITEo1QjD10ksXtTG44K7Ts=@protonmail.com>
 <44a8cee2-c193-4cba-b33c-e3937a9a59b6@gmx.de>
 <066226b0-2f4a-44b1-b084-f0ac42bd6150@gmx.de>
 <i02dtJC1U0Pf-yZFGOXKCBYdnbCerkuTvEkD3E0SbQt3bVvkBK8preFKHRAfgsi3_FijP8cZAu0HSNAjxEn3gAoYpDseHbUqNXRoE3fl1tw=@protonmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <i02dtJC1U0Pf-yZFGOXKCBYdnbCerkuTvEkD3E0SbQt3bVvkBK8preFKHRAfgsi3_FijP8cZAu0HSNAjxEn3gAoYpDseHbUqNXRoE3fl1tw=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:F8dF6RIKGr4DGzqzdIUSZux4dyDUaGt19wqukiU2FC4v5qX27Jo
 q3sTruxCq9Q+B++tFNEqP7VO9Evi9wZOG8V1deYlpBIImDLhuloe7HHFZ1AeBird38M6Hvx
 2HebKbeoc06RLT2UVaGI+zOR8aWd2xI91tGFBDr4Q9hyJQ61LS7gfyez8dKySILzacd5E98
 0pj/RZesCdk0sc3mBtSMQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vMls/yIiKJc=;3zqi33621ZIFs0sIxDtxblFXszk
 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

Am 17.11.25 um 15:12 schrieb Bugaddr:

> On Monday, November 17th, 2025 at 6:35 AM, Armin Wolf <W_Armin@gmx.de> w=
rote:
>
>> Am 17.11.25 um 01:29 schrieb Armin Wolf:
>>
>>> Am 16.11.25 um 23:14 schrieb Bugaddr:
>>>
>>>> On Sunday, November 16th, 2025 at 9:58 PM, Bugaddr
>>>> Bugaddr@protonmail.com wrote:
>>>>
>>>>> Hi Hans and Armin,
>>>>> Could you please review the logs I shared? The issue persists across
>>>>> all backlight modes, and I=E2=80=99d appreciate your guidance on the=
 next
>>>>> steps.
>>>>> Thanks,
>>>>> Bugaddr
>>>>>
>>>>> On Saturday, October 25th, 2025 at 1:11 AM, Bugaddr
>>>>> Bugaddr@protonmail.com wrote:
>>>>>
>>>>>> On Wednesday, October 15th, 2025 at 3:43 PM, Hans de Goede
>>>>>> hansg@kernel.org wrote:
>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 11-Oct-25 5:08 PM, Armin Wolf wrote:
>>>>>>>
>>>>>>>> Am 04.10.25 um 18:33 schrieb Bugaddr:
>>>>>>>>
>>>>>>>>> Sent with Proton Mail secure email.
>>>>>>>>>
>>>>>>>>> On Thursday, October 2nd, 2025 at 3:26 AM, Armin Wolf
>>>>>>>>> W_Armin@gmx.de wrote:
>>>>>>>>>
>>>>>>>>>> Am 18.09.25 um 21:18 schrieb Bugaddr:
>>>>>>>>>>
>>>>>>>>>>>> Am 13.06.25 um 19:12 schrieb Bugaddr:
>>>>>>>>>>>>
>>>>>>>>>>>>> Hello,
>>>>>>>>>>>>> I'm writing to report what appears to be a bug affecting the
>>>>>>>>>>>>> Acer AN515-58 laptop, and I would appreciate any assistance
>>>>>>>>>>>>> in investigating or resolving it.
>>>>>>>>>>>>>
>>>>>>>>>>>>> When I press Fn + F10=E2=80=94which is intended to increase =
the
>>>>>>>>>>>>> keyboard backlight brightness=E2=80=94the display brightness
>>>>>>>>>>>>> unexpectedly decreases along with it. Furthermore, the
>>>>>>>>>>>>> display brightness continues to lower incrementally, until I
>>>>>>>>>>>>> manually press Fn + Brightness Up to stop and reverse it.
>>>>>>>>>>>>>
>>>>>>>>>>>>> After pressing Fn + Brightness Up, the display brightness
>>>>>>>>>>>>> behavior returns to normal, and the issue does not
>>>>>>>>>>>>> reoccur=E2=80=94however, from that point onward, the Brightn=
ess Down
>>>>>>>>>>>>> key no longer works.
>>>>>>>>>>>>>
>>>>>>>>>>>>> This behavior is consistent and reproducible. I'm happy to
>>>>>>>>>>>>> assist with any debugging, log collection, or kernel testing
>>>>>>>>>>>>> as needed.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Best regards,
>>>>>>>>>>>>> Bugaddr
>>>>>>>>>>>>> Hi,
>>>>>>>>>>>>> can you share the output of "acpidump"?
>>>>>>>>>>>>> Thanks,
>>>>>>>>>>>>> Armin Wolf
>>>>>>>>>>>>> Sorry for late reply, but checkout this:
>>>>>>>>>>>>> https://paste.rs/Nqca3
>>>>>>>>>>>>> Thanks,
>>>>>>>>>>>>> Bugaddr
>>>>>>>>>>>>> Hi,
>>>>>>>>>> sorry for the late response. It seems that you forgot to paste
>>>>>>>>>> parts of the DSDT table. Could you please store the output
>>>>>>>>>> of acpidump inside a file (sudo acpidump > acpidump.log) and
>>>>>>>>>> attach it to the email? Also please put the whole mailing list
>>>>>>>>>>
>>>>>>>>>> on the CC next time.
>>>>>>>>>>
>>>>>>>>>> Thanks,
>>>>>>>>>> Armin Wolf
>>>>>>>>>> Hey, please checkout the attached acpidump
>>>>>>>>>> Thanks,
>>>>>>>>>> Bugaddr
>>>>>>>>>> Alright, the following ACPI bytecode is likely responsible for
>>>>>>>>>> sending those brightness down events:
>>>>>>>> Method (_Q11, 0, NotSerialized) // _Qxx: EC Query, xx=3D0x00-0xFF
>>>>>>>> {
>>>>>>>> Debug =3D "=3D=3D=3D=3D=3DQUERY_11=3D=3D=3D=3D=3D"
>>>>>>>> ^^^WMID.FEBC [Zero] =3D One /* Acer hotkey event
>>>>>>>> ^^^WMID.FEBC [One] =3D HTBN /* Hotkey scancode /
>>>>>>>> ^^^WMID.FEBC [One] =3D BRTS / Unknown, BIOS error? /
>>>>>>>> ^^^WMID.FEBC [Zero] =3D 0x04 / Unknown, BIOS error? /
>>>>>>>> Notify (WMID, 0xBC) / Notify acer-wmi driver /
>>>>>>>> If (IGDS) / Integrated GPU device state? /
>>>>>>>> {
>>>>>>>> Notify (^^^GFX0.DD1F, 0x87) / Decrease brightness on Intel iGPU /
>>>>>>>> }
>>>>>>>> Else
>>>>>>>> {
>>>>>>>> Notify (^^^PEG1.PEGP.LCD0, 0x87) / Decrease brightness on
>>>>>>>> discrete GPU */
>>>>>>>> }
>>>>>>>> }
>>>>>>>>
>>>>>>>> I think the brightness problems are caused by the kernel using
>>>>>>>> the wrong backlight interface.
>>>>>>>> Can you please try the following things:
>>>>>>>>
>>>>>>>> 1. Unload the acer-wmi driver using "modprobe -r acer-wmi".
>>>>>>>> 2. Boot the kernel with "acpi_backlight=3Dvendor" if the problem
>>>>>>>> still occurs.
>>>>>>>> Using acpi_backlight=3Dvendor on a recent laptop-model like this =
one
>>>>>>>> is unlikely
>>>>>>>> to be the right thing to do. acpi_backlight=3Dvendor is for vendo=
r
>>>>>>>> specific
>>>>>>>> backlight control firmware interfaces from before things were
>>>>>>>> standardized
>>>>>>>> on using the ACPI video firmware interface around Windows XP
>>>>>>>> (IIRC), not
>>>>>>>> sure if it was XP or some other Windows release but standardizing=
 on
>>>>>>>> the API video firmware interface happened a long long time ago an=
d
>>>>>>>> then
>>>>>>>> things moved to mostly using direct hw access (acpi_backlight=3Dn=
ative)
>>>>>>>> starting with Windows Vista.
>>>>>>> acpi_backlight=3Dvideo could still be something which might be the
>>>>>>> preferred
>>>>>>> way on some devices and also goes through ACPI calls, but using
>>>>>>> acpi_backlight=3Dvendor is weird.
>>>>>>>
>>>>>>> OTOH I learned a while ago that apparently if multiple backlight
>>>>>>> interfaces
>>>>>>> are present Windows simply sends the new brightness value to all
>>>>>>> interfaces.
>>>>>>>
>>>>>>> Anyways Bugaddr please do give acpi_backlight=3Dvendor (and maybe =
also
>>>>>>> acpi_backlight=3Dvideo) a try as asked by Armin, this will still b=
e
>>>>>>> a good data point to have.
>>>>>>>
>>>>>>> Regards,
>>>>>>>
>>>>>>> Hans
>>>>>>> Here are the logs:
>>>>>> # Logs after setting acpi_backlight=3Dvendor & removing acer-wmi
>>>>>>
>>>>>> 1. I am unable to change the display brightness either up/down
>>>>>> 2. Caps_lock light turns on automatically when pressing
>>>>>> fn+brightness_up key & turned off automatically as soon as other
>>>>>> keys are pressed
>>>>>> 3. Was able to change the keyboard brightness
>>>>>> 4. no logs while pressing fn+keyboard_brightness_up/down
>>>>>>
>>>>>> wmi PNP0C14:00 000000bc 00000000
>>>>>> video/brightnessup BRTUP 00000086 00000000
>>>>>> wmi PNP0C14:00 000000bc 00000000
>>>>>> wmi PNP0C14:00 000000bc 00000000
>>>>>> video/brightnessdown BRTDN 00000087 00000000
>>>>>> wmi PNP0C14:00 000000bc 00000000
>>>>>>
>>>>>> # Logs after setting acpi_backlight=3Dvideo
>>>>>>
>>>>>> ## Logs while testing the brightnes buttons first time after boot
>>>>>> after removing acer-wmi, was able to change the display brightness
>>>>>>
>>>>>> wmi PNP0C14:00 000000bc 00000000
>>>>>> video/brightnessup BRTUP 00000086 00000000
>>>>>> wmi PNP0C14:00 000000bc 00000000
>>>>>> wmi PNP0C14:00 000000bc 00000000
>>>>>> video/brightnessdown BRTDN 00000087 00000000
>>>>>> wmi PNP0C14:00 000000bc 00000000
>>>>>>
>>>>>> ## Logs after pressing fn+keyboard_brightness_up (the display
>>>>>> brightness suddenly goes to 0) & keyboard brightness also changes
>>>>>>
>>>>>> video/brightnessdown BRTDN 00000087 00000000 K
>>>>>>
>>>>>> ** I am on latest bios update & acpi_backlight=3Dnative also dont w=
ork
>>>>>>
>>>>>> Regards,
>>>>>> Bugaddr
>>>>>> Hi everyone,
>>>> I've debugged and fixed the annoying Fn+F10 bug on Acer Nitro 5
>>>> AN515-58.
>>>>
>>>> ROOT CAUSE:
>>>> Firmware sends wrong scancode (0xef) which Linux maps to
>>>> KEY_BRIGHTNESSDOWN instead of keyboard backlight control.
>>>>
>>>> SOLUTION:
>>>> Install this udev hwdb rule:
>>>>
>>>> sudo tee /etc/udev/hwdb.d/90-acer-nitro5-an515-58.hwdb > /dev/null <<
>>>> 'EOF'
>>>> # Acer Nitro 5 AN515-58 - Fix Fn+F10 scancode 0xef
>>>> evdev:atkbd:dmi:bvn*:bvr*:bd*:svnAcer*:pnNitroAN515-58
>>>> KEYBOARD_KEY_ef=3Dreserved
>>>> EOF
>>>>
>>>> sudo systemd-hwdb update && sudo udevadm trigger
>>>> --sysname-match=3D"event*"
>>>>
>>>> TESTED ON:
>>>> - Kernel: 6.17.8-arch1-1
>>>> - Distribution: Arch Linux
>>>> - Desktop: KDE Plasma (Wayland)
>>>>
>>>> I have blogged my full analysis here:
>>>> https://bugaddr.tech/posts/2025-11-16-debugging-the-acer-nitro-5-an51=
5-58-fn-f10-keyboard-backlight-bug-on-linux/
>>>>
>>>> Thanks & regards,
>>>> Bugaddr
>>> Sorry for not responding earlier, i kind of forgot about this bug
>>> report :/.
>>>
>>> But thanks for figuring that out, maybe you can contribute this fix to
>>> hwdb so that other users of this device
>>> can benefit for it?
>>>
>>> Thanks,
>>> Armin Wolf
>>
>> I just read your blog post and it seems that your device has some WMI i=
nterface issues. The warning
>> from the WMI driver regarding the missing WQ00 ACPI control method is h=
armless, as the WMI driver core
>> will simply ignore the affected WMI device.
>>
>> The unknown function number 4 - 0 however can be fixed inside the acer-=
wmi driver. It seems that all
>> we need to do is to tell the driver to ignore function number 4 - 0, as=
 the acpi-video driver already
>> handles the brightness up/down events.
>>
>> Can you test the attached patch?
>>
>> Thanks,
>> Armin Wolf
> Thanks Armin for the patch, I have tested this patch on my device and ye=
s the logs are suppressed. Well its unrelated but I am only getting this m=
essages when pressing fn+F9 (Keyboard backlight down) & there are no such =
warnings on fn+F10 (Keyboard brightness up):
>
> [  398.153437] atkbd serio0: Unknown key pressed (translated set 2, code=
 0xf0 on isa0060/serio0).
> [  398.153469] atkbd serio0: Use 'setkeycodes e070 <keycode>' to make it=
 known.
>
> Note: The hwdb overrides were still there while testing (The issue of di=
splay brightness came back after removing those overrides)
>
> Thanks and regards
> Bugaddr

Strange, seems to me that the atkbd driver simply has no default mapping f=
or keycode 0xf0. I honestly have no
experience regarding the atkbd driver, so i can can only suggest that you =
map this key code to KEY_IGNORE/KEY_UNKNOWN.

Thanks,
Armin Wolf

