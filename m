Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B864C31B10E
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 10:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760523190; cv=none; b=JlbHoSYl+MW/39+GkZ9wlqICPqZUwm7PVFb0tNrGlhhTFLLwupoxpxVEZgTAjU79vtZGb7chsjGBM27XdQp5JDzyZvzhkGczp+UZHFuwi6ANqb9gMKv9X7r7bLUyIAdVyBw9gc5B+37aM5HwBXoouGOBcigTdzbV178hTI2nuT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760523190; c=relaxed/simple;
	bh=yRzrxgr77/RDoGIHKf5ocMifTLCujBZ0ZsABPJA3NYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AJWLXDWp2jQh//sx8gD1scf7+HbKiDlmwXj2OLWX0TtGs51MTbY3LhTyuSKBsN0JGOBRuXRS1g9nNikZQnRsH21MtHy8Sk5FzJsgtkkPLyMP1lHrYgb/gdGysZmhWmKD1WpZNRDbu+KiJyPtM5IY+BKRAjFly6tBoSZdb40Pq/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nWJ7stH/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nWJ7stH/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8888FC4CEF8;
	Wed, 15 Oct 2025 10:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760523186;
	bh=yRzrxgr77/RDoGIHKf5ocMifTLCujBZ0ZsABPJA3NYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nWJ7stH/ZPw33kPFQrENCBtSXDqV7FHTt3eE+LGQLYJTs+NGfhf9vJFJ2Rqj3iGjJ
	 UDlSVAW37fQ/OGhrxZLsjOS2jzEgE3y84rXWCAeqgCSq+Ft8mN57J6tztUywbByCZs
	 TSmlYoG6liKYYMxR6ocqYeyfq4SB8soKnvkcV/V38RBBeWubh01zgsTC2Aus1Hqcx3
	 XrVNiCDb9OXXRHPbUhVhE6iOEmuDAqmX71y0VpKX1prD9aPQ6ACOYsTzhFHwwEOdOr
	 wuhtgE/ibeL8R5FilTiR+gZAgoEIwknRAZSpO+m7bXzhmppuqWQR5hnTYKY4Xw3v4F
	 2H1DLRtqRTUtA==
Message-ID: <43a0661f-f70d-4a02-a89a-9686190ed3de@kernel.org>
Date: Wed, 15 Oct 2025 12:13:03 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug] Acer AN515-58: Fn+F10 affects display brightness
 unexpectedly
To: Armin Wolf <W_Armin@gmx.de>, Bugaddr <Bugaddr@protonmail.com>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
References: <cwCuSGwTSU4nQ_hM-qWPNAzJwU2x4qLe_eo0tkxIFIycTeRWmDKjX7IzxJHcOVUPx_xAwjYC3GOV7MSk_LIqPs4HElFbPoSzYIZV5BHWe8Q=@protonmail.com>
 <1536ce4a-5844-447f-9e86-197c71c6d364@gmx.de>
 <0RyizLnGQaxXLOtK-q6h-mHCTA2ergYBAIS-DkF1MPD9T5nx79rlaKdIOUBRft7Ghpy11OPo2OZM4waIjDbdnv2fnafWBDxWEYL75XZKtUo=@protonmail.com>
 <0b485b76-fb44-44a4-afab-d35fa31043db@gmx.de>
 <UyWxc6DtIYzBAkoHTnMQqR6ZTP_TVtFKEpJ1kFmuTP7jKLXmh5MJxU-qD7zLFosJPBpmpLN6Cl79prEADSrrvBQX4Wi6sltWot-u6i-RigI=@protonmail.com>
 <1854119a-c257-4954-81e0-6aa07538d0c5@gmx.de>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <1854119a-c257-4954-81e0-6aa07538d0c5@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 11-Oct-25 5:08 PM, Armin Wolf wrote:
