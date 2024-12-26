Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7912BCF5
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Dec 2024 17:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735234958; cv=none; b=fbBGSqX75Vlf8Q26Pp0VPx2oLbRPTIUvZLifMnow2gkufvQ2ZyN7Cc8L5lRm9ClTkMB82HhcEPVsaPn551KDVWe5YwH2d/AQpLmgO8Hfx3Z4QVzF6OElSfampJgcXSb4l8RRZaQia76hz4xtK78LAe4zTp6xhT3boW+9o3AVoNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735234958; c=relaxed/simple;
	bh=RqqGGR3XdBuyk6v9Af+guoVQ1l6w2YsmJywQeTIj2x0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MQyPYG8KIZEGSes8hCSS/HoD7Z7Y2KaLeJ0iflwmuKZIAHXzjvJ6Q450BrDEH0xOnlhmGnXiPT/NYWCPjVqMV5Kkk8rBmG5sPyIQgXaBTjYOfZ8YFdYqT79rK/4IgNBoD2mqrdgtj4H5V+zvWMGzMi/SO9X8fy1yksNtqQw7+Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WaPC9iAS; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WaPC9iAS"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ef72924e53so7771178a91.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Dec 2024 09:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735234955; x=1735839755; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHluA9ooYeuRjZokwHyh2m5472MC56qInzO6Uq+4/Pg=;
        b=WaPC9iASACrepKNzv5msn2HFqhqdmfgpEzgoAjqXaSuUIFmG7nll77g7JkijFNWU40
         6TlTd+r9+uqqDhYePWNWTomM+VeIi+wOkp3WYv6h9mVbo7Gv7qOPb/pKSRGXl3lgcJAU
         x0x1vAn205ZxUO18M3hXOZg5Otcrt7s2jlxyHWyB2gFPO4QhjbGK8GN8jKNY6kCOkdXq
         FK53jf8GtuiJUiwrshP2M1BHnb1vcLyuFHmQkXXZH8zfUxlPYmdlY4WFxfvMUUyOOJbB
         WK24kR7oLBBmyGjalrxVXbGs2ZvhvaTQHewoe3tvMcAF9fiRHHq3GKMUiaR5G648ARru
         OOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735234955; x=1735839755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHluA9ooYeuRjZokwHyh2m5472MC56qInzO6Uq+4/Pg=;
        b=gdl/64/yuo2FsTwGBm5TQzWr9lNXMhVhBZQeU8n7wWKoSX/aQpvw2V9horpV/uGipv
         QgFCs9RtQt04CY6BSVF/T3dvh+08pcvvBK00weHB2V8TMx1YckZcFDcOSZvLo6zOdY6I
         280AA9lrZW6BTKDsRiE3wq/zieJ3AVCveVqsFnltp1jF1lfiHZfqGZuA8vRicY9rLxrU
         zAiBh42vTFxTtYXbm2U9zsNXLK9GQow0SapaE69CYbGz8A6ac8ar2R24/0sBILrYVYWf
         yvUTUlagPFtOj3Nx/umNVlwV+8wVnDgqRWBMAqwcsQg5VMGMdNzFE5/tjgXippu7zf3T
         gXXQ==
X-Gm-Message-State: AOJu0YxQBxs/f3jf5xCUKX7R6n4nJ23+u/9i0HJJLPt6Jy0RWFOeR+Z7
	/7ObiV28tt72zVOZUYOiLVhjHl2wlS24EKDOeR1l67yubEEXnjaCMox65AQi4cUIM99xRTCQxWm
	P4yhwzorMQc1rC0EFA+TEYQ1tG5qy5elq
X-Gm-Gg: ASbGnctPt9173J9QAD+DT7AucgXusUi3uHeqB/DlWTjAlrC1AC8V/V2fBEUKvemmF7c
	+c/chSHeizdt4JmIkuJCxJNssbWakFGUGFQ==
