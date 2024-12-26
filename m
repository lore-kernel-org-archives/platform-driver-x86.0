Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF209198853
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Dec 2024 23:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735256456; cv=none; b=nmVoK8TE9UEC3aaCz9T+AW1mqPNbOhReTjobTwpPQpm2kfa9hzZVz9Ift9ff14Le5QnKH5btzoeq4j1FVdrI3/b0g28R+uWjm5JsUotksCfiMbPtXFYAg3gCMkm3BaF62l2tJwi8fczDI8ltPuRSomSFrPJxooflKXLukxnUN34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735256456; c=relaxed/simple;
	bh=FWd7ydIlZmQQYeT9KMReZ+iKnhmmpey4T6JhjJLl8Nc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sSfWfo/ofN0+kAJCUWkiKiER3O0kSyff24/ljmYg/WLBiPoOxdiEaHzT3c+S2/c5KDOrfZMkVx88OrRe6sB7ACzr0PuUGHU0PUtw+hk6t46ND49DyKPuzv2tdn+fmGKbbZHiOmph7qGdaCPLTrEvVQj/Un5mmxyGe4dFkn2NJ+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=moLdxzWP; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="moLdxzWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735256451; x=1735861251; i=w_armin@gmx.de;
	bh=g19ZLRNkbuO4ve+B3w6pj7TkdpsORvBiplRs8J87zBU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=moLdxzWPZKMTWHaEWMhIB+uv81OpbBdYkH4eKAEfU08yoSAIuheWm38BAbX/KoNL
	 OTwpFvqEsyF32O0CG1X86D1iGevvYlxLUmgMd4l/3eSc8t3IuFd645EFZww5w9PJJ
	 U3k54EbHKpPBwQd68okNkVyY1tF7CHFyLJpPLcwPNv/j9HRiX++f9oa/OJurHTyjr
	 IlbDedIQxiiJ5r6TD8V8mVIZPxkYbcUwKZvUHSB4sZXMh1h2XlguMU+yftl7y3oWz
	 n6qNbxQktKpAC+DweXe+RgzmJe37KwDC5cUMITGbmDoOjE4nYuHZcjmR3rmvlDUPs
	 9ZDkyMCoI38AFxAsGw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MulqN-1ticuf40G3-00uGCC; Fri, 27
 Dec 2024 00:40:51 +0100
