Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3673C46467
	for <platform-driver-x86@archiver.kernel.org>; Sat,  7 Jan 2023 20:57:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232416AbjAGU5N (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 7 Jan 2023 15:57:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbjAGU5M (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 7 Jan 2023 15:57:12 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2B3343E48
        for <platform-driver-x86@vger.kernel.org>; Sat,  7 Jan 2023 12:57:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7E04D60C06
        for <platform-driver-x86@vger.kernel.org>; Sat,  7 Jan 2023 20:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2E01C433F0
        for <platform-driver-x86@vger.kernel.org>; Sat,  7 Jan 2023 20:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673125030;
        bh=aDN9LweX+G3YfgaKm0sGcyXCTF1xqonndcPSt4FKwjg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ct/9RAi7ayO6ef0LPOey/nAWWBISzPK58KIdX6qmBwCBnfLNheJRMDz+N6A0589rb
         4F4ysZgwC+8plfMjGafmltgAdxsNkRGkAHfxnd7F0jO5SIziCcL/Hi4LGvVbdg8thQ
         6dif5QHvp3UzZk2LniGcAQwuCK/keYgaBlEhGQewPNvmgDieVjK+BdF1NJBvEYBvIe
         N6LSp4ETLR6cPltUQcpLLhlBVDneDiJg+sGXFiUgyZoXX1FhWMLC3mQywNNVc6dmAp
         rCRsFaSqMH9q7csaid8aDdIeRo+g6Pp5/G/0gvpB1DZ43VaQaT9yw/9hbtw+fV3GNZ
         MefgXhAdrXlyg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D2C51C43143; Sat,  7 Jan 2023 20:57:10 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 07 Jan 2023 20:57:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jeroen@beerstra.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-eqqtbfMXHK@https.bugzilla.kernel.org/>
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

--- Comment #282 from Jeroen Beerstra (jeroen@beerstra.org) ---
Looks good to me:

$ sensors
k10temp-pci-00c3
Adapter: PCI adapter
Tctl:         +64.0=C2=B0C=20=20
Tccd1:        +35.4=C2=B0C=20=20
Tccd2:        +35.1=C2=B0C=20=20

nct6799-isa-0290
Adapter: ISA adapter
in0:                        1.37 V  (min =3D  +0.00 V, max =3D  +1.74 V)
in1:                      1000.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  =
ALARM
in2:                        3.39 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in3:                        3.34 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in4:                        1.02 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in5:                        1.03 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in6:                      752.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in7:                        3.39 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in8:                        3.30 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in9:                        1.67 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in10:                     560.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in11:                     560.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in12:                       1.03 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in13:                     496.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in14:                     424.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
fan1:                      755 RPM  (min =3D    0 RPM)
fan2:                      819 RPM  (min =3D    0 RPM)
fan3:                      712 RPM  (min =3D    0 RPM)
fan4:                        0 RPM  (min =3D    0 RPM)
fan5:                      674 RPM  (min =3D    0 RPM)
fan7:                        0 RPM  (min =3D    0 RPM)
SYSTIN:                    +31.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
CPUTIN:                    +36.5=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
AUXTIN0:                   +39.5=C2=B0C    sensor =3D thermistor
AUXTIN1:                   +19.0=C2=B0C    sensor =3D thermistor
AUXTIN2:                   +20.0=C2=B0C    sensor =3D thermistor
AUXTIN3:                   +73.0=C2=B0C    sensor =3D thermistor
PECI Agent 0 Calibration:  +54.0=C2=B0C=20=20
PCH_CHIP_CPU_MAX_TEMP:      +0.0=C2=B0C=20=20
PCH_CHIP_TEMP:              +0.0=C2=B0C=20=20
PCH_CPU_TEMP:               +0.0=C2=B0C=20=20
TSI0_TEMP:                 +64.5=C2=B0C=20=20
intrusion0:               ALARM
intrusion1:               ALARM
beep_enable:              disabled

amdgpu-pci-0e00
Adapter: PCI adapter
vddgfx:        1.34 V=20=20
vddnb:         1.01 V=20=20
edge:         +41.0=C2=B0C=20=20
PPT:          55.25 W=20=20

Linux beerstra 6.1.4-1.el9_1.beerstra.x86_64 #1 SMP PREEMPT_DYNAMIC Sat Jan=
  7
19:36:39 CET 2023 x86_64 x86_64 x86_64 GNU/Linux

The patch didn't apply cleanly to 6.1.4 though, but that is because some bo=
ards
were already included. Voltages seem off though.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
