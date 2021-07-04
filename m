Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977B1C07E95
	for <platform-driver-x86@archiver.kernel.org>; Sun,  4 Jul 2021 09:45:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7528D6144E
	for <platform-driver-x86@archiver.kernel.org>; Sun,  4 Jul 2021 09:45:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbhGDJrw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 4 Jul 2021 05:47:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:39954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229476AbhGDJrv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 4 Jul 2021 05:47:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 78867613FB
        for <platform-driver-x86@vger.kernel.org>; Sun,  4 Jul 2021 09:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625391916;
        bh=CZm/oOIhXlJkW545zgGReOoG5/f8vK0mVKlyXZGWkZg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bfnJZz4JAbPPF6dgz8MeLz3kuVc+nbY8bx72act2RHLh2eM4Xdv1ZHkyzVNY8VByV
         bzvm3ES0Le+mtZGsvQmmCO55ZYhm5gzoXow8ZSnpVlWS6oIPF8qyJP+xxYu92m13YI
         pS1fPdKAhlLMLhwiuAtk+vPzoEWlCuK6yC7hGBJq6crDfgYlBy0dA8/aQB8ZyfWvP/
         tGqEZ0ok+qolEIBsqRZWoGN+CN2rQbTmJuSs1vTqm5b4TkULWWn0tLMe+TpehuQOjL
         61g25hIzBL+iZJ4PdyqIhAFIJwXkNpNz04HFsN5s+npVyTBL6MazUqzbrplb11fEak
         k4/iSpuU8hf1g==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 04 Jul 2021 09:45:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: me@rebtoor.com
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-56Yd2xDFu9@https.bugzilla.kernel.org/>
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

Vittorio Roberto Alfieri (me@rebtoor.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |me@rebtoor.com

--- Comment #77 from Vittorio Roberto Alfieri (me@rebtoor.com) ---
(In reply to Bernhard Seibold from comment #75)
> Created attachment 296645 [details]
> Add support for access via Asus WMI to nct6775 (Rev 2)
>=20
> Here's an updated patch that also accesses the Super-I/O ports via WMI.
> Please note that it also adds an ACPI resource check for that IO region. =
So
> it might actually make the driver work on less hardware, although that ch=
eck
> should probably have been there in the first place.

Hi,
I can confirm that this patch works for me too.=20

dmesg |grep nct6775
[   43.723698] nct6775: Found NCT6798D or compatible chip at 0x0:0x290
[   43.723890] nct6775: Using Asus WMI to access chip

sensors nct6798-* | head -2
nct6798-isa-0000
Adapter: ISA adapter

mobo: ASUS ROG STRIX B550-F GAMING (WI-FI) - bios version 2403
kernel: 5.13.0 (patched)

Thanks Bernhard!

Have a nice sunday everyone.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
