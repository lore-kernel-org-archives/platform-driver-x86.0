Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A605328B50
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Nov 2025 15:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763392260; cv=none; b=ZKvX6MJvKBELS7QLlm2E24tbiLnPBjcjxMdr6KNiW7xvJ4nXTQ8Du6h7p2U3M6VuFdTtEtVEQiN7gJINuoaWU4rR8IhVFwrjJYemY8CwHFb/ucFfPpUQIZ8ri/PMagWYYcq7rXOvOABsoLRyIsb2z9n4CXdLL6fN2pSnNU0ruDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763392260; c=relaxed/simple;
	bh=pK1CdGIUnPdPrGi6OoMNu4HGGs+FcBFkEeBGloskwYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dfhyyv9E7LEWHXL+s/JwwXIBVcB27hr/j7LWltscsrIDrb+CkY2kjovDH/4xzNx7z/TgVAuZo7ShlkL8VprjCXTC+UbvA8eJ/OQgQzhzQPRJu5Uh0h2F7qdV8bhGcbCzgL2CBhwxscyStRcdm0hLXIJ55W6VSYh9tUePO1D9fxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XVkOUSUu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XVkOUSUu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA36C116B1;
	Mon, 17 Nov 2025 15:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763392259;
	bh=pK1CdGIUnPdPrGi6OoMNu4HGGs+FcBFkEeBGloskwYw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XVkOUSUuM1yP/QfXl6w79keOuVxQ1elbXrhHb7Ya4Eb2AmBavee6ghtsC2CaZ7dtD
	 k4tEyEIi1M2+Q+5szz0bBmAEpeh47MQPP108SEygyq1vatx0PxRaj1toJsC+TKKD7E
	 Q7/M/Rh0l5MLVJqAC5pmS1Cpx4SgFez3hyYCCi5YsG4e5tSD+nnX56KevxOOROSP+m
	 H3BUIdQih8WRTpzygan9Nf4e7m/6G4izjFM3jetlh4PrtilqSFGe3k6V9gm146e08m
	 VZA39Ae6DETfKM2neEY9chgZOtr13RN00ojYgTEk0CnBH785xFzx63SrrnXAjCu6ax
	 ZAz1L1B2V0DcQ==
Message-ID: <d78bbd3a-d4df-4a1a-aa78-a6e4c4c0a4e6@kernel.org>
Date: Mon, 17 Nov 2025 16:10:57 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug] Acer AN515-58: Fn+F10 affects display brightness
 unexpectedly
