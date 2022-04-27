Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40604C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Apr 2022 12:03:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233409AbiD0MGQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Apr 2022 08:06:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233461AbiD0MGP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Apr 2022 08:06:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7827050072
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 05:03:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B7DFE61847
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 12:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24B51C385A7
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 12:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651060983;
        bh=W1JeV+X50jo1pyQaLYKOir2bKjqpJYWRYzWtCUtkwFE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=N5Vmuji7loiv/CkrOfqjT4rMYojwBOOSwHfdblz8lteq8IxoxKuDUk6gfq3SNcj0l
         T+Ggo9eNWjBK+IPgHOeqVtzdIg9j88kp701XcPSuVuQjZH+gx7tSN2Q2PHxDglugqt
         bxDMNpDfwQB0LYOxkqzIvgeURE7/lG0gAyBe8fh20Ns8c3tixMota0L3WeqS1nKVbk
         Dj4wFcJD/D+Cq+zw3FkEP78EBLBvltzy0r/mHV0m9qNhMOPzT9Vhi+yVC/0vP/hawq
         QrP+lG9GibqXXyW7QyAwUu+h04P4tNdV9H8zjLMDR40lnTgz1Li7/8A2L+FZW7PT6Z
         BWU3NmTl/2HNw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0EC92C05FCE; Wed, 27 Apr 2022 12:03:03 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Wed, 27 Apr 2022 12:03:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214899-215701-WMgSpWIC5i@https.bugzilla.kernel.org/>
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

--- Comment #25 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Hmm, your last comments make me wonder if that maybe the ideapad-laptop mod=
ule
is actually causing this problem and if iy t maybe somehow causes the EC to
stop sending the events needed for the "Video bus" input device.

Can you try blacklisting the ideapad-laptop module and see if that makes a
change? I guess you may loose functionality of some other hotkeys then, but
lets worry about that latter and for now just see if this makes a change?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
