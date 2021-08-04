Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC26C4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Aug 2021 12:12:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BF4E60F35
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Aug 2021 12:12:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236290AbhHDMMZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 Aug 2021 08:12:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:33928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235697AbhHDMMZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Aug 2021 08:12:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1DE1B61004
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 Aug 2021 12:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628079133;
        bh=WEYN9gSXfD0+YS1Php1TWQhLNfaiQOpMebND5qD/gJ4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=JYgyYVCUliboRmpe0Pgj9A9BroodE0mDVmJbomzNLgd2pRAfQ+9VvUMPv+AzJNPxN
         ap0to7zWI0cTGBCt5Nk4GsGs4qt4O4ctakuYZxyMmKmpYfPQq8S7EQXScLR4297/SI
         RE4u+pUYol0TyJ2Bj/htJk5iVxTgo2FKrikv9f7w+zGuJ+auma8SScRwGUZFFXxnY3
         HudE20wYdF+4TkvT/UGDUqrU5E/W6N+YP+kyNm21QFqPKH6Ue7uR2ruwdWdvVY3UhA
         wLgQOEyMOdUeXnleDrf0s9ZSeRgh+UXtnsaJqN33YIhhycYb5lgDdjvHXoZM/bsccz
         QgEWPMhkJbbPQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Wed, 04 Aug 2021 12:12:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213579-215701-ShF3MZLsNu@https.bugzilla.kernel.org/>
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

Andy Shevchenko (andy.shevchenko@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kai.heng.feng@canonical.com

--- Comment #54 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
*** Bug 213463 has been marked as a duplicate of this bug. ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
