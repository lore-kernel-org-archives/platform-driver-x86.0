Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998EBC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Jun 2022 16:27:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234213AbiFTQ1L (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Jun 2022 12:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232831AbiFTQ1K (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Jun 2022 12:27:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D78CC1DA4E
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 09:27:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6EB21614DC
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 16:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF46CC3411B
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 16:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655742428;
        bh=/c69mvRpTH7jmwA6SCFsJel++U3d4sgq+NrHRByYNfM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mApKG6GN+HE6idHRAngNgAW1jElptFyRV2H4sCP1Ib1oemT7BEXQLqPza8I4QUEvQ
         3GB68I0nKrCvxj8LtCTAHcgPUoEzxKrR5y5l67onPsZdzHfx/GI6qsnChUj6mYI5Fd
         H4YH8nwxmSVgLgnKiik0QG37p65xu0v1kYO032QJcyiG1vpdDpwcDwDKZEYWLpJtBL
         xCv4owHzNH//tjUgIvg01EKAgD8KQzQWGOQBmpNojMB8Ur1k0VT1HB5tR2D4ZDtR7j
         gYh09wI4mVaC6o35d4BZ5kYxIZmhlUtMgkd+rajjT6GNTCBFmWNMm8DT+7mPv0clNy
         VbIVo7yNqUYxg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 94038C05FD6; Mon, 20 Jun 2022 16:27:08 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 200333] Incorrect battery id for BAT1 on Thinkpad 13
Date:   Mon, 20 Jun 2022 16:27:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: j.witteveen@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-200333-215701-PEGKkVDYLR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-200333-215701@https.bugzilla.kernel.org/>
References: <bug-200333-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D200333

j.witteveen@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
