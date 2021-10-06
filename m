Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08626C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Oct 2021 11:08:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D767C611B0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Oct 2021 11:08:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237931AbhJFLKA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Oct 2021 07:10:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:36296 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237836AbhJFLKA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Oct 2021 07:10:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 25145611C6
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 Oct 2021 11:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633518488;
        bh=VAZwOJAKeklnxL7BH8CqaIZuW4fNG9pIW+tXb5tVKXE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=K+WuN6ZbWFWcvznAt77Zjtqo5v8rKZapeBkU57PlfD8asEQEZu5kY8uqC5noQbYVS
         Ox0UtxDEMlcPRPFKXcIhl/B3abJEfvGHVS55WBPPguzUJGSLTW4afk5SRECy2qrXM3
         l1EaILJVZmyZ9kNLtFJKvbq0crBlFJFRYgsfWUH7meFhjLWdo+nzI4DrINOKSjjxhY
         k9MgUYWVyNCC0VZuF7fDz3+ED8K0YF2x8vZ82nkbtKm02RDmcq11iDUEItYgSgXW1m
         nsb64HnNXUHM7mlDFejtQYM7ymgzZQVMFiNIWGnmx1ZtZ7qFHGl5bscYOLl3LDcFD0
         K+2nxAmBbTWRw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 06 Oct 2021 11:08:07 +0000
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
Message-ID: <bug-204807-215701-ww2Sy35HpD@https.bugzilla.kernel.org/>
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

--- Comment #138 from Kamil Pietrzak (kpietrzak@disroot.org) ---
(In reply to Kamil Pietrzak from comment #137)
> With regard to current voltage scaling factors for nct6798d chip, they are
> most likely not correct and probably will require future changes. For
> example I can't see +12V and +5V is sensors output when using current
> voltage scalling factors.

Partially responding to my own comment here.

Due to the lack of publicly available documentation for NCT6798D chip I che=
cked
docs for similar chips (NCT6791D, NCT6791D).

Looks like voltages like +12V and +5V can be connected to any one of general
purpose voltage inputs on the SuperIO chip. So on one motherboard +12V can =
be
connected to pin VIN0, but on another one with same SuperIO chip it can
possibly be connected to other general purpose voltage pin like VIN1, VIN2,
VIN3 etc. In that case it will not be possible to properly scale these volt=
ages
without hardcoding motherboard models in module code, so scaling should take
place in userspace apps like lm_sensors. The only voltages that can be safe=
ly
scaled in module code are Vcore, AVSB, 3VCC, 3VSB, VBAT. Pins to which they=
 are
connected should not change between different motherboards. So it looks like
current voltage scaling factors are as accurate as it can be without hardco=
ding
motherboards models.

However, I am still curious about Vcore voltage readings on my TUF Z490 boa=
rd
in BIOS and Asus software. According to docs Vcore should be calculated with
formula=20

Detected Voltage =3D Reading * 0.008 V

but Asus in BIOS and in their software on Windows calculate it probably with
some additional scaling factor, most likely something like

Detected Voltage =3D Reading * 0.008 V * 1.11

The only reason that comes to my mind for calculating Vcore in that way is =
that
they (Asus) wanted BIOS/software Vcore readings to be more accurate in rela=
tion
to voltage readings using for example multimeter near the CPU socket.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
