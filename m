Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70FA13BAD5
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jul 2024 23:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721777770; cv=none; b=MrYXFAjCAcMYyro6daT8C5pZkGPYu7L2vhuNhwO+VOnlgJbP8CAimq/tFFOb9u3jB3zEJO+T+fXWfqsLHcq/Hj/oLa1kf2xgD/fhZBl9ZBDkE3oMYw+FvIuvCSmdN/thochyLS78Lu3RD0HqiH7CcPsOj/nh7ahRL2NrKkbgDn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721777770; c=relaxed/simple;
	bh=krermHDpk7Za3GGuyA3AcrDLTdrgnETOLqQkhYryIjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q5/lwC7cgtTgjbZ0eklKUYZrk1sr/vIct87UDTP3StbkwIwxCZjLQpMQMhp1BnoE+a1gKWas9Sybl3LX8EWWH4tdfvOKPtad8s4VwOWVgMfVvOa4SgB0BJI0sWmF0JQBSunSxDEZb/37atr5PnSuJ+vxrJaZ8aLOZ4hiEoBu6WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBgbCo/i; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBgbCo/i"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-80fbfeecca1so1491901241.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jul 2024 16:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721777767; x=1722382567; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXfm4qLHKCWuwnmDma8j7mlD2TZUaEIeXVBvCs3OnMk=;
        b=XBgbCo/i3UciNDL5GWWxInwQR1aqybvGZB07desWimheH8WXgRJfQ7rCBWkOQmGcli
         ED5vpPzKFpFUBM1URHwF9kY1FkXAyVoNze+Ge9/t4BkymeMJzsGeIsVWosq0lYgMuyD4
         HYikMqDeOSjrbiQV9bwB62qIRwjLDIYsIrhoHMCvPT0qUZs7a2u6JP8XC+U83X6anfE9
         tkHKo6QqFnvVJYHP2qzNzNq1WmGZT/YOFEVNkUPDVS0CM/sz9yTfruSDhfjYFhOZ5OmJ
         D2LQkxreWFOGkWI7+0aMC6zIXrNw8xp6PsbkadeFQJf4ezJIqA9vmW2OW6JiMVWJ9YXd
         8KCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721777767; x=1722382567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXfm4qLHKCWuwnmDma8j7mlD2TZUaEIeXVBvCs3OnMk=;
        b=eq3kn+bcpqmp3giq9yo4ceB0Kbkta7RJddP3pvAhqDy7BKuSMTynTp+FbYuLnW9BEM
         shAdSzKjgmIF/+MNUlH9FHrhUd7C6Z989l/IjsZ0jdD/8EMNK39YFBA4wOidf3ETosOn
         WCvWuqlaXYIqMcFGXXntJH0LUC9FD/Y4eqIlhywR1zPjlTa9ltb7LodzgqevUwjl1Ucp
         SZ8mpE3ukmEGtYuSqjdUPexTGmnjs6RYvkYSseb9l9JOwPwPuhFAL7ZCy8tzDgR08ujX
         qUPB49SH6XoCwunAguFiR/9SYIi3AnHqb0va1GjuQA18SR3KSCkKTWHWyuGLoWBJW9EP
         q6kQ==
X-Gm-Message-State: AOJu0YzusSUuAX5TTDnyGzyRA/3G607/UO0XnAzlU0xcuJRXoTJXRvO8
	CciIhNt2WAJ450wOHm4SfrT8SqMb8ac3LAkgSkXIY3Dm4HmHiTX6Sv033UG+tRUf88eW6BzDy8U
	6cd0PE/kXeOWLWsfnRUsQvBcEvW0=
X-Google-Smtp-Source: AGHT+IGCccn0hkPABZwtfkrTufUeKJ7lC3pwRTDEO9ZTBUTHwxFNrf08LhKVRNEoW+uGzgupNNwKmFYQOpcyTSWrfnI=
X-Received: by 2002:a05:6102:8097:b0:48f:3e91:12d5 with SMTP id
 ada2fe7eead31-493c4a3d7eamr474159137.1.1721777767451; Tue, 23 Jul 2024
 16:36:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHfPaQt_ZkJ=LghsuNg98X+HmXcbDbPvT2QyB9sDQLX5+KkU4Q@mail.gmail.com>
