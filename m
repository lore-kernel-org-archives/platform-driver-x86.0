Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC7AC38142
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Jan 2023 08:21:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231703AbjAXIVC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Jan 2023 03:21:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbjAXIVC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Jan 2023 03:21:02 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0730130EF
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Jan 2023 00:21:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B5DC1B80EA9
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Jan 2023 08:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D168C433B4
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Jan 2023 08:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674548458;
        bh=9XINpNp7OiZJcoPABzguieqG2+DCBficTcDyseaAo8w=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=c3ga+AoKvNRcUJzpxAQGaKHYxbMOdJ5xix8Y0VOTTpoDYd8PBGR6jUrIJlcfrS6i9
         54vvRDATpUVPED+WIroPyZ3QHwHhxxrapgDTHIX10tUtenmFentjK8bbYqqCufHGnQ
         gNlawJtqT6PRDx2rkRKNlR4ygVJBz8HYNiwklPxTzZE3FFx+PPPgxZcl+ij+JNc0XY
         rJBkuQtF0r7LN6HZwbd1Z8IFmbuuSHFduA2TDwReB255xTZ0I1tBWPK8qUcajbY+4s
         jTY7ssyo1mPe0Q9NYJ3Zw9vfVgZB8edM+PszkqfGDocBGxqMszdVpT3y9Vp5t/HO7n
         Xl+teIvPM/2eA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5DB21C43142; Tue, 24 Jan 2023 08:20:58 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Tue, 24 Jan 2023 08:20:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tiwai@suse.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214899-215701-8YbDzKlZBG@https.bugzilla.kernel.org/>
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

Takashi Iwai (tiwai@suse.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tuxuser@quantentunnel.de

--- Comment #61 from Takashi Iwai (tiwai@suse.de) ---
*** Bug 216933 has been marked as a duplicate of this bug. ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
