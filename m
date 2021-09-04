Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A07C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 10:48:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C43B60FD7
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 10:48:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235572AbhIDKtg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Sep 2021 06:49:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:37736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234482AbhIDKte (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 06:49:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5FBD4610E5
        for <platform-driver-x86@vger.kernel.org>; Sat,  4 Sep 2021 10:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630752513;
        bh=eoI0hdEEhjV9wbmFWV6p8bXJahIm51qBSAutRbmN40U=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=vJUsB6VOmpCicF53kuVJyZ08SLfSB7QnFKMH5LPg25/UgTAboqlsi7WUROPV+lsqr
         9UFR8WR1+bNfKegSdwz61glz6gr2rrd3+uhrzLg/QtT7Z14nmz9s4k5rWSLNojv2Ud
         JzpijcVmApib9+uZJsOxA08/0bJxTz51bM/wZcPtPEundQsTz/c062iyX0046N/D7I
         viUHiblLNsRk8mJapXfykZodXCY+nYPYMcSuSo3L99YBMdszkK966GUuHRgECzPT0Q
         Lhg7nuDrWbJotco0i+s0+qmN/hu8RN3ajc92N4VagY5uFZXl8EvLyYBEeyyQqVw4vn
         Y3EEqjioluzBA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 04 Sep 2021 10:48:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: to.eivind@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-3Hql7Axz1Z@https.bugzilla.kernel.org/>
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

to.eivind@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |to.eivind@gmail.com

--- Comment #87 from to.eivind@gmail.com ---
(In reply to Denis Pauk from comment #85)
> Created attachment 298539 [details]
> POC: Add support for access via Asus WMI to nct6775 by board name detect
>=20
> I have added only small list of board names(/sys/class/dmi/id/board_name),
> could you add yours and check?
>=20
> P.S.: I have not checked with real devices.

Thank you all for your great work.

I added my board "ROG STRIX B550-F GAMING (WI-FI)" and added patch against
5.14.1-arch1-1 BIOS 2423 08/10/2021.

$ dmesg | grep nct6775
[    6.878846] nct6775: Found NCT6798D or compatible chip at 0x0:0x290
[    6.879018] nct6775: Using Asus WMI to access chip

$ sensors
nct6798-isa-0000
Adapter: ISA adapter
in0:                      472.00 mV (min =3D  +0.00 V, max =3D  +1.74 V)
in1:                      1000.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  =
ALARM
in2:                        3.38 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in3:                        3.33 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in4:                      1000.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  =
ALARM
in5:                      960.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in6:                      280.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in7:                        3.36 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in8:                        3.33 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in9:                      904.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in10:                     304.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in11:                       1.02 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in12:                       1.02 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in13:                     408.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in14:                     304.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
fan1:                      714 RPM  (min =3D    0 RPM)
fan2:                      776 RPM  (min =3D    0 RPM)
fan3:                      708 RPM  (min =3D    0 RPM)
fan4:                      870 RPM  (min =3D    0 RPM)
fan5:                        0 RPM  (min =3D    0 RPM)
fan6:                        0 RPM  (min =3D    0 RPM)
fan7:                        0 RPM  (min =3D    0 RPM)
SYSTIN:                    +28.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
CPUTIN:                    +35.5=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
AUXTIN0:                   +82.5=C2=B0C    sensor =3D thermistor
AUXTIN1:                   +49.0=C2=B0C    sensor =3D thermistor
AUXTIN2:                   -60.0=C2=B0C    sensor =3D thermistor
AUXTIN3:                   +78.0=C2=B0C    sensor =3D thermistor
PECI Agent 0 Calibration:  +35.5=C2=B0C=20=20
PCH_CHIP_CPU_MAX_TEMP:      +0.0=C2=B0C=20=20
PCH_CHIP_TEMP:              +0.0=C2=B0C=20=20
PCH_CPU_TEMP:               +0.0=C2=B0C=20=20
intrusion0:               ALARM
intrusion1:               ALARM
beep_enable:              disabled


Would be very, very nice if someone has the knowledge to make this acceptab=
le
for upstream.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
