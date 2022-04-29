Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439D7C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Apr 2022 15:04:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376454AbiD2PIO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 29 Apr 2022 11:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358332AbiD2PIN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Apr 2022 11:08:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 424EDCD67C
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Apr 2022 08:04:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0254FB835E1
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Apr 2022 15:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A48D3C385AE
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Apr 2022 15:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651244692;
        bh=+YJLu71qbyzzE687sCQQxOohq4OtF9r8TErBl9+SQJo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=S3YDCpHkgjIYiuQDIo2Y+AYV6/cIOJECJOfhgwrb7xX6RPE9/OM2FNfqlbKNNn+Gd
         PfbbVzSJg12xgc6HMSRX5oB4lvYI/SKy3iMo+riDWQkWsNC9Tb7YHclPB9szxLUpxR
         79a8vIYQfgcodq1YRu9We9Ys+w9JZKWYeEmVYw8ICx9PoCydB0OEr3OUXHP0n15W2X
         GGEd9xg2qnbM3OBR/t3doLuf4s23oh6jW/gnjGKuIZhkFSS8FzTFqhlH4Zxy8wyUQO
         +bQv9PRxReAUzoBmv27GizgU4lEbW3ufVncBmY8tjv9omjzFRXqsFHRroqhGuNPYEp
         wBlyMGs925FZg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7F5B8C05FD0; Fri, 29 Apr 2022 15:04:52 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Fri, 29 Apr 2022 15:04:52 +0000
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
Message-ID: <bug-214899-215701-bF52lCo0ap@https.bugzilla.kernel.org/>
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

--- Comment #26 from Johannes P (johannes.penssel@gmail.com) ---
Blacklisting ideapad-laptop seems to have no impact on the brightness keys.
Pressing them still results in the same register change outlined above, and
nothing else.=20

Note for sanity:
For debugging purposes, I am running video.ko with report_key_events=3D3. P=
lease
let me know in case that may be a source of trouble.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
