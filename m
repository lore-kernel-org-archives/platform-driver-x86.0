Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F5DC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Nov 2021 19:36:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E91760187
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Nov 2021 19:36:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbhKATii (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Nov 2021 15:38:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:38230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231186AbhKATib (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Nov 2021 15:38:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E2F6460187
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Nov 2021 19:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635795356;
        bh=pGmMH7XDoCPaOLkJdqIqiz33b95UH3OaIJxOXm39sFo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fpNqy3a63xAPbHFUQOhKoRcdK3wxmGELBJUel54ktyU2uFkvgM/lVZ4nqv/ww/0H8
         gd5cKOd1q3JZOgHNMiLjZqZp8fAXMSIKT3fPfYQlkgkqY3tW4dpdP41+xD06nfrITA
         cyFM9NCqLaeFP+ZzH2E0b9PPVTmHGWZ4vfSH7+B0MjFhtvi8zYVb3JxlhaMv61F3X6
         UlAVl+2kFkW9M92G757Qrbu5sWZkCfgeiZKVTXBGVTgXaZFGhhquVtmddgk77+0xdy
         k3gdfN953nn6WtfX47armhvLk15VRAio5aB6DNE3/JHgR2wVpxJDncyU3ocGnxk93R
         +WNSxFozoGN8w==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: platform backlight device not working
Date:   Mon, 01 Nov 2021 19:35:56 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214899-215701-iafppdV7Kj@https.bugzilla.kernel.org/>
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

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g

--- Comment #2 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
What is your kernel commandline?  According to your attached dmesg it is em=
pty,
but that seems unlikely... ?

The ideapad-laptop code has this:

        if (acpi_video_get_backlight_type() =3D=3D acpi_backlight_vendor) {
                err =3D ideapad_backlight_init(priv);
                if (err && err !=3D -ENODEV)
                        goto backlight_failed;
        }

And acpi_video_get_backlight_type() is:

enum acpi_backlight_type acpi_video_get_backlight_type(void)
{
...
        if (acpi_backlight_cmdline !=3D acpi_backlight_undef)
                return acpi_backlight_cmdline;

        if (acpi_backlight_dmi !=3D acpi_backlight_undef)
                return acpi_backlight_dmi;

        if (!(video_caps & ACPI_VIDEO_BACKLIGHT))
                return acpi_backlight_vendor;

        if (acpi_osi_is_win8() && backlight_device_get_by_type(BACKLIGHT_RA=
W))
                return acpi_backlight_native;

        return acpi_backlight_video;
}

So the only way that the ideapad backlight can get registered is if:

1. You have acpi_backlight=3Dvendor on your kernel cmdline
2. There is a DMI quirk setting for your model in the kernel which there is
not.
3. Your ACPI tables do not implement the ACPI_VIDEO_BACKLIGHT interface, but
your dmesg says:

[    2.237329] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no=20
post: no)

So this is unlikely, it is still possible though that your DSDT implements =
the
ACPI video interface but not the backlight part (that would be a first). I
cannot tell since the ACPI video interface is not in the DSDT, it is likely
defined in one of the SSDT tables. Please attach a full acpidump.

Can you try specifying: "acpi_backlight=3Dvideo" on the kernel commandline =
and
then do:

ls /sys/class/backlight

And copy and paste the output here. This cmdline option not only helps me d=
ebug
this, but it should also workaround your backlight issue :)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
