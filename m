Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC1ACC46467
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Jan 2023 21:37:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232768AbjAKVh0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 Jan 2023 16:37:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235644AbjAKVhV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Jan 2023 16:37:21 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DFA110570
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jan 2023 13:37:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AB49061ED4
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jan 2023 21:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13970C433F0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jan 2023 21:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673473039;
        bh=dTocmdqdcKzNLkSalvd/asZtyeKTXoDAg47SGSmRqnU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=srg9Xwh7EEJeu0f9Ri2l1UvTUMoTzrR14/Zo4WDocCi8cSRKeOshwX54xBeaLPNnO
         kVBV5EKgGNN9iLTGBEc2f6Tpnc1Rsxy8iLqCbwAjYLxbpNSZT/c9gdoPtE4tXUgq4x
         0Xu3ujMxELRkPPuDUVO73wlUT9VIMTVzgpWyR45+iSKR90mCE3bjxZ2WUevVts3DX3
         q4JKDjfMj98uTkCSQbGI2UCNg9DOr3XkmEXNkd/xt3Mxjn4HopAnCTNp5euo/84Lcs
         2rPX96jOlK/bAmDrvqiTHwN/nH2gDyNOVs/exqWfDU3zelbJwaUzgqpaCUo5SNJzba
         w2l5sBxxJurig==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 03DB8C43143; Wed, 11 Jan 2023 21:37:19 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216917] hibernation regression since 6.0.18 (Ryzen-5650U incl.
 Radeon GPU)
Date:   Wed, 11 Jan 2023 21:37:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status component assigned_to
Message-ID: <bug-216917-215701-UvfONMZpVQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216917-215701@https.bugzilla.kernel.org/>
References: <bug-216917-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216917

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
          Component|Platform_x86                |Video(DRI - non Intel)
           Assignee|drivers_platform_x86@kernel |drivers_video-dri@kernel-bu
                   |-bugs.osdl.org              |gs.osdl.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
