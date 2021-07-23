Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37435C4338F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 23 Jul 2021 06:29:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 150AE60EE6
	for <platform-driver-x86@archiver.kernel.org>; Fri, 23 Jul 2021 06:29:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233939AbhGWFtG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 23 Jul 2021 01:49:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:50408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229839AbhGWFtG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 23 Jul 2021 01:49:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id EA04160E78
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Jul 2021 06:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627021780;
        bh=azR3uWXQSaVvEwdkZA9AxIcVTVBbFv4a1kU3iT98qa4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MTldfuSGzwFo6Nl+iq3K0inYwebARYcsoZzKdIeP2Zvh2wLC1mSPYFNVefL9rxRWd
         7deGtCzJ8jlglXdXiUVVMJ2vaQDhq0X7QmkXJWUM4ZlOPzS+UUvlWIt2qvOUF5eGsS
         3SpRqLncgxz5u27kyfqy5NeA89JpQxobKmZmad3O4Qh/00WMETeSVgUx38V5DRGrtH
         AX+eot+cDMTi/h+QHSkJO2Qc9WGJBHjYw6MwEZCi4EILyawxK1RCR/Mahs6NNpdqQZ
         A099BmdZR1CCoV+YtXQPFCdD1JXzxb1qeBfbOr8JSNou14HGdRHehJKg8a9thz7s+O
         9ZjJ3ceJ9dY8g==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Fri, 23 Jul 2021 06:29:39 +0000
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
Message-ID: <bug-213579-215701-jKB6qu7Cpl@https.bugzilla.kernel.org/>
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

--- Comment #42 from Rod Thomas (rod.thomas@talktalk.net) ---
Rebuilt the kernel with the hack and the touchpad is now fixed. Let's hope =
we
get a bios update before the next kernel update so we don't need to go round
this again!
Thanks again for all the help.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
