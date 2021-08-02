Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC2DC4338F
	for <platform-driver-x86@archiver.kernel.org>; Mon,  2 Aug 2021 17:16:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A155B610FE
	for <platform-driver-x86@archiver.kernel.org>; Mon,  2 Aug 2021 17:16:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhHBRQy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 2 Aug 2021 13:16:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:33130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229809AbhHBRQy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 2 Aug 2021 13:16:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 851C9610FE
        for <platform-driver-x86@vger.kernel.org>; Mon,  2 Aug 2021 17:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627924604;
        bh=VGrCklk7AG+VgucG3rEom/lfer56pjD9WIbX6fjRdjs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=aHjuyPp0qp0zLNbn7BB9ZqQFSC3Q/dXfAh2MEqtAUzd5bHV4AtJwNRKWjWjbGSKts
         OogtjlezaXbFP6vv7vy7Dx7aNupvW5tIDSjSsR7dhaWxmfdR+T65QNFDvA1tARHyFI
         Q5Ux/uc/emEZ64ZvxLzNV+Kn2oqw00hOOmIbdprd37iy9t1t50Wt3UMBWYNdDH0LKE
         mmmqvjognYugnAm4UuZ2BDGg4aFh6rDO1xjACy7/WepBH08w6dojiLuJvpgMWPVZm7
         axWhts8B6AkYJxIzoID71YNPyORNSCIoSr02vbDeIcmmB7wr8Y2uDz/96kGWSYW2EE
         ciSTevAhwiC4g==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Mon, 02 Aug 2021 17:16:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213579-215701-7xcsyrwGjB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213579-215701@https.bugzilla.kernel.org/>
References: <bug-213579-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213579

--- Comment #46 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to wse from comment #45)
> (In reply to wse from comment #44)
> > Found the offending code bit in the dsdt:
> >=20
> >     Scope (_SB.PC00.I2C0)
> >     {
> >         Device (TPAD)
> >         {
> >             [...]
> >             Method (_INI, 0, NotSerialized)  // _INI: Initialize
> >             {
> >                 BADR =3D SADR /* \_SB_.PC00.I2C0.TPAD.SADR */
> >                 INTA =3D GNUM (0x0801000C)
> >             }
> >             [...]
> >         }
> >     }
> >=20
> > INTA should evaluate to 0x8C (140), but does evaluate to 0x2c (44).
> > GNUM is some kind of offset calculation, ignoring the 0x08, taking valu=
es
> > from an array based on the 0x01 and adding it to the 0x000C. You can ch=
eck
> > it in the disassembled dsdt. I don't know ofcourse if GNUM is buggy, the
> > array is wrong, or the 0x0801000C input value is wrong (you can choose =
an
> > input value that makes GNUM evaluate to 0x8C).
>=20
> However: Building and using a dsdt with INTA hardcoded to 0x8C makes the
> touchpad work on arbitrary kernels. Maybe a better workaround then a self
> compiled kernel.

Thanks for this debugging and root causing the effort!
I totally agree that DSDT recompilation is much better approach, but it's s=
till
far from ideal (firmware fix by a vendor).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
