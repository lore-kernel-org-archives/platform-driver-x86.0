Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F10EAC432BE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 12:44:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D63A260F9E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 12:44:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236130AbhG1MoC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Jul 2021 08:44:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:44768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236108AbhG1MoB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Jul 2021 08:44:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 938BC60F9E
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jul 2021 12:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627476239;
        bh=rX5YXzv7OSVXbEuaNtXV52+WtKo0OPJuU/0R3PnHg5Y=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=o6iEQm5QvBEBrGzhc6yXorj+j/aJRxl5p8Xr3kvhXyDk1KtcHjVSHgapg6rwcGOUK
         c64fahgH+abWjqTlDh86OSgmyKZ9kNKd8NHwKacH8v0YUECPVEaS1rk6mXNjj23Jts
         EYZu8/TiR8UNhJdhhMfuMT4XqmoRB5bM9+WsBqhGTciRUcHVXM99IRl3pHxvbZD3VO
         y0zUihjkdn3PTrf1VVl8ys0HRIa9DsSHyuWEElxG2Vp4vp/w7cXeoh9BjIydFodO1a
         +F2wPh5RT0Yxxxrxljw3iOHtLxTBhKmxmsSkyaNvYZk/fnCAluz+Odsm3hzuY0XUiR
         LZi91YnGyoz1Q==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 209011] asus-wmi always reports tablet mode on a ZenBook
 UX390UAK
Date:   Wed, 28 Jul 2021 12:43:59 +0000
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
Message-ID: <bug-209011-215701-NbIUAGwlWA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209011-215701@https.bugzilla.kernel.org/>
References: <bug-209011-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D209011

--- Comment #11 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Thank you for the logs. I think I know what is going on here.

2 more questions:

1) Did you do "fold the device into tablet-mode and back to laptop-mode onc=
e"
before collecting the dmesg.txt ?

2) Can you run "grep . /sys/class/dmi/id/* 2> /dev/null" and copy and paste=
 the
output here ?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
