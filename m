Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD30C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Nov 2021 22:44:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C252060EBB
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Nov 2021 22:44:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbhKAWqn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Nov 2021 18:46:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:44508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229848AbhKAWqn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Nov 2021 18:46:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id F035760EFF
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Nov 2021 22:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635806649;
        bh=KBEgeETElB0qmN9VsiUV2KOtwhyNBhuST1RiH0pnPMQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=K6hXB67iYfeQDYowbTPoRa1gkyBkfPO71ZapQjRDY12kIW9Zvq9TVcwAD3XAx9BnW
         odw5WxZNYNyGaYT+bENCyB6Lq1ui7puMplzviJyW0j/OHoIHKfBIAY9DbC5i7wp6pZ
         4XGWM9PHIesktB9AgYtIeZvwdnJpVdwxMSjhrHoRdtcP9mYpdsGb3UPFCpdJmb1Zsn
         ZQ/P6DlBLudEIyP0AswEXZPXOQw5Dka0xZXmOJ9XMF6kfkRFOkheAg70V98bgnDNa2
         a7A0mS13zJFUIb+MkYhNrE09Fav2dMFuJq/DJhRJZvgo+o8hvmqjuASOsPfI/7jvD4
         manRTx7SkDT0A==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: platform backlight device not working
Date:   Mon, 01 Nov 2021 22:44:08 +0000
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
Message-ID: <bug-214899-215701-7mTzFcx2d3@https.bugzilla.kernel.org/>
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

--- Comment #8 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Note to self, find _DOS ACPI video method, see what setting bit 2 does (this
should disable automatic brightness adjustment by the EC).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
