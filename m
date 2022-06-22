Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C8CC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Jun 2022 09:00:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234442AbiFVJAN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Jun 2022 05:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351224AbiFVJAN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jun 2022 05:00:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC9737A14
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 02:00:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 33DB36194C
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 09:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91977C34114
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 09:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655888411;
        bh=z6Thw6aQVbjOCMf47i2QSP9Ys02zYkHqm38BE6dlpps=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qUGZAuQYdeIfXoRzbzVu/FEX9tJQmgECRhaOzpeHekJyPjOEwQP1t+IoVGmhmPl0j
         AWBCFyn0eVuZrMVq1OXBr5OxBaZw/AOrNR1yOECm6cs25T5FvBKy/NHlT9eAhdUv/q
         XChU00KYK16Z9utDcBIYsGoKNByizS/mDiz+rDfKEh5M+VZTmTy2UA3yRjxRcA4jCi
         HJ2OrJcJ0uy2e2kxc2nL/x73+OOzutLgNwa7dwDqVdA45sAj8uXCSOXl53vG1FV/k3
         JTdS8usXmqP+2otJpeh+trOtyojmGaiZX0Mx0kr7dfzAA9RAAhc1u/wweo8nvGI4nB
         ApgEGHZpGd1SA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 62426C05FD2; Wed, 22 Jun 2022 09:00:11 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216163] cstates: intel_idle.max_cstate=4 required to eliminate
 flickering of the display on the laptop model 3Logic Group Graviton N15i-K2
Date:   Wed, 22 Jun 2022 09:00:10 +0000
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
X-Bugzilla-Resolution: MOVED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-216163-215701-U6Mggddr7V@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216163-215701@https.bugzilla.kernel.org/>
References: <bug-216163-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216163

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g
         Resolution|---                         |MOVED

--- Comment #5 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
This sounds like it is an issue with panel-self-refresh mode, which is an i=
915
driver issue.

Please file a bug against the i915 kernel driver for this following this
document:
https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
