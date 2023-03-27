Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177F1C76195
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Mar 2023 13:32:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232440AbjC0NcB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Mar 2023 09:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232384AbjC0NcA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Mar 2023 09:32:00 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F172444AC
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 06:31:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3150BB81588
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 13:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C85BBC4339C
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 13:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679923913;
        bh=nWAED95/U4mFDyE2mjLt6kQHN7bgnGnxl8nYDVjFHNE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MHkRDdAQW2abKUH9/lnvtCR3bZUHOXSjBEnp3wVFj1m3ZznSHBtykHeVMQQOiIF4C
         3HzsgDc12j8bvHeRGlhvKtkN76QpWkzJGXo4apotjfK8QOhp03VOUGhbpAYD/IvbA3
         KYCuhMxs1AvdSIr77bZG1Z6pRCrIzE4IKQnZ8pEmZreQTub5bJxitNGalWEm0fL1IC
         GoR7iXRTH2b8jhdvzNMzfWmn+rLeoEW0i5Ja57k8Zm2lw+oWG8J7Zrq2Cf1e1J2K5Q
         URq2fIVOy5wdDTOCs+A+sKDoitCiAJEZ+hoOB9XtYO1xi4hhPHCUZvzj+sot0lyfI/
         7SMXxhOsIZ94Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A539CC43141; Mon, 27 Mar 2023 13:31:53 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] Some laptop hotkeys don't work
Date:   Mon, 27 Mar 2023 13:31:53 +0000
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
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216824-215701-WSdgwVPUnr@https.bugzilla.kernel.org/>
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

--- Comment #16 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
That is weird.

You could try adding the following line to the list MSI keys in hwdb:

 KEYBOARD_KEY_55=3Df21

But as the evtest output shows scancode 85 / 0x55 is normally used for a key
found on some Japanese keyboards and the Fn + F4 keypress is not just sendi=
ng
0x55 it is sending windows-key + ctrl + 0x55 .

You say this did work under KDE ?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
