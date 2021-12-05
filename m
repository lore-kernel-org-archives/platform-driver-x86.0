Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C3FC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Dec 2021 09:04:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232730AbhLEJHb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Dec 2021 04:07:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232713AbhLEJHb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Dec 2021 04:07:31 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E59AC061751
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 01:04:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D145160FCB
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 09:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E83EC341C9
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 09:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638695043;
        bh=apSoSEUNS1qPJmPOHRUgNUyswIOE86/PUgYLknDB6M4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=R4ZH2c8Bo5twNZbNGpM+k7xz0oucgu6X3b27u4hJobQAVWf/qGk8zIsgg245oisSb
         3ZoiDk9pnVYLFIYnwtdgdYolRR68h0HXKgxBZY560/tYIxi+/Kj4eAYHo5nP31GT8B
         wVBUjdq9liIyh7aA9QGn/j9LaXFzLNIwByWOYcimpyL/f0CjEJnp+T4czMKPVu9rDt
         stJ/OMomMCYDQHJKJRnjF7uGAvM+ehNG7GOK3p18dNV8HWk39tEGLz7aST7aGdoekX
         Vhhpy6fCzzp+V9THAA37JIXoWAuxsxEAehiGrQl/x1iiyDLE5Hz4yWT1R0mTBehOkn
         Bz9tQBORjdctg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 30542611C1; Sun,  5 Dec 2021 09:04:03 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 05 Dec 2021 09:04:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mikhail.v.gavrilov@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-Ss4mRe1REk@https.bugzilla.kernel.org/>
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

Mikhail (mikhail.v.gavrilov@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mikhail.v.gavrilov@gmail.co
                   |                            |m

--- Comment #174 from Mikhail (mikhail.v.gavrilov@gmail.com) ---
(In reply to Denis Pauk from comment #173)
> Created attachment 299757 [details]
> Rebased patch with i2c v5.15 28.11.2021
>=20
> Code have sent as part of https://lkml.org/lkml/2021/11/28/225 + i2c.

I see that my M/B "ROG STRIX X570-I GAMING" not listed in patch. And yes I
checked patch and can confirm that CPU FAN sensor monitoring still absent f=
or
my M/B with this patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