Message-ID: <f3bb4373-0b18-4ca4-8dc8-1bedc4a49874@gmx.de>
Date: Fri, 27 Dec 2024 00:40:50 +0100
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
 <ecb60ee5-3df7-4d7e-8ebf-8c162b339ade@gmx.de>
 <CALiyAonsOGLz9zoj_tA1aZsMbU24wKihiK7h2ONodfEB2HE1qQ@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CALiyAonsOGLz9zoj_tA1aZsMbU24wKihiK7h2ONodfEB2HE1qQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9qTbhjvaRC+eqXPhpykgEFR+6HjWgmfe34OHXSRh6IHH0kdX/hy
 aq8V8VatVVlzQRftBU7Uj8VlLRKSkE8tacgExD/XNXwFsgPTM3WFg7IfyNCaXA02hHLv0ZO
 Sg7ooN2QeYYGh+ZrEFMVEAbJpSmly4bqsGe6NI280+mle4I34EQl0cfjocNPw0AklsQ5MP2
 5zFkocyMsLMEbHgBZdgBg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yVxK96aBf2A=;RaYeSDWWYPiIp6CLU3d7UGAkiut
 /mg5l+eZtct9Ty3ePp7zYoLOP4PFoggQ5bed7tQ2TwGBohj1xD+zrrbJcu6PCLfIU5odFJF/L
 uXUUqTM9l7y3z13SOqGtoLiDH+IyYQBQiQNNIhC80iNgmbqOYn0u2f87NS64vEBnVZXfD4Oyx
 OsWDCWjpwTvvrq+yYCIr1Z8Ez7bcscPGd6LY9UXOvJ2IOIlnRV6/fXj3SVRX3TDG+boVp3ha2
 bgaqIhkqtcklrEI+ydAQNcPvfmH+Bejgue6KPx6JoojfRZmz6IfxJi0lUGzOkZsyKhIxu6yjS
 xrhFK739pmhWJbivktBovMW2PFKqbXljnNRigdwqOB8WpejZwYaH9kxnx9ei3TGzPCNVUq0Nh
 CdoMvxQ4m4IKax2bugz+s6aLLkFCx2FP7PaU0ARZfXYhI5jGBBLt0v+on4Tbq39Wbzgr6Yt2m
 hzjzkOLS58EazzG/SJzrlVrYXKzRz4ZrB8Xkp4CtT58uaz8/2BS+oP0eElc49xhkFvuQt/3kG
 G+58ISQ0PCLj/dQV3UEW1I8Y2df5A6YtM6uKQrKnkswOopC+t54S1IkwDy7W8V8L+c2NsD/TL
 nnUQ1byYtJjGAAaWw4TOrPhyyA5WFl/w5eUR9BvAJdNZGxrPqwCl8UZeX8gpIEIKfvxbROQzB
 S7jF649E2XEe7XGuoWWgzT3isLRhLwn1GAO92Zt2eTzRB5nf4TlRB4PqY2fCAFJ+u6CkcQEck
 HnBfavBP276gs3d5Xuf5xuFoYtcok2kdB+3lp2RNg9O/07X/B4pdZSMdRsx0fxB+aJ2E7b0nI
 7fL93j+XAkxIwtu8VHz3+hKutrFQDflYrIH0GoSI7F3LQi/Rh6iq/JOy4Qa7F1quTilWNT4nS
 W0EEb1SYnlq29/Hr2srPKNj1gVWWXddle7PW6HZJL3rQQCJ6b7DSMTC+/iYRBJ7nPpb3niofv
 YhDsSoYxz1VJWvYEH/SDDlbQ20Hsuo2/PWnYwQ4Tp6dRttqmTl1G2xiShC3A5/WPqhgd5Cpqw
 dXjJEz5bfkGqfXN75HcBeInmu/PVgNK+pgeU/jQNYPZYqfQ5DyGRLJFap9PK07zlKNSn/KCcK
 0BgzuwHSVu6G3sXD9WyuW58RCXjUtK

Am 26.12.24 um 18:41 schrieb Hridesh MG:

