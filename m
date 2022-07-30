Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A329C19F2A
	for <platform-driver-x86@archiver.kernel.org>; Sat, 30 Jul 2022 19:04:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbiG3TEc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 30 Jul 2022 15:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbiG3TEb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 30 Jul 2022 15:04:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A415140A0
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 Jul 2022 12:04:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B7D51B80C94
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 Jul 2022 19:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6651BC433B5
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 Jul 2022 19:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659207865;
        bh=4jH8DYUhcBu2Gxvb6k245qig+Qc+f6pmUaJDJArk1xg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=GcuNTpZVw5cQeEEQyZg+lcsvWOuhv/AQhwNo2Xqjo/L5Q+5VhKw9yMVmjcU6tObhK
         Ad0/ios3eSicsCeQzLuB5Anx1TdfreP3xNY8xD9jIH5v+EvPJhI/MHR7xqfjgY0LJm
         F3kHp6ir79SlVOmhOrfFiaT3fT0OfQrOLUX/fkTO8PzIxqN5H4V0e6IFpsI6iH/Xis
         Ja7aWLZwgG7ugR5GE7X5Kk12nk3bYYKPUXZZ2bxWyaPtHe4IjzK66r+1HZtF+ANsQD
         tkTahaqHQAwcCI0ok3un91qZbwTyWW4nrYkEdBYS+9l4OcneCQlR73meE8/CwDs9JK
         HhHYAtIP4WeQg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 482E5C433E4; Sat, 30 Jul 2022 19:04:25 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Sat, 30 Jul 2022 19:04:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: p.jungkamp@gmx.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214899-215701-OYFNEeXHcX@https.bugzilla.kernel.org/>
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

--- Comment #50 from Philipp Jungkamp (p.jungkamp@gmx.net) ---
A late response from me: Your new patches are also working wonderfully, I j=
ust
applied and tested them!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
