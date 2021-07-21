Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF95C636C9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 13:46:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6C0260FF1
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 13:46:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238707AbhGUNFk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Jul 2021 09:05:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:48138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238734AbhGUNFR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jul 2021 09:05:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7D17960FF4
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jul 2021 13:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626875154;
        bh=ipUtZCDVy5H+ppbfKNazOqbPHy3iR0atQX52YKDx6gM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mD8/X/BDJPPsw4/MZYt25wEC+SG/WVe+lzvJtqas1Po2S3+804K/vmirqFKorfCM9
         txVJkcYYC8Peny42b1xS2DzH95E+tNPqT8Gi80e1IAdjp/F90beIb7GvajHAgGbqAs
         V9W9MBWRTOQUkKzmasP3uQPYHiN8N+LptiFo5mExN99kjmiw/u7dmE+sFG/IRm70pn
         z3RC0LTb76h3hEV3vnKvLKAaSG0UYQFnDVXCGhW51BYRTuACJ1XlIuU6Va8p+IrTwG
         WGhPCI51kz5Sj2uOFLvK/hR4Y1STc0ymBhjI7ugKaibDTkNgJgiFzV2x7tIhqzgSKg
         leR+nxg096xhA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Wed, 21 Jul 2021 13:45:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213579-215701-G6oi0Ax5Tu@https.bugzilla.kernel.org/>
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

--- Comment #21 from wse@tuxedocomputers.com ---
(In reply to Riccardo Mori from comment #20)
> (In reply to Andy Shevchenko from comment #19)
> > What I'm wondering is if the pin list is broken and actual pin 57 is
> > something else (+- few pins according to the current driver). May be
> someone
> > can install libgpiod tools (such as `gpiomon`) and run with pins that a=
re
> > already in GPIO mode without [ACPI] bit set. Something like `gpiomon
> > gpiochip0 43` (for pin #56) and `gpiomon gpiochip0 47` (for pin #60). T=
hen
> > if touchpad (when being touched I presume) generates the interrupts this
> > will show them. But it's unlikely as=20
> > per success story described in the bug #211957 where pin under question=
 has
> > much higher number and any pin list disturbance will be noticed
> immediately.
>=20
>=20
> Thank you for helping us Andy.
> I tried `gpiomon gpiochip0 $PIN` with the non-ACPI pins numbered from 15 =
up
> to 100 but unfortunately I didn't get any output.

Maybe it's a typo in the firmware and it actually should be 157 or 257

Other interrupt related bug reports found with other touchpads, always had
interrupt pins in the 2xx range

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
