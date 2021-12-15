Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4313C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Dec 2021 06:47:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236051AbhLOGro (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 15 Dec 2021 01:47:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236077AbhLOGro (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Dec 2021 01:47:44 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B17C061574
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Dec 2021 22:47:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7F3FD6184B
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Dec 2021 06:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6123C34609
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Dec 2021 06:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639550862;
        bh=RzTa60S8va7E7ly45arMmQuugz3w5SH1OlL3bfBLEdI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=i6izlKiDyN/lNpmpdQgH1b9Rz1RbgwYlwaCVgawXhpo8ahkRPHEcjdt2iAOG1fStr
         PMrcG0UZ+1e4xP8H2b9dwip1x9CaauKIbhYMt6XmhALawhhapxO5QklK2dt53jFpm4
         E3YeMhHKdUXusoikrTDjg+A9LTaRcuVECyMqB7hvCE79U0p/vA6qU0nVqnExK8xszE
         SUsgxlsHhpBXJyIqhdoSLmQpcAdyesckf3FAMVHqSLLxhDyRCyHHKFpE7NFSDutNKb
         YH5W0AXsitdYg0NEmOP+Zxp5Tpmba/QI7B5c5lexKTt41SIZymNiJbdj7p8PSRWA8U
         TFta80NKNQlww==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id CD72060F00; Wed, 15 Dec 2021 06:47:42 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 15 Dec 2021 06:47:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: vladdrako007@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-fLIInypXCc@https.bugzilla.kernel.org/>
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

--- Comment #200 from Vladdrako (vladdrako007@gmail.com) ---
(In reply to Denis Pauk from comment #199)
> Could check with updated patch?

Works fine.

sudo dmesg | grep wmi
[    7.943237] asus_wmi: ASUS WMI generic driver loaded
[    8.052769] asus_wmi: Initialization: 0x0
[    8.052805] asus_wmi: BIOS WMI version: 0.9
[    8.052863] asus_wmi: SFUN value: 0x0
[    8.052866] eeepc-wmi eeepc-wmi: Detected ASUSWMI, use DCTS
[    8.053621] input: Eee PC WMI hotkeys as
/devices/platform/eeepc-wmi/input/input13
sudo dmesg | grep nct6775
[    8.074613] nct6775: Can't read chip ID by Asus WMI.
[    8.074982] nct6775: Using Asus WMI mutex: \_SB_.PCI0.LPCB.SIO1.MUT0
[    8.075014] nct6775: Found NCT6776D/F or compatible chip at 0x2e:0x290
[    8.075056] nct6775: i2c have not found
sensors
coretemp-isa-0000
Adapter: ISA adapter
Package id 0:  +37.0=C2=B0C  (high =3D +80.0=C2=B0C, crit =3D +99.0=C2=B0C)
Core 0:        +37.0=C2=B0C  (high =3D +80.0=C2=B0C, crit =3D +99.0=C2=B0C)
Core 1:        +36.0=C2=B0C  (high =3D +80.0=C2=B0C, crit =3D +99.0=C2=B0C)
Core 2:        +37.0=C2=B0C  (high =3D +80.0=C2=B0C, crit =3D +99.0=C2=B0C)
Core 3:        +31.0=C2=B0C  (high =3D +80.0=C2=B0C, crit =3D +99.0=C2=B0C)

acpitz-acpi-0
Adapter: ACPI interface
temp1:        +27.8=C2=B0C  (crit =3D +105.0=C2=B0C)
temp2:        +29.8=C2=B0C  (crit =3D +105.0=C2=B0C)

nct6776-isa-0290
Adapter: ISA adapter
Vcore:         944.00 mV (min =3D  +0.00 V, max =3D  +1.74 V)
in1:             1.02 V  (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
AVCC:            3.41 V  (min =3D  +2.98 V, max =3D  +3.63 V)
+3.3V:           3.41 V  (min =3D  +2.98 V, max =3D  +3.63 V)
in4:             1.02 V  (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
in5:             2.04 V  (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
in6:           832.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
3VSB:            3.42 V  (min =3D  +2.98 V, max =3D  +3.63 V)
Vbat:            3.38 V  (min =3D  +2.70 V, max =3D  +3.63 V)
fan1:             0 RPM  (min =3D    0 RPM)
fan2:           856 RPM  (min =3D    0 RPM)
fan3:             0 RPM  (min =3D    0 RPM)
fan4:             0 RPM  (min =3D    0 RPM)
fan5:             0 RPM  (min =3D    0 RPM)
SYSTIN:         +27.0=C2=B0C  (high =3D  +0.0=C2=B0C, hyst =3D  +0.0=C2=B0C=
)  ALARM  sensor =3D
thermistor
CPUTIN:         +91.5=C2=B0C  (high =3D +81.0=C2=B0C, hyst =3D +76.0=C2=B0C=
)  ALARM  sensor =3D
thermistor
AUXTIN:         +64.5=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +75.0=C2=B0C=
)  sensor =3D thermistor
PECI Agent 0:   +36.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +75.0=C2=B0C)
                         (crit =3D +99.0=C2=B0C)
PCH_CHIP_TEMP:   +0.0=C2=B0C=20=20
PCH_CPU_TEMP:    +0.0=C2=B0C=20=20
PCH_MCH_TEMP:    +0.0=C2=B0C=20=20
intrusion0:    ALARM
intrusion1:    ALARM
beep_enable:   disabled

nvme-pci-0200
Adapter: PCI adapter
Composite:    +25.9=C2=B0C  (low  =3D  -0.1=C2=B0C, high =3D +69.8=C2=B0C)
                       (crit =3D +84.8=C2=B0C)
ERROR: Can't get value of subfeature temp2_min: I/O error
ERROR: Can't get value of subfeature temp2_max: I/O error
Sensor 1:     +37.9=C2=B0C  (low  =3D  +0.0=C2=B0C, high =3D  +0.0=C2=B0C)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
