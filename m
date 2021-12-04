Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97BF4C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Dec 2021 16:13:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355163AbhLDQQZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Dec 2021 11:16:25 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:51970 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242107AbhLDQQZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Dec 2021 11:16:25 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 6DA2DCE0E02
        for <platform-driver-x86@vger.kernel.org>; Sat,  4 Dec 2021 16:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99EBDC341CB
        for <platform-driver-x86@vger.kernel.org>; Sat,  4 Dec 2021 16:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638634376;
        bh=p2qOMJMSAHinxiy0o7gHSvFsNoKmCcJN/bYWl4q1MX4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=tUUveythVeZaO+4th4Sp05kjLAfFVI0YLgECdC/oxYuXSr1VGreIO2zzPJ+yoDfHW
         vYyR6pRmKppEUreRp3pOUTgnPwBGEGIXB88bhroigkoIrYEEm9QJNPj+TplK9GBf5A
         pypfAeuBfYzP6LEr0SvKu/1Rlx3GGqh7zOSTSnwy/kuZCO7+NxNuaccTn/YSlzXXjv
         ChYbDoxNBwDIHbeZKAlrvpMyhKGBcNSJw/QdwlLZ8WHoO0yETk/vgjWOD8FDb9F3kA
         SwZjRcr+ulzwYBHMuXfQAYv4T34ewgMEGXNRhwCMsp9r197n2rqoiu3B0OApVoDE5T
         S73potn6X40bQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 8D09D61005; Sat,  4 Dec 2021 16:12:56 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Sat, 04 Dec 2021 16:12:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: n-fit@live.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-199715-215701-5ncYEOvrWx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-199715-215701@https.bugzilla.kernel.org/>
References: <bug-199715-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D199715

Nikos Fytilis (n-fit@live.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |n-fit@live.com

--- Comment #64 from Nikos Fytilis (n-fit@live.com) ---
Hi, i stumbled across this report through the dkms sfh github issues.

I have a flex 5 with a 4500U and have not installed the dkms module. I am
getting in_accel_[xyz]_raw in the sysfs directory of the iio device and they
work (i can move the laptop and they change consistantly)

however the buffer0/* files do not change at all. is this the same issue wi=
th
all of you?

if so, a userland solution could be very easy - basically a edited iio proxy
capable of using the raw values.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
