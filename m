Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145ACC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 16 Jan 2022 15:43:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235499AbiAPPnl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 16 Jan 2022 10:43:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbiAPPnl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 16 Jan 2022 10:43:41 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 174CEC061574
        for <platform-driver-x86@vger.kernel.org>; Sun, 16 Jan 2022 07:43:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7A67860F6D
        for <platform-driver-x86@vger.kernel.org>; Sun, 16 Jan 2022 15:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0E0BC36AF7
        for <platform-driver-x86@vger.kernel.org>; Sun, 16 Jan 2022 15:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642347819;
        bh=wHrCrWYI8Cnolv5UFHMghtiNdqPoGaI2rPnEDpFjIms=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=PFz3ebMiAeRbS6xdxua9aXmwWccfvUrlLpavD/pHMCr+ZxwDuk4xMxc6d+gtiF7Fz
         rpLwuigNUbkOzOJBpi1YEcOf/EqHfs2CHYDzBmeNot5we16Gol+Gg/Z+U3wVpYue2s
         dlubEnqP5ceoxbwZ7u9bx+5y9E8DcOuAUCOLEy3AEWy3AJCdnpCEuF08b/1fUuDPFi
         89eXCiABMlxl8+nJkzSJpwLqTapK9H+nsBDauE4F81pshhOpJEAz4ITuZQee2mRnJr
         hXEfKX9B+Fq29mTS+7AHDhv3FmT8rpoTsIWRSqJkTUBwckYogMPTvqkhQ2XSViYfrz
         y5ypGJhuBhntQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CFE91CC13AE; Sun, 16 Jan 2022 15:43:39 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 16 Jan 2022 15:43:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: kernel@melin.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-wkLA93iXK8@https.bugzilla.kernel.org/>
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

Per Melin (kernel@melin.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kernel@melin.net

--- Comment #210 from Per Melin (kernel@melin.net) ---
One more board.

--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -5001,6 +5001,7 @@ static const char * const asus_wmi_boards[] =3D {
        "ROG STRIX X570-F GAMING",
        "ROG STRIX X570-I GAMING",
        "ROG STRIX Z390-E GAMING",
+       "ROG STRIX Z390-F GAMING",
        "ROG STRIX Z490-I GAMING",
        "TUF GAMING B550M-PLUS",
        "TUF GAMING B550M-PLUS (WI-FI)",

And it works.

[    8.534975] nct6775: Using Asus WMI to access 0xc1 chip.
[    8.535102] nct6775: Enabling hardware monitor logical device mappings.
[    8.535141] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290

nct6798-isa-0290
Adapter: ISA adapter
in0:                      648.00 mV (min =3D  +0.00 V, max =3D  +1.74 V)
in1:                      1000.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  =
ALARM
in2:                        3.38 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in3:                        3.36 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in4:                        1.01 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in5:                      176.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in6:                        0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
in7:                        3.38 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in8:                        3.12 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in9:                      528.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in10:                     584.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in11:                     512.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in12:                       1.06 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in13:                     296.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in14:                     560.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
fan1:                      481 RPM  (min =3D    0 RPM)
fan2:                      520 RPM  (min =3D    0 RPM)
fan3:                      435 RPM  (min =3D    0 RPM)
fan4:                      484 RPM  (min =3D    0 RPM)
fan5:                        0 RPM  (min =3D    0 RPM)
fan6:                      517 RPM  (min =3D    0 RPM)
fan7:                     4231 RPM  (min =3D    0 RPM)
SYSTIN:                    +28.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
CPUTIN:                    +32.5=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
AUXTIN0:                  -128.0=C2=B0C    sensor =3D thermistor
AUXTIN1:                   +17.0=C2=B0C    sensor =3D thermistor
AUXTIN2:                   +25.0=C2=B0C    sensor =3D thermistor
AUXTIN3:                   +53.0=C2=B0C    sensor =3D thermistor
PECI Agent 0 Calibration:  +32.5=C2=B0C=20=20
PCH_CHIP_CPU_MAX_TEMP:      +0.0=C2=B0C=20=20
PCH_CHIP_TEMP:              +0.0=C2=B0C=20=20
PCH_CPU_TEMP:               +0.0=C2=B0C=20=20
intrusion0:               OK
intrusion1:               ALARM
beep_enable:              disabled

acpitz-acpi-0
Adapter: ACPI interface
temp1:        +27.8=C2=B0C  (crit =3D +119.0=C2=B0C)

coretemp-isa-0000
Adapter: ISA adapter
Package id 0:  +45.0=C2=B0C  (high =3D +86.0=C2=B0C, crit =3D +100.0=C2=B0C)
Core 0:        +32.0=C2=B0C  (high =3D +86.0=C2=B0C, crit =3D +100.0=C2=B0C)
Core 1:        +33.0=C2=B0C  (high =3D +86.0=C2=B0C, crit =3D +100.0=C2=B0C)
Core 2:        +33.0=C2=B0C  (high =3D +86.0=C2=B0C, crit =3D +100.0=C2=B0C)
Core 3:        +45.0=C2=B0C  (high =3D +86.0=C2=B0C, crit =3D +100.0=C2=B0C)
Core 4:        +32.0=C2=B0C  (high =3D +86.0=C2=B0C, crit =3D +100.0=C2=B0C)
Core 5:        +33.0=C2=B0C  (high =3D +86.0=C2=B0C, crit =3D +100.0=C2=B0C)
Core 6:        +33.0=C2=B0C  (high =3D +86.0=C2=B0C, crit =3D +100.0=C2=B0C)
Core 7:        +32.0=C2=B0C  (high =3D +86.0=C2=B0C, crit =3D +100.0=C2=B0C)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
