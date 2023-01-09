Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619CEC54EBD
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Jan 2023 10:16:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjAIKQU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Jan 2023 05:16:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236199AbjAIKPZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Jan 2023 05:15:25 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F3AD11455
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Jan 2023 02:14:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DF51660FD1
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Jan 2023 10:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 502CAC433D2
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Jan 2023 10:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673259297;
        bh=5oGDLD/SfgE5ZgYmu1/MKwTN4+l+DgLfJ4bgHQsrKHk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=R3vOoU9hm0O2yiQpLRcaG0sIr7qjERDvE0Y7zrOQdEZg2fTvFbBvgjqf6LUNkTP/T
         Y+2gHljQmwNlfLmftIZEHfgMnir4f3Bue7t8bTXejqHVg4NIS2qqvFPqFvGQoIe8gX
         QSd5nmw1NJ9s++CAf8VnxCEHhzH0oUiVV/6aJvTo5HuYi59yLPCrhzI7ZYLU6SCqr8
         FL3C/I1pwTDl+QXnVvvIn9vYOM+teqdTysQ6z5tJIhFQ+IXjAaNDo3+DMzD2v+lct6
         Zd153o9nAx9j7bVmvTSdUcggQBk+BLej6II1h4lic1OPn7Un84cl1rZaM+L4KhymiX
         d3DH8N+H7FvKg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3B2D5C43143; Mon,  9 Jan 2023 10:14:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 114161] pinctrl-baytrail: Potential Error: Setting GPIO with
 direct_irq_en to output
Date:   Mon, 09 Jan 2023 10:14:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-114161-215701-rbzkAVH0oW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-114161-215701@https.bugzilla.kernel.org/>
References: <bug-114161-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D114161

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #10 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Andy Shevchenko from comment #9)
> I believe this is something which Hans (Cc'ed now) has fixed a couple of
> years ago.

Correct, this if fixed by:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3De2b74419e5cc7cfc58f3e785849f73f8fa0af5b3

So lets close this bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
