Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A725C07E95
	for <platform-driver-x86@archiver.kernel.org>; Sun,  4 Jul 2021 15:05:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74F29613E1
	for <platform-driver-x86@archiver.kernel.org>; Sun,  4 Jul 2021 15:05:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbhGDPIE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 4 Jul 2021 11:08:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:47264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229492AbhGDPID (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 4 Jul 2021 11:08:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5C2FF613E1
        for <platform-driver-x86@vger.kernel.org>; Sun,  4 Jul 2021 15:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625411128;
        bh=/nRW5rkV54wzkprDkRE5lq5PtHxjaye2KyOc4dzuVXE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=U4sd3o5kZuzX+k9ScCbt6AF2r7hNC7uczIIwbYcUrIBEO4vmfxF+N4e1BzVehsrX0
         8SF1Pcf7Jxzt11LMpgHk3sqiUkUfvtP6/un+StPsVRn4LnPYYlS//f2lIQCgpjZWpl
         h4opDKdZ1PHIVB69/oKN6GgkS00kn8v5L3l39lZTNjXHjBMeGXsK5NEVeUDqccB5uu
         5NFJ6Xwz1U43u6nyTcndPBcYZC2lz+BTw9eZmtOCImtJBnBsjdCsgpFpZIItAu3g8v
         KcAfvlUCsJkzVeapGnU60K5JHVGSH0iW6ExMVe32xgKsO2QY/KLxBa1Ryucge5yoHj
         /sx1MhY+GQUkA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Sun, 04 Jul 2021 15:05:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: patacca@autistici.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213579-215701-xtANShYMt1@https.bugzilla.kernel.org/>
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

--- Comment #9 from Riccardo Mori (patacca@autistici.org) ---
Created attachment 297751
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297751&action=3Dedit
acpidump

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
