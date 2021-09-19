Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6255EC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 19 Sep 2021 14:38:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3985C61362
	for <platform-driver-x86@archiver.kernel.org>; Sun, 19 Sep 2021 14:38:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232546AbhISOkN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 19 Sep 2021 10:40:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:41108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231920AbhISOkN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 19 Sep 2021 10:40:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0EB4861352
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Sep 2021 14:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632062328;
        bh=M/mja7gnFAtPiJsOLCWiQYjblcrXWEEM3jTxeILm980=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=m2o9I2m8sI6rzvbjemV3CISv2uGj3MwqxsGllYmMN/+5+yHRbhMiCZJ2KRY7LLi4X
         ErjTVpGvZwVxs9ya5cMxfuL0buN+lrYgmErm4EONdqhYL+NOIniCZfuSnvucMFH1DE
         rq9thONgyGD99UlnbXyV4o98GwMxo8KTVPBpT9Z6Y/0FKm1aVw+nP9m/RDdTwR2n6i
         dAM3g/Wexp7+Ci7qlk5BZQmLzWMyTAf4VKMKjgOb2m8wfk9TKJby2Q+WPMO0dA+0Z9
         qnuD8vRsS+7lEbqTYodiTGh474XVDlhB+BhEPcyDrSQWE80iMTiQNJOaSK271zZTJm
         KAtE3nKQ8RVfQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 19 Sep 2021 14:38:47 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-lLZQGKf7ko@https.bugzilla.kernel.org/>
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

Kamil Pietrzak (kpietrzak@disroot.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kpietrzak@disroot.org

--- Comment #122 from Kamil Pietrzak (kpietrzak@disroot.org) ---
I confrm patch works on my "TUF GAMING Z490-PLUS (WI-FI)".

[1295150.017048] nct6775: Found NCT6798D or compatible chip at 0x0:0x290

nct6798-isa-0000
Adapter: ISA adapter
in0:                      835.00 mV (min =3D  +0.00 V, max =3D  +1.94 V)
in1:                        5.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in2:                        3.38 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in3:                        3.33 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in4:                       12.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in5:                      784.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in6:                      1000.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  =
ALARM
in7:                        3.38 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in8:                        3.12 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in9:                        1.06 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in10:                       1.36 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in11:                     960.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in12:                       1.04 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in13:                     1000.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  =
ALARM
in14:                       1.02 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
fan1:                      369 RPM  (min =3D    0 RPM)
fan2:                      389 RPM  (min =3D    0 RPM)
fan3:                      398 RPM  (min =3D    0 RPM)
fan4:                        0 RPM  (min =3D    0 RPM)
fan5:                        0 RPM  (min =3D    0 RPM)
fan6:                        0 RPM  (min =3D    0 RPM)
fan7:                        0 RPM  (min =3D    0 RPM)
SYSTIN:                    +30.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
CPUTIN:                    +33.5=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
AUXTIN0:                   +26.0=C2=B0C    sensor =3D thermistor
AUXTIN1:                    +7.0=C2=B0C    sensor =3D thermistor
AUXTIN2:                   +28.0=C2=B0C    sensor =3D thermistor
AUXTIN3:                   +25.0=C2=B0C    sensor =3D thermistor
PECI Agent 0 Calibration:  +32.5=C2=B0C=20=20
PCH_CHIP_CPU_MAX_TEMP:      +0.0=C2=B0C=20=20
PCH_CHIP_TEMP:              +0.0=C2=B0C=20=20
PCH_CPU_TEMP:               +0.0=C2=B0C=20=20
intrusion0:               OK
intrusion1:               ALARM
beep_enable:              disabled


I also noticed that some voltage values reported by nct6775 differs from the
ones reported by Asus software on Windows.

I changed voltage scaling factors to those listed below and now voltages are
reported like on Asus software on Windows.

/*
 * Some of the voltage inputs have internal scaling, the tables below
 * contain 8 (the ADC LSB in mV) * scaling factor * 100
 */
static const u16 scale_in[15] =3D {
        888, 4000, 1600, 1600, 9600, 800, 800, 1600, 1600, 1600, 1600, 1600,
800,
        800, 800
};

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
