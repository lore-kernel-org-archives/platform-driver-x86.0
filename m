Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_ABUSE_SURBL,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55960C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Sep 2021 00:19:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2914061261
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Sep 2021 00:19:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbhIOAVI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Sep 2021 20:21:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:58544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229520AbhIOAVI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Sep 2021 20:21:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 44D676121F
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Sep 2021 00:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631665190;
        bh=kthOmCghUSsCeLJvKxsuH5mICS4/zZystQWz0F7bcag=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lfHmGvHRDzCnL6B8zyIMdU3vHENv9knjQ3OdKS6ewROD1DarKhwfScuo//kDfIoP3
         MW3vdINPA5DNauGN3F3EmGWMHteDjR/MFNlnRLzkpZnEsGDzlPa4lA22ZdgeV9VqOZ
         snI3F0oB8BvsXQTaiQaZfklCXIdOlZnP1YqrAR8ClDd0XCdHOP3r6Kp+EWKoKhUJU+
         SxQCzqAdylc7+1GGRUkjqsp7jjNQu4O29iF4pqkBWq3IaT+lfj1Ah1l84HRKp30vCf
         qb+UaU3v/h7ud1t/Sd+B+OaVOG5vpJ1m6WjFTO6MEk7nz+udWb5hV+8IsmQ3aOMcY7
         BJkGQzIO11vbQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 15 Sep 2021 00:19:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sefoci9222@rerunway.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-dgDxVqcDF1@https.bugzilla.kernel.org/>
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

--- Comment #112 from sefoci9222@rerunway.com ---

please add:


cat /sys/class/dmi/id/board_name

ROG STRIX X570-F GAMING


can confirm latest debug.diff is working, many thanks:


Now follows a summary of the probes I have just done.
Just press ENTER to continue:=20

Driver `nct6775':
  * ISA bus, address 0x290
    Chip `Nuvoton NCT6798D Super IO Sensors' (confidence: 9)

Driver `k10temp' (autoloaded):
  * Chip `AMD Family 17h thermal sensors' (confidence: 9)

Do you want to overwrite /etc/sysconfig/lm_sensors? (YES/no):=20
Unloading i2c-dev... OK

-

Sep 15 01:55:35 desk kernel: nct6775: Using Asus WMI to access 0xc1 chip.
Sep 15 01:55:35 desk kernel: nct6775: Found NCT6798D or compatible chip at
0x2e:0x290

Sep 15 02:02:41 desk systemd[1]: Starting Hardware Monitoring Sensors...
Sep 15 02:02:41 desk kernel: nct6775: Using Asus WMI to access 0xc1 chip.
Sep 15 02:02:41 desk kernel: nct6775: Found NCT6798D or compatible chip at
0x2e:0x290
Sep 15 02:02:41 desk systemd[1]: Finished Hardware Monitoring Sensors.

-

[root@desk testM]# sensors
amdgpu-pci-0700
Adapter: PCI adapter
vddgfx:      950.00 mV=20
fan1:         835 RPM  (min =3D    0 RPM, max =3D 3200 RPM)
edge:         +39.0=C2=B0C  (crit =3D +91.0=C2=B0C, hyst =3D -273.1=C2=B0C)
power1:       44.15 W  (cap =3D 277.00 W)

nct6798-isa-0290
Adapter: ISA adapter
in0:                      888.00 mV (min =3D  +0.00 V, max =3D  +1.74 V)
in1:                      992.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in2:                        3.38 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in3:                        3.30 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in4:                        1.02 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in5:                      960.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in6:                      256.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in7:                        3.38 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in8:                        3.33 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in9:                      904.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in10:                     480.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in11:                     496.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in12:                       1.03 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in13:                     344.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in14:                     256.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
fan1:                      678 RPM  (min =3D    0 RPM)
fan2:                      575 RPM  (min =3D    0 RPM)
fan3:                     1050 RPM  (min =3D    0 RPM)
fan4:                      738 RPM  (min =3D    0 RPM)
fan5:                        0 RPM  (min =3D    0 RPM)
fan6:                        0 RPM  (min =3D    0 RPM)
SYSTIN:                    +28.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
CPUTIN:                    +33.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
AUXTIN0:                   +86.0=C2=B0C    sensor =3D thermistor
AUXTIN1:                   +28.0=C2=B0C    sensor =3D thermistor
AUXTIN2:                   +26.0=C2=B0C    sensor =3D thermistor
AUXTIN3:                   +91.0=C2=B0C    sensor =3D thermistor
PECI Agent 0 Calibration:  +33.5=C2=B0C=20=20
PCH_CHIP_CPU_MAX_TEMP:      +0.0=C2=B0C=20=20
PCH_CHIP_TEMP:              +0.0=C2=B0C=20=20
PCH_CPU_TEMP:               +0.0=C2=B0C=20=20
intrusion0:               ALARM
intrusion1:               ALARM
beep_enable:              disabled

k10temp-pci-00c3
Adapter: PCI adapter
Tctl:         +32.6=C2=B0C=20=20
Tdie:         +32.6=C2=B0C=20=20
Tccd1:        +39.5=C2=B0C

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
