Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05732C6377C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 21:45:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D79046124C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 21:45:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbhGUVFE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Jul 2021 17:05:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:56988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229850AbhGUVFE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jul 2021 17:05:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 99C2C61208
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jul 2021 21:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626903940;
        bh=fO8WVos7DSw6JnNMegPVVvtlEQU/l3tnjy1PnvXhKBk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mwLEHKvDHDV1Ox1V/nAh5FgfszDWfda3isxTEpflp+f6tAKIh6AnwgjRcvrZj4bV+
         kKwtgPiU9GA3NpskBrCj7Gi36OanlyrM6IQnmv9qh+f8P71iufU6YwIfGs+aLoRprW
         O1dSI+YzLvJF9MkvMOVlUaX7RHP15b32R29zIJINnhGTGFuBTXv27p2cCTOSVmoZCC
         khJURbOnE337Fwlz8wt7zKb8l3LDQJNyRRrustWYQ7BFP2Sm8flMJmm2rRLY4AS0sP
         WA+mBaOXw7/HWrnLkn8A3knV5uQ3fuFWGHrW3JUDzvSgTcrQm/sLzfVLYBpmcV85fr
         VFsiu11uyjhiA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Wed, 21 Jul 2021 21:45:40 +0000
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
Message-ID: <bug-213579-215701-QsMl6eiRMs@https.bugzilla.kernel.org/>
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

--- Comment #34 from wse@tuxedocomputers.com ---
Yes, that seems to be it also for the Tongfang GMxTGxx.

I currently only have remote access to one of the affected devices (home
office), but with this change the irq errors from the kernel logs are gone =
and
xinput lists the touchpad.

Tomorrow I will ask a colleague to touch the touchpad to see if it's actual=
ly
working.

Firmware vendors are usually faster when you can pinpoint the exact thing to
change. So my noob question: From where in the firmware does this 57/44 pin
come? Is it ACPI code (hope so, then a workaround could be crafted even wit=
hout
vendor support)? If yes: What am I looking for in the .dsl files?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
