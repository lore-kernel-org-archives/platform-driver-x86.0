Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA14FC43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 06:56:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbiGKG4Y (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 02:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiGKG4X (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 02:56:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0529213F46
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 23:56:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 963DF61010
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 06:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03941C34115
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 06:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657522582;
        bh=TdAUyM8j7ShuZSpc4Kn2Hlm8C5/2/FTuwY7gIF2QMo0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BcdMywp22BfV9VNKm9mPEKOCyMoWfDR5238wAMBQWyONGnSG6CT/JcivhU1iUqqqe
         8UNaDPfKLPoisia5ReySuoWNpFq0MC6TQFaO7Cm/PyL2Ws2Pq+qfb7YKU4g1Dq4lXY
         jKmb2hiVDMIJxu6aaFCUgY1RL4NpRcaQiWgr8d+y7mHkVG+KLEWJROMNcPYpRANQcO
         MeLXKF25VK298SYFJXC4weSDwz3MpROQ//FY5VegmHcUS3zBA0sragtwocXql3C05p
         t433bnm346XUORSErvitLF/co2WtrJJI6B1FnAhZz4EUN8AVXUACJIMmJuSiIzDa6p
         Ktzg0ijPzoJ6A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DDCBDC05FD6; Mon, 11 Jul 2022 06:56:21 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216230] "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD) when
 s2idle is enabled
Date:   Mon, 11 Jul 2022 06:56:21 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216230-215701-Ao2XH0UU5A@https.bugzilla.kernel.org/>
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

--- Comment #2 from madcatx@atlas.cz ---
Created attachment 301385
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301385&action=3Dedit
/sys/kernel/debug/gpio when the issue does manifest

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
