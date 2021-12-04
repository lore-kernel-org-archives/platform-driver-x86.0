Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530A5C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Dec 2021 14:48:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232056AbhLDOvj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Dec 2021 09:51:39 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:50006 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241868AbhLDOvi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Dec 2021 09:51:38 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B33F860E9C
        for <platform-driver-x86@vger.kernel.org>; Sat,  4 Dec 2021 14:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D29FC341CE
        for <platform-driver-x86@vger.kernel.org>; Sat,  4 Dec 2021 14:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638629291;
        bh=+rJWEilxPwyOyBx+cdrN0KiEVSmCiJn0IbgJIt3O9vM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=K0LXL9OI+Xmyefdiy9Knv7uZKhoHvqBINlL3AE7ASbcA71LnjR3f2qKRYE49Kc1xg
         puTvvloYp/4FQQeUZtlqTyppW6r81eiRcbMOGwZh8A48mwYntmcwGLyA4usLzDi7k2
         t3+V8dqGS+F/qcsbQfPBxpgHi5zyL9+k5OtFqXsLkWP6B4a4Lq8YzGugCt657q6+ST
         IWremzQ9gsHMDcJDEO8SyTNRRONw1RGFlCrtDblOesm5x4n/SRcpZ14i4Z/D5c0/ID
         Tm0BfYMbFSC8rrQCGuJsAliFL15ZQiLiK5zddQlC3rm2OnIsKWOMiKu8mzqg5EehGx
         N8qHbUXnnEHWg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 0D4D060FF3; Sat,  4 Dec 2021 14:48:11 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Sat, 04 Dec 2021 14:48:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mail@richard-neumann.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-199715-215701-yRGFzyED5Z@https.bugzilla.kernel.org/>
In-Reply-To: <bug-199715-215701@https.bugzilla.kernel.org/>
References: <bug-199715-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D199715

--- Comment #63 from Richard Neumann (mail@richard-neumann.de) ---
@Stuart
I am no longer interested in getting my refactored version upstream.
I tried to follow the upstream development of the driver by AMD to my best
abilities, but I've not yet seen further development on "interesting" parts,
such as the accelerometer support for the newest-generation sensor hubs or a
lid switch driver. So yes, this is basically a dead effort.
If I should have overlooked upstream commits regarding above features, plea=
se
let me know. I'm still interested in incorporating those into my refactored
driver version.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