> Am 04.10.25 um 18:33 schrieb Bugaddr:
> 
>>
>>
>>
>>
>> Sent with Proton Mail secure email.
>>
>> On Thursday, October 2nd, 2025 at 3:26 AM, Armin Wolf <W_Armin@gmx.de> wrote:
>>
>>> Am 18.09.25 um 21:18 schrieb Bugaddr:
>>>
>>>>> Am 13.06.25 um 19:12 schrieb Bugaddr:
>>>>>
>>>>>> Hello,
>>>>>> I'm writing to report what appears to be a bug affecting the Acer AN515-58 laptop, and I would appreciate any assistance in investigating or resolving it.
>>>>>>
>>>>>> When I press Fn + F10—which is intended to increase the keyboard backlight brightness—the display brightness unexpectedly decreases along with it. Furthermore, the display brightness continues to lower incrementally, until I manually press Fn + Brightness Up to stop and reverse it.
>>>>>>
>>>>>> After pressing Fn + Brightness Up, the display brightness behavior returns to normal, and the issue does not reoccur—however, from that point onward, the Brightness Down key no longer works.
>>>>>>
>>>>>> This behavior is consistent and reproducible. I'm happy to assist with any debugging, log collection, or kernel testing as needed.
>>>>>>
>>>>>> Best regards,
>>>>>> Bugaddr
>>>>>> Hi,
>>>>> can you share the output of "acpidump"?
>>>>>
>>>>> Thanks,
>>>>> Armin Wolf
>>>>> Sorry for late reply, but checkout this:
>>>>> https://paste.rs/Nqca3
>>>> Thanks,
>>>> Bugaddr
>>>
>>> Hi,
>>>
>>> sorry for the late response. It seems that you forgot to paste parts of the DSDT table. Could you please store the output
>>> of acpidump inside a file (sudo acpidump > acpidump.log) and attach it to the email? Also please put the whole mailing list
>>>
>>> on the CC next time.
>>>
>>> Thanks,
>>> Armin Wolf
>> Hey, please checkout the attached acpidump
>>
>> Thanks,
>> Bugaddr
> 
> Alright, the following ACPI bytecode is likely responsible for sending those brightness down events:
> 
>     Method (_Q11, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
>     {
>         Debug = "=====QUERY_11====="
>                 ^^^WMID.FEBC [Zero] = One    /* Acer hotkey event
>                 ^^^WMID.FEBC [One] = HTBN    /* Hotkey scancode */
>                 ^^^WMID.FEBC [One] = BRTS    /* Unknown, BIOS error? */
>                 ^^^WMID.FEBC [Zero] = 0x04    /* Unknown, BIOS error? */
>                 Notify (WMID, 0xBC)        /* Notify acer-wmi driver */
>                 If (IGDS)            /* Integrated GPU device state? */
>                 {
>             Notify (^^^GFX0.DD1F, 0x87)        /* Decrease brightness on Intel iGPU */
>                 }
>                 Else
>                 {
>                     Notify (^^^PEG1.PEGP.LCD0, 0x87)    /* Decrease brightness on discrete GPU */
>                 }
>     }
> 
> I think the brightness problems are caused by the kernel using the wrong backlight interface.
> Can you please try the following things:
> 
> 1. Unload the acer-wmi driver using "modprobe -r acer-wmi".
> 2. Boot the kernel with "acpi_backlight=vendor" if the problem still occurs.

Using acpi_backlight=vendor on a recent laptop-model like this one is unlikely
to be the right thing to do. acpi_backlight=vendor is for vendor specific
backlight control firmware interfaces from before things were standardized
on using the ACPI video firmware interface around Windows XP (IIRC), not
sure if it was XP or some other Windows release but standardizing on
the API video firmware interface happened a long long time ago and then
things moved to mostly using direct hw access (acpi_backlight=native)
starting with Windows Vista.

acpi_backlight=video could still be something which might be the preferred
way on some devices and also goes through ACPI calls, but using
acpi_backlight=vendor is weird.

OTOH I learned a while ago that apparently if multiple backlight interfaces
are present Windows simply sends the new brightness value to all interfaces.

Anyways Bugaddr please do give acpi_backlight=vendor (and maybe also
acpi_backlight=video) a try as asked by Armin, this will still be
a good data point to have.

Regards,

Hans


