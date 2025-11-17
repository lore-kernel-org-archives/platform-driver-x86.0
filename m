Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2D83595D
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Nov 2025 01:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763341555; cv=none; b=Xf619g/TA6Y8kjIt8TZTzQSdiNyVssCqME6CCLYeHPjnNyuNqmKLRMmLGW+970JalllY0vUZkE97NYpasxsMGMes67aaVlqiImLsJX55Z8Lbtr5KZnRqT4K/5KA8gShiE1L3lv8ywT4QrLfXnIAxJStcv0YjpDHOsUpxtI2Qv6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763341555; c=relaxed/simple;
	bh=leg4KFtg2desuGRXjBKGhlKdFxcs1iFZxxVnBUcIPMc=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:From:To:Cc:
	 References:In-Reply-To; b=lJvY1SZ2JiCt1NSB6V6wjfIlv0gVvriPPwk/ZyszqHlwGZySLK41ILcvvTwRwhtroAvDrQ6jHVF5dc6RA8n/A47aW0D62UA9UnU7B79WU/tGK6py79k7vt+8WGLN4TFSwsW21fpsPum9oSKgwsN56nX1DosFv/WZc3JU9ggSU7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=b7iwdXvo; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="b7iwdXvo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763341549; x=1763946349; i=w_armin@gmx.de;
	bh=leg4KFtg2desuGRXjBKGhlKdFxcs1iFZxxVnBUcIPMc=;
	h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:
	 Subject:From:To:Cc:References:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=b7iwdXvo+LIZbWwhbzMRMYcJ5RXnn9cW510m9XloXEdwnSvINAxAxeiyr1A+ZsGf
	 4PhiPGVn0jWvA48sohpaqJXje83+ROERqeIDhrQD56RZ5EYnK9sNZf/HfUaFsKwxV
	 X08+yXN0aRVJ2HIOzHOhEbgnJRIcU9u8FtIsejOETlZMgEgeh3+zLZcKNnTmcqqTv
	 +NcYwXFbCirJya5S12onhbW5KMkcc4vpqkmudC1EFIKX+IAOekSzIifNvOhp/IvYh
	 obodR26gJG4kcJkMiWfMW+EKRVDIAQmyicK4jTtdsvd8pqQper70x48oDzZDv1+1g
	 4SmCe8nRrk41vMGN9Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.24] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeU0q-1vvEMr1nNs-00gPkz; Mon, 17
 Nov 2025 02:05:49 +0100
Content-Type: multipart/mixed; boundary="------------DGJ81iJ75ChlzidMpa8ngfMA"
Message-ID: <066226b0-2f4a-44b1-b084-f0ac42bd6150@gmx.de>
Date: Mon, 17 Nov 2025 02:05:48 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug] Acer AN515-58: Fn+F10 affects display brightness
 unexpectedly
From: Armin Wolf <W_Armin@gmx.de>
To: Bugaddr <Bugaddr@protonmail.com>, Hans de Goede <hansg@kernel.org>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
References: <cwCuSGwTSU4nQ_hM-qWPNAzJwU2x4qLe_eo0tkxIFIycTeRWmDKjX7IzxJHcOVUPx_xAwjYC3GOV7MSk_LIqPs4HElFbPoSzYIZV5BHWe8Q=@protonmail.com>
 <0RyizLnGQaxXLOtK-q6h-mHCTA2ergYBAIS-DkF1MPD9T5nx79rlaKdIOUBRft7Ghpy11OPo2OZM4waIjDbdnv2fnafWBDxWEYL75XZKtUo=@protonmail.com>
 <0b485b76-fb44-44a4-afab-d35fa31043db@gmx.de>
 <UyWxc6DtIYzBAkoHTnMQqR6ZTP_TVtFKEpJ1kFmuTP7jKLXmh5MJxU-qD7zLFosJPBpmpLN6Cl79prEADSrrvBQX4Wi6sltWot-u6i-RigI=@protonmail.com>
 <1854119a-c257-4954-81e0-6aa07538d0c5@gmx.de>
 <43a0661f-f70d-4a02-a89a-9686190ed3de@kernel.org>
 <xEdzYmxBwMOpzb0oiIr1q-SXgVMntKFDOqeoW1Q1wshnw7o-MZjLstwuSkj2Bc6E8DSEIMghxzhAKLbO8FtY4ABQHjYxG8SreVDidptyg2k=@protonmail.com>
 <tPQumZng3Py_n2et4MLRKu_-M-xqv-nzkFCCtnVryRamgSs5020dXq67qWVdrTG6mrFCDTGVDLGvoVvvnJZ_nQszJDQ4PWYCPbflKqGlqNs=@protonmail.com>
 <1szuDGB7r2yubTWirjmsulWXtSkOdmTU2dmYrMbB6Wp2Y2PzBxbJ63OT4BWW_zDRp8QnPhH0VGKG7UyjWzEnFITEo1QjD10ksXtTG44K7Ts=@protonmail.com>
 <44a8cee2-c193-4cba-b33c-e3937a9a59b6@gmx.de>
