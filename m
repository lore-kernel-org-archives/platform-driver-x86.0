Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F16E4C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jan 2022 18:21:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344603AbiAKSVB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jan 2022 13:21:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344629AbiAKSVA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jan 2022 13:21:00 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1035EC06173F
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2022 10:21:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A2617616D0
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2022 18:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11D26C36AF9
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2022 18:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641925259;
        bh=viiaJqtdkhwEyQG7Ub/bSeWbji5XSoWCQW8NR1dTDAo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=UbGJO1MCjrCLSyOAim1Ry9PGgaJNvTLP/WCHtWX3m5l89DQmTKvs1XZbPjDqG0JIf
         g+F94D++NwSBzgsE1t1Mwb0TvD/yqFHMrpvSCdKchSg8C3/G5+uB6znXE5Xl4E9tuu
         iy3RdHj5JK+ReybDnVrQ/GVp0Ydo9nzlFFukiVnh/EC1si7zjAd61a1CDQLQYYMvbX
         0atrXKjFARy+OiPqFmHuWP/RTkVZUZ9gIyITnwFdEmBm9TSYUwu0pEbyMH6W64QQu7
         h6PRBBOdwWtiASN+XAhZIVhH3ggBE4SZZX8ZCD+TF6agncImQ3ceV+9Q7svcR7M5DI
         fm+uz55pgrIWw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id F3958C05FD5; Tue, 11 Jan 2022 18:20:58 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 11 Jan 2022 18:20:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jonfarr87@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-1UXiSD0Dv0@https.bugzilla.kernel.org/>
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

--- Comment #209 from Jonathan Farrugia (jonfarr87@gmail.com) ---
(In reply to Denis Pauk from comment #205)
> Created attachment 300253 [details]
> Asus WMI for nct6775 v5.16 base (2022.01.11)
>=20
> (In reply to Jonathan Farrugia from comment #204)
> > cat /sys/class/dmi/id/board_name=20
> > PRIME B550M-A
> (In reply to Gregory P. Smith from comment #202)
> > The "Pro B550M-C" as mentioned in #c70 also appears to need to be in a
> list.
> >=20
> > $ cat /sys/class/dmi/id/board_name=20
> > Pro B550M-C
> >=20
> >
> https://www.asus.com/us/Motherboards-Components/Motherboards/CSM/Pro-B550=
M-C-
> > CSM/
>=20
> Could you check with updated patch?


Just tried the patch. The chip is being detected correctly and readings are=
 the
same as with Kernel 5.14.21.

nct6798-isa-0290
Adapter: ISA adapter
in0:                       +0.39 V  (min =3D  +0.00 V, max =3D  +1.74 V)
in1:                       +1.01 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in2:                       +3.44 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in3:                       +3.33 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in4:                       +1.02 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in5:                       +1.05 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in6:                       +1.01 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in7:                       +3.44 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in8:                       +3.38 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in9:                       +0.92 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in10:                      +0.52 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in11:                      +0.52 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in12:                      +1.03 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in13:                      +1.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in14:                      +1.01 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
fan1:                     1347 RPM  (min =3D    0 RPM)
fan2:                     1279 RPM  (min =3D    0 RPM)
fan3:                        0 RPM  (min =3D    0 RPM)
fan7:                        0 RPM  (min =3D    0 RPM)
SYSTIN:                    +23.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
CPUTIN:                    +28.5=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
AUXTIN0:                   +25.5=C2=B0C    sensor =3D thermistor
AUXTIN1:                   +23.0=C2=B0C    sensor =3D thermistor
AUXTIN2:                   +23.0=C2=B0C    sensor =3D thermistor
AUXTIN3:                   +26.0=C2=B0C    sensor =3D thermistor
PECI Agent 0 Calibration:  +28.5=C2=B0C=20=20
PCH_CHIP_CPU_MAX_TEMP:      +0.0=C2=B0C=20=20
PCH_CHIP_TEMP:              +0.0=C2=B0C=20=20
PCH_CPU_TEMP:               +0.0=C2=B0C=20=20
intrusion0:               ALARM
intrusion1:               ALARM
beep_enable:              disabled


If I may ask, will this work be integrated into 5.16.x patches?

Thanks :)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
