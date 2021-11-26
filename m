Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D67C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 26 Nov 2021 18:48:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240326AbhKZSvy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 26 Nov 2021 13:51:54 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:57602 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239008AbhKZSty (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Nov 2021 13:49:54 -0500
X-Greylist: delayed 453 seconds by postgrey-1.27 at vger.kernel.org; Fri, 26 Nov 2021 13:49:54 EST
Received: from mail.kernel.org (unknown [198.145.29.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id ECB54CE20FF
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Nov 2021 18:39:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8535560385
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Nov 2021 18:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637951946;
        bh=Mme+hZQlPkFhVzT+Fuuol2samI7VT0tRinNetBQhBnA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VO7FsXfxWqVMWOQ+bl8dAMMOoQOKSUCWsBqrfom5+c2DxhMVfzoMrCgrNdsxQGQpz
         QvzyjCb1X5Q6DgMulptZ9+jtg4zxujnNntW5iwTnagQWv0oowgN/FtICMe9mIu2pFx
         4gp175BrCYQedngDA51en7FQDKqkkrqvX3akV+hla0BBLRyt3JYTmxKgqnyUgS3HNo
         9fmgxuqLfG6yejN9eO4Brdfeco5LGgzTPZiNCY9+nSsFU0NWXdzZpJwlrX3bRtKaV+
         SCHe2X+Lg5eNeVFwOmE74yWFrOyZdlMMUYeqwwKi78qTA2euHTWowBBpdWbrvs2q5i
         VdQrqX5Dz962g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 7F6EB61001; Fri, 26 Nov 2021 18:39:06 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 201885] acpi PNP0C14:02: duplicate WMI GUID
 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:01)
Date:   Fri, 26 Nov 2021 18:39:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hxss@ya.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201885-215701-3jpphwHBT8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201885-215701@https.bugzilla.kernel.org/>
References: <bug-201885-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D201885

Sergey S (hxss@ya.ru) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hxss@ya.ru

--- Comment #14 from Sergey S (hxss@ya.ru) ---
```
acpi PNP0C14:01: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (f=
irst
instance was on PNP0C14:00)
```


 OS: Arch Linux=20
 Kernel: x86_64 Linux 5.15.2-arch1-1
 CPU: AMD Ryzen 7 5800U with Radeon Graphics @ 16x 1.9GHz
 GPU: AMD RENOIR (DRM 3.42.0, 5.15.2-arch1-1, LLVM 13.0.0)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
