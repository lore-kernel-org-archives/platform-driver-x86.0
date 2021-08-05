Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838EAC4338F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Aug 2021 08:40:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5400161100
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Aug 2021 08:40:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232888AbhHEIki (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Aug 2021 04:40:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:41048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232749AbhHEIki (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Aug 2021 04:40:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5177D610CD
        for <platform-driver-x86@vger.kernel.org>; Thu,  5 Aug 2021 08:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628152824;
        bh=fjDOAYkhq5xxxRsX4VXO8uHwwhU6nqIUA24cHY1ALIU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BoUEqu5laB0mBHsHM7dq+iZmpIjILoJ+/LheDT5xlLr4wSQawdAXvXxubDGJhZ6EK
         4eoRoEHT0QGhbWdO4Qewyu4cGinVxzi5+AwrV4EUU7FMrZrVDMQ/b34qjZEhdAYjTk
         3RUrLBfxkEjgN+f29Dm38ob8ln0Oe6AwbJ7ZSDHfjKi6pzRsCzakYvy3s/bgcgFavd
         +fyGPuQeczxZecqWxBbO0pC47Ilkb+8vuhKeAV/lDJz6lYJ46E0IuUYvwH0RFdhw7J
         pORfoE9xqHpTh5R+TuSHfLBQZbNW+zjg7BjScrPtvIc4ehLLKiPcZ1tYB7YkPatk9s
         YeY+xqCc+MKQQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213977] Unable to lock HW IRQ 44 :: TigerLake Proc :: Clevo
 NH58HPQ
Date:   Thu, 05 Aug 2021 08:40:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213977-215701-tIsawtced4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213977-215701@https.bugzilla.kernel.org/>
References: <bug-213977-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213977

--- Comment #4 from Andy Shevchenko (andy.shevchenko@gmail.com) ---


*** This bug has been marked as a duplicate of bug 213579 ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
