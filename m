Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88073C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Apr 2022 17:32:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238514AbiDYRfQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Apr 2022 13:35:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237180AbiDYRfP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Apr 2022 13:35:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6711960AB9
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 10:32:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0C0856148C
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 17:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D639C385A7
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 17:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650907930;
        bh=N67osZaUwQlk7U9aU6ayIrQQj9eQHuo1Lngb18Y6SIg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Zfk/ZYq+OefaVakkYsIdYfDQxopjI2W0hOBqN55ceV0QlQKF7o38L2pzdghWTX3FH
         uXEMk0+RFfKfJt7yVdLQA7zRK9Tn9H4k80QaE6bOBh/JZjQ4nxgwv/cCXn5s4kNMaC
         Lfxv/D69nMYm7EW7/uUFMzzqJO0kcPN+owjwcN4FbrR1WBm6fIy9NE25W8VhoN6Wli
         4sS+r/AWRnP3NOcKYjJP7AR7MrevlFaVyZdX5/g5AmZmeOh8HTxY3U+Inu/ZTW6/qH
         lQyiw4ie9FwIiZKdlQmmDK3+3/Fm74S0mdSUrnppXM6y8DiWcikKKFsqsTXYb8Wl+s
         MZm/d7qr9C+sg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4CFA4C05FD0; Mon, 25 Apr 2022 17:32:10 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215883] Unable to resume from suspend with module
 `intel_lpss_pci` enabled
Date:   Mon, 25 Apr 2022 17:32:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: o@zgur.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215883-215701-6wtRNOglKk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215883-215701@https.bugzilla.kernel.org/>
References: <bug-215883-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215883

Ozgur Kara (o@zgur.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |o@zgur.org

--- Comment #1 from Ozgur Kara (o@zgur.org) ---
Hello,

please share your kernel version and which distro do you used? if you have
compiled a kernel, i would like you to share your kernel config parameters =
as
well.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
