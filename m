Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE93C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 14 Jul 2022 13:15:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239724AbiGNNPV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 14 Jul 2022 09:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239697AbiGNNPS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Jul 2022 09:15:18 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 908E24A802
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Jul 2022 06:15:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 18C4AB820FD
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Jul 2022 13:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96126C34114
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Jul 2022 13:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657804513;
        bh=O9foo28JM257LIY8dPgiEeRyGhKDxAvzbrPqlQ3jbY4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ftTc8fpW1a97anKcubh/Mc8cC2DDjNIh9QWSIggMINKr+CLQU4Bq6C4MT+LPYaiu5
         MDcJ/UW/qhuDsGpxAfHUOt1rh5FpWndXS5Snj5z2O0VoD8duWFIFag4WsqKO3pDIaC
         YwQ5f+aiW1q9xcZvEyy6dAaDZMIPt/pMnG+7hnq8e7eWWuPjlavLaeSja7z8ofzFb1
         wC9tstGa6vEdAxw1aHsO5xyV4HjPlJN9nsvOMgs62zDSrBlAYgJKdBNumwGNgxDebL
         FjjiN/fXNiyWwBNtLgBlW3bcciSnUvkGsUYxo0soktfOIQvNOL2WgZKYJ+gGdKGuyj
         TwFfI60YdSevQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 832A3C05FD2; Thu, 14 Jul 2022 13:15:13 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216230] "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD) when
 s2idle is enabled
Date:   Thu, 14 Jul 2022 13:15:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: madcatx@atlas.cz
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216230-215701-oXHXecqnHP@https.bugzilla.kernel.org/>
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

--- Comment #23 from madcatx@atlas.cz ---
(In reply to Mario Limonciello (AMD) from comment #22)
> Were you still using the initramfs method when 33000 came through?
> If so; please switch to built-in.  That should allow the driver to load as
> early as possible.

Just tried that and the number of unserviced interrupts dropped down to less
than 8000; that's the lowest value I've seen so far. pinctrl_amd gets loaded
about 0.48 secs into boot, it loaded at about 0.67 sec when it was a module.

Anyway, it looks like we pinned the problem down pretty well. Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
