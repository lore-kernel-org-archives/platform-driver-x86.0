Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B06C25B08
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Aug 2022 20:26:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbiHTU0p (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 20 Aug 2022 16:26:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbiHTU0o (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 20 Aug 2022 16:26:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED17927FC2
        for <platform-driver-x86@vger.kernel.org>; Sat, 20 Aug 2022 13:26:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 817A260C58
        for <platform-driver-x86@vger.kernel.org>; Sat, 20 Aug 2022 20:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCB89C43141
        for <platform-driver-x86@vger.kernel.org>; Sat, 20 Aug 2022 20:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661027202;
        bh=ekhvEScwKgicVgrTPWVztrIKJ0LNc/SizrgsM8cXC04=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=S3QD0BoAbiEG8vDO4djaI6lBGGHqwybcJoTe25VEcaDoGHRVptqrWVCtUTAdx0Xd6
         I851AddD8xv9S1YFk0T1Rui4LXAgO3Lv9yKnb1UH4UmBplUHHgcnh+D5BG4Cj+3kIy
         YbSbDJ/Bvybc7YTAbmS4UQLWHnrjj0IoUiIjOLLfq/kveygIgl6yuJ2GsoYCyvcuTs
         jTITgz9TS/l1L5hF3nmOtkpVm+mdvHRAcsdi1JjzaFnfyJHzzus1rT85uQ2ZRtI5o4
         8x1FPX/N7/tEEZ3hb1m9JpSslN02gQ21XxBOJ6pgHWe9W3OR4T/QDezCPUELec9qYd
         +6SsYRc8d3Tlw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CDE99C433E6; Sat, 20 Aug 2022 20:26:42 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 20 Aug 2022 20:26:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: renedis@hotmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-cUlL69JSnI@https.bugzilla.kernel.org/>
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

--- Comment #255 from renedis (renedis@hotmail.com) ---
Thanks all! With kernel 5.17 it didn't worked without manually patching. I'=
ve
skipped kernel 5.18 but can confirm that kernel 5.19 works OOTB:

nct6798-isa-0290
Adapter: ISA adapter
in0:                      664.00 mV (min =3D  +0.00 V, max =3D  +1.74 V)
in1:                        1.01 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in2:                        3.28 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in3:                        3.36 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in4:                      992.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in5:                      832.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in6:                      240.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in7:                        3.28 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in8:                        3.22 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in9:                      496.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in10:                     608.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in11:                     592.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in12:                     1000.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  =
ALARM
in13:                     232.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in14:                     376.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
fan1:                     2235 RPM  (min =3D    0 RPM)
fan2:                     2224 RPM  (min =3D    0 RPM)
fan3:                        0 RPM  (min =3D    0 RPM)
fan4:                        0 RPM  (min =3D    0 RPM)
fan5:                        0 RPM  (min =3D    0 RPM)
fan6:                        0 RPM  (min =3D    0 RPM)
SYSTIN:                    +35.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
CPUTIN:                    +33.5=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
AUXTIN0:                   +91.0=C2=B0C    sensor =3D thermistor
AUXTIN1:                   +15.0=C2=B0C    sensor =3D thermistor
AUXTIN2:                   +16.0=C2=B0C    sensor =3D thermistor
AUXTIN3:                   +75.0=C2=B0C    sensor =3D thermistor
PECI Agent 0 Calibration:  +32.0=C2=B0C=20=20
PCH_CHIP_CPU_MAX_TEMP:      +0.0=C2=B0C=20=20
PCH_CHIP_TEMP:              +0.0=C2=B0C=20=20
PCH_CPU_TEMP:               +0.0=C2=B0C=20=20
intrusion0:               OK
intrusion1:               ALARM
beep_enable:              disabled

Kernel:
5.19.0-051900-generic


Many thanks again!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
