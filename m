Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789BBC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Sep 2021 20:03:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 514AE61168
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Sep 2021 20:03:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235994AbhIHUEv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Sep 2021 16:04:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:40114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230044AbhIHUEu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Sep 2021 16:04:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id AF2EB61184
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Sep 2021 20:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631131422;
        bh=fVeSVrNuLZlJphtLV/HrolulIwdFyPSztN4TFnD5koM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YLZ001SViOqDk9/Xr473X7XIHeEfPmiercpo1/vtCRG5IQ1L2F5V09omUNuHrcEb1
         lIKL7SKsoH2zI+xvN/RK6BNCXaptnYJL/YQy1Nfv4KlPL1rGDXkRhvo3TKYzw/D9+8
         nIf8ltD9ao+12Q/wJuvGUAj6HRBEBBj+LZvGhh+gpH/2YIqnyfunBDbGVmY1RZNLXd
         87SNeyDXwQOyOJuD5ykes6BupK7TC03Nqd5AJeD8emSrXugeLveeCBM4P35nZHaQUs
         cCPRoRWyKzX7G7GKkwWhN1WctmsfefwmwZohJqgarG8CGG/GkZeSDhwP0M+fOBmA9Y
         4cpWm8gd7nE4w==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 08 Sep 2021 20:03:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-kXqL1rrot4@https.bugzilla.kernel.org/>
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

--- Comment #98 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Tom Lloyd from comment #96)
>=20
> I hope that's of some use.  The differing dmesg output suggests that the
> patch is helping, but shouldn't there be a change (improvement) to the
> sensors output?

The patch which is being worked on here is simply changing the method of
accessing hardware, it does _not_ change the underlying driver which deciph=
ers
the sensor inputs.=20

To improve the output you've got to create e.g. /etc/sensors.d/nct6798.conf=
 and
describe your desired configuration there but that's outside the scope of t=
his
bugzilla. Please read lm-sensors documentations for that.

I've already done that for the ASUS TUF GAMING X570-PLUS (WI-FI) motherboar=
d:
https://github.com/lm-sensors/lm-sensors/pull/216 but my configuration is v=
ery
incomplete since the documentation for this chip is likely proprietary and =
not
available publicly. Even HWiNFO64 fails to decipher multiple inputs and sho=
ws
them as is and that's the best application for that under Windows. Then cer=
tain
inputs may simply not be connected to anything and basically report white
noise.

If you have close contacts at ASUS they may give you the data but that's far
from certain. For some reasons hardware monitoring for motherboards, GPUs a=
nd
CPUs is veiled in secrecy and protected by patents and NDA.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
