Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C8CC77B61
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Mar 2023 13:45:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjC0Npm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Mar 2023 09:45:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230386AbjC0Npl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Mar 2023 09:45:41 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E8673AB1
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 06:45:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B8C30B81150
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 13:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 740CEC4339E
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 13:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679924737;
        bh=IwUv2YugCR9uAWCB8rYwP4kNjvxa64fBMEY4v6WyVvY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=et+5DUVf5VShJgx2iia6DxxvUZYwVreM2FDDQ8OUWYs92zxNO0aXfeWeLPccR6mon
         FB90Ncoygo9jR+1rTlstCndS/Hc6Znh8O6tAs/SdmoEpofVCufO/3DlOPp4ceD75kL
         EmnPk9z3JKZPO5lAMl7sBt3d3EB9Jxe9USNAveu771ongt5pxPE/kZDdv12JhAGbYX
         nc6Z5POQF01HZoASon2rGuf8HyskmBjB93pBtw26lrD0Eri8EI8EmduLxRdrpSNMLm
         tret3BL3vao5Nefo8xYq4S0DbOan3Q8EBAqzeBlc8vJT60kXIxFpKGVLgfBJ8Ycyjw
         PVY8tw93MEwqw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 55156C43141; Mon, 27 Mar 2023 13:45:37 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] Some laptop hotkeys don't work
Date:   Mon, 27 Mar 2023 13:45:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andretiagob@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216824-215701-sjaNcn7LxB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216824-215701@https.bugzilla.kernel.org/>
References: <bug-216824-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216824

--- Comment #18 from Andr=C3=A9 Barata (andretiagob@protonmail.com) ---
I'am mainly using that key to turn off the touchpad when i'm using the lapt=
op
in tablet mode since it doesn't turn it off in that mode.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
