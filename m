Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECADC4708C
	for <platform-driver-x86@archiver.kernel.org>; Mon,  5 Dec 2022 22:30:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233820AbiLEWah (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 5 Dec 2022 17:30:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233655AbiLEWae (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 5 Dec 2022 17:30:34 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C946EBF49
        for <platform-driver-x86@vger.kernel.org>; Mon,  5 Dec 2022 14:30:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7CCD6B80F2B
        for <platform-driver-x86@vger.kernel.org>; Mon,  5 Dec 2022 22:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 424DFC433D7
        for <platform-driver-x86@vger.kernel.org>; Mon,  5 Dec 2022 22:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670279429;
        bh=+vwSkz13SQ6KaIzy9gC+mvNmuspsZWR3KyzTebrw7Rw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=quDB3v/MJ8XT7+X95s3OsiPKBvZahFjh28nb/MLsRqN5pyyAvTip9PeEyfwbZonwE
         300z2cZlFesdfHbmS3yTUnWPMMTUmmo0ANCXF0zDIZfiO+0YttSV7G3B/iPvXLSttX
         1EEAEBXNNSloF+Tl6A/+GFyGJ9zsth6OHnl9ch5YL5N165CbuqS+U8/CtvuuMBwRhP
         mR7kd6g8u5jU5XNu50J8cgGdEB5FL+Zb3udCS/ZbpjeFdZd1USOBaW5z0RqG+v1I81
         UggrTLAo02Z69EgHsIGojVENI33tUvc8+tH4+6SemVlHW16nLt+IuKGUqks28Gx4ER
         64imbMfUMUnHA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 24B97C433E6; Mon,  5 Dec 2022 22:30:29 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216647] first hibernate to disk fails on HP EliteBook 845 G8
Date:   Mon, 05 Dec 2022 22:30:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216647-215701-lLXIBaQDS8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216647-215701@https.bugzilla.kernel.org/>
References: <bug-216647-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216647

--- Comment #8 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Oh I must have missed this the first time:

> Wakeup pending. Abort CPU freeze

So we need to figure out what event is causing the aborted hibernate when i=
t's
set to platform.

Can you please share a log with /sys/power/pm_debug_messages set?
Also when the failure happens what does /sys/power/pm_wakeup_irq indicate t=
he
IRQ was?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
