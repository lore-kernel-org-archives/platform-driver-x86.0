Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A981BC43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 17:34:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiGKReS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 13:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbiGKReQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 13:34:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B5F327B29
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 10:34:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3199261458
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 17:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F423C341D2
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 17:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657560854;
        bh=X548DhJp4M/HYHQ5YAOEH5oEH6A8vc0E9uL4ADXN0JQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=QYASBL5YcerKaQ4GmfuhJU1SYon/jt6wjMykFgxd48a4iQDIs5EgF/Zqf5y+XgbwY
         b0kN9hjcdAWUOB9JNZXd9J9wB+H9HNU1mdIxlnjVO4sTU+U3E9vKc7/2QXJ08aA9yQ
         LFv+OMZDdLxjdYfoY3Od0p2b6+Qa85k1n4DS/ce9X7dl/w8xyT1gcxchUeli54ECdH
         cwjtXxwDnDD8QacKzTwa7Yrma3P3MzCNWoZJ7FpQXKuDdS1hY3Rj3awynCbkEsxbXF
         Pzz83WhPjg93kLviEao+LOTpumUtWloDX+0KSHh01XtRzs9Gjx2YThr+7+wUX3EeCF
         Z1tOfUHYxI8FQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 712F9C05FD6; Mon, 11 Jul 2022 17:34:14 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216230] "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD) when
 s2idle is enabled
Date:   Mon, 11 Jul 2022 17:34:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: madcatx@atlas.cz
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216230-215701-vlDYgHKg0i@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216230-215701@https.bugzilla.kernel.org/>
References: <bug-216230-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216230

--- Comment #9 from madcatx@atlas.cz ---
Luckily I managed to reproduce this very quickly this time.

The state of the GPIO pin32 is now reported as:
pin32       interrupt is disabled| interrupt is masked| disable wakeup in S=
0i3
state| disable wakeup in S3 state|
 disable wakeup in S4/S5 state|     pull-up is disabled| Pull-down is disab=
led|
output is high| output is enabled| debouncing filter disabled|   0xc50000

I attached a new dmesg log with the extended pinctrl debugging enabled.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
