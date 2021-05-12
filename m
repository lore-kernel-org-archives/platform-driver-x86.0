Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DF1C43462
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 May 2021 15:10:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB765619F1
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 May 2021 15:10:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233210AbhELPMB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 May 2021 11:12:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:41568 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233663AbhELPKA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 May 2021 11:10:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id F12296162A
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 May 2021 15:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620831765;
        bh=1Ll5vfHofsToVuIVascTlcKiD6UMIPE/UGSKyV/KEdE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dbe1dVauL7xh8OJNIZiPOwFLyKXYktsDJBz7dTa3QgzBX9b/T0BRPmSDLsEXZDzo2
         2K7gM9CZ+qqJa2Ms5IeAnLWw9RXL5nss4lUmZ+lJJxyMP7ZZvlkoWuBpk77MB4LbZP
         K7grb5hSij/dopyvLTql/DAbr+nuUnfTN7gYTWPOCPrFHXGTPwUF/bIfQcv4sAHdEi
         UebD3ZGKC0m4oYoWDaUMd9P8Vkyhk+z6jDGfWuecJx0JAbTpSxgswgZo0fvBrcTQU/
         XVM1hh6EreRgKEoMtM1+9Vly9RQE643EDQ9i4VbZPxZvbMi99bS7R7cWbXs+GBoy2X
         h7IWEy2/2tOwQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213029] [5.12 Regression] clock_gettime() a lot slower with
 Hyper-V clocksource driver
Date:   Wed, 12 May 2021 15:02:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mhkelley@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213029-215701-2zmdsXBpKb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213029-215701@https.bugzilla.kernel.org/>
References: <bug-213029-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213029

Michael Kelley (mhkelley@outlook.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mhkelley@outlook.com

--- Comment #1 from Michael Kelley (mhkelley@outlook.com) ---
And I was trying to be so clever. :-(  I see that Vitaly Kuznetsov has post=
ed a
patch to fix this.

One thing: The commit that causes the problem was first available in 5.13-R=
C1.=20
But your problem statement above says that you see the problem with 5.12. C=
an
you confirm? The 5.12 release doesn't have the problematic commit.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
