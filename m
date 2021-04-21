Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEADC433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Apr 2021 17:09:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04F7961463
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Apr 2021 17:09:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237674AbhDURJs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Apr 2021 13:09:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:39732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237525AbhDURJs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Apr 2021 13:09:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E83526145A
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Apr 2021 17:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619024954;
        bh=jvqgPeIaqMcqB4ySzYHs2vC2H2k3T0JeSzAKiWX6IRI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VEnVduaBnWlGVnOIYetMzau1qGzgw68wMHKuDd4ycIMwRg2g2EF2JITEWUpewi4/V
         V80/j1bjNjFndWOkFXW2S2vZmfgd7mWWN56Rauv3KgZ+yhNr1hcbz2CipnRrweNYZe
         Z4JDFGcU8KiGFA0xTvT3kwQhQhv/Aw1RIy6txncJQ84igRSLsVAzY6N3K5qcrHFAXg
         84UaptZnEfcfPtkSimvURuiEGxFj9rKyRCdY4I5OLWppnfXhuyvToq/z6tknb83ZZd
         GI2liZWpFWliEJY0p79VfPUHnaofZS7f6L5kbLXVegQuW1inJYuluGIGEAPs/NpDw3
         pkkz4JXvj4RyQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 21 Apr 2021 17:09:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: doomwarriorx@gmail.com
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-204807-215701-8nlAEbSyti@https.bugzilla.kernel.org/>
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

doomwarriorx@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |doomwarriorx@gmail.com

--- Comment #70 from doomwarriorx@gmail.com ---
Created attachment 296451
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296451&action=3Dedit
acpidump for Pro B550-C

can confirm the issue with ASUS System Product Name/Pro B550M-C, BIOS 0214
10/22/2020

The bug still exists if asus_wmi & eeepc_wmi is blacklisted. Does the acpi_=
wmi
still claim the address space even if no consumer/driver is available?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
