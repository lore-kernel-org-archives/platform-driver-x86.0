Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA25C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Nov 2021 14:36:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72D9A61186
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Nov 2021 14:36:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233117AbhKEOiz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 5 Nov 2021 10:38:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:48970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232865AbhKEOiy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Nov 2021 10:38:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 426D261355
        for <platform-driver-x86@vger.kernel.org>; Fri,  5 Nov 2021 14:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636122974;
        bh=koZqodasZwYQRaWmgbhztBc0HTJmL1stezisy59ljWU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gE9SVFtp525lDkdi6oIKbG5aSdvbOWDhJVXqTfckbcKQgh47Qh20s3+DmpCCz/C3V
         ZGRjjXi67P9R8dwON0Qq/zVAw29/B2PHu6kQKJGMgxUfoyAc6LCPQY5nDH+Orc1zQY
         HhEDR8Q/0fZdtKU+yDEiizmxBQ01IxDjn6Yd2FR915HaJ61IvlhVAIsQ0EKCimXIM6
         9V0ENVaShnx4C2W7vETzED32onPBiiwKO/kHbetIvPwKCxhb3CBioQsfknnuRl9lTL
         /p8o8+rjC3lTxSKGzaBXCywb8XqQW8FMJUUovQ3kAEN0ZJLirHcpO/bEL/1XEWgeG5
         3oTK1L0NRTFuQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 05 Nov 2021 14:36:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: eugene.shalygin@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-PrPAzD9k33@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #156 from Eugene Shalygin (eugene.shalygin@gmail.com) ---
(In reply to Andy Shevchenko from comment #155)

I use acpi_acquire_mutex()/acpi_release_mutex() for the ASUS EC sensors dri=
ver
(https://github.com/zeule/asus-ec-sensors/blob/master/asus-ec-sensors.c#L41=
7),
but there seem to be no other users of these function inside the kernel sou=
rces
(checked 5.15.0)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
