Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD52C433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Mar 2021 10:52:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 784126199E
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Mar 2021 10:52:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbhCVKwI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 22 Mar 2021 06:52:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:56930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229547AbhCVKv4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Mar 2021 06:51:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 52877619A1
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Mar 2021 10:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616410316;
        bh=WhVdtVIQsxzsXRXzKptKc3RxdoDCmREyuWXMb4kBlC4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=D6bS64CTQoZwMnOIBmrSpl3n4tNFmqeH6bYh9CywVFtXSfetrN5r8QeplxiWaR2vH
         d4HJaVgpiAqj7+XNvrtx28G+3I3vWmbXuggryt1zSraxX6t8uTkJu81Qa/xgzYmyLx
         pHlC4g6oRumD/FPx/FzoifdCvVZR/AWf1He9VHMFeVB+di9sGi49BiL3UZOxM+pppi
         hYttB1HVBGmnAEkRunSp2j6z7/+0V2c9Io9Qpux0EVcZOq9Svmp9v6ucm5g6ZsJT9+
         r3FVBWwL8Kq6Ni/O75/uDWMjpbE0w93oVs9qRSJzOG5C/nYR1bYz4lwv00EknMElrD
         MZRM1WzXpmtcw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 22 Mar 2021 10:51:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-GHMFm9UNQ4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #49 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Andy Shevchenko from comment #48)
> Matthew gave a really good explanation on techical background what's going
> on. What you really need is to amend existing driver(s) or provide a new =
one
> to fulfill the functionality you want to have.

I'm not a programmer let alone a person who understand the innards of the L=
inux
kernel to even attempt to fix the issue, not to mention that:

> Note I believe that this will not be a whole lot of work (but its not tri=
vial
> either).

Maybe we have ... kernel developers who can do that instead, for instance
lm-sensors maintainers. I don't know. I'm confused. I did my best to report=
 the
issue. Meanwhile I'll continue to use the hack since I want to monitor my HW
right now - not a few years later when someone finally ventures to scratch =
the
itch. Thank you very much ;-)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
