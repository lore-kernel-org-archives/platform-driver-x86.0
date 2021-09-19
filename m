Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D04C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun, 19 Sep 2021 07:31:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E52560F48
	for <platform-driver-x86@archiver.kernel.org>; Sun, 19 Sep 2021 07:31:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234105AbhISHcf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 19 Sep 2021 03:32:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:34678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232832AbhISHcc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 19 Sep 2021 03:32:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id F0D646128E
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Sep 2021 07:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632036667;
        bh=+qnpjM0AKXWw8yElq/G+hDs55vyHvONUua+g6ghL7TQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fizeRiOYKKjPD7ITEFsiV1yr4WkxtCITcXEmEu/kvAMSFNXTZBLs6i32N9qafv8hh
         AdeT3tq9zetiwQcGueAS4CUaLHV9JQAt5d1ZarkBoVIMjUkS6qJfG/RaLfum/DS8Bu
         Mg2ceYSLrlx2PKvKXAbOnAB0plfPmU8f3v4DvXWb/WiRaRibtPYWM+X3GENijmDlQM
         kl3GNQan46bmIyRgTr00/v8tbA2baDewy6QzI3om+nq6J1/mnETNhfwyOUcRrLpTfl
         +lPF3L0/G48nEbmWyWhFIskVKXFKeqYBkbw4L20weznMg3Pdah53yWCftpkZQvU+OB
         HO3tA6J8gTLcw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 19 Sep 2021 07:31:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: kdudka@redhat.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-vWj6YseUqq@https.bugzilla.kernel.org/>
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

--- Comment #118 from Kamil Dudka (kdudka@redhat.com) ---
Thanks!  I confirm the patch works for me with ASUS PRIME B360-PLUS and
linux-5.14.5 after adding the board on the white-list:

--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -4986,6 +4986,7 @@ static int __init nct6775_find(int sioaddr, struct
nct6775_sio_data *sio_data)
 static struct platform_device *pdev[2];

 static const char * const asus_wmi_boards[] =3D {
+   "PRIME B360-PLUS",
    "PRIME B460-PLUS",
    "ROG CROSSHAIR VIII DARK HERO",
    "ROG CROSSHAIR VIII HERO",


# sensors nct6796-isa-0290
nct6796-isa-0290
Adapter: ISA adapter
Vcore:                    376.00 mV (min =3D  +0.00 V, max =3D  +1.74 V)
in1:                        1.02 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
AVCC:                       3.46 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
+3.3V:                      3.42 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in4:                        1.03 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in5:                      144.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in6:                      120.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
3VSB:                       3.46 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
Vbat:                       3.22 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in9:                        1.05 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in10:                     152.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in11:                     128.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in12:                     136.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in13:                     120.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in14:                     136.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
fan1:                     1073 RPM  (min =3D    0 RPM)
fan2:                     1214 RPM  (min =3D    0 RPM)
fan3:                        0 RPM  (min =3D    0 RPM)
fan4:                        0 RPM  (min =3D    0 RPM)
fan5:                        0 RPM  (min =3D    0 RPM)
fan6:                        0 RPM  (min =3D    0 RPM)
fan7:                        0 RPM  (min =3D    0 RPM)
SYSTIN:                    +28.0=C2=B0C  (high =3D +98.0=C2=B0C, hyst =3D +=
95.0=C2=B0C)  sensor =3D
thermistor
CPUTIN:                    +33.5=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
AUXTIN0:                  +111.0=C2=B0C    sensor =3D thermistor
AUXTIN1:                  +118.0=C2=B0C    sensor =3D thermistor
AUXTIN2:                  +117.0=C2=B0C    sensor =3D thermistor
AUXTIN3:                  +118.0=C2=B0C    sensor =3D thermistor
PECI Agent 0:              +37.0=C2=B0C  (high =3D +98.0=C2=B0C, hyst =3D +=
95.0=C2=B0C)
                                    (crit =3D +100.0=C2=B0C)
PECI Agent 0 Calibration:  +32.0=C2=B0C=20=20
PCH_CHIP_CPU_MAX_TEMP:      +0.0=C2=B0C=20=20
PCH_CHIP_TEMP:              +0.0=C2=B0C=20=20
intrusion0:               ALARM
intrusion1:               ALARM
beep_enable:              disabled

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
