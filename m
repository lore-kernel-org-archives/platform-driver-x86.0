Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7110C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Nov 2021 13:08:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD8B86135E
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Nov 2021 13:08:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbhKENKt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 5 Nov 2021 09:10:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:33068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229529AbhKENKt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Nov 2021 09:10:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 803EF61360
        for <platform-driver-x86@vger.kernel.org>; Fri,  5 Nov 2021 13:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636117689;
        bh=yi0iCV4gPYZ7fyT9gHfo+dx/1JcZTic0YDfQeWFnIgM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=uUObD6nYEYPVqyotg/Gz8c1MKLlZWxadVc8bM4JErTSwir6nx5p+fj8GIc0eDkoPr
         UZS2SxMNa0JWCBYYELYOI9mCTvF3kvyXFvIFgTpeysZRDvp9WIe/3TcABHU6P2kkwA
         eXFTgjj8V2g+ys00bAyKQfkTWxaYIM/sGue9os/TbSCtwDY4qAFPYBrx/ugtlz7N6l
         WvD/dSMqdwSCjk1CiNp7MzPrFrr+3zAMB57muyXCrIGBgfmswB7WAJtvk72U8+ySdp
         8AnovoSrU7GfAxPcgAaT06mTkwwZy4ep3iRwEjC1W3f40IYR8EnID35l6wJr3XKRd5
         pX6C87IC3mHPg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 05 Nov 2021 13:08:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: olli.asikainen@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-pKuDkYBzdx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

Olli Asikainen (olli.asikainen@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |olli.asikainen@gmail.com

--- Comment #149 from Olli Asikainen (olli.asikainen@gmail.com) ---
My ancient MAXIMUS VII HERO (NCT6791D) suffers from this bug as well.

I added the board name to asus_wmi_boards, but this is what I get:

[    3.131718] nct6775: Using Asus WMI to access 0x0 chip.
[    3.131742] nct6775: Enabling hardware monitor logical device mappings.
[    3.131750] nct6775: Found NCT6791D or compatible chip at 0x2e:0x290

nct6791-isa-0290
Adapter: ISA adapter
Vcore:                   0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
in1:                     0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
AVCC:                    0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
+3.3V:                   0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
in4:                     0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
in5:                     0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
in6:                     0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
3VSB:                    0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
Vbat:                    0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
in9:                     0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
in10:                    0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
in11:                    0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
in12:                    0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
in13:                    0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
in14:                    0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
fan1:                     0 RPM  (min =3D    0 RPM)
fan2:                     0 RPM  (min =3D    0 RPM)
fan3:                     0 RPM  (min =3D    0 RPM)
fan4:                     0 RPM  (min =3D    0 RPM)
fan5:                     0 RPM  (min =3D    0 RPM)
SYSTIN:                  +0.0=C2=B0C  (high =3D  +0.0=C2=B0C, hyst =3D  +0.=
0=C2=B0C)  sensor =3D
thermistor
CPUTIN:                  +0.0=C2=B0C  (high =3D  +0.0=C2=B0C, hyst =3D  +0.=
0=C2=B0C)  sensor =3D
thermistor
AUXTIN0:                 +0.0=C2=B0C    sensor =3D thermistor
AUXTIN1:                 +0.0=C2=B0C    sensor =3D thermistor
AUXTIN2:                 +0.0=C2=B0C    sensor =3D thermistor
AUXTIN3:                 +0.0=C2=B0C    sensor =3D thermistor
PCH_CHIP_CPU_MAX_TEMP:   +0.0=C2=B0C
PCH_CHIP_TEMP:           +0.0=C2=B0C
PCH_CPU_TEMP:            +0.0=C2=B0C
PCH_MCH_TEMP:            +0.0=C2=B0C
intrusion0:            OK
intrusion1:            OK
beep_enable:           disabled

Any idea?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
