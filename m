Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0EC0C43334
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Jun 2022 19:14:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357627AbiFNTOn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Jun 2022 15:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231270AbiFNTOm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Jun 2022 15:14:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48F2A11C0F
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jun 2022 12:14:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0888BB81A3D
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jun 2022 19:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0731C385A9
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jun 2022 19:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655234079;
        bh=ywzs4q0recv70uCeYwxuy0DOx+XESSUZ3GbCUqZjp6w=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ql+BYtGtEt/7EY5a2CbTwjvjIXvfv7xWYQzHXWWkMXpmq0xiINEmSBIsLIpcpSGEs
         LeNOci6EUOPX3Qz1YgRleoKbZ55dElbakVZNTT90nXOpe9+T1oK0x7ZCs6QegP8BDG
         sjoTxacmY7u6M7s5xu59fGEr3AZHvQDoG8l1x9yqmMCghBIDEWUKdHj4DXRaoCbHda
         gNNH5wt73oGX3/mhsW04qRh43rz9RTBXgCuSlQLiPv75fQ01rLqO7GZ9o3nmu4Yc9m
         xOu9BuKmkMBWtUhguI2dUHdB3IFxzMGG1iHRQ2XXfsiIdkqUzk4hJTUPqzAGiBP7zc
         f+FOLYJAYQVBQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 86431C05FD5; Tue, 14 Jun 2022 19:14:39 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Tue, 14 Jun 2022 19:14:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johannes.penssel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214899-215701-OO9E2Ub9x1@https.bugzilla.kernel.org/>
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

--- Comment #37 from Johannes Pen=C3=9Fel (johannes.penssel@gmail.com) ---
Works like a charm! Kernel log looks normal as well.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