Content-Language: en-US
In-Reply-To: <44a8cee2-c193-4cba-b33c-e3937a9a59b6@gmx.de>
X-Provags-ID: V03:K1:N7C4fyGYpwYw8d2SCtikeNiswo9MCNzYBleHS6uIAJZl5mAyEob
 dSOEXZRCx9xr/BT55D6CbnQIembicFPjLWBoO6TcHhPkzfbaLCd3p5kPMt4lMiBGVB1N/To
 8DgXN3pZ2ojyjzrpO0JVZzzsF5V/shg7WIljWM61bIb7J2kY3smlN+C5dNQghOOlsUKG7Nt
 /KHFPlmk6r/yEkgtlAFrQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3H/v/76Vsu4=;DXFjYpZZgUPZaSWjrZw1SSPE+jC
 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

This is a multi-part message in MIME format.
--------------DGJ81iJ75ChlzidMpa8ngfMA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Am 17.11.25 um 01:29 schrieb Armin Wolf:

> Am 16.11.25 um 23:14 schrieb Bugaddr:
>
>> On Sunday, November 16th, 2025 at 9:58 PM, Bugaddr=20
>> <Bugaddr@protonmail.com> wrote:
>>
>>> Hi Hans and Armin,
>>> Could you please review the logs I shared? The issue persists across=
=20
>>> all backlight modes, and I=E2=80=99d appreciate your guidance on the n=
ext=20
>>> steps.
>>> Thanks,
>>> Bugaddr
>>>
>>>
>>> On Saturday, October 25th, 2025 at 1:11 AM, Bugaddr=20
>>> Bugaddr@protonmail.com wrote:
>>>
>>>> On Wednesday, October 15th, 2025 at 3:43 PM, Hans de Goede=20
>>>> hansg@kernel.org wrote:
>>>>
>>>>> Hi,
>>>>>
>>>>> On 11-Oct-25 5:08 PM, Armin Wolf wrote:
>>>>>
>>>>>> Am 04.10.25 um 18:33 schrieb Bugaddr:
>>>>>>
>>>>>>> Sent with Proton Mail secure email.
>>>>>>>
>>>>>>> On Thursday, October 2nd, 2025 at 3:26 AM, Armin Wolf=20
>>>>>>> W_Armin@gmx.de wrote:
>>>>>>>
>>>>>>>> Am 18.09.25 um 21:18 schrieb Bugaddr:
>>>>>>>>
>>>>>>>>>> Am 13.06.25 um 19:12 schrieb Bugaddr:
>>>>>>>>>>
>>>>>>>>>>> Hello,
>>>>>>>>>>> I'm writing to report what appears to be a bug affecting the=
=20
>>>>>>>>>>> Acer AN515-58 laptop, and I would appreciate any assistance=20
>>>>>>>>>>> in investigating or resolving it.
>>>>>>>>>>>
>>>>>>>>>>> When I press Fn + F10=E2=80=94which is intended to increase th=
e=20
>>>>>>>>>>> keyboard backlight brightness=E2=80=94the display brightness=
=20
>>>>>>>>>>> unexpectedly decreases along with it. Furthermore, the=20
>>>>>>>>>>> display brightness continues to lower incrementally, until I=
=20
>>>>>>>>>>> manually press Fn + Brightness Up to stop and reverse it.
>>>>>>>>>>>
>>>>>>>>>>> After pressing Fn + Brightness Up, the display brightness=20
>>>>>>>>>>> behavior returns to normal, and the issue does not=20
>>>>>>>>>>> reoccur=E2=80=94however, from that point onward, the Brightnes=
s Down=20
>>>>>>>>>>> key no longer works.
>>>>>>>>>>>
>>>>>>>>>>> This behavior is consistent and reproducible. I'm happy to=20
>>>>>>>>>>> assist with any debugging, log collection, or kernel testing=
=20
>>>>>>>>>>> as needed.
>>>>>>>>>>>
>>>>>>>>>>> Best regards,
>>>>>>>>>>> Bugaddr
>>>>>>>>>>> Hi,
>>>>>>>>>>> can you share the output of "acpidump"?
>>>>>>>>>> Thanks,
>>>>>>>>>> Armin Wolf
>>>>>>>>>> Sorry for late reply, but checkout this:
>>>>>>>>>> https://paste.rs/Nqca3
>>>>>>>>>> Thanks,
>>>>>>>>>> Bugaddr
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> sorry for the late response. It seems that you forgot to paste=20
>>>>>>>> parts of the DSDT table. Could you please store the output
>>>>>>>> of acpidump inside a file (sudo acpidump > acpidump.log) and=20
>>>>>>>> attach it to the email? Also please put the whole mailing list
>>>>>>>>
>>>>>>>> on the CC next time.
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Armin Wolf
>>>>>>>> Hey, please checkout the attached acpidump
>>>>>>> Thanks,
>>>>>>> Bugaddr
>>>>>> Alright, the following ACPI bytecode is likely responsible for=20
>>>>>> sending those brightness down events:
>>>>>>
>>>>>> Method (_Q11, 0, NotSerialized) // _Qxx: EC Query, xx=3D0x00-0xFF
>>>>>> {
>>>>>> Debug =3D "=3D=3D=3D=3D=3DQUERY_11=3D=3D=3D=3D=3D"
>>>>>> ^^^WMID.FEBC [Zero] =3D One /* Acer hotkey event
>>>>>> ^^^WMID.FEBC [One] =3D HTBN /* Hotkey scancode /
>>>>>> ^^^WMID.FEBC [One] =3D BRTS / Unknown, BIOS error? /
>>>>>> ^^^WMID.FEBC [Zero] =3D 0x04 / Unknown, BIOS error? /
>>>>>> Notify (WMID, 0xBC) / Notify acer-wmi driver /
>>>>>> If (IGDS) / Integrated GPU device state? /
>>>>>> {
>>>>>> Notify (^^^GFX0.DD1F, 0x87) / Decrease brightness on Intel iGPU /
>>>>>> }
>>>>>> Else
>>>>>> {
>>>>>> Notify (^^^PEG1.PEGP.LCD0, 0x87) / Decrease brightness on=20
>>>>>> discrete GPU */
>>>>>> }
>>>>>> }
>>>>>>
>>>>>> I think the brightness problems are caused by the kernel using=20
>>>>>> the wrong backlight interface.
>>>>>> Can you please try the following things:
>>>>>>
>>>>>> 1. Unload the acer-wmi driver using "modprobe -r acer-wmi".
>>>>>> 2. Boot the kernel with "acpi_backlight=3Dvendor" if the problem=20
>>>>>> still occurs.
>>>>> Using acpi_backlight=3Dvendor on a recent laptop-model like this one=
=20
>>>>> is unlikely
>>>>> to be the right thing to do. acpi_backlight=3Dvendor is for vendor=
=20
>>>>> specific
>>>>> backlight control firmware interfaces from before things were=20
>>>>> standardized
>>>>> on using the ACPI video firmware interface around Windows XP=20
>>>>> (IIRC), not
>>>>> sure if it was XP or some other Windows release but standardizing on
>>>>> the API video firmware interface happened a long long time ago and=
=20
>>>>> then
>>>>> things moved to mostly using direct hw access (acpi_backlight=3Dnati=
ve)
>>>>> starting with Windows Vista.
>>>>>
>>>>> acpi_backlight=3Dvideo could still be something which might be the=
=20
>>>>> preferred
>>>>> way on some devices and also goes through ACPI calls, but using
>>>>> acpi_backlight=3Dvendor is weird.
>>>>>
>>>>> OTOH I learned a while ago that apparently if multiple backlight=20
>>>>> interfaces
>>>>> are present Windows simply sends the new brightness value to all=20
>>>>> interfaces.
>>>>>
>>>>> Anyways Bugaddr please do give acpi_backlight=3Dvendor (and maybe al=
so
>>>>> acpi_backlight=3Dvideo) a try as asked by Armin, this will still be
>>>>> a good data point to have.
>>>>>
>>>>> Regards,
>>>>>
>>>>> Hans
>>>> Here are the logs:
>>>>
>>>> # Logs after setting acpi_backlight=3Dvendor & removing acer-wmi
>>>>
>>>> 1. I am unable to change the display brightness either up/down
>>>> 2. Caps_lock light turns on automatically when pressing=20
>>>> fn+brightness_up key & turned off automatically as soon as other=20
>>>> keys are pressed
>>>> 3. Was able to change the keyboard brightness
>>>> 4. no logs while pressing fn+keyboard_brightness_up/down
>>>>
>>>> wmi PNP0C14:00 000000bc 00000000
>>>> video/brightnessup BRTUP 00000086 00000000
>>>> wmi PNP0C14:00 000000bc 00000000
>>>> wmi PNP0C14:00 000000bc 00000000
>>>> video/brightnessdown BRTDN 00000087 00000000
>>>> wmi PNP0C14:00 000000bc 00000000
>>>>
>>>> # Logs after setting acpi_backlight=3Dvideo
>>>>
>>>> ## Logs while testing the brightnes buttons first time after boot=20
>>>> after removing acer-wmi, was able to change the display brightness
>>>>
>>>> wmi PNP0C14:00 000000bc 00000000
>>>> video/brightnessup BRTUP 00000086 00000000
>>>> wmi PNP0C14:00 000000bc 00000000
>>>> wmi PNP0C14:00 000000bc 00000000
>>>> video/brightnessdown BRTDN 00000087 00000000
>>>> wmi PNP0C14:00 000000bc 00000000
>>>>
>>>> ## Logs after pressing fn+keyboard_brightness_up (the display=20
>>>> brightness suddenly goes to 0) & keyboard brightness also changes
>>>>
>>>> video/brightnessdown BRTDN 00000087 00000000 K
>>>>
>>>> ** I am on latest bios update & acpi_backlight=3Dnative also dont wor=
k
>>>>
>>>> Regards,
>>>> Bugaddr
>> Hi everyone,
>>
>> I've debugged and fixed the annoying Fn+F10 bug on Acer Nitro 5=20
>> AN515-58.
>>
>> ROOT CAUSE:
>> Firmware sends wrong scancode (0xef) which Linux maps to=20
>> KEY_BRIGHTNESSDOWN instead of keyboard backlight control.
>>
>> SOLUTION:
>> Install this udev hwdb rule:
>>
>> sudo tee /etc/udev/hwdb.d/90-acer-nitro5-an515-58.hwdb > /dev/null <<=
=20
>> 'EOF'
>> # Acer Nitro 5 AN515-58 - Fix Fn+F10 scancode 0xef
>> evdev:atkbd:dmi:bvn*:bvr*:bd*:svnAcer*:pnNitro*AN515-58*
>> =C2=A0 KEYBOARD_KEY_ef=3Dreserved
>> EOF
>>
>> sudo systemd-hwdb update && sudo udevadm trigger=20
>> --sysname-match=3D"event*"
>>
>> TESTED ON:
>> - Kernel: 6.17.8-arch1-1
>> - Distribution: Arch Linux
>> - Desktop: KDE Plasma (Wayland)
>>
>> I have blogged my full analysis here:=20
>> https://bugaddr.tech/posts/2025-11-16-debugging-the-acer-nitro-5-an515-=
58-fn-f10-keyboard-backlight-bug-on-linux/
>>
>> Thanks & regards,
>> Bugaddr
>
> Sorry for not responding earlier, i kind of forgot about this bug=20
> report :/.
>
> But thanks for figuring that out, maybe you can contribute this fix to=
=20
> hwdb so that other users of this device
> can benefit for it?
>
> Thanks,
> Armin Wolf

