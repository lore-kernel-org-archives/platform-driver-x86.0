Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27746C433E6
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Mar 2021 16:40:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EBCBE64EB9
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Mar 2021 16:40:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbhCRQju (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 18 Mar 2021 12:39:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:34806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232176AbhCRQjr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Mar 2021 12:39:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9B68C64ED2
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Mar 2021 16:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616085586;
        bh=OX7avWvtm33i+hFAvw4ofqL3xtCa3m7do21RCpAvHyM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=HEEACEyhksp1YUmLDMd6iIQsmEY5zJlorRRCbJ0T6hEjSmwZZv18owpdJ3a/Nmzw+
         J4GxE+ykH9JPCEh44nwVyqv/qvBaDqq5ZA1/B4isyZaHdXUzr1jl3PUfIePuUdPufR
         50HUjc1kt1uzA6XfVkKwbJYVXiflcL++gaUhOh/YqCu5hZVA3YLqBsQIaI+kBcg9Pn
         PCPmvxCkB40b3KO+eC0nICz5lspV+mAVKcsjY2HbT9ojZgJN3dX9kUx9+0Je0hspjU
         mcwgL4uPgS6SpQcZlSs4mtp0b+UblNF5Dp1cavIsf52/OUxsrKGRJkv5/cM8jFPiPh
         YlNO9sHiofuuQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 203191] The fan speed reports to 65535, despite the fan is
 stopped
Date:   Thu, 18 Mar 2021 16:39:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mschiffer@universe-factory.net
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203191-215701-lHNpreJ94r@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203191-215701@https.bugzilla.kernel.org/>
References: <bug-203191-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D203191

--- Comment #7 from Matthias Schiffer (mschiffer@universe-factory.net) ---
The T470 (without the 's' suffix) is affected as well. Still reproducible w=
ith
the latest BIOS 1.65 and Linux 5.11.6.

I believe the issue is not directly related to suspend/resume, as I don't u=
se
suspend. Instead, the fan control can break any time the fan is supposed to
spin up, which may be when waking up from suspend, or simply because of
increased CPU workload.

Whenever the systems gets into the broken state:

- the fan is not spinning at all
- hwmon and /proc/acpi/ibm/fan report 65535 RPM
- manual control via /proc/acpi/ibm/fan is ignored (Note: I normally don't =
use
this interface, but rely on the builtin fan control)
- only a full poweroff will fix the issue. When attempting to reboot withou=
t a
poweroff, the BIOS will refuse to boot with a "Fan error" message.

As far as I remember, the issue originally started when Lenovo fixed a BIOS
issue that caused the fan to hang at 100% after suspend occasionally a few
years ago.

I'd be happy to provide any information that may help fix this issue, as I'm
seeing it pretty much daily.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
