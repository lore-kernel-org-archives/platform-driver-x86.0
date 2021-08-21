Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE94C19F31
	for <platform-driver-x86@archiver.kernel.org>; Sat, 21 Aug 2021 16:19:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A95A961248
	for <platform-driver-x86@archiver.kernel.org>; Sat, 21 Aug 2021 16:19:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232213AbhHUQUf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 21 Aug 2021 12:20:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:46556 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229571AbhHUQUe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 21 Aug 2021 12:20:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1CF7E6124C
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 Aug 2021 16:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629562795;
        bh=gvsHog8ttH7wksC1ITvBfAhjG6CzQzF5JIuvvbdNcvQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=CxnZUYcP9y9L90KuquypdoVb4IDrkVC71TlCjxoEG1rwUbe7t7TmDq48fuz3gsKD8
         HZ5PvkwoK8sHq4hYn7yriVnCSIri+ygyBNIW596SLwwSUN5b+6y2Aa46gAcHNTKGt8
         NIvKzhaIvARUNQ2w43+CgFmWDmov+1hozggsFF0jRcJ9hkAPJQJxCDmepuRXViF+I8
         eCi0HESSlG7EVynWDGN8OGpZ9kb3kOjUCC4ezpdrFIEgTloDgf6tZ19m5ZMm0QGSVc
         kUolsetOi3dzLsWyZgmgNEA/AD57xOtBjZPodvGxwnu0Dc4yi8ROqQmAbacwhdYl5o
         skYCZA2+hOZGQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 21 Aug 2021 16:19:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: danglingpointerexception@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-BLrhXtwhcj@https.bugzilla.kernel.org/>
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

danglingpointerexception@gmail.com (danglingpointerexception@gmail.com) cha=
nged:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |danglingpointerexception@gm
                   |                            |ail.com

--- Comment #81 from danglingpointerexception@gmail.com (danglingpointerexc=
eption@gmail.com) ---
Hi All, I've got the same issue with a ASUS ROG STRIX X570-E Gaming.

We need this patch merged!  Can anyone with influence or clout help push th=
is
along so we can get this resolved?

There must be hundreds of thousands affected by this!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