I just read your blog post and it seems that your device has some WMI inte=
rface issues. The warning
from the WMI driver regarding the missing WQ00 ACPI control method is harm=
less, as the WMI driver core
will simply ignore the affected WMI device.

The unknown function number 4 - 0 however can be fixed inside the acer-wmi=
 driver. It seems that all
we need to do is to tell the driver to ignore function number 4 - 0, as th=
e acpi-video driver already
handles the brightness up/down events.

Can you test the attached patch?

Thanks,
Armin Wolf

--------------DGJ81iJ75ChlzidMpa8ngfMA
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-platform-x86-acer-wmi-Ignore-backlight-event.patch"
Content-Disposition: attachment;
 filename="0001-platform-x86-acer-wmi-Ignore-backlight-event.patch"
Content-Transfer-Encoding: base64

RnJvbSA1ZTQ2YTY1MmQ5NmI5ODY4ZGFiNzQ0ZTcyMmIyMDcwZGMzMTYzMGQwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBcm1pbiBXb2xmIDxXX0FybWluQGdteC5kZT4KRGF0
ZTogTW9uLCAxNyBOb3YgMjAyNSAwMjowMDoyNiArMDEwMApTdWJqZWN0OiBbUEFUQ0hdIHBs
YXRmb3JtL3g4NjogYWNlci13bWk6IElnbm9yZSBiYWNrbGlnaHQgZXZlbnQKCk9uIHRoZSBB
Y2VyIE5pdHJvIEFONTE1LTU4LCB0aGUgZXZlbnQgNCAtIDAgYXJlIHNlbmQgYnkgdGhlIEFD
UEkKZmlybXdhcmUgd2hlbiBiYWNrbGlnaHQgdXAvZG93biBrZXlzIGFyZSBwcmVzc2VkLiBJ
Z25vcmUgdGhpcyBldmVudAp0byBhdm9pZCBzcGFtbWluZyB0aGUga2VybmVsIGxvZyB3aXRo
IGVycm9yIG1lc3NhZ2VzLCBhcyB0aGUKYWNwaS12aWRlbyBkcml2ZXIgYWxyZWFkeSBoYW5k
bGVzIGJyaWdodG5lc3MgdXAvZG93biBldmVudHMuCgpSZXBvcnRlZC1ieTogQnVnYWRkciA8
QnVnYWRkckBwcm90b25tYWlsLmNvbT4KQ2xvc2VzOiBodHRwczovL2J1Z2FkZHIudGVjaC9w
b3N0cy8yMDI1LTExLTE2LWRlYnVnZ2luZy10aGUtYWNlci1uaXRyby01LWFuNTE1LTU4LWZu
LWYxMC1rZXlib2FyZC1iYWNrbGlnaHQtYnVnLW9uLWxpbnV4LyN3bWktaW50ZXJmYWNlLWlz
c3VlcwpTaWduZWQtb2ZmLWJ5OiBBcm1pbiBXb2xmIDxXX0FybWluQGdteC5kZT4KLS0tCiBk
cml2ZXJzL3BsYXRmb3JtL3g4Ni9hY2VyLXdtaS5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0Zm9ybS94ODYv
YWNlci13bWkuYyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2FjZXItd21pLmMKaW5kZXggMThj
YjE4ZTk4ZTVkLi5iZjk3MzgxZmFmNTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGxhdGZvcm0v
eDg2L2FjZXItd21pLmMKKysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvYWNlci13bWkuYwpA
QCAtMTIxLDYgKzEyMSw3IEBAIE1PRFVMRV9BTElBUygid21pOjY3NkFBMTVFLTZBNDctNEQ5
Ri1BMkNDLTFFNkQxOEQxNDAyNiIpOwogCiBlbnVtIGFjZXJfd21pX2V2ZW50X2lkcyB7CiAJ
V01JRF9IT1RLRVlfRVZFTlQgPSAweDEsCisJV01JRF9CQUNLTElHSFRfRVZFTlQgPSAweDQs
CiAJV01JRF9BQ0NFTF9PUl9LQkRfRE9DS19FVkVOVCA9IDB4NSwKIAlXTUlEX0dBTUlOR19U
VVJCT19LRVlfRVZFTlQgPSAweDcsCiAJV01JRF9BQ19FVkVOVCA9IDB4OCwKQEAgLTI1MTIs
NiArMjUxMyw5IEBAIHN0YXRpYyB2b2lkIGFjZXJfd21pX25vdGlmeSh1bmlvbiBhY3BpX29i
amVjdCAqb2JqLCB2b2lkICpjb250ZXh0KQogCQkJc3BhcnNlX2tleW1hcF9yZXBvcnRfZXZl
bnQoYWNlcl93bWlfaW5wdXRfZGV2LCBzY2FuY29kZSwgMSwgdHJ1ZSk7CiAJCX0KIAkJYnJl
YWs7CisJY2FzZSBXTUlEX0JBQ0tMSUdIVF9FVkVOVDoKKwkJLyogQWxyZWFkeSBoYW5kbGVk
IGJ5IGFjcGktdmlkZW8gKi8KKwkJYnJlYWs7CiAJY2FzZSBXTUlEX0FDQ0VMX09SX0tCRF9E
T0NLX0VWRU5UOgogCQlhY2VyX2dzZW5zb3JfZXZlbnQoKTsKIAkJYWNlcl9rYmRfZG9ja19l
dmVudCgmcmV0dXJuX3ZhbHVlKTsKLS0gCjIuMzkuNQoK

--------------DGJ81iJ75ChlzidMpa8ngfMA--
