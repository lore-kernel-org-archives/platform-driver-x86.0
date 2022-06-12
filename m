Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94EA4C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 12 Jun 2022 15:32:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233382AbiFLPce (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 12 Jun 2022 11:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236454AbiFLPce (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 12 Jun 2022 11:32:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C38F0BED
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Jun 2022 08:32:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EBC7360F95
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Jun 2022 15:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A80AC3411C
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Jun 2022 15:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655047945;
        bh=LEQ36o8NtDhGgSE5dU++zAF8jtlj8XpjqCryAAII/+o=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=J46Ksb9D6MSeUOSXqvNiBfvSI+76e2gSUE4bqAfGpBxUm4u+ffjHtX+y27RphDIAJ
         biMF0Pve2XACKmPKxIOqWIbt6ZYBfMqeFEbC/lQbPUlSrmL9LgwC3+7QMbVRn1w2lq
         GS56zYPuZ0gzsZY/E8OS56wkcktC43C4EzvBevWdzRM5LHfzPXYsjQlnRFGbvCRHGw
         aJYOT8jqPDNXXNCXjdfVSxYV8UPpVgm85xvR2wy2OTeEVksWBeD2vm6j66vAoIO/x/
         2Zz6njGhATn1VKw4ck0mxotvJ2QjYhKDQ0tIEqIgCnIK9AL8MG//OPJBTRgmWQq7IU
         A24mw7WX1Vkbw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2B57FC05FD5; Sun, 12 Jun 2022 15:32:25 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Sun, 12 Jun 2022 15:32:24 +0000
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
Message-ID: <bug-214899-215701-szdpOmYaVf@https.bugzilla.kernel.org/>
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

--- Comment #30 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
If it turns out that the issue is that for some reason the "Local0 =3D 0x06=
" part
of:

                    If ((OSYS =3D=3D 0x07DF))
                    {
                        Local0 =3D 0x06
                    }

Does not execute then this is similar to:
https://bugzilla.redhat.com/show_bug.cgi?id=3D1842039

Which is also caused by an OSYS check for some reason not working. Note OSYS
gets set to 0x07DF this bit of DSDT code:

                If (_OSI ("Windows 2015"))
                {
                    OSYS =3D 0x07DF
                }

Which should run early on, but on the 1842039 this for some reason is not
working.

For some more background info, Linux will answer true for _OSI ("Windows 20=
15")
which is asking the OS if it is "Windows 10", or IOW if it can handle modern
ACPI features, which Linux can.

So assuming that this is the cause of 0xA3 is not being set to 0x86 (*), th=
en
getting to the bottom of this is definitely interesting.

*) Note I'm not even sure that the OSTY reference to address 0xFE0B04A3 is =
the
A3 we are looking for ...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