In-Reply-To: <CAHfPaQt_ZkJ=LghsuNg98X+HmXcbDbPvT2QyB9sDQLX5+KkU4Q@mail.gmail.com>
From: Liam Howlett <howlett@gmail.com>
Date: Tue, 23 Jul 2024 19:35:56 -0400
Message-ID: <CAHfPaQuLT1zvuRBQ9bJZ7=rxLrOXbZ9xryoGH8piWa3r5cfSPQ@mail.gmail.com>
Subject: Re: Tablet mode on L13 Yoga Gen 3
To: hmh@hmh.eng.br, hdegoede@redhat.com, ibm-acpi-devel@lists.sourceforge.net
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just to follow this up, it's not (just?) an acpi issue, the driver
isn't doing what it needs to do - if there is a driver for the
hardware at all.  I'm still looking into what is necessary.

I did write the value to the CMMD variable, but calling the _Q2E
function does not cause the ^HKEY.MHKQ (0x60C0) to be sent.  If I
understand this correctly, that's what should happen.

Thanks,
Liam


On Mon, Jul 22, 2024 at 11:30=E2=80=AFPM Liam Howlett <howlett@gmail.com> w=
rote:
>
> ..resend in plaintext, apologies if this is the second copy you are readi=
ng.
>
> Hello,
>
> I'd like to say first, thanks for the support of thinkpads in linux.
> As a kernel maintainer, I understand this is a lot of work and I
> appreciate you doing a fine job with supporting the hardware.
>
> I am working on patching the thinkpad_acpi driver to support the
> keyboard rotation and keyboard lock-out in tablet mode for the L13
> Yoga Gen 3.  I believe it needs just one bit extra to get working and
> I'm struggling to figure out how to do what I believe is necessary.
>
> It looks like _SB.PCI0.LPC0.EC0.CMMD needs an initial value of 0x01 to
> 0x06, but I don't see a way to trigger this to happen.  Alternatively,
> is there a way to write PMMD?
>
> Right now, I get the following message on boot:
> thinkpad_acpi: Unknown/reserved multi mode value 0x0000 for type 4,
> please report this to ibm-acpi-devel@lists.sourceforge.net
>
> It looks like the value of 0 indicates that the keyboard rotate
> monitoring is disabled, but I cannot seem to find an ACPI table way of
> modifying EC0's contents (or set CMMD/PMMD)
>
> The functions of interest seem to be as follows:
>                     Method (_Q2E, 0, NotSerialized)  // _Qxx: EC
> Query, xx=3D0x00-0xFF
>                     {
>                         Local0 =3D CMMD /* \_SB_.PCI0.LPC0.EC0_.CMMD */
>                         If (((Local0 !=3D 0x00) && (Local0 <=3D 0x06)))
>                         {
>                             If ((Local0 !=3D PMMD))
>                             {
>                                 PMMD =3D Local0
>                                 ^HKEY.MHKQ (0x60C0)
>                                 If ((PMMD >=3D 0x04))
>                                 {
>                                     WFIO (0x0B, 0x01)
>                                 }
>                                 ElseIf (CPLS)
>                                 {
>                                     WFIO (0x0B, 0x00)
>                                 }
>                                 Else
>                                 {
>                                     WFIO (0x0B, 0x01)
>                                 }
>                             }
>                         }
>
>                         If (((Local0 =3D=3D 0x00) || (Local0 >=3D 0x07)))
>                         {
>                             Local1 =3D 0x01
>                         }
>                         ElseIf (((Local0 =3D=3D 0x02) || (Local0 =3D=3D
> 0x03)))
>                         {
>                             Local1 =3D 0x02
>                         }
>                         Else
>                         {
>                             Local1 =3D 0x03
>                         }
>
>                         If ((Local1 !=3D LVMD))
>                         {
>                             LVMD =3D Local1
>                             Sleep (0x0A)
>                             ^HKEY.MHKQ (0x60F0)
>                         }
>                     }
> ... and ...
>                         Method (GMMS, 1, NotSerialized)
>                         {
>                             Local0 =3D 0x00040000
>                             Local1 =3D PMMD /* \PMMD */
>                             If ((Local1 >=3D 0x06))
>                             {
>                                 Local0 |=3D 0x03
>                             }
>                             ElseIf ((Local1 >=3D 0x05))
>                             {
>                                 Local0 |=3D 0x05
>                             }
>                             ElseIf ((Local1 >=3D 0x04))
>                             {
>                                 Local0 |=3D 0x04
>                             }
>                             ElseIf ((Local1 >=3D 0x03))
>                             {
>                                 Local0 |=3D 0x02
>                             }
>                             ElseIf ((Local1 >=3D 0x01))
>                             {
>                                 Local0 |=3D 0x01
>                             }
>
>                             Return (Local0)
>                         }
> ...
> and this portion of the _WAK code:
>         PMMD =3D \_SB.PCI0.LPC0.EC0.CMMD
>         If ((PMMD >=3D 0x07))
>         {
>             PMMD =3D 0x00
>         }
>
>         LVMD =3D \_SB.PCI0.LPC0.EC0.CMMD
>         If (((LVMD =3D=3D 0x00) || (LVMD >=3D 0x07)))
>         {
>             LVMD =3D 0x01
>         }
>         ElseIf (((LVMD =3D=3D 0x02) || (LVMD =3D=3D 0x03)))
>         {
>             LVMD =3D 0x02
>         }
>         Else
>         {
>             LVMD =3D 0x03
>         }
>
> From this, and running acpiexec on the dumped tables, I can see that
> the CMMD value is always 0.  I don't see another function that
> modifies or touches CMMD or PMMD directly, so it seems that this value
> is read but never written by the ACPI itself.  I also see that these
> are the functions that your driver often uses and is trying to
> interact with.  I tried to set the CMMD value in the acpiexec, but it
> won't set RegionField:
> - dump _SB.PCI0.LPC0.EC0.CMMD
> Object 0x55c5a3389490: Namespace Node - Pathname: \_SB.PCI0.LPC0.EC0.CMMD
>     0000: B0 D9 38 A3 C5 55 00 00 0F 11 00 00 43 4D 4D 44  // ..8..U.....=
.CMMD
>     0010: E0 3B 38 A3 C5 55 00 00 00 00 00 00 00 00 00 00  // .;8..U.....=
.....
>     0020: 00 95 38 A3 C5 55 00 00 01 00 00 00 00 00 00 00  // ..8..U.....=
.....
>                 Name : CMMD
>                 Type : 11 [RegionField]
>                Flags : 0000
>             Owner Id : 0001
>          Object List : 0x55c5a338d9b0 RegionField (Type 11)
>               Parent : 0x55c5a3383be0 [EC0_]
>                Child : (nil)
>                 Peer : 0x55c5a3389500 [WFDK]
>
> Attached Object 0x55c5a338d9b0:
>     0000: 00 00 00 00 00 00 00 00 0E 11 01 00 00 01 00 01  // ...........=
.....
>     0010: 90 94 38 A3 C5 55 00 00 08 00 00 00 C1 00 00 00  // ..8..U.....=
.....
>     0020: 00 00 00 00 00 00 00 00 10 3F 38 A3 C5 55 00 00  // .........?8=
..U..
>     0030: 00 00 00 00 00 00 00 00 80 00 00 00 00 00 00 00  // ...........=
.....
>     0040: 00 00 00 00 00 00 00 00                          // ........
>                 Type : 11 [RegionField]
>      Reference Count : 0001
>                Flags : 00
>          Object List : (nil) - No attached objects
>          Field Flags : 01
>    Access Byte Width : 01
>           Bit Length : 00000008
>     Field Bit Offset : 00
>     Base Byte Offset : 000000C1
>          Parent Node : 0x55c5a3389490 [CMMD]
>         AccessLength : 00
>        Region Object : 0x55c5a3383f10
>       ResourceBuffer : (nil)
>
> I am nervous about adding a call to write that region field to the
> thinkpad_acpi driver, but there does not appear to be another way to
> modify the entry.  I've searched for CMMD and PMMD in the dsdt.dsl and
> haven't found a way to modify them.
>
> Any help would be appreciated.
>
> Thanks,
> Liam R. Howlett
