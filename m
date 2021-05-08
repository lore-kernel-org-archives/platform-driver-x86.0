Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12DCEC433B4
	for <platform-driver-x86@archiver.kernel.org>; Sat,  8 May 2021 01:09:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BEE7A6044F
	for <platform-driver-x86@archiver.kernel.org>; Sat,  8 May 2021 01:09:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhEHBKl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 7 May 2021 21:10:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:55502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229482AbhEHBKl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 May 2021 21:10:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A90986044F
        for <platform-driver-x86@vger.kernel.org>; Sat,  8 May 2021 01:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620436180;
        bh=XnRPJFmDcHD1hifXtBuES5tZt+PM8PGAzskr3hGRa2I=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=QXLiZUrVBvF4kU7Uy5JIQHP7JzVs7RoHlrlTkHbFNTwWcNHEkdKTzeNOUOdF8ka1M
         2qoOcNdzXq9SwABI9qFWiZAU5CpXCkuhzjSRxfvcTtn38GmG09KMuxwFt8Upr0kiu/
         Gt8sWCQF994u8XHS5uVFpdrPo6KY1nsz6WDUq73wRugOr/aZXsf2YwXdoSQIY9Baux
         B41uIjw7q8mbmbwrOuTONJMFRM+EF0sSGUnc4fec8CKYYmm+LReZnbJQ3v8afr6Oh4
         cCbnogI7Drc6tvhefV9wd0mf7zJbwxNCTrpspsxidrppcuOwtzVr9/Uw1vluGFBcK2
         bRbeZ+9M7n56Q==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 212985] ideapad_acpi: VPC2004:00: DYTC interface is not
 available. platform_profile interface is unavailable
Date:   Sat, 08 May 2021 01:09:40 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pobrn@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform-driver-x86@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212985-215701-xtoNGfx5lu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212985-215701@https.bugzilla.kernel.org/>
References: <bug-212985-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212985

--- Comment #4 from Barnab=C3=A1s P=C5=91cze (pobrn@protonmail.com) ---
> If I'm understanding correctly, you're saying to check the disassembled A=
CPI
> tables, right?

Yes, exactly.

From this part:


            Method (DYTC, 1, Serialized)
            {
                ITSV =3D Zero
                ITSM =3D Zero
                Local0 =3D Zero
                Local1 =3D (Arg0 & 0x01FF)
                Local2 =3D (Arg0 & 0xFFFFFE00)
                Switch (Local1)
                {
                    Case (Zero)
                    {
                        If (!Local2)
                        {
                            Local0 |=3D One
                            Local0 |=3D 0x0100
                            Local0 |=3D Zero
                            Local0 |=3D 0x40000000
                        }
                        Else
                        {
                            Local0 |=3D Zero
                            Local0 |=3D 0x04
                        }
                    }


it **seems to me** that only DYTC v4 is supported on that model - although =
I'm
not sure. The ideapad_acpi driver will only expose the platform_profile
functionality if it finds DYTC v5 or newer. The code was adapted from the
thinkpad_acpi driver, and the platform_profile support was contributed to t=
hat
driver by Lenovo employee Mark Pearson. I cannot remember the exact reason =
why
earlier versions are not supported, you could possibly write to the PDx86
mailing list (platform-driver-x86 at vger.kernel.org) and CC him if you wan=
t to
know more; or search back on lore.kernel.org.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
