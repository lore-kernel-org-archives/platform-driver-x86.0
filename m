Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9E9C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat, 25 Sep 2021 15:37:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF2356135A
	for <platform-driver-x86@archiver.kernel.org>; Sat, 25 Sep 2021 15:37:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343802AbhIYPis (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 25 Sep 2021 11:38:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:59896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238418AbhIYPis (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 25 Sep 2021 11:38:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7F9C16128A
        for <platform-driver-x86@vger.kernel.org>; Sat, 25 Sep 2021 15:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632584233;
        bh=ACq5UXi48z5/IRxEQCqw1fMe12OX9JPaTifOWei58qY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NpWyLYKZBF6yMYZjYfdaF8izCo96vrz5hiRbrso8MoD/T2SJJvID9Vw0wdo6SGRhq
         IzA6ct9A/WM2JgR6RGrhjHGHjdURg9C1NOaopsdScNz8VyrH9ItX/WDJy2MtGwrSyy
         CGD8XRAup02s5/2lDZcBsR9QbNTLWU7xkiGKAWDV41pWDctPHKzQD5BYiwjh4xakL4
         TY3cKkkudmeKUUEKSwr4PYC082BrianHk94WeyrtbRXjON61JsCxx+Z3tow6aGS9uE
         0tLaeGFZUUx/69OWkWmgm+zGjh4JA3BZiWhQWMEMGPutmx+SfO1CWqgRD+Lnjplcrk
         f0ZiWFNpK7APg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 25 Sep 2021 15:37:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: kpietrzak@disroot.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-wz3F1snMdj@https.bugzilla.kernel.org/>
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

--- Comment #130 from Kamil Pietrzak (kpietrzak@disroot.org) ---
(In reply to Denis Pauk from comment #128)

> @Kamil Pietrzak Could you please check that scale applied to your board
> correctly?

I confirm voltages defined in "static const u16 scale_in_z490[15]" are appl=
ied
correctly to my motherboard "TUF GAMING Z490-PLUS (WI-FI)".

Motherboard "TUF GAMING Z490-PLUS (WI-FI)" is using Nuvoton NCT6798D Super =
I/O,
so probably all motherboards that use same Nuvoton chip may benefit from th=
ose
new voltage scaling factors.
Maybe variable "static const u16 scale_in_z490" could have some more generic
name related to NCT6798D.
Here I have to admit that I figured out those voltage scaling factors by try
and error (to match voltages to those shown in Asus software on Windows), c=
ause
I could not find Nuvoton NCT6798D documentation on Nuvoton website.

Also I think it is probaby safe to add motherboard "TUF GAMING Z490-PLUS" to
supported boards, case as far as I know the only difference between "TUF GA=
MING
Z490-PLUS" and "TUF GAMING Z490-PLUS (WI-FI)" is Intel Wi-Fi 6 AX201 chip on
the latter.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
