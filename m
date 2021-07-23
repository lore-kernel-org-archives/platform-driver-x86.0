Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CB4C4338F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 23 Jul 2021 05:47:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1800D60E8B
	for <platform-driver-x86@archiver.kernel.org>; Fri, 23 Jul 2021 05:47:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233771AbhGWFHO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 23 Jul 2021 01:07:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:40828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231949AbhGWFHO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 23 Jul 2021 01:07:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 02F9A60E8B
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Jul 2021 05:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627019268;
        bh=KTN5CfBBIYibOzymyw1beL7dZQsDFbCGHz5GLCwD5G4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gGbx8cNRKR/Si3FBiq/6ocbnMWk0uYIabVN1TosXJHgpYetUzs28ZSJ9KCbnYTYor
         yPgBg41c+plUTCmbHTv7dOf92Z8jIgUcVVL0QlKDADekjDW3pDMJ3gxxq/w/cMl9Nc
         6RswM2uMXm3nLaesn4yRu2tdPf0kK5MJd1e67qFZpLjyk6lLxgLISFX50bfnquCCPR
         B5sP9NSiEIdsKo/h4vDphnlbongXzqB/je+Alnom7OpuHewLW3iuw3OpjUlbMoMWSI
         +A/M8WSY4bZHIlrI7+PdGBNkq8v2ZMTMpd8SIqrdmlnTaQIn1qxW0c50Hp5WStJ+ti
         EqWZFfYdV1Edg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Fri, 23 Jul 2021 05:47:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rod.thomas@talktalk.net
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213579-215701-AhgIZa0xP2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213579-215701@https.bugzilla.kernel.org/>
References: <bug-213579-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213579

--- Comment #41 from Rod Thomas (rod.thomas@talktalk.net) ---
Many thanks for the education guys, that's pretty clear now.
Riccardo, what version is your repo based on?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
