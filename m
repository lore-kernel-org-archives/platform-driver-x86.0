Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD78C0015E
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Jul 2023 19:52:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbjGXTwq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Jul 2023 15:52:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjGXTwp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Jul 2023 15:52:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA88DB
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jul 2023 12:52:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AA54661342
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jul 2023 19:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F10D6C433C8
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jul 2023 19:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690228364;
        bh=kUfI+WYawudP16v6Ntw92++dh2jR0og6n/rHb+0sDjI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bFxk8/ShCekvduJRPMZEw77jlj9gCjBpjYIHP8jRNfw72axivBW3/NmBkRdqpwv0t
         hsDdNtttcYUahoZFXPq0Dngyo4xSv7ehCnL80oXLIwGbBsyp8cb5W1atomBAI8xWUG
         zQ9wkcNUR1bxxA9NOwRqouiVKgvCfpMnd6+QztROXGYVrYlsXkfa3wbIWpDMdtz9uY
         uLAKPAjpoKqp4WTWrBczmu5HtIqEHknxnAvw2dEzlSlGl1Ubp0XHcqUleQt0tPjQpL
         xDq5stFx6K0KzG0xqUGpIyalX3S44OV3RgVZ+41DZEwsKb/VZkExusNtJHrusUlzTn
         mC7ZZCskmCHaQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D9E51C4332E; Mon, 24 Jul 2023 19:52:43 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217696] Looking for a way to enable power saving mode for Ryzen
 APUs, along with limiting the upper temperature and total power consumption
Date:   Mon, 24 Jul 2023 19:52:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-217696-215701-glxXzl6Rd2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217696-215701@https.bugzilla.kernel.org/>
References: <bug-217696-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217696

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--- Comment #14 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
No worry.  Look forward to your results later.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