> On Thu, Dec 26, 2024 at 2:22=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>> Am 24.12.24 um 19:45 schrieb Hridesh MG:
>>
>>>> Am 24.12.24 um 00:06 schrieb Armin Wolf:
>>>> This WMI call is already supported by the driver and exposed to users=
pace using the platform profile interface.
>>>> It seems however that your device:
>>>>
>>>> - does only support the turbo profile and not the other OC settings
>>>>
>>>> - only supports a subset of the platform profile choices
>>>>
>>>> - uses a different EC address for storing the current platform profil=
e
>>>>
>>>> Can you test kernel patches? I can prepare a patch for you which:
>>>>
>>>> - puts your device on the necessary whitelists
>>>>
>>>> - fixes the platform profile handling
>>>>
>>>> Thanks,
>>>> Armin Wolf
>>> Oh I see, thank you for your work! Actually, could I work on the patch
>>> myself? I'd like to take this as an opportunity to learn something
>>> new, I'm also a mentee under the LFX kernel bug fixing mentorship
>>> program and was hoping to create a patch which could count towards my
>>> graduation requirements out of this issue.
>>>
>>> I understood the rest, but if it isn't too much of a bother, could you
>>> tell me how you found out the EC address? (or the fact that it was
>>> different)
>>>
>>> Thanks,
>>> Hridesh MG
>> This is the full definition of the Acer gaming WMI interface on your ma=
chine:
>>
>> [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("C=
lass used to Gaming Function, Version 2.88"), guid("{7A4DDFE7-5B5D-40B4-85=
95-4408E0CC7F56}")]
>> class AcerGamingFunction {
>>     [key, read] string InstanceName;
>>     [read] boolean Active;
>>
>>     [WmiMethodId(1), Implemented, read, write, Description("Set Acer Ga=
ming Profile Configuration.")] void SetGamingProfile([in] uint64 gmInput, =
[out] uint32 gmOutput);
>>     [WmiMethodId(2), Implemented, read, write, Description("Set Acer Ga=
ming LED Behavior.")] void SetGamingLED([in] uint8 gmInput[12], [out] uint=
32 gmOutput);
>>     [WmiMethodId(3), Implemented, read, write, Description("Get Acer Ga=
ming Profile Configuration.")] void GetGamingProfile([in] uint32 gmInput, =
[out] uint64 gmOutput);
>>     [WmiMethodId(4), Implemented, read, write, Description("Get Acer Ga=
ming LED Behavior.")] void GetGamingLED([in] uint32 gmInput, [out] uint8 g=
mReturn, [out] uint8 gmOutput[11]);
>>     [WmiMethodId(5), Implemented, read, write, Description("Get Acer Ga=
ming System Information.")] void GetGamingSysInfo([in] uint32 gmInput, [ou=
t] uint64 gmOutput);
>>     [WmiMethodId(6), Implemented, read, write, Description("Set Acer Ga=
ming RGB Keyboard Setting.")] void SetGamingRgbKb([in] uint64 gmInput, [ou=
t] uint32 gmOutput);
>>     [WmiMethodId(7), Implemented, read, write, Description("Get Acer Ga=
ming RGB Keyboard Setting.")] void GetGamingRgbKb([in] uint32 gmInput, [ou=
t] uint64 gmOutput);
>>     [WmiMethodId(8), Implemented, read, write, Description("Set Acer Ga=
ming Profile Setting.")] void SetGamingProfileSetting([in] uint64 gmInput,=
 [out] uint32 gmOutput);
>>     [WmiMethodId(9), Implemented, read, write, Description("Get Acer Ga=
ming Profile Setting.")] void GetGamingProfileSetting([in] uint32 gmInput,=
 [out] uint64 gmOutput);
>>     [WmiMethodId(10), Implemented, read, write, Description("Set Acer G=
aming LED Group Behavior.")] void SetGamingLEDBehavior([in] uint64 gmInput=
, [out] uint32 gmOutput);
>>     [WmiMethodId(11), Implemented, read, write, Description("Get Acer G=
aming LED Group Behavior.")] void GetGamingLEDBehavior([in] uint32 gmInput=
, [out] uint64 gmOutput);
>>     [WmiMethodId(12), Implemented, read, write, Description("Set Acer G=
aming LED Group Color.")] void SetGamingLEDColor([in] uint64 gmInput, [out=
] uint32 gmOutput);
>>     [WmiMethodId(13), Implemented, read, write, Description("Get Acer G=
aming LED Group Color.")] void GetGamingLEDColor([in] uint32 gmInput, [out=
] uint64 gmOutput);
>>     [WmiMethodId(14), Implemented, read, write, Description("Set Acer G=
aming Fan Group Behavior.")] void SetGamingFanBehavior([in] uint64 gmInput=
, [out] uint32 gmOutput);
>>     [WmiMethodId(15), Implemented, read, write, Description("Get Acer G=
aming Fan Group Behavior.")] void GetGamingFanBehavior([in] uint32 gmInput=
, [out] uint64 gmOutput);
>>     [WmiMethodId(16), Implemented, read, write, Description("Set Acer G=
aming Fan Group Speed.")] void SetGamingFanSpeed([in] uint64 gmInput, [out=
] uint32 gmOutput);
>>     [WmiMethodId(17), Implemented, read, write, Description("Get Acer G=
aming Fan Group Speed.")] void GetGamingFanSpeed([in] uint32 gmInput, [out=
] uint64 gmOutput);
>>     [WmiMethodId(18), Implemented, read, write, Description("Set Acer G=
aming Fan Table.")] void SetGamingFanTable([in] uint64 gmInput, [out] uint=
32 gmOutput);
>>     [WmiMethodId(19), Implemented, read, write, Description("Get Acer G=
aming Fan Table.")] void GetGamingFanTable([out] uint64 gmOutput);
>>     [WmiMethodId(20), Implemented, read, write, Description("Set Acer G=
aming Keyboard Backlight Behavior.")] void SetGamingKBBacklight([in] uint8=
 gmInput[16], [out] uint32 gmOutput);
>>     [WmiMethodId(21), Implemented, read, write, Description("Get Acer G=
aming Keyboard Backlight Behavior.")] void GetGamingKBBacklight([in] uint3=
2 gmInput, [out] uint8 gmReturn, [out] uint8 gmOutput[15]);
>>     [WmiMethodId(22), Implemented, read, write, Description("Set Acer G=
aming Miscellaneous Setting.")] void SetGamingMiscSetting([in] uint64 gmIn=
put, [out] uint32 gmOutput);
>>     [WmiMethodId(23), Implemented, read, write, Description("Get Acer G=
aming Miscellaneous Setting.")] void GetGamingMiscSetting([in] uint32 gmIn=
put, [out] uint64 gmOutput);
>>     [WmiMethodId(24), Implemented, read, write, Description("Set CPU Ov=
erclocking Profile.")] void SetCPUOverclockingProfile([in] uint8 OCProfile=
, [in] uint8 OCStructure[512], [out] uint8 ReturnCode, [out] uint8 Reserve=
d[3]);
>>     [WmiMethodId(25), Implemented, read, write, Description("Get CPU Ov=
erclocking Profile.")] void GetCPUOverclockingProfile([in] uint8 Reserved[=
4], [out] uint8 ReturnCode, [out] uint8 ReturnOCProfile, [out] uint8 OCStr=
ucture[512]);
>> };
>>
>> The method "SetGamingMiscSetting"  is used to set the platform profile.=
 For reading however the EC is accessed by the acer-wmi driver.
>>
>> This is the ACPI code responsible for handling "SetGamingMiscSetting" a=
nd "GetGamingMiscSetting" (Arg1 is the WMI method id, Arg2 contains the in=
put arguments):
>>
>>                   If ((Arg1 =3D=3D 0x16))
>>                   {
>>                       BHSK =3D Arg2
>>                       Local0 =3D DerefOf (BHSK [Zero])
>>                       Local1 =3D DerefOf (BHSK [One])
>>                       BHSK [Zero] =3D 0x03
>>                       If ((Local0 =3D=3D One))
>>                       {
>>                           \_SB.PC00.LPCB.EC0.TKST =3D Local1
>>                           BHSK [Zero] =3D Zero
>>                       }
>>                       ElseIf ((Local0 =3D=3D 0x02))
>>                       {
>>                           WSMI (Arg1, Arg2)
>>                           BHSK =3D WMIB /* \_SB_.PC00.WMID.WMIB */
>>                       }
>>                       ElseIf ((Local0 =3D=3D 0x05)){}
>>                       ElseIf ((Local0 =3D=3D 0x06))
>>                       {
>>                           WSMI (Arg1, Arg2)
>>                           BHSK =3D WMIB /* \_SB_.PC00.WMID.WMIB */
>>                       }
>>                       ElseIf ((Local0 =3D=3D 0x07)){}
>>                       ElseIf ((Local0 =3D=3D 0x08))
>>                       {
>>                           WSMI (Arg1, Arg2)
>>                           BHSK =3D WMIB /* \_SB_.PC00.WMID.WMIB */
>>                       }
>>                       ElseIf ((Local0 =3D=3D 0x09))
>>                       {
>>                           BHSK [Zero] =3D One
>>                       }
>>                       ElseIf ((Local0 =3D=3D 0x0A))
>>                       {
>>                           BHSK [Zero] =3D 0x03
>>                       }
>>                       ElseIf ((Local0 =3D=3D 0x0B))
>>                       {
>>
>> This code in particular is responsible for setting the platform profile=
. Noticed the OPMS field here which is used to
>> store the current platform profile set by the driver.
>>
>>                           \_SB.PC00.LPCB.EC0.OPMS =3D Local1
>>                           If ((OG00 =3D=3D Zero))
>>                           {
>>                               If ((\_SB.GGIV (0x090E000A) =3D=3D Zero))
>>                               {
>>                                   If ((Local1 =3D=3D Zero))
>>                                   {
>>                                       \ODV0 =3D Zero
>>                                   }
>>                                   ElseIf ((Local1 =3D=3D One))
>>                                   {
>>                                       \ODV0 =3D One
>>                                   }
>>                                   ElseIf ((Local1 =3D=3D 0x04))
>>                                   {
>>                                       \ODV0 =3D 0x02
>>                                   }
>>                               }
>>                               ElseIf ((Local1 =3D=3D Zero))
>>                               {
>>                                   \ODV0 =3D 0x03
>>                               }
>>                               ElseIf ((Local1 =3D=3D One))
>>                               {
>>                                   \ODV0 =3D 0x04
>>                               }
>>                               ElseIf ((Local1 =3D=3D 0x04))
>>                               {
>>                                   If (((CMSR (0x77) =3D=3D 0x05) || (CM=
SR (0x77) =3D=3D 0x04)))
>>                                   {
>>                                       \ODV0 =3D 0x06
>>                                   }
>>                                   Else
>>                                   {
>>                                       \ODV0 =3D 0x05
>>                                   }
>>                               }
>>                           }
>>
>>                           If ((OG00 =3D=3D One))
>>                           {
>>                               If ((\_SB.GGIV (0x090E000A) =3D=3D Zero))
>>                               {
>>                                   If ((Local1 =3D=3D Zero))
>>                                   {
>>                                       \ODV0 =3D 0x07
>>                                   }
>>                                   ElseIf ((Local1 =3D=3D One))
>>                                   {
>>                                       \ODV0 =3D 0x08
>>                                   }
>>                                   ElseIf ((Local1 =3D=3D 0x04))
>>                                   {
>>                                       \ODV0 =3D 0x09
>>                                   }
>>                               }
>>                               ElseIf ((Local1 =3D=3D Zero))
>>                               {
>>                                   \ODV0 =3D 0x0A
>>                               }
>>                               ElseIf ((Local1 =3D=3D One))
>>                               {
>>                                   \ODV0 =3D 0x0B
>>                               }
>>                               ElseIf ((Local1 =3D=3D 0x04))
>>                               {
>>                                   If (((CMSR (0x77) =3D=3D 0x05) || (CM=
SR (0x77) =3D=3D 0x04)))
>>                                   {
>>                                       \ODV0 =3D 0x0D
>>                                   }
>>                                   Else
>>                                   {
>>                                       \ODV0 =3D 0x0C
>>                                   }
>>                               }
>>                           }
>>
>>                           \_SB.IETM.ODVP ()
>>                           Notify (\_SB.IETM, 0x88) // Device-Specific
>>                           Notify (\_SB.NPCF, 0xC0) // Hardware-Specific
>>                           Notify (\_SB.NPCF, 0xC1) // Hardware-Specific
>>                           BHSK [Zero] =3D Zero
>>                       }
>>                       ElseIf ((Local0 =3D=3D 0x0D))
>>                       {
>>                           BHSK [Zero] =3D 0x03
>>                       }
>>                       ElseIf ((Local0 =3D=3D 0x0E))
>>                       {
>>                           BHSK [Zero] =3D 0x03
>>                       }
>>                       ElseIf ((Local0 =3D=3D 0x0F))
>>                       {
>>                           If ((Local1 =3D=3D One))
>>                           {
>>                               BHSK [Zero] =3D Zero
>>                               \_SB.PC00.LPCB.EC0.FMKY =3D One
>>                           }
>>                           ElseIf ((Local1 =3D=3D 0x02))
>>                           {
>>                               BHSK [Zero] =3D Zero
>>                               \_SB.PC00.LPCB.EC0.FMKY =3D Zero
>>                           }
>>                       }
>>                       Else
>>                       {
>>                           BHSK [Zero] =3D 0x03
>>                           BHSK [One] =3D Zero
>>                           BHSK [0x02] =3D Zero
>>                           BHSK [0x03] =3D Zero
>>                       }
>>
>>                       Return (BHSK) /* \_SB_.PC00.WMID.BHSK */
>>                   }
>>
>>                   If ((Arg1 =3D=3D 0x17))
>>                   {
>>                       BHSK =3D Arg2
>>                       Local0 =3D DerefOf (BHSK [Zero])
>>                       BHGK [Zero] =3D Zero
>>                       BHGK [One] =3D 0xFF
>>                       If ((Local0 =3D=3D One))
>>                       {
>>                           BHGK [One] =3D \_SB.PC00.LPCB.EC0.TKST /* Ext=
ernal reference */
>>                           BHGK [Zero] =3D Zero
>>                       }
>>                       ElseIf ((Local0 =3D=3D 0x02))
>>                       {
>>                           WSMI (Arg1, Arg2)
>>                           BHGK =3D WMIB /* \_SB_.PC00.WMID.WMIB */
>>                       }
>>                       ElseIf ((Local0 =3D=3D 0x05)){}
>>                       ElseIf ((Local0 =3D=3D 0x06))
>>                       {
>>                           WSMI (Arg1, Arg2)
>>                           BHGK =3D WMIB /* \_SB_.PC00.WMID.WMIB */
>>                       }
>>                       ElseIf ((Local0 =3D=3D 0x07)){}
>>                       ElseIf ((Local0 =3D=3D 0x08))
>>                       {
>>                           WSMI (Arg1, Arg2)
>>                           BHGK =3D WMIB /* \_SB_.PC00.WMID.WMIB */
>>                       }
>>                       ElseIf ((Local0 =3D=3D 0x09))
>>                       {
>>                           WSMI (Arg1, Arg2)
>>                           BHGK =3D WMIB /* \_SB_.PC00.WMID.WMIB */
>>                       }
>>                       ElseIf ((Local0 =3D=3D 0x0A))
>>                       {
>>                           BHGK [Zero] =3D Zero
>>                           BHGK [One] =3D 0x13
>>
>> Side note: this field seems to contain a bitmap of the supported platfo=
rm profiles on this machine.
>>
>>                       }
>>                       ElseIf ((Local0 =3D=3D 0x0B))
>>                       {
>>
>> Calling this method ("GetGamingMiscSetting") with the same command (0x0=
B) would return the current platform
>> profile by using the OPMS field.
>>
>>                           BHGK [Zero] =3D Zero
>>                           BHGK [One] =3D \_SB.PC00.LPCB.EC0.OPMS /* Ext=
ernal reference */
>>                       }
>>                       ElseIf ((Local0 =3D=3D 0x0C))
>>                       {
>>                           BHGK [One] =3D Zero
>>                       }
>>                       ElseIf ((Local0 =3D=3D 0x0D))
>>                       {
>>                           BHGK [Zero] =3D 0x03
>>                       }
>>                       ElseIf ((Local0 =3D=3D 0x0E))
>>                       {
>>                           BHGK [Zero] =3D 0x03
>>                       }
>>                       ElseIf ((Local0 =3D=3D 0x0F))
>>                       {
>>                           If ((\_SB.PC00.LPCB.EC0.FMKY =3D=3D One))
>>                           {
>>                               BHGK [Zero] =3D Zero
>>                               BHGK [One] =3D One
>>                           }
>>                           ElseIf ((\_SB.PC00.LPCB.EC0.FMKY =3D=3D Zero)=
)
>>                           {
>>                               BHGK [Zero] =3D Zero
>>                               BHGK [One] =3D 0x02
>>                           }
>>                       }
>>                       ElseIf ((Local0 =3D=3D 0x10))
>>                       {
>>                           BHGK [Zero] =3D Zero
>>                           BHGK [One] =3D 0xFF
>>                       }
>>                       Else
>>                       {
>>                           BHGK [Zero] =3D Zero
>>                           BHGK [One] =3D 0xFF
>>                           BHGK [0x02] =3D Zero
>>                           BHGK [0x03] =3D Zero
>>                           BHGK [0x04] =3D Zero
>>                           BHGK [0x05] =3D Zero
>>                           BHGK [0x06] =3D Zero
>>                           BHGK [0x07] =3D Zero
>>                       }
>>
>>                       Return (BHGK) /* \_SB_.PC00.WMID.BHGK */
>>                   }
> That clears up a lot, I did dig around the ACPI tables earlier but I
> couldn't figure out where the WMI functions were being received. Stuff
> makes much more sense now.
>
>> I can provide you with a basic patch which adds support for calling tho=
se two WMI methods. You can then wire-up the platform profile code
>> inside acer-wmi to use those WMI methods instead of trying to access th=
e EC directly.
> Yeah, thanks. Regarding the platform profile code, it currently uses
> the predator v4 quirk to enable platform profile support. Does it make
> sense to add a new quirk for the nitro series so i can associate it
> with the respective functions for the platform profile handler?
>
AFAIK the interface used by your device is the same one used by the predat=
or series. So adding a new quirk is not necessary here.

Actually you can completely replace the EC access inside the platform prof=
ile handler with the WMI method call.

Thanks,
Armin Wolf

