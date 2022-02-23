Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F31C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Feb 2022 20:30:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241283AbiBWUbO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Feb 2022 15:31:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240361AbiBWUbN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Feb 2022 15:31:13 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F6114D9D0
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Feb 2022 12:30:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1506D6184B
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Feb 2022 20:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45BECC36B05
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Feb 2022 20:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645648244;
        bh=vv2nCSRwbfiwnPQEPdw5UIJ4xVaK7WKqTSyymhFwbNo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YpEuBGkBt0w7gqRwDoPQj4FpNXKoRvnVyWYyn4Lbw1FH0s5/02Y8xWkxwmeSt0vH9
         oUjiutweFIsHGrz9qPctEvObRW33RBHAjKEVj+RYk1gTxVuIcmu2ovFPo5K1cnFW+H
         k4zY8AUNxr0FBXhhtrdOlhIIXx9SSVHjt+H+5nn+welJ6LXAmvX+DQbRWdTnT5tM0E
         IKoKV9U5DVmARXKZs98Mfc533ekGtPXy4+UeCzUKJQTnV9e8u6T1sKTPEeBdzATkwx
         bS9Vxom3cEdOdDkhOA0tTI6ryyNVopSPPSnlD8YHnBx7HZcSUK0vckG72AwV8IUzhl
         Dq7/5RBw+SwoQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 00546CC13B6; Wed, 23 Feb 2022 20:30:43 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Wed, 23 Feb 2022 20:30:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-199715-215701-TWKYNdR2nj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-199715-215701@https.bugzilla.kernel.org/>
References: <bug-199715-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D199715

--- Comment #67 from Alex Deucher (alexdeucher@gmail.com) ---
Support for newer platforms was added last year:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D0aad9c95eb9a2b086322e28ae2e58ad25598604e

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
