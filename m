Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D0D1C433ED
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Apr 2021 22:42:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 293CE613BB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Apr 2021 22:42:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240745AbhDLWmk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Apr 2021 18:42:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:40890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238901AbhDLWmj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Apr 2021 18:42:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 34A9E613AD
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Apr 2021 22:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618267341;
        bh=b4BttA0eJEy2QSAC7xhGI8PdOOQYNUggfoo9UwU/hto=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WDG5IOUD4bZ4PGQCzGplRyXdcCURJnEGMi4H1HxxGfN0nXvz9X4wCW4Us2l0MbY4V
         isQt1JkOHjQ3yI1nsVJ6Myk6/WTBq0AQJUY93s+nEXtjy4X/DAzhZp0BFkSaXNCppe
         aX7G7ymEEjlUy2t8Rkoz0JtSuxB5f6gm/6RVZ0MzvzMqCdr8nzEkIQGrhOrBFR/qPI
         NO02EevyjcsHoDQ83x9t3818c6eEX0DCgDp0zjaVOPBkBpvhX56AR97/RkqvyVimHo
         7JOeGPH2toCqlyXGs8EtgenVpFmHHSbXKo2HP4NN8BcgP2zLo/x0URLO2nJ3BBtfqN
         EUFGnOk1z+ydg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 12 Apr 2021 22:42:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: syd.meyer@gmail.com
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-QLSM2EWSAm@https.bugzilla.kernel.org/>
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

--- Comment #63 from Sydney Meyer (syd.meyer@gmail.com) ---
Hello all,

perhaps this is the wrong place to ask such a question, but after reading m=
any
sites on the interwebs about the issue, i am left with the impression that =
most
people (me included) do not actually understand the implications introduced=
 by
turning on/off knobs like "acpi_enforce_resources=3Dlax". Also, i read a lo=
t,
mostly unclear, comments about "hardware damage" and therefore would like to
ask, what is actually the recommended way to go about this with the situati=
on
as it is now? Is this issue perhaps only relevant for manual fan control,
because with or without "acpi_enforce_resources=3Dlax" and the nct6775 kern=
el
module loaded, the system appears to adjust the fan speed for the appropria=
te
load either way and there aren't any noticable differences between CPU temps
either. So i guess my question basically boils down to this: Is there actua=
lly
something to worry about, apart from not beeing able to see/control fan spe=
eds?
I just have become a little worried now with all the contradictive informat=
ion
out there, also read (on phoronix) about this [1] and this [2] a few weeks =
ago.
This is a Asus X570 Gaming-E Board with a Ryzen 5950X CPU. As a regular use=
r,
am i going to fry my little computer by running Linux on it?

I understand that nobody will guarantee anything, of course, i just felt th=
is
might be a good place for a qualified answer, because, obviously, i don't
understand any of this low-level stuff.

Thanks a bunch.

[1] Linux 5.11 Drops AMD Zen Voltage/Current Reporting Over Lack Of
Documentation=20
https://www.phoronix.com/scan.php?page=3Dnews_item&px=3DLinux-5.11-Drops-k1=
0temp-V-C
[2] AMD Ryzen 5000 Temperature Monitoring Support Sent In For Linux 5.12
https://www.phoronix.com/scan.php?page=3Dnews_item&px=3DZen-3-Desktop-CPU-k=
10temp

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