To: Bugaddr <Bugaddr@protonmail.com>, Armin Wolf <W_Armin@gmx.de>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
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
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <i02dtJC1U0Pf-yZFGOXKCBYdnbCerkuTvEkD3E0SbQt3bVvkBK8preFKHRAfgsi3_FijP8cZAu0HSNAjxEn3gAoYpDseHbUqNXRoE3fl1tw=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 17-Nov-25 3:12 PM, Bugaddr wrote:
> On Monday, November 17th, 2025 at 6:35 AM, Armin Wolf <W_Armin@gmx.de> wrote:
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
>>>>> all backlight modes, and I’d appreciate your guidance on the next
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
>>>>>>>>>>>>> When I press Fn + F10—which is intended to increase the
>>>>>>>>>>>>> keyboard backlight brightness—the display brightness
>>>>>>>>>>>>> unexpectedly decreases along with it. Furthermore, the
>>>>>>>>>>>>> display brightness continues to lower incrementally, until I
>>>>>>>>>>>>> manually press Fn + Brightness Up to stop and reverse it.
>>>>>>>>>>>>>
>>>>>>>>>>>>> After pressing Fn + Brightness Up, the display brightness
>>>>>>>>>>>>> behavior returns to normal, and the issue does not
>>>>>>>>>>>>> reoccur—however, from that point onward, the Brightness Down
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
>>>>>>>>>>
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
>>>>>>>>
>>>>>>>> Method (_Q11, 0, NotSerialized) // _Qxx: EC Query, xx=0x00-0xFF
>>>>>>>> {
>>>>>>>> Debug = "=====QUERY_11====="
>>>>>>>> ^^^WMID.FEBC [Zero] = One /* Acer hotkey event
>>>>>>>> ^^^WMID.FEBC [One] = HTBN /* Hotkey scancode /
>>>>>>>> ^^^WMID.FEBC [One] = BRTS / Unknown, BIOS error? /
>>>>>>>> ^^^WMID.FEBC [Zero] = 0x04 / Unknown, BIOS error? /
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
>>>>>>>> 2. Boot the kernel with "acpi_backlight=vendor" if the problem
>>>>>>>> still occurs.
>>>>>>>> Using acpi_backlight=vendor on a recent laptop-model like this one
>>>>>>>> is unlikely
>>>>>>>> to be the right thing to do. acpi_backlight=vendor is for vendor
>>>>>>>> specific
>>>>>>>> backlight control firmware interfaces from before things were
>>>>>>>> standardized
>>>>>>>> on using the ACPI video firmware interface around Windows XP
>>>>>>>> (IIRC), not
>>>>>>>> sure if it was XP or some other Windows release but standardizing on
>>>>>>>> the API video firmware interface happened a long long time ago and
>>>>>>>> then
>>>>>>>> things moved to mostly using direct hw access (acpi_backlight=native)
>>>>>>>> starting with Windows Vista.
>>>>>>>
>>>>>>> acpi_backlight=video could still be something which might be the
>>>>>>> preferred
>>>>>>> way on some devices and also goes through ACPI calls, but using
>>>>>>> acpi_backlight=vendor is weird.
>>>>>>>
>>>>>>> OTOH I learned a while ago that apparently if multiple backlight
>>>>>>> interfaces
>>>>>>> are present Windows simply sends the new brightness value to all
>>>>>>> interfaces.
>>>>>>>
>>>>>>> Anyways Bugaddr please do give acpi_backlight=vendor (and maybe also
>>>>>>> acpi_backlight=video) a try as asked by Armin, this will still be
>>>>>>> a good data point to have.
>>>>>>>
>>>>>>> Regards,
>>>>>>>
>>>>>>> Hans
>>>>>>> Here are the logs:
>>>>>>
>>>>>> # Logs after setting acpi_backlight=vendor & removing acer-wmi
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
>>>>>> # Logs after setting acpi_backlight=video
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
>>>>>> ** I am on latest bios update & acpi_backlight=native also dont work
>>>>>>
>>>>>> Regards,
>>>>>> Bugaddr
>>>>>> Hi everyone,
>>>>
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
>>>> KEYBOARD_KEY_ef=reserved
>>>> EOF
>>>>
>>>> sudo systemd-hwdb update && sudo udevadm trigger
>>>> --sysname-match="event*"
>>>>
>>>> TESTED ON:
>>>> - Kernel: 6.17.8-arch1-1
>>>> - Distribution: Arch Linux
>>>> - Desktop: KDE Plasma (Wayland)
>>>>
>>>> I have blogged my full analysis here:
>>>> https://bugaddr.tech/posts/2025-11-16-debugging-the-acer-nitro-5-an515-58-fn-f10-keyboard-backlight-bug-on-linux/
>>>>
>>>> Thanks & regards,
>>>> Bugaddr
>>>
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
>>
>> I just read your blog post and it seems that your device has some WMI interface issues. The warning
>> from the WMI driver regarding the missing WQ00 ACPI control method is harmless, as the WMI driver core
>> will simply ignore the affected WMI device.
>>
>> The unknown function number 4 - 0 however can be fixed inside the acer-wmi driver. It seems that all
>> we need to do is to tell the driver to ignore function number 4 - 0, as the acpi-video driver already
>> handles the brightness up/down events.
>>
>> Can you test the attached patch?
>>
>> Thanks,
>> Armin Wolf
> 
> Thanks Armin for the patch, I have tested this patch on my device and yes the logs are suppressed. Well its unrelated but I am only getting this messages when pressing fn+F9 (Keyboard backlight down) & there are no such warnings on fn+F10 (Keyboard brightness up):
> 
> [  398.153437] atkbd serio0: Unknown key pressed (translated set 2, code 0xf0 on isa0060/serio0).
> [  398.153469] atkbd serio0: Use 'setkeycodes e070 <keycode>' to make it known.
> 
> Note: The hwdb overrides were still there while testing (The issue of display brightness came back after removing those overrides)

You can silence that by also mapping 0xf0 to reserved in your hwdb changes.
Never mind I see you've already done this in your blogpost.

> Yes, all buttons (display & keyboard backlight up/down) works perfectly after this hwdb fix. Yes, I am going to open a pull request to systemd regarding this fix.

Great, thank you!

Regards,

Hans


