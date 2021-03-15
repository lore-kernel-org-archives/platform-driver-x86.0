Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A427C433E0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Mar 2021 16:05:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 517BD64EE7
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Mar 2021 16:05:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232286AbhCOQEu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 15 Mar 2021 12:04:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:44852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234646AbhCOQEk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Mar 2021 12:04:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5044C64EEC
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Mar 2021 16:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615824280;
        bh=w9XnGjj6hdoETstIpPylpw9MCgOSm1sbx+09crjNvxg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VwmGFmJMyrP2LYiHFAqObSw6O35/6qEcu248yDImQWERmIQumMVU8klOY9tCyR1WD
         lWKk3bQVSyTrHWZNt11IvyhW4MdMEfsKp03W0DaD4KxBi6k/UtnugC1LrPqkBh9krm
         QKOxUT/jeKdCi5YG7B/N8nXGlKirmKRY9fRqcI3P/Bne8vEvRevGChJiWFce7FnR+e
         bKlp1bYS+prCUTOuXvEqUy2/QlDQaezY5bx8SkOkSPpsEGBiZ0bRGdN4e99Sm03DcA
         P/0xY+N0Pyvg/CPawZNsC9xxGaLfb7ng79+KoUGdD1hY4yYTuOgamo9/khn9ErVifi
         lcjWe9EtGEUpw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211977] System fails to resume the second time with 5.10.17,
 resumes fine with 5.10.13
Date:   Mon, 15 Mar 2021 16:04:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-211977-215701-GUdjcHUyRp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211977-215701@https.bugzilla.kernel.org/>
References: <bug-211977-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211977

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|CODE_FIX                    |---

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
No, it's not fixed or maybe 5.10.23 has regressed again.

Anyways with 5.10.17 I could suspend and resume for over a week, around 20
times, and with 5.10.19 and later the system dies on resume after two or th=
ree
resumes.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
