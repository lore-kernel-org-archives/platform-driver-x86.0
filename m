Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCC8C19F28
	for <platform-driver-x86@archiver.kernel.org>; Sun, 31 Jul 2022 01:46:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbiGaBqd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 30 Jul 2022 21:46:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbiGaBqd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 30 Jul 2022 21:46:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52D5712D1C
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 Jul 2022 18:46:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 07E0BB80CC6
        for <platform-driver-x86@vger.kernel.org>; Sun, 31 Jul 2022 01:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4E11C433D6
        for <platform-driver-x86@vger.kernel.org>; Sun, 31 Jul 2022 01:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659231989;
        bh=F1Bk73lV9DQwUhfzF97azs2qrlyDDjj7HXgU2jmS4Hc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=AXF/FoP68LNAKALGFN+6kxWwPaIDmnIj4MzykI5xc3IIk8xHDVEFV3+fgyF7chXVp
         m6m2AS5XurISwbU+fwEPM92DJq5Ia/6lNVSgRYAmLYyEmRuFgWbGI93k4sz2y3vJVK
         Tbd5f/IyVuf6NsTi1ILZYke8kqCXI/nVqaeMSd+nycXAAs+qoRm7KNfB/JvSBCleWI
         K8GotzZm/WJkv6V91YF9B4IDrRLPRAg4PrKrgvZpBqrOwbU0zJ3eXoNveC1e6bDd7T
         v53UA0JwRNcB0asc/7tljqZLLSJVgXCJskVXyxaGhzkaRY/ZTzftFWJ9NF2acl4kly
         ckp4ks58bUfFA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8454AC433E7; Sun, 31 Jul 2022 01:46:29 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Sun, 31 Jul 2022 01:46:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cristina223@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214899-215701-yisqEpBA9Q@https.bugzilla.kernel.org/>
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

cris223 (cristina223@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |cristina223@gmail.com

--- Comment #51 from cris223 (cristina223@gmail.com) ---
I tested the 2 patches and i can confirm works fine on my Lenovo Yoga 7i 16=
IAP7
Philipp's patch for favorites keys works good too!
Thank you guys.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
