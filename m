Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA0DFC6FD1D
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Mar 2023 14:40:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232452AbjC0OkL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Mar 2023 10:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232776AbjC0OkK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Mar 2023 10:40:10 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEDEC2737
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 07:40:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4DAC7B81609
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 14:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ECA00C433EF
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 14:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679928007;
        bh=hQu3Q48V2r73CNqzW//VovwoTR2bEbqO/UzAOo/hE/g=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=hA0WkzZpLitjmSbiDIpkWtyGFmDcFTCmw7/EFge/TYBcYdnmwuLonW2btbRBT4m0O
         /4qNZtHxoEZOSnPL9tHtDA/OX6a4Dpumc6BjAu3Py581s7eLjD+cPy09OESr4e5hkW
         rOHt8xYTGofxHqsBGn3vHytwxxuFr76nqK8iusWXmruZiAybLYPIGbfjAUIjAV9H4e
         8UVP33L6NMn6IL+OgZYhVZssk5pyW3dlNaT73joyVzXTVKttUdq3jICY+zantpwFhY
         7Inmw3t/UoOlhqY8LBvz/1G6WKwapKHY6n9EurLMvs8RRB8rNjgtbADJP3c9IoGlmV
         uH3YBS4Xo9Acw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CFFEEC43142; Mon, 27 Mar 2023 14:40:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] Some laptop hotkeys don't work
Date:   Mon, 27 Mar 2023 14:40:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216824-215701-1wtdDJ8Lck@https.bugzilla.kernel.org/>
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

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|CODE_FIX                    |---

--- Comment #22 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Great I have submitted a pull-request adding this here:

https://github.com/systemd/systemd/pull/27017

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
