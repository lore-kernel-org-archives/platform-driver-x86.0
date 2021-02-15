Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D849C433E0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Feb 2021 11:14:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4656664DF4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Feb 2021 11:14:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbhBOLOP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 15 Feb 2021 06:14:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:46126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229652AbhBOLOP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Feb 2021 06:14:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 9724A64DF4
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Feb 2021 11:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613387614;
        bh=SXYzQ1fBUZvvz30hwAbr2fI/S9O29Vf4cGfOZ12kB8Y=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=sQ0mtVKMp8JENhqpiHeXwCRZqgd++eswL7PVM+LROXWAChdfuJQOKVyzqY+lm2kcC
         t/9ZPSzohdLSkfV2FYlA03S278kDyyzfecICLvAm8i9ubyXp6SMe+sKFh0e6clOXmh
         KrCZFk4Ov5NbxJognFfgnTbtF8fVvPOphVuP+qGub7Lb2CAoO8n9G32xkQqTpdgfGx
         so7NUw5XGsn71C8bo6/aBtUHKndFPxWHSDLFD/aIqTvK1Oh3f5cPjtJ9DD8mOthYNA
         N3tEHiwFNvHkyscIs2KkD2PjTro+75rlDFbisX3lFOG09Jo6/bGdr3bxHmRxzQM+iQ
         xmChrWuyCG1ow==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 192831] acer_wmi spamming logs with iio-sensor-prox Could not
 open input accel Operation not permitted
Date:   Mon, 15 Feb 2021 11:13:34 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-192831-215701-s8ivsRuOCx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-192831-215701@https.bugzilla.kernel.org/>
References: <bug-192831-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D192831

Andy Shevchenko (andy.shevchenko@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |andy.shevchenko@gmail.com

--- Comment #1 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
What kernel version is it?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
