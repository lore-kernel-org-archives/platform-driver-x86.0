Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC2EC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Nov 2021 22:59:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B23C461267
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Nov 2021 22:59:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234104AbhKJXCD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 10 Nov 2021 18:02:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:37682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233906AbhKJXCA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 Nov 2021 18:02:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 40F5861268
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Nov 2021 22:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636585152;
        bh=DBnNnZXwlN4t4y/O9RX6VSIgmwNQEPI8xUwLGgu+dPE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mVSpY2zkOyFhk2n0c7QgUsapY+sgTnzlA+mSkQ3y9hElUBkbpC6dhFqDA8x8vpryZ
         DsAWqpwcYkKQwyu6Xk6/9btY4ecrHWj4k9WaMG/IPTqIal891qg4dDeuNnoN8r1ojL
         IHoUGGSN/YZNUC19rWBxEl4LWV2FtFqo4Hy67H9xWIVSzh0vesSz2zSLFpDD5SXAlc
         s1wHSxnEZTv5dApMuCifoRmdtKTQkXrHtWsT5f0uyoUkgzsXw621OfruZsEpJ4S7nE
         kVOqhr5pA6QyA6emE9/DIIPMoj+WKYTSbgyFJadSOIXfSVM1/YNjHfZlgFO5y0n3LX
         okTlPFd6N/AEA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 10 Nov 2021 22:59:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: olli.asikainen@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-01bTQ7n3OC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #167 from Olli Asikainen (olli.asikainen@gmail.com) ---
(In reply to Denis Pauk from comment #163)
> Created attachment 299517 [details]
> Rebased patch with all asus_* drivers and i2c 11.11.2021

Thank you Denis!

A small correction for MAXIMUS VII HERO, the board name is actually "MAXIMUS
VII HERO" not "ROG MAXIMUS VII HERO".

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
