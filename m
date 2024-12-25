Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3111DFE1
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Dec 2024 20:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735159924; cv=none; b=CPVbEP2cw2ufrTxf+mYPlfA3qlRgi5qLHwty7KjYdG96934yrzaAIOkTjL5UpyFqiCFQ9ODiV+xXqVVDFCeAUB8QW6jNGe8u0FnuNSrD7fMtqQIGnaNWmdjBYobgbebGaGWrrnp9GqrDSRALINcAsFoJqMTBjCRoAYPMcS8VrLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735159924; c=relaxed/simple;
	bh=2vebcg+AMXlRy3mNS0+VHLPt+Jjvp8P33zQXuEYXS/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oaJFzKzOPC256uUv00uf1eAUK92jGX8c7WbIbL84L76y2Svo6g3pye/vZ4+KQwdg5F64egIBjkfMp4V1hRFysUlnstox2yaVAtXHM9Fed3e8AaS3aO2iweQ6yv0ZuFs+AcIh+FA5t+saY/fsFT8q44cy81dFjv879P5zTxS0ljs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=dTVs4Go7; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="dTVs4Go7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735159920; x=1735764720; i=w_armin@gmx.de;
	bh=iaMl4LHfXUs62RXgHiCMGVy/GZXkG+HYsXK+rdJou9U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=dTVs4Go7FTpYUD6p9gZrTKAfe7V8aWCYYJb2zfG+yMLWVyZadtwXxf9HEYWPBvxv
	 uIR5f8Ne4grNwR4U5FdIW02jy8Hio5amFoSResURjf7/VLwgwb+2IGjBopglCfOND
	 CoixS0QtGIbhP//CvbvwgVoxyaOjpXu/BgOpawthzoke0kJBXLDjFF/bf97tiPi5F
	 RqJi0vnUYkibe9mXqd/EG3zOph2ImHnc85cRNEV7N0cIdhoHTQ+jl6jkeU28faK/V
	 +YBr306Bg8lhMHPiZhv706MoTCz+ut3RTFx8TIX0sl4+2PAS3lYhcyz19JlVq5c2R
	 eFfk0nHZghqiHZe9Kg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.2.35] ([91.137.126.34]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpDJX-1tsykS2s87-00pIDO; Wed, 25
 Dec 2024 21:52:00 +0100
Message-ID: <ecb60ee5-3df7-4d7e-8ebf-8c162b339ade@gmx.de>
Date: Wed, 25 Dec 2024 21:51:58 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: acer-wmi: Nitro button doesn't produce a WMI event
To: Hridesh MG <hridesh699@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CALiyAom1xDH6A0Q2WNHCMUcpMJfM3pXO2DaW=bgHGUi8ZOpBbQ@mail.gmail.com>
 <8b8749c1-59c8-4f95-a43e-055cf94f9597@gmx.de>
 <CALiyAo=R1kcvwRpw22s=YU0YHUxR8T_WHLwSvDr=8Ahsenn-jA@mail.gmail.com>
 <9c625119-e46e-464b-933d-9c836577f454@gmx.de>
 <CALiyAo=7kVi4ipA5-xDfRYQ-gqyza0woYHUzwGuW5BccLOVHgg@mail.gmail.com>
 <209f39ab-a312-45b5-981c-8324d9b8cd90@gmx.de>
 <CALiyAo=GpKN2Aty5c3Bw0Vh4U16vgUP29pZkaeBsOKw8kcK29w@mail.gmail.com>
 <c5124fb9-74af-4c90-9edc-ddb3517cd9ac@gmx.de>
 <CALiyAok0_JKE+BkUQxHHH8Z39FHq5bW0Hb1Gk-MYHgDy0yFoMA@mail.gmail.com>
 <cea0918c-7c7d-49e1-8b33-b952b64d67f1@gmx.de>
 <d7be714c-3103-42ee-ad15-223a3fe67f80@gmx.de>
 <CALiyAomaT5y10Bawth3X44WB9Cie1fhW0GyBZgASo7ySK6g9zQ@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CALiyAomaT5y10Bawth3X44WB9Cie1fhW0GyBZgASo7ySK6g9zQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:pXSN9o8Y9ivWrrL+pZwpd8MrhxEzY5Vith+TPUUDHvaADQ8Ke65
 GxIyBDzjPaFTIMeRY5UTEGvzokgeQ0GX/taZ5v8Y/+50BxU7JUbRdLLwtynLVWB/SrQpHFZ
 95LcjmVf4zbJ2fyTsdNab2VvAdb+TgvfEkfjUv8ITY1mPWFd7zRzocysytge772FjA1NcdV
 bra8FPV5OJFfGz3F/B9rQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6AI6AALQDwc=;Ca/EmqNuApDRXCvFnQA5D8EJ1MP
 +hl64h3VEfRLjWh4w2ftUoQovBt+9nrueYrAsoDz1bo1hLrlp0EQQeSyjkd6LEZKX0wYv/foY
 vz68LA3A7LzlnYlkVk6Rpvvk4t3o65TgVkmgdudbgJFEOtWlt0ud/DP2a75/Ya6bwaCErwHWG
 LhAvduageinD1K7Va1YZj8fNGSHRYvEt3OnR66L+sw3otVkjoYNOlVR+OiHB2kVNHd/HZrCaR
 3YnogBomIMof7NFPxmq5oL2CxN4O4qygr47DV8Y3oAVgtLiOXyn7fVdcNTVW04F6mXgjlxINg
 V5GMGkeJdXuOArhsow1OHX8dYV8+/LlGirRTNMHE75pqdRTpkRvDJRtb5EaMGDF9YsiuvORMC
 YyQdQNXx8UWIZQM60yOYpw3hW0IQw2bSl+DvB1AVjyu9OilI8QvknZnYYdvE0WW3Z09fotGzA
 ILZmCNpPNHlrkw1+ywVOJ2MumNZpWVTEZW5JGuaYuPY16fou+qIBc4nuIWDpx+Z7HAZrOQzMA
 QWTexaX5JCR15jti0o9eNTIh7lQ6rrc8XxVt820PvE/dnzqWHYtI2SoPpNvh0Ilf8zF0+NIz6
 7+5b1QNz6NtxlQfEVg+vkPjMp85OdD7FIOsR/5lR/fULWBYX75UzFfW3er1DTFa50g9ywZfD2
 TUYrY1es24VPcgR1jbRW00qZ8E+jQTY4zqKHsnsAUFBass+hW8EcRIbvbe9lYuCbOXF2bYL37
 n7RlpKTR+o+wht/EMaJXITzS873mC/QtRZv2K5SnddCK4tum9zqLD/MxYKY6sgjfocKbOM5V7
 ip2cj+gM5uLV9BtMAdw4asYL/WxBxVeqlTBqkQjxFFA2tzHaLxvozJ3ZRy0VPazQ+fyY+hzFQ
 cD/zAsiDTNpnmZXWbl4pfdKwnqCaRPvOmvWbBBVEKUJ9E3VOflPywXAsA1GagCrzc108+dxZZ
 BWIWBaZGf91K4WIKy0OH1XdQ4PWiMKUCXaJhx+n1PUJxuGACfgZzL3QWkK81b7WUxYdr/BrMa
 BikRUsY9aTFq2RZc/b9I2aIQ+ZKAO2Oo5bS56PGN3V49wTDwT28XkuXuce7DQWtMzTyhmqiYe
 QrJJjZ3cp2Qww//RIR5VZd8QfP9R57

Am 24.12.24 um 19:45 schrieb Hridesh MG:

>> Am 24.12.24 um 00:06 schrieb Armin Wolf:
>> This WMI call is already supported by the driver and exposed to userspace using the platform profile interface.
>> It seems however that your device:
>>
>> - does only support the turbo profile and not the other OC settings
>>
>> - only supports a subset of the platform profile choices
>>
>> - uses a different EC address for storing the current platform profile
>>
>> Can you test kernel patches? I can prepare a patch for you which:
>>
>> - puts your device on the necessary whitelists
>>
>> - fixes the platform profile handling
>>
>> Thanks,
>> Armin Wolf
> Oh I see, thank you for your work! Actually, could I work on the patch
> myself? I'd like to take this as an opportunity to learn something
> new, I'm also a mentee under the LFX kernel bug fixing mentorship
> program and was hoping to create a patch which could count towards my
> graduation requirements out of this issue.
>
> I understood the rest, but if it isn't too much of a bother, could you
> tell me how you found out the EC address? (or the fact that it was
> different)
>
> Thanks,
> Hridesh MG

This is the full definition of the Acer gaming WMI interface on your machine:

[WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Class used to Gaming Function, Version 2.88"), guid("{7A4DDFE7-5B5D-40B4-8595-4408E0CC7F56}")]
class AcerGamingFunction {
   [key, read] string InstanceName;
   [read] boolean Active;

   [WmiMethodId(1), Implemented, read, write, Description("Set Acer Gaming Profile Configuration.")] void SetGamingProfile([in] uint64 gmInput, [out] uint32 gmOutput);
   [WmiMethodId(2), Implemented, read, write, Description("Set Acer Gaming LED Behavior.")] void SetGamingLED([in] uint8 gmInput[12], [out] uint32 gmOutput);
   [WmiMethodId(3), Implemented, read, write, Description("Get Acer Gaming Profile Configuration.")] void GetGamingProfile([in] uint32 gmInput, [out] uint64 gmOutput);
   [WmiMethodId(4), Implemented, read, write, Description("Get Acer Gaming LED Behavior.")] void GetGamingLED([in] uint32 gmInput, [out] uint8 gmReturn, [out] uint8 gmOutput[11]);
   [WmiMethodId(5), Implemented, read, write, Description("Get Acer Gaming System Information.")] void GetGamingSysInfo([in] uint32 gmInput, [out] uint64 gmOutput);
   [WmiMethodId(6), Implemented, read, write, Description("Set Acer Gaming RGB Keyboard Setting.")] void SetGamingRgbKb([in] uint64 gmInput, [out] uint32 gmOutput);
   [WmiMethodId(7), Implemented, read, write, Description("Get Acer Gaming RGB Keyboard Setting.")] void GetGamingRgbKb([in] uint32 gmInput, [out] uint64 gmOutput);
   [WmiMethodId(8), Implemented, read, write, Description("Set Acer Gaming Profile Setting.")] void SetGamingProfileSetting([in] uint64 gmInput, [out] uint32 gmOutput);
   [WmiMethodId(9), Implemented, read, write, Description("Get Acer Gaming Profile Setting.")] void GetGamingProfileSetting([in] uint32 gmInput, [out] uint64 gmOutput);
   [WmiMethodId(10), Implemented, read, write, Description("Set Acer Gaming LED Group Behavior.")] void SetGamingLEDBehavior([in] uint64 gmInput, [out] uint32 gmOutput);
   [WmiMethodId(11), Implemented, read, write, Description("Get Acer Gaming LED Group Behavior.")] void GetGamingLEDBehavior([in] uint32 gmInput, [out] uint64 gmOutput);
   [WmiMethodId(12), Implemented, read, write, Description("Set Acer Gaming LED Group Color.")] void SetGamingLEDColor([in] uint64 gmInput, [out] uint32 gmOutput);
   [WmiMethodId(13), Implemented, read, write, Description("Get Acer Gaming LED Group Color.")] void GetGamingLEDColor([in] uint32 gmInput, [out] uint64 gmOutput);
   [WmiMethodId(14), Implemented, read, write, Description("Set Acer Gaming Fan Group Behavior.")] void SetGamingFanBehavior([in] uint64 gmInput, [out] uint32 gmOutput);
   [WmiMethodId(15), Implemented, read, write, Description("Get Acer Gaming Fan Group Behavior.")] void GetGamingFanBehavior([in] uint32 gmInput, [out] uint64 gmOutput);
   [WmiMethodId(16), Implemented, read, write, Description("Set Acer Gaming Fan Group Speed.")] void SetGamingFanSpeed([in] uint64 gmInput, [out] uint32 gmOutput);
   [WmiMethodId(17), Implemented, read, write, Description("Get Acer Gaming Fan Group Speed.")] void GetGamingFanSpeed([in] uint32 gmInput, [out] uint64 gmOutput);
   [WmiMethodId(18), Implemented, read, write, Description("Set Acer Gaming Fan Table.")] void SetGamingFanTable([in] uint64 gmInput, [out] uint32 gmOutput);
   [WmiMethodId(19), Implemented, read, write, Description("Get Acer Gaming Fan Table.")] void GetGamingFanTable([out] uint64 gmOutput);
   [WmiMethodId(20), Implemented, read, write, Description("Set Acer Gaming Keyboard Backlight Behavior.")] void SetGamingKBBacklight([in] uint8 gmInput[16], [out] uint32 gmOutput);
   [WmiMethodId(21), Implemented, read, write, Description("Get Acer Gaming Keyboard Backlight Behavior.")] void GetGamingKBBacklight([in] uint32 gmInput, [out] uint8 gmReturn, [out] uint8 gmOutput[15]);
   [WmiMethodId(22), Implemented, read, write, Description("Set Acer Gaming Miscellaneous Setting.")] void SetGamingMiscSetting([in] uint64 gmInput, [out] uint32 gmOutput);
   [WmiMethodId(23), Implemented, read, write, Description("Get Acer Gaming Miscellaneous Setting.")] void GetGamingMiscSetting([in] uint32 gmInput, [out] uint64 gmOutput);
   [WmiMethodId(24), Implemented, read, write, Description("Set CPU Overclocking Profile.")] void SetCPUOverclockingProfile([in] uint8 OCProfile, [in] uint8 OCStructure[512], [out] uint8 ReturnCode, [out] uint8 Reserved[3]);
   [WmiMethodId(25), Implemented, read, write, Description("Get CPU Overclocking Profile.")] void GetCPUOverclockingProfile([in] uint8 Reserved[4], [out] uint8 ReturnCode, [out] uint8 ReturnOCProfile, [out] uint8 OCStructure[512]);
};

The method "SetGamingMiscSetting"  is used to set the platform profile. For reading however the EC is accessed by the acer-wmi driver.

This is the ACPI code responsible for handling "SetGamingMiscSetting" and "GetGamingMiscSetting" (Arg1 is the WMI method id, Arg2 contains the input arguments):

                 If ((Arg1 == 0x16))
                 {
                     BHSK = Arg2
                     Local0 = DerefOf (BHSK [Zero])
                     Local1 = DerefOf (BHSK [One])
                     BHSK [Zero] = 0x03
                     If ((Local0 == One))
                     {
                         \_SB.PC00.LPCB.EC0.TKST = Local1
                         BHSK [Zero] = Zero
                     }
                     ElseIf ((Local0 == 0x02))
                     {
                         WSMI (Arg1, Arg2)
                         BHSK = WMIB /* \_SB_.PC00.WMID.WMIB */
                     }
                     ElseIf ((Local0 == 0x05)){}
                     ElseIf ((Local0 == 0x06))
                     {
                         WSMI (Arg1, Arg2)
                         BHSK = WMIB /* \_SB_.PC00.WMID.WMIB */
                     }
                     ElseIf ((Local0 == 0x07)){}
                     ElseIf ((Local0 == 0x08))
                     {
                         WSMI (Arg1, Arg2)
                         BHSK = WMIB /* \_SB_.PC00.WMID.WMIB */
                     }
                     ElseIf ((Local0 == 0x09))
                     {
                         BHSK [Zero] = One
                     }
                     ElseIf ((Local0 == 0x0A))
                     {
                         BHSK [Zero] = 0x03
                     }
                     ElseIf ((Local0 == 0x0B))
                     {

This code in particular is responsible for setting the platform profile. Noticed the OPMS field here which is used to
store the current platform profile set by the driver.

                         \_SB.PC00.LPCB.EC0.OPMS = Local1
                         If ((OG00 == Zero))
                         {
                             If ((\_SB.GGIV (0x090E000A) == Zero))
                             {
                                 If ((Local1 == Zero))
                                 {
                                     \ODV0 = Zero
                                 }
                                 ElseIf ((Local1 == One))
                                 {
                                     \ODV0 = One
                                 }
                                 ElseIf ((Local1 == 0x04))
                                 {
                                     \ODV0 = 0x02
                                 }
                             }
                             ElseIf ((Local1 == Zero))
                             {
                                 \ODV0 = 0x03
                             }
                             ElseIf ((Local1 == One))
                             {
                                 \ODV0 = 0x04
                             }
                             ElseIf ((Local1 == 0x04))
                             {
                                 If (((CMSR (0x77) == 0x05) || (CMSR (0x77) == 0x04)))
                                 {
                                     \ODV0 = 0x06
                                 }
                                 Else
                                 {
                                     \ODV0 = 0x05
                                 }
                             }
                         }

                         If ((OG00 == One))
                         {
                             If ((\_SB.GGIV (0x090E000A) == Zero))
                             {
                                 If ((Local1 == Zero))
                                 {
                                     \ODV0 = 0x07
                                 }
                                 ElseIf ((Local1 == One))
                                 {
                                     \ODV0 = 0x08
                                 }
                                 ElseIf ((Local1 == 0x04))
                                 {
                                     \ODV0 = 0x09
                                 }
                             }
                             ElseIf ((Local1 == Zero))
                             {
                                 \ODV0 = 0x0A
                             }
                             ElseIf ((Local1 == One))
                             {
                                 \ODV0 = 0x0B
                             }
                             ElseIf ((Local1 == 0x04))
                             {
                                 If (((CMSR (0x77) == 0x05) || (CMSR (0x77) == 0x04)))
                                 {
                                     \ODV0 = 0x0D
                                 }
                                 Else
                                 {
                                     \ODV0 = 0x0C
                                 }
                             }
                         }

                         \_SB.IETM.ODVP ()
                         Notify (\_SB.IETM, 0x88) // Device-Specific
                         Notify (\_SB.NPCF, 0xC0) // Hardware-Specific
                         Notify (\_SB.NPCF, 0xC1) // Hardware-Specific
                         BHSK [Zero] = Zero
                     }
                     ElseIf ((Local0 == 0x0D))
                     {
                         BHSK [Zero] = 0x03
                     }
                     ElseIf ((Local0 == 0x0E))
                     {
                         BHSK [Zero] = 0x03
                     }
                     ElseIf ((Local0 == 0x0F))
                     {
                         If ((Local1 == One))
                         {
                             BHSK [Zero] = Zero
                             \_SB.PC00.LPCB.EC0.FMKY = One
                         }
                         ElseIf ((Local1 == 0x02))
                         {
                             BHSK [Zero] = Zero
                             \_SB.PC00.LPCB.EC0.FMKY = Zero
                         }
                     }
                     Else
                     {
                         BHSK [Zero] = 0x03
                         BHSK [One] = Zero
                         BHSK [0x02] = Zero
                         BHSK [0x03] = Zero
                     }

                     Return (BHSK) /* \_SB_.PC00.WMID.BHSK */
                 }

                 If ((Arg1 == 0x17))
                 {
                     BHSK = Arg2
                     Local0 = DerefOf (BHSK [Zero])
                     BHGK [Zero] = Zero
                     BHGK [One] = 0xFF
                     If ((Local0 == One))
                     {
                         BHGK [One] = \_SB.PC00.LPCB.EC0.TKST /* External reference */
                         BHGK [Zero] = Zero
                     }
                     ElseIf ((Local0 == 0x02))
                     {
                         WSMI (Arg1, Arg2)
                         BHGK = WMIB /* \_SB_.PC00.WMID.WMIB */
                     }
                     ElseIf ((Local0 == 0x05)){}
                     ElseIf ((Local0 == 0x06))
                     {
                         WSMI (Arg1, Arg2)
                         BHGK = WMIB /* \_SB_.PC00.WMID.WMIB */
                     }
                     ElseIf ((Local0 == 0x07)){}
                     ElseIf ((Local0 == 0x08))
                     {
                         WSMI (Arg1, Arg2)
                         BHGK = WMIB /* \_SB_.PC00.WMID.WMIB */
                     }
                     ElseIf ((Local0 == 0x09))
                     {
                         WSMI (Arg1, Arg2)
                         BHGK = WMIB /* \_SB_.PC00.WMID.WMIB */
                     }
                     ElseIf ((Local0 == 0x0A))
                     {
                         BHGK [Zero] = Zero
                         BHGK [One] = 0x13

Side note: this field seems to contain a bitmap of the supported platform profiles on this machine.

                     }
                     ElseIf ((Local0 == 0x0B))
                     {

Calling this method ("GetGamingMiscSetting") with the same command (0x0B) would return the current platform
profile by using the OPMS field.

                         BHGK [Zero] = Zero
                         BHGK [One] = \_SB.PC00.LPCB.EC0.OPMS /* External reference */
                     }
                     ElseIf ((Local0 == 0x0C))
                     {
                         BHGK [One] = Zero
                     }
                     ElseIf ((Local0 == 0x0D))
                     {
                         BHGK [Zero] = 0x03
                     }
                     ElseIf ((Local0 == 0x0E))
                     {
                         BHGK [Zero] = 0x03
                     }
                     ElseIf ((Local0 == 0x0F))
                     {
                         If ((\_SB.PC00.LPCB.EC0.FMKY == One))
                         {
                             BHGK [Zero] = Zero
                             BHGK [One] = One
                         }
                         ElseIf ((\_SB.PC00.LPCB.EC0.FMKY == Zero))
                         {
                             BHGK [Zero] = Zero
                             BHGK [One] = 0x02
                         }
                     }
                     ElseIf ((Local0 == 0x10))
                     {
                         BHGK [Zero] = Zero
                         BHGK [One] = 0xFF
                     }
                     Else
                     {
                         BHGK [Zero] = Zero
                         BHGK [One] = 0xFF
                         BHGK [0x02] = Zero
                         BHGK [0x03] = Zero
                         BHGK [0x04] = Zero
                         BHGK [0x05] = Zero
                         BHGK [0x06] = Zero
                         BHGK [0x07] = Zero
                     }

                     Return (BHGK) /* \_SB_.PC00.WMID.BHGK */
                 }

I can provide you with a basic patch which adds support for calling those two WMI methods. You can then wire-up the platform profile code
inside acer-wmi to use those WMI methods instead of trying to access the EC directly.

Thanks,
Armin Wolf

