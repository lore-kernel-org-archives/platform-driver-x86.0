Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63743C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Apr 2022 16:30:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240129AbiDYQd2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Apr 2022 12:33:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238415AbiDYQdW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Apr 2022 12:33:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A38571FA58
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 09:30:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5A85FB811FB
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 16:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16E07C385A7
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650904214;
        bh=BI7RYiVFeg4jPeh43G67XrggeknLFaZmPgTgd5mffIg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DnCuPXPJkz3gUXKur1ikO7VPAKwpyeKNoTd7PmnAShlmZmAceQvlXllpmKHjIyP4/
         Ueu7Okh/XUaTzxVrgZ693frFjGLHIpGhNen+E5ekO/UUUqqtk/ufy09Ia2iCi5nl68
         pKEs3QTo/54QBra5p2WEREQ6KKlM+tMEPnvD4MAP16UQDMp2iQjhJt7vj141SDpMp6
         npCJ8S0LrEH21SGyiv4HlhMQqAnm4ijCxCaQBoUnZJASX8Y9AYBiSwiXG6wErcdf6u
         3j++Rie5Lb/5LffVHR9Iw8wMJr94a+D9KL6Q0aNYgpWbNYA+wQwAOaHmEqyNaG0v1e
         N1HbMdLIXGy6Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E91C9C05FCE; Mon, 25 Apr 2022 16:30:13 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Mon, 25 Apr 2022 16:30:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214899-215701-iWgVTvxy5L@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214899-215701@https.bugzilla.kernel.org/>
References: <bug-214899-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

--- Comment #22 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Sorry for the slow reply (note I'm afraid my next reply will likely also be=
 a
bit slow).

Good find on the methods, so this means that the key-press events are suppo=
sed
to come from the "Video Bus" device and as you point out for some reason th=
is
is not happening. I guess that the drivers/acpi/acpi_video.c is not making =
some
call to enable the events which your laptop requires; or it is making a call
which it should not make which disables the events...

One thing which I just noticed is that when passing acpi_backlight=3Dvideo =
you
get 2 acpi_video# backlight devices. Given that AFAICT your laptop has only=
 a
single GPU,  may be an indication of a problem.

I wonder what happens when you pass:

video.only_lcd=3D1 acpi_backlight=3Dvideo

on the kernel cmdline, I would expect there to only be 1 acpi_video# backli=
ght
device under /sys/class/backlight then ?    And maybe this also fixes the
brightness keys?

I assume that without any "acpi_backlight=3Dxxx" on the kernel cmdline you =
only
get the intel_backlight device, right? You could also check to see if adding
just "video.only_lcd=3D1" to the kernel cmdline helps.

If that does not help, you may want to play with the acpi_video_bus_DOS() c=
all
from=20
drivers/acpi/acpi_video.c .

This gets called from the acpi_video_bus_start_devices() function:

static int acpi_video_bus_start_devices(struct acpi_video_bus *video)
{
        return acpi_video_bus_DOS(video, 0,
                                  acpi_osi_is_win8() ? 1 : 0);
}

You may want to modify this trying the following:

        return acpi_video_bus_DOS(video, 3,
                                  acpi_osi_is_win8() ? 1 : 0);

Looking at your acpidump it seems the second parameter is ignored, so chang=
ing
that will likely not matter.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
