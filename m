Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631E5C433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 Jan 2022 11:07:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbiADLHz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 4 Jan 2022 06:07:55 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:57038 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiADLHy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Jan 2022 06:07:54 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9DC18B8119E
        for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jan 2022 11:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56A39C36AEB
        for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jan 2022 11:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641294472;
        bh=52z35gj833nN68hEh9GicEUmuZchb8O894qOKAg+Iaw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MOLYZg7AbgyEnLFC6DUm53SBUrgsUsb0IpAJWUQld+7LhRTbID+2ZKhRAIrOPHO+h
         FxaXggzZKwg20hdw7dSIoqjR/mRuJtOUHZjagjpODW5+eX1BBsoClmg6lMMPdn9GUI
         ONVxoXCVMY3wHqythJFeGY/iS4vUpWWiEgVgk5hEne0twF98sne6u7fUtsx5Hyj3r/
         dpiJe0Y1jZr4NIWz0WgJt9uSQMp5cBmABDdhzSHIDlBz0IKAbuZBD0dWEB+xpmoI7n
         JbqRwYKIUlc5MNBV5wk0RaOsoloGDaJWsG2Cyt89zvE1OeT21Ca6iNacIBQwj0pb3v
         42wf/LPksAFAA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 36878C05FDA; Tue,  4 Jan 2022 11:07:52 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 192831] acer_wmi spamming logs with iio-sensor-prox Could not
 open input accel Operation not permitted
Date:   Tue, 04 Jan 2022 11:07:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INSUFFICIENT_DATA
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-192831-215701-CrheCiliwk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-192831-215701@https.bugzilla.kernel.org/>
References: <bug-192831-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D192831

Andy Shevchenko (andy.shevchenko@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INSUFFICIENT_DATA

--- Comment #2 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
The bug is against v4.10, now we are almost at v5.16. Please, retest with t=
he
latest kernel and fell free to reopen if the bug is still reproducible.

Note v4.10 is LTS, so if the bug is still there in the latest stable versio=
n of
it, but there is no such bug in the latest vanilla, try to bisect the fix
commit and then you may require to backport it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
