Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899CFC12002
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 12:32:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66FC861242
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 12:32:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233944AbhGULvk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Jul 2021 07:51:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:48320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232426AbhGULvf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jul 2021 07:51:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7117461241
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jul 2021 12:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626870728;
        bh=BwjQ1d+LeBIO9kn6gw/x7BAolryREHCKa+TKdb6ihFE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gKr+tVeFRlwPfYi9hn9/YWeFclrSgZb/mxX4VYp0HZh7zhK7A+NTYhFWfbX5p+Duf
         RNxViQ1L7STrZmHpT53z2mEUN9SldEsx7+hCJfoPeXth8ySAmB2SDzENKkvIIH1tuC
         Waop9Afwotsf3WzPeUYlMHf2kxLqfmHo3I3YKR5qKL7/+V1TlR53oOLM7J42YZ6OkK
         bkkUqNMhQqBsn2iFQmUP2k88IeUVJ1ADHk8LiLfvO1FE/cDpihM6gK51JemytWw0ir
         Ls/kx49AGOYEg2aAc1u7dXCbGkeZ7xSxPgrHlG+EmJJu+9+9B84yB3H8j+NnhvFAxA
         x7j8pFjt3eIGQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Wed, 21 Jul 2021 12:32:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213579-215701-mIi6yZILsq@https.bugzilla.kernel.org/>
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

wse@tuxedocomputers.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |wse@tuxedocomputers.com

--- Comment #17 from wse@tuxedocomputers.com ---
Another affected device to add to the list: Tongfang GMxTGxx Barebone based
laptops.

Here however the pin is not LOCKED full, but only ACPI:

pin 57 (SLP_S0B) 44:INT34C6:00 mode 1 0x84000500 0x00000051 0x00000000 [ACP=
I]

Running Ubuntu, but with 5.14-rc2 mainline kernel from here:
https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.14-rc2/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
