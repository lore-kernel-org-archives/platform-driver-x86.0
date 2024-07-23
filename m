Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6692C2C9D
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jul 2024 03:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721705465; cv=none; b=n3lzhwJh4b76lAgZn5gOzhgSjAmFc5RAdNkvM+GcThdXiANsMruDumSAiD86DftvZpFo6rUJMKU2r4an6k+n0KjUD4ei3a9/2Pi+Hafqz+Q1KpI22NVNr3VhszZlDX9c2bgml7JcmVEoMtAfMQl8jO1R/YxFA5SnUNgWrbD1oZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721705465; c=relaxed/simple;
	bh=rxku4/q4wTVaKvlKBsZKsW9Ct9wlupoodXJgtAwlI84=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ByQmFhcTZ58cGR+msbTV8WqlRU5Yn+bjpzrO0e6J0h6jCCnjrc4dB4/rr1bj98kpDZP5uHT+d7RV41o0Okfar0Td3C8+m2DJf3RTdOWM+1gEGnZNUAUjYjJoc5FMb/iRiNNRwfvCgTfze7bHQwwjdbLwpjjn3LDN3ERqMua0W0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsG4jojO; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsG4jojO"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-4f51c1f9372so823090e0c.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jul 2024 20:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721705463; x=1722310263; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ynD1F0ztxLzSgRVecWFwgfDC7E2nZeypjxkRlRsEsIg=;
        b=TsG4jojOaPSQ7k25y29BtFsXRoG1ksLJq4MBynuJW4UB0oP1Bmn08FNFiEDyYbzh7h
         ZNpQgwNQxqM3mLBCGGL3wzfDy9QknjwuLiyoc+N337v+mLfJ6VFQZ18zCrkflDXlr7c7
         Cs/GrlEYHVG+/RCqDyiE+j4aGNJpLaUXcP2ycSv3966pbTn0p4aKTGbvz6WEKH85FVYR
         fvAtxO2e7bQTHeEhN7rwxWnpG1izuedCWQR5ENp0tj88EYmD1xM1IfVyqXRGyU4gOFyJ
         0C0vRkHpBq6iA/YXmNw6h2d7c/jZH1NNcWDenNPBvK4BekDUxf8SoUgBmnvcHv/yYWUR
         PFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721705463; x=1722310263;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ynD1F0ztxLzSgRVecWFwgfDC7E2nZeypjxkRlRsEsIg=;
        b=tKSqqakSIK18bcbWOluX7aI2aN3/bFEOK7v3GzNyfKeMqCSXEHz5zDmafvUDtRW0Wj
         buGGTxN7rkV8hzynL+16E84SYF8ax/opAsfVokcc5M09bftCvxlboQ7Rh1yMS5sxN/F4
         bi+KIIm9PCTVD+pWZULawM4mMWPw1Jg3dwrzGQhCfZWVmBh7k6TQqBtQ3/Ma9TfElx7K
         TYPTUY6UITqh9VyMpZpAnUYUvgmnorAYFZ2NMjXaFSjJ937/WqObC1KxIggdjdS87XIJ
         kCB5MR7wM0sjVs6rfNhbR9xG1qUYob5Y7D4lECx+K1ZnSStzL1WlxEo7mGeZN/lNhSzH
         Zidw==
X-Gm-Message-State: AOJu0YzIGrJq0f/pmDeoG5lvRHY36HISV1uH2UI3x1qMTJ1fs4s0brtW
	E5i3OF2stgMIljBWssGPceks5S02MpR2M5OPWAuSONyhL9g3iJhXMZfKcai+NRCtfbCB9eZEQ3V
	AH0h9UYBwqXT0SRSROrf0eJgUWu/QXQ5q
X-Google-Smtp-Source: AGHT+IHVH9td/V9iUY8v7xJpOBfvPahcSVpMbe14O2+vubBgo7uhdN3REeKeHb8VcPmp1yVmFafo4+G3/VCtTnGV3wo=
X-Received: by 2002:a05:6122:181b:b0:4ed:12b:ec99 with SMTP id
 71dfb90a1353d-4f5066645efmr11780354e0c.3.1721705463055; Mon, 22 Jul 2024
 20:31:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Liam Howlett <howlett@gmail.com>
Date: Mon, 22 Jul 2024 23:30:52 -0400
Message-ID: <CAHfPaQt_ZkJ=LghsuNg98X+HmXcbDbPvT2QyB9sDQLX5+KkU4Q@mail.gmail.com>
Subject: Tablet mode on L13 Yoga Gen 3
To: hmh@hmh.eng.br, hdegoede@redhat.com, ibm-acpi-devel@lists.sourceforge.net
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

..resend in plaintext, apologies if this is the second copy you are reading.

Hello,

I'd like to say first, thanks for the support of thinkpads in linux.
As a kernel maintainer, I understand this is a lot of work and I
appreciate you doing a fine job with supporting the hardware.

I am working on patching the thinkpad_acpi driver to support the
keyboard rotation and keyboard lock-out in tablet mode for the L13
Yoga Gen 3.  I believe it needs just one bit extra to get working and
I'm struggling to figure out how to do what I believe is necessary.

It looks like _SB.PCI0.LPC0.EC0.CMMD needs an initial value of 0x01 to
0x06, but I don't see a way to trigger this to happen.  Alternatively,
is there a way to write PMMD?

