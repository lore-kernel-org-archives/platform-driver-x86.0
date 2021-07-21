Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82DA6C12002
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 12:56:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55A576120C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 12:56:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233417AbhGUMQP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Jul 2021 08:16:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:56918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232654AbhGUMQO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jul 2021 08:16:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4CE136120A
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jul 2021 12:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626872207;
        bh=GYfMhgITFSWMcC+xxPbm1/G4r97HAPVCcP2/MqnJbi8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=T+49BfFUVIB4GGZ2OB37DEAWc0UCz57TFQYpScc+BVg1btpY8e1hU9jeyZSW7CoTT
         dsGI3j0tljUqdFlZld+owHotLJnwV+6XZq2M6xbcu8GEaX//kqY8COiI+1yG9sYkpi
         Bu0Rhb81Scn6qwn7aqD3TgDwGj/WzEyGR5bQydR3gWcA5w7JKiz+AtX/T8ICb3fuXG
         3EleGhYI3TQD/dibgxhAWBPN8fKlQZvwk6FpFv1bWjNE871/5kvv0+G56PksbIkAok
         m8gKDV3LoWzWGypkDCpawYrYM5HqyF9sW7DhSRL4y+yte/q9nAIvW0pEICH/087PAT
         f/ZFa0NeytaIA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Wed, 21 Jul 2021 12:56:47 +0000
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
Message-ID: <bug-213579-215701-nzm5CnuL5G@https.bugzilla.kernel.org/>
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

--- Comment #18 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
Citing the hardware level documentation:

"Each GPIO pad ownership assignment is pre-determined via OEM system
configuration through BIOS, soft strap and/or embedded subsystems=E2=80=99 =
firmware
settings with corresponding pin list documentation.

...

In summary the pad ownership bit is used to determine:
  =EF=82=B7 GPIO input event notification/status update to the subsystem ow=
ning the pad
    o setting of Host=E2=80=99s various interrupt status bits
    ...
  ...

PAD Ownership (PAD_OWN)
This register can be written by [Firmware] only.

...

00 =3D Host software (ACPI Mode or GPIO Driver Mode) has ownership of the p=
ad. In
Host GPIO Driver Mode (refer to HOSTSW_OWN), GPIO input event update is lim=
ited
to GPI_STS update only. While in Host ACPI Mode, updates are limited to
GPI_GPE_STS, GPI_NMI_STS and/or GPI_SMI_STS."

Sorry, but OEM has to fix this. I love to know how Windows works around thi=
s.
If anybody has that information, please share.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
