Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D75C43334
	for <platform-driver-x86@archiver.kernel.org>; Sun, 26 Jun 2022 15:39:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiFZPjB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 26 Jun 2022 11:39:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiFZPjA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Jun 2022 11:39:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3BE1DFAD
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Jun 2022 08:38:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6D7C460AFF
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Jun 2022 15:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C59DDC34114
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Jun 2022 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656257938;
        bh=6iBgcrGVVGkHVXLwgxbOucWCL1LVZVSlEobjqgCs7Yo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=UhATo9YC45HhqsC7/A9XMY/RnAfJLaCHV+kpTJ0qXtMPdPzkXlLnUziNCekOX8B4t
         QyPXRFW1F+iZvAfg6li/iISVF7s449B7l8MG9YLNCh6ilE4sypSEUIwz39in9HqdG9
         2QF0Ax15/b9zUV7sf0E3VbP2Bg8YatcNsh5OCgun19kUyxvDE3jWXjWiWUt9h+Eqq7
         a48aRXIL7i233A5UxZ6cvzLWza+R0H1PF4uCNNTrLEtB+huh/oYVihMDplNrSn4ZJ9
         3SdXapP2P6mt+YZnO2LvYFUHKhWF5mcrTWvxy8f+Qb2uxVbJJPZTF5C6fgI3ZZTMEK
         jIDksahlCgbeg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A8EACC05FD2; Sun, 26 Jun 2022 15:38:58 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Sun, 26 Jun 2022 15:38:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tinozzo123@tutanota.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214899-215701-8pSR6wWMAP@https.bugzilla.kernel.org/>
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

tinozzo123@tutanota.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tinozzo123@tutanota.com

--- Comment #42 from tinozzo123@tutanota.com ---
I have zero issues on an IdeaPad 5 14ARE05.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