Right now, I get the following message on boot:
thinkpad_acpi: Unknown/reserved multi mode value 0x0000 for type 4,
please report this to ibm-acpi-devel@lists.sourceforge.net

It looks like the value of 0 indicates that the keyboard rotate
monitoring is disabled, but I cannot seem to find an ACPI table way of
modifying EC0's contents (or set CMMD/PMMD)

The functions of interest seem to be as follows:
                    Method (_Q2E, 0, NotSerialized)  // _Qxx: EC
Query, xx=0x00-0xFF
                    {
                        Local0 = CMMD /* \_SB_.PCI0.LPC0.EC0_.CMMD */
                        If (((Local0 != 0x00) && (Local0 <= 0x06)))
                        {
                            If ((Local0 != PMMD))
                            {
                                PMMD = Local0
                                ^HKEY.MHKQ (0x60C0)
                                If ((PMMD >= 0x04))
                                {
                                    WFIO (0x0B, 0x01)
                                }
                                ElseIf (CPLS)
                                {
                                    WFIO (0x0B, 0x00)
                                }
                                Else
                                {
                                    WFIO (0x0B, 0x01)
                                }
                            }
                        }

                        If (((Local0 == 0x00) || (Local0 >= 0x07)))
                        {
                            Local1 = 0x01
                        }
                        ElseIf (((Local0 == 0x02) || (Local0 ==
0x03)))
                        {
                            Local1 = 0x02
                        }
                        Else
                        {
                            Local1 = 0x03
                        }

                        If ((Local1 != LVMD))
                        {
                            LVMD = Local1
                            Sleep (0x0A)
                            ^HKEY.MHKQ (0x60F0)
                        }
                    }
... and ...
                        Method (GMMS, 1, NotSerialized)
                        {
                            Local0 = 0x00040000
                            Local1 = PMMD /* \PMMD */
                            If ((Local1 >= 0x06))
                            {
                                Local0 |= 0x03
                            }
                            ElseIf ((Local1 >= 0x05))
                            {
                                Local0 |= 0x05
                            }
                            ElseIf ((Local1 >= 0x04))
                            {
                                Local0 |= 0x04
                            }
                            ElseIf ((Local1 >= 0x03))
                            {
                                Local0 |= 0x02
                            }
                            ElseIf ((Local1 >= 0x01))
                            {
                                Local0 |= 0x01
                            }

                            Return (Local0)
                        }
...
and this portion of the _WAK code:
        PMMD = \_SB.PCI0.LPC0.EC0.CMMD
        If ((PMMD >= 0x07))
        {
            PMMD = 0x00
        }

        LVMD = \_SB.PCI0.LPC0.EC0.CMMD
        If (((LVMD == 0x00) || (LVMD >= 0x07)))
        {
            LVMD = 0x01
        }
        ElseIf (((LVMD == 0x02) || (LVMD == 0x03)))
        {
            LVMD = 0x02
        }
        Else
        {
            LVMD = 0x03
        }

From this, and running acpiexec on the dumped tables, I can see that
the CMMD value is always 0.  I don't see another function that
modifies or touches CMMD or PMMD directly, so it seems that this value
is read but never written by the ACPI itself.  I also see that these
are the functions that your driver often uses and is trying to
interact with.  I tried to set the CMMD value in the acpiexec, but it
won't set RegionField:
- dump _SB.PCI0.LPC0.EC0.CMMD
Object 0x55c5a3389490: Namespace Node - Pathname: \_SB.PCI0.LPC0.EC0.CMMD
    0000: B0 D9 38 A3 C5 55 00 00 0F 11 00 00 43 4D 4D 44  // ..8..U......CMMD
    0010: E0 3B 38 A3 C5 55 00 00 00 00 00 00 00 00 00 00  // .;8..U..........
    0020: 00 95 38 A3 C5 55 00 00 01 00 00 00 00 00 00 00  // ..8..U..........
                Name : CMMD
                Type : 11 [RegionField]
               Flags : 0000
            Owner Id : 0001
         Object List : 0x55c5a338d9b0 RegionField (Type 11)
              Parent : 0x55c5a3383be0 [EC0_]
               Child : (nil)
                Peer : 0x55c5a3389500 [WFDK]

Attached Object 0x55c5a338d9b0:
    0000: 00 00 00 00 00 00 00 00 0E 11 01 00 00 01 00 01  // ................
    0010: 90 94 38 A3 C5 55 00 00 08 00 00 00 C1 00 00 00  // ..8..U..........
    0020: 00 00 00 00 00 00 00 00 10 3F 38 A3 C5 55 00 00  // .........?8..U..
    0030: 00 00 00 00 00 00 00 00 80 00 00 00 00 00 00 00  // ................
    0040: 00 00 00 00 00 00 00 00                          // ........
                Type : 11 [RegionField]
     Reference Count : 0001
               Flags : 00
         Object List : (nil) - No attached objects
         Field Flags : 01
   Access Byte Width : 01
          Bit Length : 00000008
    Field Bit Offset : 00
    Base Byte Offset : 000000C1
         Parent Node : 0x55c5a3389490 [CMMD]
        AccessLength : 00
       Region Object : 0x55c5a3383f10
      ResourceBuffer : (nil)

I am nervous about adding a call to write that region field to the
thinkpad_acpi driver, but there does not appear to be another way to
modify the entry.  I've searched for CMMD and PMMD in the dsdt.dsl and
haven't found a way to modify them.

Any help would be appreciated.

Thanks,
Liam R. Howlett
