Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5911AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Dec 2021 23:01:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359463AbhLFXEq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Dec 2021 18:04:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353673AbhLFXEq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Dec 2021 18:04:46 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30702C061746
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Dec 2021 15:01:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DDA6CB811E6
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Dec 2021 23:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0AA9C341ED
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Dec 2021 23:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638831674;
        bh=TYhMzClhi/d8bk2p1GRTgNmq9sIowuhZxLfrjRiZ6YI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DKaejCyH4zT9wX+UYGhxbRriPNd+XO9SvQA63+6pcSTZo6JctBZ+J7ibsGqcCDkmQ
         fMmwMIUiSEuML2hHGlZ/O0N35kABQ73FzzwFxnqSje44Rp8llOoXqzDPNsO4Poxgvg
         npaY3KKh3MDHzgIHO3t5CgcBSkzvNGa9tX8HkuCEhIBj+2DL6dSeIk5aG2hckj/9V+
         FY4gTMUObQtd/iajsEph/4AcQ6Q8yq0b76UyRm3jYpRXSBH/XomX9vAioXZux99UUh
         dZvhQ8Ke2FvUPs+8MsyKeU4LOGmNkaiqbPraqHHvSM6V1frzbwqIKrc//okE1gM7jR
         Dc6TF4FlzxseA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 9D589611F0; Mon,  6 Dec 2021 23:01:14 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 06 Dec 2021 23:01:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mikhail.v.gavrilov@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-204807-215701-oncgmtOW4A@https.bugzilla.kernel.org/>
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

--- Comment #190 from Mikhail (mikhail.v.gavrilov@gmail.com) ---
Created attachment 299921
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299921&action=3Dedit
Photo of FANs indication in BIOS (ROG STRIX X570-I GAMING) (

(In reply to Denis Pauk from comment #186)
> Patch is based on stable v5.15 kernel version. Could you check with v5.15
> kernel version from kernel.org.

Thanks, I beginning see CPU FAN RPM.

$ sensors
iwlwifi_1-virtual-0
Adapter: Virtual device
temp1:        +55.0=C2=B0C=20=20

amdgpu-pci-0b00
Adapter: PCI adapter
vddgfx:      775.00 mV=20
fan1:           0 RPM  (min =3D    0 RPM, max =3D 3300 RPM)
edge:         +52.0=C2=B0C  (crit =3D +100.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +105.0=C2=B0C)
junction:     +54.0=C2=B0C  (crit =3D +110.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +115.0=C2=B0C)
mem:          +56.0=C2=B0C  (crit =3D +100.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +105.0=C2=B0C)
power1:       15.00 W  (cap =3D 255.00 W)

nvme-pci-0100
Adapter: PCI adapter
Composite:    +52.9=C2=B0C=20=20

hidpp_battery_0-hid-3-9
Adapter: HID adapter
in0:           4.06 V=20=20

nct6798-isa-0290
Adapter: ISA adapter
in0:                      976.00 mV (min =3D  +0.00 V, max =3D  +1.74 V)
in1:                      1000.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  =
ALARM
in2:                        3.41 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in3:                        3.36 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in4:                      992.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in5:                      656.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in6:                      424.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in7:                        3.41 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in8:                        3.36 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in9:                      912.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in10:                     328.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in11:                     544.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in12:                       1.04 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in13:                     464.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in14:                     368.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
fan1:                        0 RPM  (min =3D    0 RPM)
fan2:                      847 RPM  (min =3D    0 RPM)
fan5:                        0 RPM  (min =3D    0 RPM)
fan7:                        0 RPM  (min =3D    0 RPM)
SYSTIN:                    +46.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
CPUTIN:                    +48.5=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
AUXTIN0:                   +66.5=C2=B0C    sensor =3D thermistor
AUXTIN1:                   +46.0=C2=B0C    sensor =3D thermistor
AUXTIN2:                   +21.0=C2=B0C    sensor =3D thermistor
AUXTIN3:                   +67.0=C2=B0C    sensor =3D thermistor
PECI Agent 0 Calibration:  +53.0=C2=B0C=20=20
PCH_CHIP_CPU_MAX_TEMP:      +0.0=C2=B0C=20=20
PCH_CHIP_TEMP:              +0.0=C2=B0C=20=20
PCH_CPU_TEMP:               +0.0=C2=B0C=20=20
intrusion0:               ALARM
intrusion1:               ALARM
beep_enable:              disabled

k10temp-pci-00c3
Adapter: PCI adapter
Tctl:         +63.4=C2=B0C=20=20
Tccd1:        +53.8=C2=B0C=20=20
Tccd2:        +48.0=C2=B0C=20=20

ucsi_source_psy_0_00081-i2c-0-08
Adapter: Synopsys DesignWare I2C adapter
in0:           0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
curr1:         0.00 A  (max =3D  +0.00 A)

For unknown reason  RPM of PCH FAN and RPM of HS FAN which displayed in BIOS
didn't reading by driver. It's normal?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
