Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D631C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 31 Oct 2023 20:53:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231710AbjJaUxR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 31 Oct 2023 16:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbjJaUxR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Oct 2023 16:53:17 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 454AFF5
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 13:53:15 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8D24C433C9
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 20:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698785593;
        bh=E6sDLODR7puSd9q5ufeXzqW5Opbdjok8WH948SPpNnI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=klmHuxYvnI3bVg3IQVpEz7Ga2TFpgB/Uo0VPmyEztRvkihpCddmfwfDWRQ/82mJPk
         mM93A77YyHfVf1PUlz963EGM6LM5K16JlVDym4+zlmTA8HWI56xSMl6CEe+7x0mqR6
         7N42Q1r/IUlKCZVqIDzy5zG/u8Zd1nd3m7LsXWFFuyALXcgPM2Qxz9zcVc6/oABlAn
         eF5HOlhrmZKtDZu5+uj1ui8beB0qKeorGXJxsmN/lPLCF5Aa8egsf3gOSBAZLE0Dlj
         +p0e0gXcobMdD60lF0ldoP7g49vl3Q1bZua6+kj+Y3xVrhwIhDfUQ1Ddp8fDQ3zzCZ
         Tlkcd4sTIS7PQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BBF26C53BD0; Tue, 31 Oct 2023 20:53:13 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Tue, 31 Oct 2023 20:53:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218092-215701-oEHVdXSAVZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218092-215701@https.bugzilla.kernel.org/>
References: <bug-218092-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218092

--- Comment #13 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Most distributions let you pick different kernels from the bootloader, so w=
hen
you build it you should be able to revert back to your inbox kernel if it
doesn't work.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
