Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1872C433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Apr 2022 12:55:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350316AbiDZM6D (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Apr 2022 08:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350244AbiDZM6B (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Apr 2022 08:58:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C65B17E238
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Apr 2022 05:54:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CA807618A2
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Apr 2022 12:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3BF71C385A0
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Apr 2022 12:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650977692;
        bh=0JNfebxDDqaSni/PPG9628eTBDiVviNo1UGtlf55LTI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=nlqaa+nJtnsUZLK6An2b+KyA4AQcoom+gHia1TppE8QBv6/8v5yyzh61PClBt4AMW
         216XEcFAGZNAs6lXzCZGysxrFbf5lKi+8DFE9bw7xjaSm/AMHgTjNwPaVWyTkW88Zy
         zYB4KQVb1sBpq8mv2pMuKwQXRU8/GjYPkDqvAXhD78Dcv+/6ouL3q+VLH/3Wr1+r/+
         f2wowrwMSFaO7OaUphHEMk5mR6NgnivfYvwhYUNuaFybc4oNNekwK6/HljGdAKnTV/
         lcJeC3NTXEvDncErHnwjNfyQDK58CtUblwNklvZUxVFbFt6TlZ0/BSuPv4TeXWTftP
         +jFXLz8T6gAFA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1A9EFC05F98; Tue, 26 Apr 2022 12:54:52 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Tue, 26 Apr 2022 12:54:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johannes.penssel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214899-215701-XDojGHYeBK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214899-215701@https.bugzilla.kernel.org/>
References: <bug-214899-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

--- Comment #23 from Johannes P (johannes.penssel@gmail.com) ---
No problem, this isn't exactly the most pressing of issues.

Looks like neither any combination of kernel parameters, nor the code change
you suggested, leads to any difference in behaviour.

My laptop does have a 2nd GPU actually, a GeForce MX450 which is for all
practical purposes disabled at runtime by the nouveau driver. But no matter=
 if
enabled or disabled in BIOS, there is only the intel_backlight device in sy=
sfs
without any kernel parameters, as expected. By the way, enabling the GPU
results in this warning message at boot:

[    3.894320] ACPI: video: [Firmware Bug]: ACPI(PEGP) defines _DOD but not
_DOS

Interestingly, I have noticed that booting with acpi_backlight=3Dvideo resu=
lts in
just one acpi_video device appearing in sysfs now. (regardless if the GPU is
activated or not) I'm not sure if this is due to a change in BIOS or the
kernel, so just to be sure, I am uploading an acpi dump from the most recent
BIOS release.=20

Here is some additional info about the input devices registered by acpi vid=
eo
that might be helpful:

/proc/bus/input/devices

I: Bus=3D0019 Vendor=3D0000 Product=3D0006 Version=3D0000
N: Name=3D"Video Bus"
P: Phys=3DLNXVIDEO/video/input0
S:
Sysfs=3D/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:00/LNXVIDEO:00/i=
nput/input8
U: Uniq=3D
H: Handlers=3Dkbd event6=20
B: PROP=3D0
B: EV=3D3
B: KEY=3D3e000b00000000 0 0 0

I: Bus=3D0019 Vendor=3D0000 Product=3D0006 Version=3D0000
N: Name=3D"Video Bus"
P: Phys=3DLNXVIDEO/video/input0
S: Sysfs=3D/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:01/input/in=
put9
U: Uniq=3D
H: Handlers=3Dkbd event7=20
B: PROP=3D0
B: EV=3D3
B: KEY=3D3e000b00000000 0 0 0

Not sure if relevant, but something else I have noticed is that the brightn=
ess
value recorded by the ideapad backlight device, which as mentioned does cha=
nge
when the brightness keys are pressed, corresponds to value B9 on the regist=
er
map dumped by the kernel ec tool:

     00  01  02  03  04  05  06  07  08  09  0A  0B  0C  0D  0E  0F
00:  00  01  00  00  00  00  00  01  00  00  10  00  00  00  29  00=20
10:  00  00  80  00  01  00  65  04  00  01  9a  20  00  02  00  00=20
20:  02  00  00  00  00  00  00  00  00  00  00  00  00  00  00  00=20
30:  00  00  00  00  00  00  00  00  00  00  00  00  00  00  00  00=20
40:  00  00  00  00  00  00  00  00  00  00  00  00  8d  52  00  00=20
50:  00  00  00  33  00  00  2d  00  00  00  00  00  00  00  00  00=20
60:  00  80  02  03  02  00  00  08  ef  17  85  43  01  00  20  01=20
70:  00  02  10  01  00  00  00  00  00  00  00  00  00  00  00  00=20
80:  00  00  00  00  08  00  00  00  c0  00  93  00  20  01  00  4c=20
90:  47  43  00  32  30  31  39  00  4c  31  39  4c  34  50  46  31=20
A0:  00  01  00  80  00  00  c0  00  00  00  00  00  00  15  00  00=20
B0:  2d  2f  00  2a  00  24  00  28  02  11  04  00  00  00  01  00=20
C0:  30  00  ce  14  33  05  97  3e  10  3b  58  1b  9b  1b  4b  00=20
D0:  00  00  00  00  00  00  00  23  2f  0c  00  00  00  00  00  00=20
E0:  00  00  00  00  00  00  00  00  00  00  00  00  01  00  43  00=20
F0:  01  00  00  40  90  51  80  43  00  00  00  00  00  00  00  00

This value persists across reboots, but does not change when pressing the
brightness keys in Windows.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
