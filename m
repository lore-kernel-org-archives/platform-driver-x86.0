Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B17C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Dec 2022 13:00:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbiLUNAz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Dec 2022 08:00:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbiLUNAx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Dec 2022 08:00:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D870E86
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 05:00:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1970DB81B8F
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 13:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D05E0C433EF
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 13:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671627649;
        bh=WQBGG3sh1P+z31BPgnsaKAa0zLK//vOxvWv8gkPK+7Q=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ICUyp0lP1SrzPH/ep/x41Co0PJNfprZI/kA6nEdfCHMjkFPu+M15S3f+Rd6SCEB11
         WjbeTQW2yfIfE/hQh/4OGwj3NZCLCgy+HPxQw6dtgkmBI97PLtSd0XYUNohfIolqZW
         LByRQ2WaiFZoNUB2WNbmjIDfXEvHx73uIYP4VlEwZe49luFxFI1pangMrZG1Vcxgq+
         nMYfDdto5FvzNIg8w2LOIHQQ83D4VYnLE7tbihAx3ZBrMzEzv+/fqJGXta8h0hMiDd
         DahuVQPfP3qn0A6tQDSUTWKgkkiP4hKj61EmRtLQT2LklBgQMOFW9QmNLNg812TpOJ
         6x617jjJTh7VA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 75C99C43142; Wed, 21 Dec 2022 13:00:49 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] Some laptop hotkeys don't work
Date:   Wed, 21 Dec 2022 13:00:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andretiagob@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216824-215701-1ytajiFlVZ@https.bugzilla.kernel.org/>
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

--- Comment #9 from Andr=C3=A9 Barata (andretiagob@protonmail.com) ---
EDIT:

Restarted the computer and some of the hotkeys started working!=20

The microphone hotkey (number 1 in the image) works now. The hotkey number 2
also works, it opens up system settings.

The screen rotation hotkey does nothing.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
