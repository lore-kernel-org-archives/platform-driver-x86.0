Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C03C4320A
	for <platform-driver-x86@archiver.kernel.org>; Fri, 30 Jul 2021 06:06:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85A7A60F9B
	for <platform-driver-x86@archiver.kernel.org>; Fri, 30 Jul 2021 06:06:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237168AbhG3GGg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 30 Jul 2021 02:06:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:33936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230282AbhG3GGd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 30 Jul 2021 02:06:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8EEAC61057
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Jul 2021 06:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627625189;
        bh=5yFBS3tlt8s4UGkYD9laE/b5UwLp/FphUz3ijaKlWPo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qO+HFZwbyJE28Xcs7jLu5jfeEefLfkxVllRHevlcYhaTe+gl0xHr/dg8rx9+iCv7x
         H/YQ8mWxHq0FTL7KD4w4ESZ1s/HAUwT0w5jybUmEKuxNoW/x/AB4hekRRBt8l7ksvH
         YMOkpmGN1w7zMSSD5ztcW7s05/Y8k2xPymIea/izfkGpFR+2s98rwgueHGvM+dKTjA
         /FV1zBGqkh95oXZG/i7EDBZ0VBS0L5egUmNRdWUNjhmGWgNUrpdtjuxHxkGYsyR3sC
         kFjADChjv7CWNQzObPNGDuVlrTF63kJOy8s886xuZtserVbIYNK4XaZtYHFDEUjc3g
         0Bv7uDtiLyeig==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 30 Jul 2021 06:06:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-ZUFOn8wDgG@https.bugzilla.kernel.org/>
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

--- Comment #80 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Bernhard Seibold from comment #79)
> (In reply to Gregory Duhamel from comment #78)
> > Is there any chance this patch reach upstream ? Thanks a lot Guys !
>=20
> I submitted the patch, but it was rejected and I don't intend to continue
> working on it, sorry.
>=20
> https://www.spinics.net/lists/linux-hwmon/msg11260.html

To be honest I have no evidence it was rejected, rather additional work is
needed. This is standard practice in OSS projects, especially big ones like
kernel to reshape patch(es) a few times when it will satisfy all parties.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
