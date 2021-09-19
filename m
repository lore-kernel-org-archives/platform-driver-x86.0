Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC17C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 19 Sep 2021 13:32:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E820761356
	for <platform-driver-x86@archiver.kernel.org>; Sun, 19 Sep 2021 13:32:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbhISNeQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 19 Sep 2021 09:34:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:51220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229948AbhISNeQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 19 Sep 2021 09:34:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D684261242
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Sep 2021 13:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632058370;
        bh=5EmHdswUWkN2t5Ljk4FAi6EeVDEDKG5jqeVHJwq9bWs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DHfFbdgUdDFwNUOZ1bgPEvFO5WKy+jXPGxN8R7VNUakGbfICK44o7gZO0QdK3IQvb
         uhWEq73Zmvarfs3CNx0tVTFl31FcRiEpSGmmud2UJm53z8egS7aWuUF5L6NaYsR5A3
         XUOIeyPN+MTbPS+oZ8SWOPsK45fGhieTko6B52z1XmjWPGkrnWM1L2wVZAoTMEMO0/
         Pdddc2v8cpv9yvoT7+bfmlcKrbdhMDLDk0U5bpDb+pmF7opreuqXx3UjVv+RMO8YBk
         HSLAl7m8z/ZZC764UBRqVw5B/q5SKktqlHkZZP/AHGunAlwZd1oaTn4cFapeOyxKnq
         cz9XbLmqqM/IA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 19 Sep 2021 13:32:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: robert@swiecki.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-ShgHLhdpXE@https.bugzilla.kernel.org/>
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

Robert Swiecki (robert@swiecki.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |robert@swiecki.net

--- Comment #121 from Robert Swiecki (robert@swiecki.net) ---
FYI, tested also with "ROG CROSSHAIR VIII FORMULA", works well.

[72758.077595] nct6775: Using Asus WMI to access chip
[72758.077637] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290

nct6798-isa-0290
Adapter: ISA adapter
in0:                      936.00 mV (min =3D  +0.00 V, max =3D  +1.74 V)
in1:                        1.01 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in2:                        3.39 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in3:                        3.31 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in4:                        1.74 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in5:                      592.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in6:                        1.08 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in7:                        3.39 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in8:                        3.31 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in9:                      912.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in10:                      80.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in11:                      96.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in12:                       1.02 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in13:                       1.34 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in14:                     904.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
fan1:                      422 RPM  (min =3D    0 RPM)
fan2:                      991 RPM  (min =3D    0 RPM)
fan3:                        0 RPM  (min =3D    0 RPM)
fan4:                        0 RPM  (min =3D    0 RPM)
fan5:                      626 RPM  (min =3D    0 RPM)
fan6:                        0 RPM  (min =3D    0 RPM)
fan7:                        0 RPM  (min =3D    0 RPM)
SYSTIN:                    +35.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
CPUTIN:                    +38.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
AUXTIN0:                   +22.0=C2=B0C    sensor =3D thermistor
AUXTIN1:                  +104.0=C2=B0C    sensor =3D thermistor
AUXTIN2:                   +98.0=C2=B0C    sensor =3D thermistor
AUXTIN3:                   +31.0=C2=B0C    sensor =3D thermistor
PECI Agent 0 Calibration:  +39.0=C2=B0C=20=20
PCH_CHIP_CPU_MAX_TEMP:      +0.0=C2=B0C=20=20
PCH_CHIP_TEMP:              +0.0=C2=B0C=20=20
PCH_CPU_TEMP:               +0.0=C2=B0C=20=20
intrusion0:               ALARM
intrusion1:               ALARM
beep_enable:              disabled

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
