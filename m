Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7CEEC3DA7D
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Jan 2023 19:25:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238944AbjACTZy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Jan 2023 14:25:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239130AbjACTZi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Jan 2023 14:25:38 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E128314037
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 Jan 2023 11:22:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A1840B810F2
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 Jan 2023 19:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55022C433B0
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 Jan 2023 19:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672773753;
        bh=xDP1hwXS5fMAP78S9KHKARa4hhNXUobHdBbXGTXtHF0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mnMmj1WZgVPLII5+n02USCPB9on5MxXzkHSNx5f87OvSVAx56JtNTw8TX7Pceap3T
         XE9UZmJmyRrBEf8aQUiccLJnBIFlPlZxa6y3Br0nL019px+HYEOtWtHLONhRHglHCF
         FyqO5l9619tutECcsYs7giQf/8GQYa3giY6iEH9A+cPwAU41ZKpRQWla1PmRMEKM+y
         eFtp+Za29oanJ6DaSN7CQbWiPnx7uwZdcS88CjVn/CKXfGa4XmllkYmMU8FWSjeEKA
         zjZEtv0xDkZZcq9ECZIOz2tDn3TEQn7bqogXF2aHI2T3Fyp6oXwxcM1cb5H+Ykf2K8
         3ySQpIR9eRJkQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4125DC43141; Tue,  3 Jan 2023 19:22:33 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 03 Jan 2023 19:22:31 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-XuCg3dBQdu@https.bugzilla.kernel.org/>
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

Jeroen Beerstra (jeroen@beerstra.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jeroen@beerstra.org

--- Comment #280 from Jeroen Beerstra (jeroen@beerstra.org) ---
(In reply to Denis Pauk from comment #278)

I was succesfull in enabling the monitoring for my Asus X670-P motherboard =
on
kernel 6.1.2 running on Almalinux. First of all I added my board to DMI sec=
tion
of you r patch and second I added it to asus_wmi_sensors. The patch didn't
apply fully though on ML linux but manually editing nct6775-platform was
trivial for me (I just needed to add Asus X670-P to the list and didn't bot=
her
to sort out the differences in the list from the patch and linux 6.1.2). I
still need to modprobe nct6775 and lmsensors doesn't detect my sensors OOTB.
But the module loads cleanly and I see sensors readings :)

nct6799-isa-0290
Adapter: ISA adapter
in0:                        1.21 V  (min =3D  +0.00 V, max =3D  +1.74 V)
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
in6:                      784.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in7:                        3.39 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in8:                        3.30 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in9:                        1.67 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in10:                     560.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in11:                     552.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in12:                       1.03 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in13:                     496.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in14:                     424.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
fan1:                      681 RPM  (min =3D    0 RPM)
fan2:                      512 RPM  (min =3D    0 RPM)
fan3:                      639 RPM  (min =3D    0 RPM)
fan7:                        0 RPM  (min =3D    0 RPM)
SYSTIN:                    +30.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
CPUTIN:                    +34.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
AUXTIN0:                   +38.0=C2=B0C    sensor =3D thermistor
AUXTIN1:                   +19.0=C2=B0C    sensor =3D thermistor
AUXTIN2:                   +20.0=C2=B0C    sensor =3D thermistor
AUXTIN3:                   +73.0=C2=B0C    sensor =3D thermistor
PECI Agent 0 Calibration:  +35.5=C2=B0C
PCH_CHIP_CPU_MAX_TEMP:      +0.0=C2=B0C
PCH_CHIP_TEMP:              +0.0=C2=B0C
PCH_CPU_TEMP:               +0.0=C2=B0C
TSI0_TEMP:                 +46.4=C2=B0C
intrusion0:               ALARM
intrusion1:               ALARM
beep_enable:              disabled

Not all is correct (for example one of the 2 case fans is missing from the
list) but at least I'm getting somewhere, thanx! :)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
