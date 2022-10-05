Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17182C433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 Oct 2022 23:21:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbiJEXVm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 5 Oct 2022 19:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiJEXVl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Oct 2022 19:21:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F42B85AA3
        for <platform-driver-x86@vger.kernel.org>; Wed,  5 Oct 2022 16:21:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EA4F1617E7
        for <platform-driver-x86@vger.kernel.org>; Wed,  5 Oct 2022 23:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52F5BC433B5
        for <platform-driver-x86@vger.kernel.org>; Wed,  5 Oct 2022 23:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665012099;
        bh=0hnnUsnEnWryUWyyTKic8Dax5vXXmcB5HzL0f1YN8G0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WYdsL84vwSqsXcHAi1GHyPA0xM5GBhAM6H7hRX347RvPejGCk+bbU5vdH2KOa9ymp
         oUW1vAhbRkZQvkJyf3dAUqb+un5/U/cV1b3z83cbEd1i4DIDvCrIHxnkYdUdyuQMoA
         a+QGXgeTjDzUAFbfBbvoVFwmF/d2oBKF5j6Acxf26K28zZ3cB1iZ9y5MNobPnTbWti
         xu9Ql1DP4h9y5LiMxJFQhT1GkeBz5L1sl3b3djCXadF1kHWTGodKBo92tK+EH3rnX+
         BlgDQfOMY0Q3zHPviqJpPyIbnK8+dQ8iKz5sSpg1DZkjgYdRX9+tJqIwtdzRXlOiGj
         nmWo+cZBJ83nQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2FD26C433E9; Wed,  5 Oct 2022 23:21:39 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Wed, 05 Oct 2022 23:21:38 +0000
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
Message-ID: <bug-214899-215701-b6Pscm0pfl@https.bugzilla.kernel.org/>
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

--- Comment #57 from Johannes Pen=C3=9Fel (johannes.penssel@gmail.com) ---
On my machine, the new patch set is working flawlessly with Linux 6.0.

No problem, thank you very much for your time and effort working on this!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
