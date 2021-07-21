Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48856C12002
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 14:32:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 260AF61248
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 14:32:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238335AbhGUNwQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Jul 2021 09:52:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:50298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232825AbhGUNwQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jul 2021 09:52:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0889D6120C
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jul 2021 14:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626877973;
        bh=8WBDNfq1/hrZTsc4cIrrtvp0NbF8EUOmxg45H0olCBo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MnWSelYSWikHGpUydatm2b2pBsOae3/SQfPLbMaJnW7doI3CujNUr3vMnRSBqg3I2
         wDOqwINM0eIIasCi1FK/z7WL17Twmyh8YjVeZxpJ7MdA12tQawIMcPpmsMWMood20v
         1SP3K9/9UEFhEsmV4Ffp8DQ5LA4oab7HxW0/XTKxBmsZRFV5ECFKXnMrpwfjd67gMs
         Z02Zs49SedBq1uZvkB4WJYNdQ7xX+lxKt/ZvleQBDGRhGNiB2cKckrYxzTCj+V4xwQ
         Jfw/CcZjMOxns1UkV1q6HtUI+EGmouKzdkHVzfOH4L+Jb0YTtA21uOYvm/cvzzFyeX
         CkfAALxfRLpAg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Wed, 21 Jul 2021 14:32:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: patacca@autistici.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213579-215701-cYjdfO2en8@https.bugzilla.kernel.org/>
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

--- Comment #22 from Riccardo Mori (patacca@autistici.org) ---
Created attachment 297983
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297983&action=3Dedit
dmesg

This is the dmesg output with the latest kernel 5.14.0-rc2 with the commit
cb8cc18508fb0cad74929ffd080bebafe91609e2 "pinctrl: tigerlake: Fix register
offsets for TGL-H variant" reverted and CONFIG_DEBUG_PINCTRL=3Dy and
CONFIG_DEBUG_GPIO=3Dy.

The issue is still present

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
