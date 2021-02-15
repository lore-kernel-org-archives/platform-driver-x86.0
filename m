Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A640AC433E0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Feb 2021 11:23:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6691764E52
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Feb 2021 11:23:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbhBOLXh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 15 Feb 2021 06:23:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:50038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230030AbhBOLXc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Feb 2021 06:23:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 6C4E1601FC
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Feb 2021 11:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613388172;
        bh=+/XzwVMxHYObBMFrDksQD3l3pgf+iF/Dxm26F3YwTkM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=egkFf0rH+9wnwCjENiNS+mEM468GsW8QOXElM3zrvUxsALh3fVMFqfZR4WrrSkrZd
         bzU8DQSVZq3/21ARGFmLObvK9RS7+1SbuqaGvsfCOYYsBb/DaNn6m3AhOASYXclk5N
         VFbJTAqOIjeZeb8I4jjov8rnK9lDaqMgZGvSkhPGjh7b1zfKMaqvVpF0bAH3nxrBln
         aFpNEuYfeAgSnvrX73PpBLh3yLmFpb6mM/em4PN5v3IrFmJ7FfQjRt9VOPjmjrC2a7
         ZULzBlKXbi651xoCKqS2MROu7ja7mDals/OxE1UCQKeVUR0TrgZxHOBsBIt3Kvifxh
         MGzr1PXy2zpSg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211741] amd-hid: add support for SW_TABLET_MODE
Date:   Mon, 15 Feb 2021 11:22:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc component assigned_to
Message-ID: <bug-211741-215701-7tJnvV7wA4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211741-215701@https.bugzilla.kernel.org/>
References: <bug-211741-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211741

Andy Shevchenko (andy.shevchenko@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |andy.shevchenko@gmail.com
          Component|IIO                         |Platform_x86
           Assignee|drivers_iio@kernel-bugs.ker |drivers_platform_x86@kernel
                   |nel.org                     |-bugs.osdl.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
