Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEDD3C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Nov 2021 22:15:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 948B060F70
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Nov 2021 22:15:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhKBWR6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Nov 2021 18:17:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:35728 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229900AbhKBWR4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Nov 2021 18:17:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3C8A160F70
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Nov 2021 22:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635891321;
        bh=9eJnllGAEXVyCVV6lz3iHh/JOGo/yCrJNmMqB1jDEv0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=up6mhZpy+/J0dICObPGSvUKtAXvdp9lizbCKIWB09ch0pEHsk2KuKumX7XI8ys79y
         lTFkXcYof4Qzqqsk8d0F9ZYOHk16/JAcr/kNvfGTMdaCoQDdndEkjs9iFWKSceKwzA
         bI/V35r8Y/+HoCILAax6ecztQbvYLwiJHvS4BpOwLwNmSLNLklk9xvKUu+AYGtGuR1
         eRPVoy9o+SlfWAJez7mNdZnMyt1Za6EcnttF68KcL+J6jHDDFDQCGsoAQXfqYbawi+
         4h1p2Nb06N79JBdVu+GTga/aiBM6iZkSqt3zmwgXs0K7zp8qIDXeWA3P7bm/4q0aqP
         KEzSc4ucMm3jw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: platform backlight device not working
Date:   Tue, 02 Nov 2021 22:15:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johannes.penssel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214899-215701-FxsPs5NFa3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214899-215701@https.bugzilla.kernel.org/>
References: <bug-214899-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

--- Comment #16 from Johannes P (johannes.penssel@gmail.com) ---
(In reply to Andy Shevchenko from comment #12)
> (In reply to Johannes P from comment #11)
> > Still nothing but grave silence from the brightness keys though.
>=20
> Which might be a sign that the key presses are handled by some
> microcontroller (EC?) with a custom firmware and being delivered to the OS
> in different way. It's also possible that the WMI can be used but these
> events have to be enabled somehow (obviously with ACPI methods or so).

This is something that came to my mind as well. The keyboard backlight on t=
his
machine works in a similar way: It seems to be entirely handled by the EC,
because it is in no way exposed to the OS, but can be toggled at any time, =
even
during boot/shutdown/restart.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
