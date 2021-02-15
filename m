Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B48CC433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Feb 2021 11:49:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4673E64DE0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Feb 2021 11:49:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbhBOLtf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 15 Feb 2021 06:49:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:58310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230097AbhBOLtZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Feb 2021 06:49:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id DDF8564DE0
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Feb 2021 11:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613389724;
        bh=19g8AlxcS4o+b0tU4fiv121J64Rrn5wv685d1d11Ucg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NIDP1hqFlRS0AAa2+yBK/dr1rBKKkw/M6gw3XbfpfjmH7sS43Wb5Smed6pRgIZdab
         056+GakGM1q9LU7geNCweVtOgqMiws59Yj3wsax1M5Prdy4sVutE34P6P2U/FjLEzp
         1iRwr80SMVr2tsttVBtG6C4RJwC36k5GPsRrlbRYO36j0McQmp0qFC5ln1GmfpuT3U
         3e5cqsrJ5Tigm/AgQWGKyf4fR21xXyZ5WSaL2T/9SN06NoRQRVz/eNcoFDH8K5Pfkx
         MFr00X2naDaRUqR6hM1TgQ7VSKwD4zatEkln/Hh8yjkf1caDhGGZMcCHU3TS0nUujp
         exqm/SpkZkz6Q==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 207433] intel-hid: add support for SW_TABLET_MODE
Date:   Mon, 15 Feb 2021 11:48:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-207433-215701-1MODDoyyMV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207433-215701@https.bugzilla.kernel.org/>
References: <bug-207433-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D207433

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g
         Resolution|---                         |CODE_FIX

--- Comment #26 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Elia's patches for this are available in the just released 5.12 kernel, so =
this
bug can be closed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
