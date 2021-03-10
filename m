Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0AD0C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Mar 2021 19:31:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55B1364EF6
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Mar 2021 19:31:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232944AbhCJTbM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 10 Mar 2021 14:31:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:48758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229939AbhCJTbE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 Mar 2021 14:31:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id EF14564EF6
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Mar 2021 19:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615404664;
        bh=GDqJlIUcqr6dv8aWkjHdek8J/JUPTytx511z15Hp3kk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dtQKvzNL4AFKFrGieNm7kMYW1lArSIPbdVre2Fdkg1TccbZhlh5cBd8zGMGTc23sR
         aOwa9I+86njm2WaspH33n5EaR8CE+tQYTp3eqNSlEXnG8PLxZZksz4hrrLIzg1dhcJ
         j+HTFuhSDL6Sb1xgyexz/X3SUdSl33+QF+Xw2vfUC02xxg6/Psn1Nopc0zqPHERex7
         Anu84H2f0Gu/NG5oMkak+yABoIsErl9BttQrASTSbNf2WIQTYlC4lL9AJXDjvkPYCq
         XZROnhk8QqlNOXb1mfdkoxcnUg7sjgnBUFVWkhMZDcvOzKAGNmC34xZeRA5//pz381
         OSSLq4QGT9cqw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 210457] Fan sporadically maxed on wake-up due to unavailable
 sensor temperature
Date:   Wed, 10 Mar 2021 19:31:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: reescf@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210457-215701-KTHTMxVcEv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210457-215701@https.bugzilla.kernel.org/>
References: <bug-210457-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210457

--- Comment #2 from cfr (reescf@gmail.com) ---
I should have looked at the date of this report. The problem I'm seeing is =
new.
I installed a new kernel this week and the problem started then.

ArchLinux kernel package version is 5.11.4-arch1-1. I did NOT see this bug =
with
5.10.16.arch1-1.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
