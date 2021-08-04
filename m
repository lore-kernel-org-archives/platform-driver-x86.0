Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6103FC4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Aug 2021 21:21:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34B77603E9
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Aug 2021 21:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbhHDVVR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 Aug 2021 17:21:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:44310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229778AbhHDVVR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Aug 2021 17:21:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0A2E0603E9
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 Aug 2021 21:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628112064;
        bh=vJzrnZYMZbQSFaf7tGMaXU8RCp4XjfvhLqSHaaTTPA4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=SOIsny0hBKrie62+N9qjTIMJvtrYsAP586X1CqCP/h96X347P4/t6HzNBQ9P89t0F
         Lf8W6Jxn/SZvINxg/gI0PK/zM/tLvgwlOgBXmNoh7YXKdvJNYtP+BVGu+ebLBMfQiz
         VQ9+MM8NCdOnZ06lfGBO8Q4R2tUK5YMUqIGxQP0zaHq/B3uhQJvWDnU3FofDO9HbpL
         R8xTjY5f85fp7VJ1roHiHBEvU7VejTe+/c7hGU5s17AXM5/bobKxAte1FbU4c2+buE
         4ISQ01b6juTEe5ee6q88NGrl9Y9SOAjh/cpAN80bLPwOGcjl4M33ifB90vnH7VnRc9
         0b6dEIV+9+elg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213977] Unable to lock HW IRQ 44 :: TigerLake Proc :: Clevo
 NH58HPQ
Date:   Wed, 04 Aug 2021 21:21:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: death420.x@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213977-215701-jQUm35idDp@https.bugzilla.kernel.org/>
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

--- Comment #2 from Ben Long (death420.x@gmail.com) ---
The patch posted in the referenced report actually does work.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
