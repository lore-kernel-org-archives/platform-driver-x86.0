Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A978FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 19 Sep 2021 11:52:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AC9B61360
	for <platform-driver-x86@archiver.kernel.org>; Sun, 19 Sep 2021 11:52:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbhISLxo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 19 Sep 2021 07:53:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:57576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231443AbhISLxo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 19 Sep 2021 07:53:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 561FE61352
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Sep 2021 11:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632052339;
        bh=HFhaR2aPoMEVroGoWAClvq3NJapXi9+/LQggYUV4eb4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=GsLGZ6F7DwmsCAUehKk+wIrtWotD/Whpt48EluEsFi5wsEwXBdcVM+HgK6K8xPJQa
         G6MHZXhSP/qlnGD0PDSCVCsPT6YMR3duNKCoF2SZVTY2AKq9xBdfadPLlgB4FtIF/1
         puNURJLZHZA53kdff/dok3nRBhEmAKXKk8ycg6AZDxo0MkJ+/iLDA2TH3Cy3kGoJ0Z
         LPYu90I09+T3niOgfZYvdbzPs8KTwSXpM166MG8735odCNoXcQWRpz9I/Exairrb++
         ZlaoLH2Rt8CoKhhys7iOxhp6z34cTlzWigsyDgYD5cOsmYQWeLwCey/YpHGAObk3I9
         YEYahGq5IObvQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 19 Sep 2021 11:52:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-QZHdNOAndA@https.bugzilla.kernel.org/>
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

--- Comment #120 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to nutodafozo from comment #119)
> does this patch change how kernel reads the sensor values (e.g. to that
> buggy asus wmi interface) or

The underlying module/driver which reads sensors data is the same and this
patch doesn't touch it.

> it merely sets specifically for nct67 module what
> "acpi_enforce_resources=3Dlax" does?

Exactly.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
