Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6325C678D4
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Mar 2023 22:05:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbjCBWF5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Mar 2023 17:05:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbjCBWFx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Mar 2023 17:05:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E22D7DAA
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Mar 2023 14:05:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C5C77616C6
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Mar 2023 22:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 309D5C4339B
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Mar 2023 22:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677794751;
        bh=TSzQiWL/oRR2EkrBMVUZtrgPxfTnL8DYjdwY0B7SJ7U=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Q4ZrGI9clvLhAPhDvqnuyw0RicI1M66wPk/7KF5cwlLp5Lx4fAs0D6pAGLy/K0iIE
         Vt//tQ9VPLGuRPlx3CGJaVUftBdqd+Y77ZKw+YM8XKAhKpfEeBj7z594akFByjdxeu
         3Hsi2QkJPqLkVWxyx7O8Hc+lkT/YG9CckrToLUZpuQUjphdDEE5LH9fCPa+XNiPOgo
         aDfEMotykDP5T1DXhgA5jKu+VDjpg23vxj2qwAVb+8swAfU9subVzjbIiNSLrQ7TLG
         DGN9KlbdFAF5fH1PpzarBL8bAKcYMPMer9rzA08plOKAL1XCK2TjkIPASLLGojkzpg
         tLVkDsip+p+8g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 21CF0C43143; Thu,  2 Mar 2023 22:05:51 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 02 Mar 2023 22:05:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mischief@offblast.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-204807-215701-xjqbr3PVaB@https.bugzilla.kernel.org/>
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

Nick Owens (mischief@offblast.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mischief@offblast.org

--- Comment #302 from Nick Owens (mischief@offblast.org) ---
Created attachment 303833
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303833&action=3Dedit
proart-x670e-dmi.patch

hi denis,

i've tested patch for 6.1.8
(https://bugzilla.kernel.org/show_bug.cgi?id=3D204807#c290) against gentoo =
6.1.12
kernel on ProArt X670E-CREATOR WIFI. seems to work ok.

i attached a patch to put this board in asus_wmi_info_table, as this also
appears to make the module load automatically with a modalias. for the mute=
x, i
checked my DSDT and acpi_board_SBRG_MUTEX seems to exist there, but i am ve=
ry
much a novice in kernel programming so i am unsure if this is correct. if it
helps i can attach my DSDT for this board.

i would very much like for this to be included in a future kernel, so if i =
can
help further let me know.

here is my sensor reading.

mischief@beast:~ $ dmesg|grep nct6775
[    6.678325] nct6775: Found NCT6799D or compatible chip at 0x2e:0x290
mischief@beast:~ $ sensors nct6799-*
nct6799-isa-0290
Adapter: ISA adapter
in0:                        1.34 V  (min =3D  +0.00 V, max =3D  +1.74 V)
in1:                      1000.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  =
ALARM
in2:                        3.39 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in3:                        3.31 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in4:                        1.01 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in5:                        1.01 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in6:                        1.15 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in7:                        3.39 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in8:                        3.30 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in9:                        1.66 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in10:                     528.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in11:                     528.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in12:                       1.02 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in13:                       1.28 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in14:                       1.23 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
fan1:                        0 RPM  (min =3D    0 RPM)
fan2:                      849 RPM  (min =3D    0 RPM)
fan3:                      841 RPM  (min =3D    0 RPM)
fan4:                        0 RPM  (min =3D    0 RPM)
fan5:                        0 RPM  (min =3D    0 RPM)
fan6:                        0 RPM  (min =3D    0 RPM)
fan7:                        0 RPM  (min =3D    0 RPM)
SYSTIN:                    +37.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
CPUTIN:                    +41.5=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
AUXTIN0:                   +18.0=C2=B0C    sensor =3D thermistor
AUXTIN1:                   +23.0=C2=B0C    sensor =3D thermistor
AUXTIN2:                   +23.0=C2=B0C    sensor =3D thermistor
AUXTIN3:                   +14.0=C2=B0C    sensor =3D thermistor
PECI Agent 0 Calibration:  +41.5=C2=B0C=20=20
PCH_CHIP_CPU_MAX_TEMP:      +0.0=C2=B0C=20=20
PCH_CHIP_TEMP:              +0.0=C2=B0C=20=20
PCH_CPU_TEMP:               +0.0=C2=B0C=20=20
TSI0_TEMP:                 +50.5=C2=B0C=20=20
intrusion0:               OK
intrusion1:               ALARM
beep_enable:              disabled

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
