Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A3BBC433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 30 Sep 2022 12:32:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbiI3McV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 30 Sep 2022 08:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbiI3McT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 30 Sep 2022 08:32:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03B16121108
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Sep 2022 05:32:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 96CCA622EB
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Sep 2022 12:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05F5FC433C1
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Sep 2022 12:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664541138;
        bh=04VyyqpQMbSeNa7JW6Z5yaFOi6+gCelvvWjJGEQdbOw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=n2EWRZK1DWR4mG+b05vtL9sYyjfaiX9JWAD7Ph2QuopOR6TCAdP+77Ru6bJ81ukUH
         W8IxNZM7Xw+LLBA1cLoeS8QJlG+q40N3udgMXefMSx3ts8pPyjhcKHqvFSxWql/QbM
         7P6iho/eVRawtCz1fgzLp0GGug+u5K7YvZhItR+8sUwFHVCPJb//dD/oLd4rrYweq5
         wH+MPRj6behol+V3+Wb8Ny0beyWNbptem4FfyoDw9jvJqnpgNpOKa2FV2YgqRlw+x0
         /Y94EjfEB3HwVay/qjmCCKOCbgX2RLKc5ohqJFUxB/6a01CXsIVlEk/ZxIimtO2yLN
         ooov4dTkwR5/Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E7E4AC433E4; Fri, 30 Sep 2022 12:32:17 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date:   Fri, 30 Sep 2022 12:32:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DOCUMENTED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216516-215701-Judo0dNamA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216516-215701@https.bugzilla.kernel.org/>
References: <bug-216516-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216516

--- Comment #31 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> Can the power consumption in s2idle be lowered further?

Once the amd-pmc driver is reporting nearly the whole sleep in the deepest
state, I don't know anything else that can be done from the Linux side.

External things to Linux that come to mind:
- Anything USB plugged in over the sleep can stay powered and sip some batt=
ery.
 Unplug these.  A good example here is a wireless USB dongle for a mouse or
keyboard.
- Do you use any manageability features like AIM-T?  These can keep some pa=
rts
of the SOC doing things.  If so; you can try to disable those.

> If there will be a new BIOS version. Should I immediately update? Or shou=
ld I=20
> keep the current BIOS version for the moment, so we can run a few more te=
sts?

I don't see any other valuable tests. I would upgrade when it's available.

> Is ec_no_wakeup=3DY the best solution? If yes, maybe add a quirk to the k=
ernel.

If this is to be quirked by the kernel by default then it needs to be tied =
to
this BIOS version, as hopefully this will be fixed in a future HP BIOS.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
