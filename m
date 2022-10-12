Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301A9C433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 Oct 2022 17:53:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbiJLRxn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Oct 2022 13:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbiJLRxi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Oct 2022 13:53:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9224E8F950
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Oct 2022 10:53:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2E8536159F
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Oct 2022 17:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81CD4C433C1
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Oct 2022 17:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665597216;
        bh=Sz9o2+/y0it6dF3nFOdDjLhZmJfGaBOEKvA6lCT7KRE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bJdTVgMp+SLro+iOC/49ml79cMABGIlhsKodA3Ntu3d75kooav/D+u5cAape8BJct
         uUQUKoPA7Dm7rmAVy6gij6whifkfWv3xRFf9pmYBnUayF5exVXs+SOI0yNr77PaJmc
         mex+WnnYc1440CufY9NXuMnrt+Tm/hPNtuwaAcbO8BbgiSD6rWsRtfom1ewy7sOfQp
         2p0pNYMVWtAyjQnGwCA9p+4uYUNRqJ2/FRC6G9j02BgqO8BxwsefYEJ2uFzfOtFQs5
         krPrcsmbe0LL1ZvyFZqItsmO3Ol0VUCdOtVKGVZj0MiKbPw2KLowuxy/971kesxaG4
         E1BFWcgiuiE3Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5DD44C433E4; Wed, 12 Oct 2022 17:53:36 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date:   Wed, 12 Oct 2022 17:53:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DOCUMENTED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216516-215701-LZ7KrvhRxY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216516-215701@https.bugzilla.kernel.org/>
References: <bug-216516-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216516

--- Comment #35 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
I'm admittedly unfamiliar with "s2both", but this sounds like its own bug
report.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
