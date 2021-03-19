Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE0F6C433E1
	for <platform-driver-x86@archiver.kernel.org>; Fri, 19 Mar 2021 15:16:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A762761928
	for <platform-driver-x86@archiver.kernel.org>; Fri, 19 Mar 2021 15:16:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbhCSPPp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 19 Mar 2021 11:15:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:47882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229952AbhCSPPU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Mar 2021 11:15:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 314DA6192E
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Mar 2021 15:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616166920;
        bh=EXUdtJLYYRAP7xVeVMb7bFrce5OqqqlJPCt/HbuaNmk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LyRoKUFkmo1BMigj8XxyAG75zuYv5JRxfd1Dl4ZkqeInvaiekh74I0rwg7Ritl0mt
         +txO0E2Ul/M5AsIdRRyu9uJLKHdfLK05Zh5T4yqMtreRYJ6vxzMxV6i1YMRr8mVI7E
         rxsrVZcExyGSCdfgBOjnfzDQCw8eNkspkBCuMbNC/dMeddLz8S5uQ1U6l45s9X2cQ0
         bEUh7MlF/FlyA2BXNG3XpEetM94Lm7lq6BEOOv4ESnpha35bWETZvaojr0cNVdyUNd
         IW3/tySXcee5f1rkFdZMBI6MasvK29YGtfUDqC2bEkoW+5ubekkyQZ49tEnxgSQMu9
         tdXSPTQbeIYTQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 19 Mar 2021 15:15:19 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-YwcR1d35xM@https.bugzilla.kernel.org/>
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

--- Comment #36 from Artem S. Tashkinov (aros@gmx.com) ---
Lastly, this problem affects literally hundreds of thousands of systems. It=
's
not some single broken motherboard or broken EFI, we're talking about multi=
ple
classes of hardware.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
