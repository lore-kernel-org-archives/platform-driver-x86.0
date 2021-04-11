Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4472C433ED
	for <platform-driver-x86@archiver.kernel.org>; Sun, 11 Apr 2021 09:40:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8956361210
	for <platform-driver-x86@archiver.kernel.org>; Sun, 11 Apr 2021 09:40:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbhDKJk6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 11 Apr 2021 05:40:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:34740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235211AbhDKJk5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 11 Apr 2021 05:40:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E80FF6120B
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Apr 2021 09:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618134041;
        bh=fU3Y55phuoQafVmePd+QjHCPRBg0hz3ysuRdAlt/JTI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IyyMjbZjGRE0knWtxO3Bl1nqltcARUJqTQbNV/Cj5+IOJSIi5KPauVLZ6AFm5hEbM
         pq562+ywk5UWb+e11HEUDdjrzqxg2rP63LO2doqRM5BH+cKFUh9ey/Wy41Jfet9EkR
         EpoGVBFJ2xfW2NZuX0v7p7sh8ot7vnKrY+qnrTQv3Ucwe1zb5txKmXOuhexe7LsiX6
         NRkx90gKAMf3wVGAqvyIZfUM1z4zBNeGXAZ0GfIKJZsR0GJsy6k7a+AD7vg12KYECn
         kBwZN4oF3k+uoDrnkBIfW8Lxx8VuzqN7nCyNzjDYvcSobROQwa2tCuM4eiZCJwQbRg
         pVHwx0zw3nROw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 11 Apr 2021 09:40:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-Qd5xbTVWwU@https.bugzilla.kernel.org/>
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

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g

--- Comment #55 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Mateusz Jo=C5=84czyk from comment #54)
> For ASUS boards there exists a better driver:
>=20
> https://github.com/electrified/asus-wmi-sensors

Interesting I wonder why that has not been submitted upstream. I'll open an
issue at its github page for that.

> so there is probably no reason to implement direct access to nct6775.
>=20
> Are there any benefits from implementing access to nct6775 as outlined ab=
ove?

No, that was just meant as a possible solution for the reported problem. I
agree that using the WMI interface, which presumably is what Asus' Windows
tools use, is better.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
