Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CB8C433B4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Apr 2021 06:11:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15C0B613BB
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Apr 2021 06:11:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245263AbhDMGLp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 13 Apr 2021 02:11:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:44866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229748AbhDMGLo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Apr 2021 02:11:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E2F8C613BB
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Apr 2021 06:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618294285;
        bh=mwjSw/VA1fo1rNK25QfaXxf+HLZyivqMrVsrG9JHOiE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oMDBlQmGIk/hZ+ldmEt25YeFJtwZMUTmNFfp5mCUsoWV3AJhKUOo19l8Cgszak0Nb
         B0wHnaxXzbDMvQh+r+pg4iMHl3KS/jnRlBEMgcZtMe4b+GpZilYDV12Nok9MZkGjXf
         6qQpRDWUSKSEp/JgvBmXn8i+8GqvKj2JlP5K/zeUG4Ixx3xp7zD9z+nYwjuiiTfdw2
         oxPuJjsjQoJag4IGPFnvOmZMtBZV4GsZOdOOWeBY5/Gl4/JSTSClQjmtRe7wigAzEs
         KGwcikkuVXwlKVrveYDDGPHIZ7RElJwt+lNoneXKp8G038304fbLYzJSH14cSQx162
         bvG2/QHqat88g==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 13 Apr 2021 06:11:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-ePoDqrPyyS@https.bugzilla.kernel.org/>
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

--- Comment #64 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Sydney, I understand that all the discussion can be somewhat confusing.

It should be perfectly safe to run Linux on your computer (but as you said =
no
there is no warranty), by default Windows also does not come with any softw=
are
to monitor the nct6775 sensors. So when installing Linux without making any
changes your computer will run the same way as with a pristine (no extra sw
installed) windows install.

Under Linux you will even be able to monitor the CPU temperature using the
CPU's builtin temp-sensors. What does not work is monitoring other
temperatures, voltages and fan-speeds. Nor controlling fan-speeds.  But
typically a modern motherboard will automatically control the CPU fan speed
based on temperature, without needing the OS to do anything; Also most users
typically use their computer for other things then to monitor the computers
temps and voltages.

Matthew rightly advises against using "acpi_enforce_resources=3Dlax" becaus=
e that
opens races between the firmware and Linux which could result in writing to
another superIO register then intended. This can definitely lead to e.g.
stopping the fans even though the CPU is running hot, which is not good but=
 all
modern CPUs have builtin overtemp protection, so at the worst the system wi=
ll
simply shutdown (1).=20

Theoretically this could also lead to worse outcomes, such us changes your =
CPU
or RAM voltage which could damage your hardware. I am aware of at least one
semi-related case where RAM got seriously overvolted damaging both the RAM =
and
the CPU, this was not with a Super-IO solution though, but with I2C attached
sensor probing.

1) Repeatedly overheating your CPU to where it automatically shuts down is =
not
good for your CPU's health though and will likely shorten its lifetime.

TL;DR: Don't use "acpi_enforce_resources=3Dlax", otherwise running Linux sh=
ould
be safe and everything should work fine.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
