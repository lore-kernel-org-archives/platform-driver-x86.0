Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1509C43334
	for <platform-driver-x86@archiver.kernel.org>; Thu,  7 Jul 2022 19:44:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235908AbiGGTo6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 7 Jul 2022 15:44:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232284AbiGGTo6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Jul 2022 15:44:58 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94BA32BB18
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Jul 2022 12:44:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3F8DFB8232E
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Jul 2022 19:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF683C3411E
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Jul 2022 19:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657223095;
        bh=IBt82yn9aroVmi7KmuXImpxfy3jg70hNDv5cGyh8mDQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=o9ZMi3n8vbLxJPQ/6L+xTzMcVS0y+6PXc6d6XOD1+a9fH33OEzQa3SkTFIloRPnbu
         IdHsEGhmXpNQiq0WFMvHe5+cZkVaRw1r4Ja64/yNYHROt7ZSPOlQPYWM2x7+8XnZZK
         i8aXFvRV4QWj6+A/+2cVOaSzAVuGiSjOpUNhfac4sCn2vjrMrvgQtPWqxPKR4WU4la
         5tJ8g431PhfV4bxjoH29jg7hsy5Z+LNGwF/vxnboi2cMus8QyXd/mYuEieTBQUYuHI
         Sb5/Dp3VURbEagHlz7OHGsPffwg4ktWfxjVGXyu6DfA+MLzSnYDdy7ocOUSYU7mj50
         GJIaUYIVHj0yg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D5650CC13B0; Thu,  7 Jul 2022 19:44:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215177] Stop exporting platform_profile interface for Lenovo
 T14/P14s Gen2 AMD
Date:   Thu, 07 Jul 2022 19:44:54 +0000
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
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215177-215701-embI4yVXuW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215177-215701@https.bugzilla.kernel.org/>
References: <bug-215177-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215177

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #4 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
This has been fixed in 5.18 and later:
https://github.com/torvalds/linux/commit/e1c21608e3cfc4b44ecdf04e12986b6564=
667095

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
