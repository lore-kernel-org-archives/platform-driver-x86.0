Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 979B6C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 22:05:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B4DF6322C
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 22:05:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbhKPWI1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 Nov 2021 17:08:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:42552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231587AbhKPWI1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 Nov 2021 17:08:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 93EC863246
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Nov 2021 22:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637100329;
        bh=70f6Lgy8Qbyb1LoaTlMiQ7rAk+ni59JshA3x3XukCyY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=B3094twhXBiYJuagpt3PjBxij8H2cJP0bnqrGicHgjcDJubdOWaR0TW/Egsz9Xdd5
         sJ/bYQ7dPHGxIiUzNUC/8vNrBakapEh7nhhSDcrhNuNLjhP4f69D5RrgqczXz821Zb
         l2YpE3B+WIWPkK0fnvuBo/8TnL7v2E3kHF3XkYgqaWGE0+Dj5lF3jBzel+iSYBiVjl
         mn0xTwQHLMsj03E2lPZuPtgktFDkMegmexGCO1zerfDUt075vzi1yME5lgWtuo6YZe
         b9cJLXRsSrpImnMJk+Do3UgIBB1Gww7Dl1uGf1xYi6hOKG5kD3LnCg04xCYNHu3cVl
         agSWeMRY2Xk5A==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 16 Nov 2021 22:05:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: gregory.duhamel@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-BqxXwTshpB@https.bugzilla.kernel.org/>
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

--- Comment #172 from Gregory Duhamel (gregory.duhamel@gmail.com) ---
Hello Guys,

uname -a=20=20
Linux 5.16.0-0.rc1.20211115git8ab774587903.14.vanilla.1.fc35.x86_64 #1 SMP
PREEMPT Tue Nov 16 12:36:08 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux

sensors
nct6798-isa-0290
Adapter: ISA adapter
in0:                        1.20 V  (min =3D  +0.00 V, max =3D  +1.74 V)
fan1:                      883 RPM  (min =3D    0 RPM)
fan2:                      596 RPM  (min =3D    0 RPM)
fan3:                      820 RPM  (min =3D    0 RPM)
fan6:                     1081 RPM  (min =3D    0 RPM)
SYSTIN:                    +31.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
CPUTIN:                    +37.5=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
AUXTIN0:                   +26.0=C2=B0C    sensor =3D thermistor
AUXTIN1:                  +127.0=C2=B0C    sensor =3D thermistor
AUXTIN2:                  +109.0=C2=B0C    sensor =3D thermistor
AUXTIN3:                   +23.0=C2=B0C    sensor =3D thermistor
PECI Agent 0 Calibration:  +37.5=C2=B0C
[...]


Thanks a lot everyone ! Special though to Denis and everyone contributing.

Regards,
Gregory.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
