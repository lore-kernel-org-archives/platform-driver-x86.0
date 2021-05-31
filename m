Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB48AC47080
	for <platform-driver-x86@archiver.kernel.org>; Mon, 31 May 2021 15:01:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF94960FE8
	for <platform-driver-x86@archiver.kernel.org>; Mon, 31 May 2021 15:01:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232408AbhEaPDY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 31 May 2021 11:03:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:51252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233906AbhEaPAg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 May 2021 11:00:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B04216135A
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 May 2021 14:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622471202;
        bh=U3yDopgIw2tO64kLTesXIO1gwXn9lxY7MY5Eraru/sE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=CsCNsbtHVbgTW2GupUQWSb5U9ydgH8rOlN9pZp/51QQ27UqMzE+5RBkxHkAOuFcMV
         ZlfgcmYIH69HXCJc+XeZg11nf70T4q+E19Tsse8E3+T6lZT3yCfUWyCjpv7oVnlU0G
         xNT2rJrcoIKcXwEFB/tMbgdLPt5eNE4W8w19D96ZzcwGq2jJ3jn9FU/A946V1V5WhE
         frQXOLTyduNr31TJNkSEkN7hAtyrB2zRRkKzIME20RpoGVf1yQNbMBlO+tZPn4EeiZ
         xMP7j+Y10Q/gIDJxhARjQb2A9t9962GB9YksoZ8t4MUxppZExYKOCXRNPUHaS8sRI+
         LIWnQZtLg+cLw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213297] ideapad-laptop: DYTC interface not found, several
 functionalities missing
Date:   Mon, 31 May 2021 14:26:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pobrn@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213297-215701-Bpj0YQGdXD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213297-215701@https.bugzilla.kernel.org/>
References: <bug-213297-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213297

Barnab=C3=A1s P=C5=91cze (pobrn@protonmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pobrn@protonmail.com

--- Comment #3 from Barnab=C3=A1s P=C5=91cze (pobrn@protonmail.com) ---
As for /sys/firmware/acpi/platform_profile, the issue is very possible the =
same
as https://bugzilla.kernel.org/show_bug.cgi?id=3D212985 , that is, the driv=
er
only supports DYTC 5 and above, but it seems from the DSDT that version 4 is
available on that machine.

As for the keyboard backlight, it's not available because the driver only
supports and older version of the keyboard backlight control interface which
does not seem to be available.

As for "LUK2019" and "IDEA2004", those devices don't seem to be that
interesting (I might be wrong though) at first glance since they seem to
contain more or less nothing as far as I can see:

            Device (HKDV)
            {
                Name (_HID, "LHK2019")  // _HID: Hardware ID
                Name (_UID, Zero)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }
            }

            ...

            Scope (^^EC0)
            {
                Device (ITSD)
                {
                    Name (_HID, "IDEA2004")  // _HID: Hardware ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }
                }
            }

As for the, I assume, screen backlight and Fn keys, unfortunately I cannot
help.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
