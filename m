Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793552177;
	b=XNERIruYWi0QQWrqexjhlsPdOUA1M3OfBK9tmHbeWy52rphvQCH56ZgqNLj5lhuq9PYG
	 ss2ep7LX0k9c/wF2F3iSa6kj66jbsOkrHX9REcFLdFMvxHwm1SLiJXxlFHKIvC9a/fCvP
	 KbrrZoLdtfblLw0Yx05zbgxun4khdGQtSXO3KEzNF+ToblsaBTM0IaugcRin9uQzAgxqB
	 4GLb0CVle2x04Ug5xd8N1lp9D31HkTc2uy5yG01eZw2ibxgKpJqyd3rosUg4r9xxs9o2c
	 8FN5DhK9k0xvOA2/hymKNaI+16cncuFsnN4u4YCiCH9T49ZTlwlBvOTzSComn6iJ+OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793552177;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=uq5UcYrb3jC8Aad1Y+ojcRwgmWU3RMdEv79Fs7j1qj0=;
	b=0BlDPXGFGljc3V0tMtbwbEB6srAEQnFijRYz9EObG4sQiZus6hvWuCa0pWfN2/F3qVS2
	 tBWlnAq1rZ+J6EyFVt4GFoe8S6yUOa1KXUgB1V4XAAw6zt4l4EN0hvgQSGaZWEyx2dmPq
	 EDPLjro2sp1Zavqtb5Pd4kSOaQIHR3Imm8DAu63gnvFeoVaElz7N3GfodyfpW8BNK0sPN
	 wQ7LZ/TVBKclFJ21AqqJi/Yuq8pQaOVUEuSKN6FGCRuNsrnsn4i0e8PQcj9uw7RycqCjk
	 MXAG7qLfPtq9P7mPyuWZSPY8aOvk/k6GyxFZnGO41uHqago5O0IfOW5XBbIN2CzjETQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=VGt+GoIh;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BD7606A324
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 16:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54BD7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=VGt+GoIh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793552164; x=1794156964; i=w_armin@gmx.de;
	bh=uq5UcYrb3jC8Aad1Y+ojcRwgmWU3RMdEv79Fs7j1qj0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VGt+GoIhsNf1osTaos1ZjNU0ttATKf9DfQyxiRBNbd+fejK3/ZmAsO/ibyJ2pggz
	 KSrsXM1S1VM13dF9auiwW8Z+TGa35WuwKEaTS36xlkWxtpqrv9D0/MB8/o+NeeFD8
	 /LK0tFZsH1+B2YFuBuUyLuT3HeT1IOE9afhsTlXPNMtfjyTAuhr90zr1LyUh/hFHk
	 dSNp4uLGI9pWPWVaTQWE9lc16c+qe1dgEbY1e3xfcrcjqWLKu5DwcJBSA3fdpuBAY
	 kzjevIH3iA8bXdwmdjdkO+vj7hwHmYhlaB6NpWFno0EkEaVXRyMm7edp5wSv6DiNC
	 2LAuGMzhZ2s+W/jvBA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgvvT-1wtjHV0wub-00ixDd; Sun, 01
 Nov 2026 17:56:04 +0100
Message-ID: <2b2cd3fb-4c69-488d-915d-19a4dc338452@gmx.de>
Date: Sun, 1 Nov 2026 17:56:03 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: uniwill-laptop: XMG EVO 14 (E25) support - DMI entry, perf
 profiles, kbd backlight
From: Armin Wolf <W_Armin@gmx.de>
To: Nico Kessler <nicokessler@icloud.com>
Cc: platform-driver-x86@vger.kernel.org
References: <8A581217-ADC4-4DC2-AE21-1A92537341B0@icloud.com>
 <7FEA1980-AFC6-4A6C-84E1-E820B7E6CF3C@icloud.com>
 <56d9221d-c228-4037-8677-3d4737e323ca@gmx.de>
Content-Language: en-US
In-Reply-To: <56d9221d-c228-4037-8677-3d4737e323ca@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Uut3hAbw4kMnFnXNxeN887NJdrTbV5+YQJsV7RGU4L3514cL46D
 yT39nR2ofFeGlayN7hyzjWYeuX17neKwToIzgIVPfahRuoJLVA8ebnlWaxI016hw7CrWLyT
 LKSjsHFRjXSFyv/8CYny5hoIjk8yDUVCovrd+8bAo3IKGYEkTrTok3hl3kOwT0nY8VDnzs0
 s4s9MaFjptqIviLa04oqA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:i9VGgqAM3VQ=;xRyqCOvwnUM6lDQa2657cYVuxqX
 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

Am 27.10.26 um 22:14 schrieb Armin Wolf:

