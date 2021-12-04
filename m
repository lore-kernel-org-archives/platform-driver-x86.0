Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F069AC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Dec 2021 11:00:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbhLDLEE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Dec 2021 06:04:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbhLDLED (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Dec 2021 06:04:03 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B8CC061751
        for <platform-driver-x86@vger.kernel.org>; Sat,  4 Dec 2021 03:00:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 311FC60DF8
        for <platform-driver-x86@vger.kernel.org>; Sat,  4 Dec 2021 11:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93E91C341CF
        for <platform-driver-x86@vger.kernel.org>; Sat,  4 Dec 2021 11:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638615637;
        bh=hnVI/uCThwT1qAkTDpk40nmARiUtF+NslJ0IqPJsmLM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Whmdwoo+/O2sJVgYi2FMmexe+rOA87wycoJwmYglltQ/EScbu6KbJLUvfTryFJBYQ
         FjdAqpVbIH+x5h7T1BkqP9XXzWWUa3JYV9zgF52BM+h9F1tAKL1ljrfybXa0f7sjI7
         X2LaTE4ud6E0mHm6o49/n3/BLB9vfd3+Oam8VrX39ZHwEj/O1/cTq2Jop6MDoWFOwU
         6lDwPMLmDf0bFJlX9o5157fY65VqezaEEj+WKTZTxVxtOYX6ZLIEbs5j6ZXGVCtqKb
         VSlYKMrXYYGR916xfKrs0Ro6JKZd2BT1qFv6VCeRm6wYuzx6n/xzCEJ94A6lKQxa7a
         Wzrnar8SyrUzA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 76FC4611AC; Sat,  4 Dec 2021 11:00:37 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Sat, 04 Dec 2021 11:00:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stuart@tase.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-199715-215701-inUokOTXKJ@https.bugzilla.kernel.org/>
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

Stuart Morgan (stuart@tase.co.uk) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |stuart@tase.co.uk

--- Comment #61 from Stuart Morgan (stuart@tase.co.uk) ---
@Richard - it's been nearly a year since any updates to this ticket and zero
activity on your github repo since Feb. Are you still fighting to get your
fixes upstream, or is this effectively a dead effort?

Even with AMD's own official updates to 5.14 mid-year, the official SFH dri=
ver
still doesn't work with the AMD 4000 series HP x360 laptops. I'm currently =
on
5.15.

I personally have an AY007NA (note AY not AG). I'm assuming this to be simi=
lar
if not identical in behaviour to the AGxxx models and would therefore benef=
it
from the same fixes.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
