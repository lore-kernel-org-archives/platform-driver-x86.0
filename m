Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D593C636CE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 16:07:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8614961261
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 16:07:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231517AbhGUP1E (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Jul 2021 11:27:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:53884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhGUP1E (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jul 2021 11:27:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9816261244
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jul 2021 16:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626883660;
        bh=mJ7jBr8eKCYT6eFW2ZmOyf66yuJTKoYPRE+vLJJm1yM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=vFutT4dttzW7c6vj2zOUKA5FM3gevWcp797NIz5i8WvtgZSQpyer2YvgXeExgoExg
         m9XGwD/iBREU3rVjQyAx5NMAxhCJjLk8kO2NQ8iddZo5fs1384eMovOHpEkQ+kqVfQ
         PGRT3ryPdJiFSJJnuFXzElYfzKTiOumX2oXzjID0/8Tvb3k3UmILd/uSxwJ/maxomQ
         LWWiPaOICzp/dZxLMxecXetUX5/7aRES6dA2/9rGjMQFX6z1DNFNbirqrKeCeC5u7w
         NCykEmWEmmBpc16zlEytrNUry3NJSJ7RBpS7M9Nb4nb5SBVqsAwWOMeSFV7Aaaq9Eo
         zcNbqo0mgMVqg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Wed, 21 Jul 2021 16:07:40 +0000
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
Message-ID: <bug-213579-215701-AJQtjd61Rf@https.bugzilla.kernel.org/>
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

--- Comment #26 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to wse from comment #21)
> (In reply to Riccardo Mori from comment #20)

> Maybe it's a typo in the firmware and it actually should be 157 or 257
>=20
> Other interrupt related bug reports found with other touchpads, always had
> interrupt pins in the 2xx range

It's solely depends to the PCB design. Without schematics it's hard to say.=
 And
no, we (our team of developers) do not possess any schematics for this OEM
specific hardware.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