X-Google-Smtp-Source: AGHT+IEWvDVyjB36w8QSRQmwePw/tq7FPMAfGKa0E2FILAmKtOKOkxQut5G+KxfRt2OE1iciu+L/EZ1myKUb0Ekhy84=
X-Received: by 2002:a17:90a:e18b:b0:2ee:9902:18b4 with SMTP id
 98e67ed59e1d1-2f452ee838bmr34954660a91.27.1735234955153; Thu, 26 Dec 2024
 09:42:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALiyAom1xDH6A0Q2WNHCMUcpMJfM3pXO2DaW=bgHGUi8ZOpBbQ@mail.gmail.com>
 <8b8749c1-59c8-4f95-a43e-055cf94f9597@gmx.de> <CALiyAo=R1kcvwRpw22s=YU0YHUxR8T_WHLwSvDr=8Ahsenn-jA@mail.gmail.com>
 <9c625119-e46e-464b-933d-9c836577f454@gmx.de> <CALiyAo=7kVi4ipA5-xDfRYQ-gqyza0woYHUzwGuW5BccLOVHgg@mail.gmail.com>
 <209f39ab-a312-45b5-981c-8324d9b8cd90@gmx.de> <CALiyAo=GpKN2Aty5c3Bw0Vh4U16vgUP29pZkaeBsOKw8kcK29w@mail.gmail.com>
 <c5124fb9-74af-4c90-9edc-ddb3517cd9ac@gmx.de> <CALiyAok0_JKE+BkUQxHHH8Z39FHq5bW0Hb1Gk-MYHgDy0yFoMA@mail.gmail.com>
 <cea0918c-7c7d-49e1-8b33-b952b64d67f1@gmx.de> <d7be714c-3103-42ee-ad15-223a3fe67f80@gmx.de>
 <CALiyAomaT5y10Bawth3X44WB9Cie1fhW0GyBZgASo7ySK6g9zQ@mail.gmail.com> <ecb60ee5-3df7-4d7e-8ebf-8c162b339ade@gmx.de>
