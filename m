Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8DF3C27C47
	for <platform-driver-x86@archiver.kernel.org>; Sat, 28 Oct 2023 00:13:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232648AbjJ1ANi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 27 Oct 2023 20:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235175AbjJ1ANg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 27 Oct 2023 20:13:36 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8434AD48
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Oct 2023 17:13:26 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E840AC433C9
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Oct 2023 00:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698452005;
        bh=Q+nfHCCaHBJ+9bMhQ+djdknb1dbX4T4toERcJS82FA8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gDLCUruv62EkmXViax7qkDjmBt0sX5IwdvtWrbeq8XkYR7DO958oDfY7EPvSVblqS
         iOBaAlzlNC3zum6DlgcBNWZNiW8+3ChI+aeBYyWuwugOVP1d7LjzDC+FKMKeXmLF7G
         iQwnxggkjgNjvRpcNRsyk+OLWq9i3heIf7P8+GzOGMyEUXvBBDsrNlWOrfv0E9U7f7
         SJcSUWnppaFpwYBPTjs2TOZ2GtGwFPRC9Dkxf9QR9L8oPUKBOgxKmQghI4x+sZ1YBq
         ke2VUoZquWUENkQPFlY5qVkPW/3sLWRyQwxxKWrEWr/0Heobt5iDoPeFAV5MBWcw3b
         SZbPR71bsbqGw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C910DC4332E; Sat, 28 Oct 2023 00:13:25 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218024] broken suspend to idle on Lenovo V15 G4 AMN (and
 related laptops)
Date:   Sat, 28 Oct 2023 00:13:25 +0000
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
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218024-215701-bmSqja1CDx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218024-215701@https.bugzilla.kernel.org/>
References: <bug-218024-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218024

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #14 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Merged as=20
https://github.com/torvalds/linux/commit/3bde7ec13c971445faade32172cb0b4370=
b841d9

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
