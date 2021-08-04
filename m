Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D7CC4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Aug 2021 12:12:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF52A60F41
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Aug 2021 12:12:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236857AbhHDMMu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 Aug 2021 08:12:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:34318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235697AbhHDMMt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Aug 2021 08:12:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7259061004
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 Aug 2021 12:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628079157;
        bh=+n5GaKN6e9xX7V3WqaicQZXZqVR/5pupVbtlKlShgJ8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VTCXRWJYYV/TxRF14FOY1RZKRKYyRQcdlF3Mp0Uqen/+wpjz/S9A64xmxkj8XvUAf
         ShByZ6RmLdDszHamH3BCSXDTkbGbX9XGlAZMbEeNuOKUBhg9/qrZPKxQ43oeXtff8U
         BSf/Y4W+WGTMXv8tTl2Pj+L2szaNKzbaq04r5CMvm7fDv/e/Uw19AwpxV0y7NMlG0y
         Oqdt4J4c0wGVfqqDRNfUrgOuTp1r5QxgV2lJgNkKRoseGILIlAnIzXf7y4ic6wVTN7
         Y/ceZeNXh7R5qIdr3gznUE2Zo9TdjHT6S/uDC0Gcb9CtYUapjyr3Lk1huIq28FsynA
         nWcNIuLZT+lyA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Wed, 04 Aug 2021 12:12:36 +0000
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
Message-ID: <bug-213579-215701-Y7rY9CUKtl@https.bugzilla.kernel.org/>
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
                 CC|                            |lovesh.bond@gmail.com

--- Comment #55 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
*** Bug 213857 has been marked as a duplicate of this bug. ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