> Am 27.10.26 um 19:40 schrieb Nico Kessler:
>
>> Hi Armin,
>>
>> a short addition to point 2 (charging profiles), now that I measured=20
>> a full charge with each profile:
>>
>> Trickle: charge ends at 16.75 V (4.19 V/cell), shown as 100%
>> Standard: charge goes to 17.62 V (4.40 V/cell), also shown as 100%,
>> still in the CV phase at that point (1.1 A)
>>
>> So the EC limits the end voltage in Trickle and rescales the reported=
=20
>> capacity, the OS sees 100% in both cases. During the Standard charge,=
=20
>> 16.75 V under 2.1 A was reported as 86%.
>>
>> Thanks,
>> Nico Kessler
>
> Good work, i attached a patch that should whitelist your device. Can=20
> you just check that this patch works
> as intended?
>
> Thanks,
> Armin Wolf=20

Just for anyone that is listening: the user has replied off-list and repor=
ted that the patch works.

Thanks,
Armin Wolf

>>> Am 27.10.2026 um 16:40 schrieb Nico Kessler <nicokessler@icloud.com>:
>>>
>>> =EF=BB=BF
>>> =EF=BB=BF
>>> Hi Armin,
>>>
>>> the XMG EVO 14 (E25) uses the same board as the TUXEDO InfinityBook=20
>>> Pro 14 Gen10 AMD, which is already in uniwill_dmi_table, but ships=20
>>> with a different system vendor, so uniwill-laptop does not load:
>>>
>>> sys_vendor: SchenkerTechnologiesGmbH
>>> product_name: XMG EVO (E25)
>>> board_name: XxKK4NAx_XxSP4NAx
>>> CPU: AMD Ryzen AI 7 350
>>> Kernel: 7.3.0-5-cachyos
>>>
>>> I built the 7.3 driver out of tree with an extra DMI entry and=20
>>> tested it for a few hours. Findings below, all register values were=20
>>> read back from the EC.
>>>
>>> 1) DMI entry
>>>
>>> With tux_featureset_4_descriptor and vendor=20
>>> "SchenkerTechnologiesGmbH" the driver loads and works (charge_types,=
=20
>>> hwmon, fn_lock).
>>>
>>> 2) Charging profiles (charge_types)
>>>
>>> Standard / Long_Life / Trickle map to the three profiles of the XMG=20
>>> Control Center on Windows (OEM_4 0x07A6 bits 5:4). Two observations:
>>> - The firmware resets the profile to Standard on every boot (and=20
>>> when settings are saved in the BIOS setup). The Windows XMG Control=20
>>> Center re-applies it at startup; on Linux it has to be set again=20
>>> after each boot.
>>> - With Trickle the charge ends at 100% displayed with 16.75 V (4S=20
>>> pack, design voltage 15.4 V), so the reduced peak voltage seems to=20
>>> be handled by the EC as XMG describes.
>>>
>>> 3) Performance profiles (not supported by the driver yet)
>>>
>>> The three BIOS profiles are selected through 0x0751=20
>>> (EC_ADDR_MANUAL_FAN_CTRL). 0x07E8 reports the active one. Identical=20
>>> values whether set in the BIOS setup or with the XMG Control Center=20
>>> on Windows; a full dump of 0x0700-0x07FF showed no other related=20
>>> changes:
>>>
>>> profile 0x0751 0x07E8 sustained PPT (stress-ng)
>>> Balanced 0xa0 0x08 25 W, 62 C
>>> Enthusiast 0x00 0x00 45 W, 81 C
>>> Overboost 0x10 0x01 65 W, 94 C
>>>
>>> Writing 0x0751 from Linux switches the profile: 0x07E8 follows=20
>>> within 2 seconds and the power limits change as measured above. The=20
>>> setting survives reboots. PL1/PL2/PL4 (0x0783-0x0785) stay at 0 in=20
>>> all profiles.
>>>
>>> 4) Keyboard backlight (white, 4 levels)
>>>
>>> KBD_STATUS 0x078C reads 0x01 / 0x21 / 0x41 / 0x61 / 0x81 for off and=
=20
>>> levels 1-4, so single color with kbd_led_max_brightness =3D 4 fits.=20
>>> Fn+Space is handled by the EC, and the EC turns the backlight off=20
>>> during suspend and restores it by itself.
>>> Note: uniwill_kbd_led_init() would set ENABLE_CHINA_MODE in 0x0782=20
>>> here, because CHINA_MODE is not set in SUPPORT_2 (0x0766 =3D 0x90). I=
=20
>>> did not know what that does on this firmware, so I skipped that=20
>>> write (and the suspend/resume writes) in my test build. Writing only=
=20
>>> the brightness bits works fine.
>>>
>>> Could you add the DMI entry? If useful, I can send my test patch for=
=20
>>> the profile and backlight parts, more register dumps, or test patches.
>>>
>>> Thanks,
>>> Nico Kessler
