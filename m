Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7E7C433E0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Mar 2021 15:08:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5A996198B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Mar 2021 15:08:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbhCVPIX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 22 Mar 2021 11:08:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:37598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230334AbhCVPHv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Mar 2021 11:07:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 985FC61990
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Mar 2021 15:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616425670;
        bh=JY1C2n9kINi6mZnwELln4k0zM82z1QSRkQfvRLlkecg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=c80XPAoX81m5f2VotUJOoLR1yFlPDevQLR3bL1ruwubl+5DQw0j6FObj6+4FAo7FZ
         GNiJJ0xCe7hqMYBO25ferNSp4Z/bzCHr4o0Klj1R0/b1HRJpDG0TdnL3IEv7XUDtkp
         pgX4PKFi3DbSuALXFm2cpDiYqgb3PgVonVOI6codzJyaBfT/GK0DGqXAO9R/Gb4SLj
         oWz/2BpCV1+KuVdHDj3RM/7pt+oQq+IZmX9sEskGB5qNOmSC2Nrj2fh0IIwL/Ffex0
         J7S2iiCriNGmAf4E35+X3imumDJYWDWLw6BC65DuIQ2eM8V5Ek+agoGzKuZrnd5cH/
         MbIBxjE1oFCuQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 22 Mar 2021 15:07:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-204807-215701-vWlke0ySWN@https.bugzilla.kernel.org/>
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

Andy Shevchenko (andy.shevchenko@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |CLOSED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
