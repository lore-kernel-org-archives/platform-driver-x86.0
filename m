Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34ECEC4708F
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Jun 2021 19:00:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C920613BC
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Jun 2021 19:00:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234678AbhFATCD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Jun 2021 15:02:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:46480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234716AbhFATCA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Jun 2021 15:02:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id ACC12613C5
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Jun 2021 19:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622574018;
        bh=TBygYJDsR05EIpPrWZfjiynDRMBp/UxYXFq+iLtzvn8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MDETaezb7T84+aplW7HOdHxGIDflSj/Xu0SSOzen9+VZteU/UJWMy+5SUaSPzmHTr
         4yUEGeOWyyu7B46FNER0T2thP7iAKflNNiczIWITwSzDzwyN0eF4onl/FcqTxJieVE
         znBVqJ+a+nJrTDCO2B8fGt14vKhruIlfKkz9x56/FHBH5Mw1x7aIvC6gSoyuPeZbBo
         cjz3rlBUktLbAyepsNljM7lzA5bglw8TXg8gFPaMxR5pfsIgCqGwpKq7RDfuyfasvl
         JoBmj02jyJFK6WDAKmfJoSOE3L0uJnR68eveXHAucBHSbtaWU6xBnCs1l1ONjn8r0a
         2E999Lnn4GqDQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213297] ideapad-laptop: DYTC interface not found, several
 functionalities missing
Date:   Tue, 01 Jun 2021 19:00:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johannes.penssel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213297-215701-EeAj7jy3AU@https.bugzilla.kernel.org/>
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

--- Comment #4 from Johannes P (johannes.penssel@gmail.com) ---
(In reply to Barnab=C3=A1s P=C5=91cze from comment #3)
> As for /sys/firmware/acpi/platform_profile, the issue is very possible the
> same as https://bugzilla.kernel.org/show_bug.cgi?id=3D212985 , that is, t=
he
> driver only supports DYTC 5 and above, but it seems from the DSDT that
> version 4 is available on that machine.
>=20
> As for the keyboard backlight, it's not available because the driver only
> supports and older version of the keyboard backlight control interface wh=
ich
> does not seem to be available.
>=20
> As for "LUK2019" and "IDEA2004", those devices don't seem to be that
> interesting (I might be wrong though) at first glance since they seem to
> contain more or less nothing as far as I can see:
>=20
>             Device (HKDV)
>             {
>                 Name (_HID, "LHK2019")  // _HID: Hardware ID
>                 Name (_UID, Zero)  // _UID: Unique ID
>                 Method (_STA, 0, NotSerialized)  // _STA: Status
>                 {
>                     Return (0x0F)
>                 }
>             }
>=20
>             ...
>=20
>             Scope (^^EC0)
>             {
>                 Device (ITSD)
>                 {
>                     Name (_HID, "IDEA2004")  // _HID: Hardware ID
>                     Method (_STA, 0, NotSerialized)  // _STA: Status
>                     {
>                         Return (0x0F)
>                     }
>                 }
>             }
>=20
> As for the, I assume, screen backlight and Fn keys, unfortunately I cannot
> help.

Thank you for your help! I thought mentioning LHK2019 and IDEA2004 might be
relevant as both platforms load Lenovo-specific drivers in Windows 10, thus=
 I
assumed that they are supposed to do the same in Linux.=20
May I ask how you were able to determine the DYTC version on my machine? I =
have
been unsuccessfully trying to figure it out myself for the last few days.
Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
