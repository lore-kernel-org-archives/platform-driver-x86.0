Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C8E8C12002
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 16:13:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 874DE61245
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 16:13:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232708AbhGUPdP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Jul 2021 11:33:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:56292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232058AbhGUPdO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jul 2021 11:33:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3A48261245
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jul 2021 16:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626884031;
        bh=waqMgSacdYXgqVOkFg3i0AncfGovvG/cnnBfIt8HNBU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qF/gP5XCWJbW2STMSG6T1DOlCbMNVb8AEgpSTFIs04JtI0cZ9yeau9Us2KSCL/w/h
         qaURqI6+E/ze/KG+GZ9a64q4zvyFrXD2KOgfitkCf+Aq+V4xALx/DuKJDP/Jkyk8Ys
         FY789Jb1mnd+Invf+aJrk6gMnsU5BmK5u8F9fWxd2+0WZ0LZE0N9//ZG78yD+wRMRR
         xoq4/mrYJNQIET+0X+jn8MTr+9UJSZc6BIeTfrqJto3eQLvvG4NBD3rFUBA/3Yys9A
         MlogT9uj08xqNjhx/AU0jOnp3jToRRj9B0IaMGa3wj1M5FOw3aP1VtKV11MbroeYTr
         zWPV95PXuhI5w==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Wed, 21 Jul 2021 16:13:50 +0000
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
Message-ID: <bug-213579-215701-snoXcGQ8dF@https.bugzilla.kernel.org/>
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

--- Comment #27 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to wse from comment #25)
> Did i get it right that this are the actuall physical pins on the bottom =
of
> the cpu?

Nope. Pins are actually pads on the die which may or may not be connected to
the bumps. So, some of them are traced out some of them are internal for in=
-SoC
devices.

> Does anyone have a schematic for a device available where this issue aris=
es?

Extremely good question!

> So we could check where the physical connections between the touchpad
> controller and the cpu soc terminate.

Exactly my point in a comment above.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
