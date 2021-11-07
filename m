Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0512C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun,  7 Nov 2021 13:58:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76BC761186
	for <platform-driver-x86@archiver.kernel.org>; Sun,  7 Nov 2021 13:58:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233784AbhKGOBL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 7 Nov 2021 09:01:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:39086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229996AbhKGOBK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 7 Nov 2021 09:01:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 76A8C6152A
        for <platform-driver-x86@vger.kernel.org>; Sun,  7 Nov 2021 13:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636293507;
        bh=79jAO5YbaxKUqa6bSluKITdM2o6M9GyG/ocWxTlaE/g=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BT+yBDE16GPpdnwA6uLxtc7qo1+QpKgYdbtuYJ+HMlOz9eoOz0vRfZMjAtnwmHnOz
         lgelNDoJJFBoDbWZEd6gWH4t0fC5gBvJBe17xaVeuTR8greEiG9YhRPvWOzv0STGM9
         zfjwFV5kqQtDFndsSEXk9rSD1ay6suYfGT5sWDqtSLwjf7srvPUc6Oftl8EmsPWWlH
         y/M4NUNEOoLfAWZLtDmyoBzEfx2fAomTju3XVEbbV+NFWy4lnZ6bRo/ceZpDcAVmrb
         YiJXESiNukGCoSmG5MsZ5AoSCI7Nfubh73DkGjxnON+6dxL06JlVNqyn7VSJhwWxES
         uBIETaIiT9KfQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 07 Nov 2021 13:58:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: temp82@luukku.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-KW3JcEAQ52@https.bugzilla.kernel.org/>
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

--- Comment #160 from Jarkko Korpi (temp82@luukku.com) ---
if someone provides a patch for ROG STRIX Z390-F GAMING I am willing to giv=
e it
a try against up to date Linu's git tree.

where exactly I find this new patch from sudo make menuconfig?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
