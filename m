Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E8BC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Feb 2022 01:21:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbiBQBV6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Feb 2022 20:21:58 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbiBQBVu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Feb 2022 20:21:50 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CC62BF5C
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Feb 2022 17:21:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3EC2EB81002
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 01:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3574C004E1
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 01:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645060893;
        bh=RuFeqVU9f6tUEl9XLf85N5XeGtf+dVCeuMrMXK6audY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=V+GX0FQb1NSK7EahDY9B4trzg8kuVu44Kkt+wagh27NEiv0CXIaGdtQKchy9RHcQN
         NY+yqvqXDbqJBTWTl/Y9WosrMhmnijJnuMMGgm5nusLqxv4uxf3IKtiHp/vIALQXW1
         uIdU2n3yC9lxRUcFcPOL2Qly8Li3UUzQyda6KMV7oG0ZjhNmteez8KdNnc8ribgEHr
         p+pIQvdRWpwPEp8mipSrvt0HhCXm2BFKnx8LRBVdRpgzIXWOGl5HYYa+BCeGZOD6ls
         kv/cz51lMLZ904VdXQNEP9/gOdmRG3RsD71eHYrIulU2Zso2tqxY3RY26zJeekY8rL
         rjpTyS/LVNakA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CC1DBC05FD2; Thu, 17 Feb 2022 01:21:33 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Thu, 17 Feb 2022 01:21:33 +0000
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
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-214899-215701-e13RRiUc5M@https.bugzilla.kernel.org/>
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

Johannes P (johannes.penssel@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.10.27-5.14.15             |5.10.27-

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
