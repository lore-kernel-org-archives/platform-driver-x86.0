Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0936C636D4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Feb 2023 12:33:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbjBMMdr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Feb 2023 07:33:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230367AbjBMMdq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Feb 2023 07:33:46 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2650B15563
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2023 04:33:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7ED9BB811B3
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2023 12:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00CBAC433D2
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2023 12:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676291599;
        bh=L5xOz8J9D7EyOv8gv3MuqTJGtg7ocT7m8QZ008PLyZs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=X00KMmvdk1qKmxxpo3B9fNgxa04tMMpRm8y9lcgSmKIzHI1w7bpIt2B10pkVrIXOl
         aSHPra3HFsijn9rMTvelfSABVmRAaIBeZlt6XaMoH01eskuPZfmzYtgzb6015pIDqs
         hY2zXw468ukLhuP/CFLcCPJ7Yemky7TSUE6EIymuG2SleN9XLFnAvv80Nxs61DgN5O
         uIaz3zbz+lcSVjGoOqhPdT2sWEkNY31wS4fGApxVotsFxAgGn8ord6dXQl201FwMjP
         nf4MLMylQww8MxFl+ESKNIXsJBaua0X2YtTwriCq+zZuFMpOh8HJo74nIRFGbKGokZ
         v9Fsf+LzsNYow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D9DC7C43142; Mon, 13 Feb 2023 12:33:18 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217028] CONFIG_AMD_PMF missing CONFIG_POWER_SUPPLY
 depend/select
Date:   Mon, 13 Feb 2023 12:33:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-217028-215701-aD2emFgiiK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217028-215701@https.bugzilla.kernel.org/>
References: <bug-217028-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217028

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g
         Resolution|---                         |CODE_FIX

--- Comment #1 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Thank you for reporting this.

This is fixed by this (just mergd) patch in the for-next branch of the
platform-drivers-x86 tree:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.=
git/commit/?h=3Dfor-next&id=3Da2f9d361e3d70fcd8c53612034be7dae4f586d97

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