In-Reply-To: <ecb60ee5-3df7-4d7e-8ebf-8c162b339ade@gmx.de>
From: Hridesh MG <hridesh699@gmail.com>
Date: Thu, 26 Dec 2024 23:11:58 +0530
Message-ID: <CALiyAonsOGLz9zoj_tA1aZsMbU24wKihiK7h2ONodfEB2HE1qQ@mail.gmail.com>
Subject: Re: acer-wmi: Nitro button doesn't produce a WMI event
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 26, 2024 at 2:22=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 24.12.24 um 19:45 schrieb Hridesh MG:
>
> >> Am 24.12.24 um 00:06 schrieb Armin Wolf:
> >> This WMI call is already supported by the driver and exposed to usersp=
ace using the platform profile interface.
> >> It seems however that your device:
> >>
> >> - does only support the turbo profile and not the other OC settings
> >>
> >> - only supports a subset of the platform profile choices
> >>
> >> - uses a different EC address for storing the current platform profile
> >>
> >> Can you test kernel patches? I can prepare a patch for you which:
> >>
> >> - puts your device on the necessary whitelists
> >>
> >> - fixes the platform profile handling
> >>
> >> Thanks,
> >> Armin Wolf
> > Oh I see, thank you for your work! Actually, could I work on the patch
> > myself? I'd like to take this as an opportunity to learn something
> > new, I'm also a mentee under the LFX kernel bug fixing mentorship
> > program and was hoping to create a patch which could count towards my
> > graduation requirements out of this issue.
> >
> > I understood the rest, but if it isn't too much of a bother, could you
> > tell me how you found out the EC address? (or the fact that it was
> > different)
> >
> > Thanks,
> > Hridesh MG
>
> This is the full definition of the Acer gaming WMI interface on your mach=
ine:
>
> [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Cla=
ss used to Gaming Function, Version 2.88"), guid("{7A4DDFE7-5B5D-40B4-8595-=
4408E0CC7F56}")]
> class AcerGamingFunction {
>    [key, read] string InstanceName;
>    [read] boolean Active;
>
>    [WmiMethodId(1), Implemented, read, write, Description("Set Acer Gamin=
g Profile Configuration.")] void SetGamingProfile([in] uint64 gmInput, [out=
] uint32 gmOutput);
>    [WmiMethodId(2), Implemented, read, write, Description("Set Acer Gamin=
g LED Behavior.")] void SetGamingLED([in] uint8 gmInput[12], [out] uint32 g=
mOutput);
>    [WmiMethodId(3), Implemented, read, write, Description("Get Acer Gamin=
g Profile Configuration.")] void GetGamingProfile([in] uint32 gmInput, [out=
] uint64 gmOutput);
>    [WmiMethodId(4), Implemented, read, write, Description("Get Acer Gamin=
g LED Behavior.")] void GetGamingLED([in] uint32 gmInput, [out] uint8 gmRet=
urn, [out] uint8 gmOutput[11]);
>    [WmiMethodId(5), Implemented, read, write, Description("Get Acer Gamin=
g System Information.")] void GetGamingSysInfo([in] uint32 gmInput, [out] u=
int64 gmOutput);
>    [WmiMethodId(6), Implemented, read, write, Description("Set Acer Gamin=
g RGB Keyboard Setting.")] void SetGamingRgbKb([in] uint64 gmInput, [out] u=
int32 gmOutput);
>    [WmiMethodId(7), Implemented, read, write, Description("Get Acer Gamin=
g RGB Keyboard Setting.")] void GetGamingRgbKb([in] uint32 gmInput, [out] u=
int64 gmOutput);
>    [WmiMethodId(8), Implemented, read, write, Description("Set Acer Gamin=
g Profile Setting.")] void SetGamingProfileSetting([in] uint64 gmInput, [ou=
t] uint32 gmOutput);
>    [WmiMethodId(9), Implemented, read, write, Description("Get Acer Gamin=
g Profile Setting.")] void GetGamingProfileSetting([in] uint32 gmInput, [ou=
t] uint64 gmOutput);
>    [WmiMethodId(10), Implemented, read, write, Description("Set Acer Gami=
ng LED Group Behavior.")] void SetGamingLEDBehavior([in] uint64 gmInput, [o=
ut] uint32 gmOutput);
>    [WmiMethodId(11), Implemented, read, write, Description("Get Acer Gami=
ng LED Group Behavior.")] void GetGamingLEDBehavior([in] uint32 gmInput, [o=
ut] uint64 gmOutput);
>    [WmiMethodId(12), Implemented, read, write, Description("Set Acer Gami=
ng LED Group Color.")] void SetGamingLEDColor([in] uint64 gmInput, [out] ui=
nt32 gmOutput);
>    [WmiMethodId(13), Implemented, read, write, Description("Get Acer Gami=
ng LED Group Color.")] void GetGamingLEDColor([in] uint32 gmInput, [out] ui=
nt64 gmOutput);
>    [WmiMethodId(14), Implemented, read, write, Description("Set Acer Gami=
ng Fan Group Behavior.")] void SetGamingFanBehavior([in] uint64 gmInput, [o=
ut] uint32 gmOutput);
>    [WmiMethodId(15), Implemented, read, write, Description("Get Acer Gami=
ng Fan Group Behavior.")] void GetGamingFanBehavior([in] uint32 gmInput, [o=
ut] uint64 gmOutput);
>    [WmiMethodId(16), Implemented, read, write, Description("Set Acer Gami=
ng Fan Group Speed.")] void SetGamingFanSpeed([in] uint64 gmInput, [out] ui=
nt32 gmOutput);
>    [WmiMethodId(17), Implemented, read, write, Description("Get Acer Gami=
ng Fan Group Speed.")] void GetGamingFanSpeed([in] uint32 gmInput, [out] ui=
nt64 gmOutput);
>    [WmiMethodId(18), Implemented, read, write, Description("Set Acer Gami=
ng Fan Table.")] void SetGamingFanTable([in] uint64 gmInput, [out] uint32 g=
mOutput);
>    [WmiMethodId(19), Implemented, read, write, Description("Get Acer Gami=
ng Fan Table.")] void GetGamingFanTable([out] uint64 gmOutput);
>    [WmiMethodId(20), Implemented, read, write, Description("Set Acer Gami=
ng Keyboard Backlight Behavior.")] void SetGamingKBBacklight([in] uint8 gmI=
nput[16], [out] uint32 gmOutput);
>    [WmiMethodId(21), Implemented, read, write, Description("Get Acer Gami=
ng Keyboard Backlight Behavior.")] void GetGamingKBBacklight([in] uint32 gm=
Input, [out] uint8 gmReturn, [out] uint8 gmOutput[15]);
>    [WmiMethodId(22), Implemented, read, write, Description("Set Acer Gami=
ng Miscellaneous Setting.")] void SetGamingMiscSetting([in] uint64 gmInput,=
 [out] uint32 gmOutput);
>    [WmiMethodId(23), Implemented, read, write, Description("Get Acer Gami=
ng Miscellaneous Setting.")] void GetGamingMiscSetting([in] uint32 gmInput,=
 [out] uint64 gmOutput);
>    [WmiMethodId(24), Implemented, read, write, Description("Set CPU Overc=
locking Profile.")] void SetCPUOverclockingProfile([in] uint8 OCProfile, [i=
n] uint8 OCStructure[512], [out] uint8 ReturnCode, [out] uint8 Reserved[3])=
;
>    [WmiMethodId(25), Implemented, read, write, Description("Get CPU Overc=
locking Profile.")] void GetCPUOverclockingProfile([in] uint8 Reserved[4], =
[out] uint8 ReturnCode, [out] uint8 ReturnOCProfile, [out] uint8 OCStructur=
e[512]);
> };
>
> The method "SetGamingMiscSetting"  is used to set the platform profile. F=
or reading however the EC is accessed by the acer-wmi driver.
>
> This is the ACPI code responsible for handling "SetGamingMiscSetting" and=
 "GetGamingMiscSetting" (Arg1 is the WMI method id, Arg2 contains the input=
 arguments):
>
>                  If ((Arg1 =3D=3D 0x16))
>                  {
>                      BHSK =3D Arg2
>                      Local0 =3D DerefOf (BHSK [Zero])
>                      Local1 =3D DerefOf (BHSK [One])
>                      BHSK [Zero] =3D 0x03
>                      If ((Local0 =3D=3D One))
>                      {
>                          \_SB.PC00.LPCB.EC0.TKST =3D Local1
>                          BHSK [Zero] =3D Zero
>                      }
>                      ElseIf ((Local0 =3D=3D 0x02))
>                      {
>                          WSMI (Arg1, Arg2)
>                          BHSK =3D WMIB /* \_SB_.PC00.WMID.WMIB */
>                      }
>                      ElseIf ((Local0 =3D=3D 0x05)){}
>                      ElseIf ((Local0 =3D=3D 0x06))
>                      {
>                          WSMI (Arg1, Arg2)
>                          BHSK =3D WMIB /* \_SB_.PC00.WMID.WMIB */
>                      }
>                      ElseIf ((Local0 =3D=3D 0x07)){}
>                      ElseIf ((Local0 =3D=3D 0x08))
>                      {
>                          WSMI (Arg1, Arg2)
>                          BHSK =3D WMIB /* \_SB_.PC00.WMID.WMIB */
>                      }
>                      ElseIf ((Local0 =3D=3D 0x09))
>                      {
>                          BHSK [Zero] =3D One
>                      }
>                      ElseIf ((Local0 =3D=3D 0x0A))
>                      {
>                          BHSK [Zero] =3D 0x03
>                      }
>                      ElseIf ((Local0 =3D=3D 0x0B))
>                      {
>
> This code in particular is responsible for setting the platform profile. =
Noticed the OPMS field here which is used to
> store the current platform profile set by the driver.
>
>                          \_SB.PC00.LPCB.EC0.OPMS =3D Local1
>                          If ((OG00 =3D=3D Zero))
>                          {
>                              If ((\_SB.GGIV (0x090E000A) =3D=3D Zero))
>                              {
>                                  If ((Local1 =3D=3D Zero))
>                                  {
>                                      \ODV0 =3D Zero
>                                  }
>                                  ElseIf ((Local1 =3D=3D One))
>                                  {
>                                      \ODV0 =3D One
>                                  }
>                                  ElseIf ((Local1 =3D=3D 0x04))
>                                  {
>                                      \ODV0 =3D 0x02
>                                  }
>                              }
>                              ElseIf ((Local1 =3D=3D Zero))
>                              {
>                                  \ODV0 =3D 0x03
>                              }
>                              ElseIf ((Local1 =3D=3D One))
>                              {
>                                  \ODV0 =3D 0x04
>                              }
>                              ElseIf ((Local1 =3D=3D 0x04))
>                              {
>                                  If (((CMSR (0x77) =3D=3D 0x05) || (CMSR =
(0x77) =3D=3D 0x04)))
>                                  {
>                                      \ODV0 =3D 0x06
>                                  }
>                                  Else
>                                  {
>                                      \ODV0 =3D 0x05
>                                  }
>                              }
>                          }
>
>                          If ((OG00 =3D=3D One))
>                          {
>                              If ((\_SB.GGIV (0x090E000A) =3D=3D Zero))
>                              {
>                                  If ((Local1 =3D=3D Zero))
>                                  {
>                                      \ODV0 =3D 0x07
>                                  }
>                                  ElseIf ((Local1 =3D=3D One))
>                                  {
>                                      \ODV0 =3D 0x08
>                                  }
>                                  ElseIf ((Local1 =3D=3D 0x04))
>                                  {
>                                      \ODV0 =3D 0x09
>                                  }
>                              }
>                              ElseIf ((Local1 =3D=3D Zero))
>                              {
>                                  \ODV0 =3D 0x0A
>                              }
>                              ElseIf ((Local1 =3D=3D One))
>                              {
>                                  \ODV0 =3D 0x0B
>                              }
>                              ElseIf ((Local1 =3D=3D 0x04))
>                              {
>                                  If (((CMSR (0x77) =3D=3D 0x05) || (CMSR =
(0x77) =3D=3D 0x04)))
>                                  {
>                                      \ODV0 =3D 0x0D
>                                  }
>                                  Else
>                                  {
>                                      \ODV0 =3D 0x0C
>                                  }
>                              }
>                          }
>
>                          \_SB.IETM.ODVP ()
>                          Notify (\_SB.IETM, 0x88) // Device-Specific
>                          Notify (\_SB.NPCF, 0xC0) // Hardware-Specific
>                          Notify (\_SB.NPCF, 0xC1) // Hardware-Specific
>                          BHSK [Zero] =3D Zero
>                      }
>                      ElseIf ((Local0 =3D=3D 0x0D))
>                      {
>                          BHSK [Zero] =3D 0x03
>                      }
>                      ElseIf ((Local0 =3D=3D 0x0E))
>                      {
>                          BHSK [Zero] =3D 0x03
>                      }
>                      ElseIf ((Local0 =3D=3D 0x0F))
>                      {
>                          If ((Local1 =3D=3D One))
>                          {
>                              BHSK [Zero] =3D Zero
>                              \_SB.PC00.LPCB.EC0.FMKY =3D One
>                          }
>                          ElseIf ((Local1 =3D=3D 0x02))
>                          {
>                              BHSK [Zero] =3D Zero
>                              \_SB.PC00.LPCB.EC0.FMKY =3D Zero
>                          }
>                      }
>                      Else
>                      {
>                          BHSK [Zero] =3D 0x03
>                          BHSK [One] =3D Zero
>                          BHSK [0x02] =3D Zero
>                          BHSK [0x03] =3D Zero
>                      }
>
>                      Return (BHSK) /* \_SB_.PC00.WMID.BHSK */
>                  }
>
>                  If ((Arg1 =3D=3D 0x17))
>                  {
>                      BHSK =3D Arg2
>                      Local0 =3D DerefOf (BHSK [Zero])
>                      BHGK [Zero] =3D Zero
>                      BHGK [One] =3D 0xFF
>                      If ((Local0 =3D=3D One))
>                      {
>                          BHGK [One] =3D \_SB.PC00.LPCB.EC0.TKST /* Extern=
al reference */
>                          BHGK [Zero] =3D Zero
>                      }
>                      ElseIf ((Local0 =3D=3D 0x02))
>                      {
>                          WSMI (Arg1, Arg2)
>                          BHGK =3D WMIB /* \_SB_.PC00.WMID.WMIB */
>                      }
>                      ElseIf ((Local0 =3D=3D 0x05)){}
>                      ElseIf ((Local0 =3D=3D 0x06))
>                      {
>                          WSMI (Arg1, Arg2)
>                          BHGK =3D WMIB /* \_SB_.PC00.WMID.WMIB */
>                      }
>                      ElseIf ((Local0 =3D=3D 0x07)){}
>                      ElseIf ((Local0 =3D=3D 0x08))
>                      {
>                          WSMI (Arg1, Arg2)
>                          BHGK =3D WMIB /* \_SB_.PC00.WMID.WMIB */
>                      }
>                      ElseIf ((Local0 =3D=3D 0x09))
>                      {
>                          WSMI (Arg1, Arg2)
>                          BHGK =3D WMIB /* \_SB_.PC00.WMID.WMIB */
>                      }
>                      ElseIf ((Local0 =3D=3D 0x0A))
>                      {
>                          BHGK [Zero] =3D Zero
>                          BHGK [One] =3D 0x13
>
> Side note: this field seems to contain a bitmap of the supported platform=
 profiles on this machine.
>
>                      }
>                      ElseIf ((Local0 =3D=3D 0x0B))
>                      {
>
> Calling this method ("GetGamingMiscSetting") with the same command (0x0B)=
 would return the current platform
> profile by using the OPMS field.
>
>                          BHGK [Zero] =3D Zero
>                          BHGK [One] =3D \_SB.PC00.LPCB.EC0.OPMS /* Extern=
al reference */
>                      }
>                      ElseIf ((Local0 =3D=3D 0x0C))
>                      {
>                          BHGK [One] =3D Zero
>                      }
>                      ElseIf ((Local0 =3D=3D 0x0D))
>                      {
>                          BHGK [Zero] =3D 0x03
>                      }
>                      ElseIf ((Local0 =3D=3D 0x0E))
>                      {
>                          BHGK [Zero] =3D 0x03
>                      }
>                      ElseIf ((Local0 =3D=3D 0x0F))
>                      {
>                          If ((\_SB.PC00.LPCB.EC0.FMKY =3D=3D One))
>                          {
>                              BHGK [Zero] =3D Zero
>                              BHGK [One] =3D One
>                          }
>                          ElseIf ((\_SB.PC00.LPCB.EC0.FMKY =3D=3D Zero))
>                          {
>                              BHGK [Zero] =3D Zero
>                              BHGK [One] =3D 0x02
>                          }
>                      }
>                      ElseIf ((Local0 =3D=3D 0x10))
>                      {
>                          BHGK [Zero] =3D Zero
>                          BHGK [One] =3D 0xFF
>                      }
>                      Else
>                      {
>                          BHGK [Zero] =3D Zero
>                          BHGK [One] =3D 0xFF
>                          BHGK [0x02] =3D Zero
>                          BHGK [0x03] =3D Zero
>                          BHGK [0x04] =3D Zero
>                          BHGK [0x05] =3D Zero
>                          BHGK [0x06] =3D Zero
>                          BHGK [0x07] =3D Zero
>                      }
>
>                      Return (BHGK) /* \_SB_.PC00.WMID.BHGK */
>                  }
That clears up a lot, I did dig around the ACPI tables earlier but I
couldn't figure out where the WMI functions were being received. Stuff
makes much more sense now.

> I can provide you with a basic patch which adds support for calling those=
 two WMI methods. You can then wire-up the platform profile code
> inside acer-wmi to use those WMI methods instead of trying to access the =
EC directly.
Yeah, thanks. Regarding the platform profile code, it currently uses
the predator v4 quirk to enable platform profile support. Does it make
sense to add a new quirk for the nitro series so i can associate it
with the respective functions for the platform profile handler?
