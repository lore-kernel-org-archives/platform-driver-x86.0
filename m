Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F258C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun,  7 Nov 2021 10:52:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D20D619A6
	for <platform-driver-x86@archiver.kernel.org>; Sun,  7 Nov 2021 10:52:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234380AbhKGKzV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 7 Nov 2021 05:55:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:38440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232174AbhKGKzV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 7 Nov 2021 05:55:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 0595661458
        for <platform-driver-x86@vger.kernel.org>; Sun,  7 Nov 2021 10:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636282359;
        bh=vFdFxbwFELl8NtR6xMCzD45DSj2Q+ZOioglptQkW2OM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=uHPZbHDg1t24RgFfFFbgM/+uFOA1wz8yxViP7ZKwi6muLGYNnW4OjkjVZhLj3VAgX
         KSmBYxcPHoaTMkwHaou5fkDML8DxUrZqwRaJuip807FOaLVRDVwEWasrwPl7KGw49O
         FRVG+iRRXDear+kn74k/7T4nVlERlXsrii8I8C4y1YJwOtZ9b+kvsrqSgX0iV/XsgA
         FvMr7zmXe1pEW2pa9+o8xlr6Fx9Sd1kLu9Fu5nAqKUmZ7tAwt8nxel7Jy3UqGHGEAh
         jS/v/tMRth1b6sw2gK4ZQqzpraMZBG5o04BYfAjBd5cyu3A+1dl6TQ7/WZSk/EOrbL
         V4qfXnkoZaliQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 07 Nov 2021 10:52:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pauk.denis@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-204807-215701-nS0ODXfG9p@https.bugzilla.kernel.org/>
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

Denis Pauk (pauk.denis@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #299159|0                           |1
        is obsolete|                            |

--- Comment #159 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 299483
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299483&action=3Dedit
Check MAXIMUS_VII_HERO by lock mutex directly

(In reply to Olli Asikainen from comment #151)
> Created attachment 299459 [details]
> acpidump -b -n DSDT

Could you check with updated patch? It has only nct6798d part and only for
check idea.

As I see by your logs and dsdt - all call returned just zero and DSDT does =
not
have RSIO/WRIO methods.

Could you please check with patch?

(In reply to Eugene Shalygin from comment #154)
> (In reply to Olli Asikainen from comment #153)
> > Yeah, it's old and suffers from the same bug, but I reckon supporting t=
his
> > would be a completely different story. Thanks for your answer Eugene and
> > sorry for the noise.
>=20
> This firmware seem to be using ACPI mutex named \_SB_.PCI0.LPCB.SIO1.MUT0=
 to
> guard access to the nct chip registers.
>=20
> I wonder, can we rely on these mutexes, whose names seem to be quite stab=
le,
> as well, instead of the WMI functions? Then accessing nct registers would
> become simpler: lock ACPI mutex if needed, access registers always in the
> regular way, unlock the mutex.

It looks as different for different boards, B550-E uses
"\\_SB.PCI0.SBRG.SIO1.MUT0" as mutex name.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
