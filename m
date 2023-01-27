Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA00C05027
	for <platform-driver-x86@archiver.kernel.org>; Fri, 27 Jan 2023 00:49:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232741AbjA0Atb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 26 Jan 2023 19:49:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232429AbjA0AtY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Jan 2023 19:49:24 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A2E956495
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Jan 2023 16:49:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7CD5B619F4
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jan 2023 00:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D682CC433EF
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jan 2023 00:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674780561;
        bh=Y6HrdofBOvUs2Pp3LyaO+2mA7mkkrfcB50SeKeyYFac=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VS1/01Zvare8Yz5GDxPo7i4kLOi/1ajrF+7SK8zuUeQtFAawAEIaUhJVD1QdDEF8u
         DdCaFcRsJyd1Z6+WE/pSiSadPJMc0nGgWT6TIVlD5SYs620HNDqZPbBTknCj7zBENV
         QoJ3Vnp64LrdeWvTjCcydCrvzYHrDWlkt5mD0Z525G/Tjwnzy3eRpX6yrJ5b3ormlz
         Mb4NenORAOT+1cfUW4jwTIyliUqsiVtvp/uQA7VSWg3G6eygUdZMQT4mGRXBJY/3G4
         8JmS33hY1/5/WzGKTkR54hnBnNtG+frRnJGNTjRrYh3ulFdiQZ7mjPsQ69pDHJeX65
         mwUpc6NHLBenA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C68FBC43145; Fri, 27 Jan 2023 00:49:21 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 27 Jan 2023 00:49:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: nikodll@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-nViBtaiGMu@https.bugzilla.kernel.org/>
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

--- Comment #286 from Nikita Koval (nikodll@gmail.com) ---
(In reply to Denis Pauk from comment #285)
> Created attachment 303655 [details]
> Asus WMI for nct6775 v6.1 base (2023.01.26)
>=20

Thanks for the patch! It didn't work right away with my current 6.1.7-gentoo
kernel though, but I was able to apply it against vanilla v6.0. The sensors
from 6798D chip seem working now (at least the ones that I care about, like=
 fan
values):


nct6798-isa-0290
Adapter: ISA adapter
in0:                      144.00 mV (min =3D  +0.00 V, max =3D  +1.74 V)
in1:                        1.01 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in2:                        3.41 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in3:                        3.33 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in4:                      1000.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  =
ALARM
in5:                        0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in6:                        0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
in7:                        3.41 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in8:                        3.23 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in9:                      528.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in10:                     504.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in11:                       0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in12:                       1.06 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in13:                     392.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in14:                     896.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
fan1:                        0 RPM  (min =3D    0 RPM)
fan2:                     1124 RPM  (min =3D    0 RPM)
fan3:                        0 RPM  (min =3D    0 RPM)
fan4:                        0 RPM  (min =3D    0 RPM)
fan5:                        0 RPM  (min =3D    0 RPM)
fan7:                        0 RPM  (min =3D    0 RPM)
SYSTIN:                    +28.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
CPUTIN:                    +38.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
AUXTIN0:                  -128.0=C2=B0C    sensor =3D thermistor
AUXTIN1:                   +25.0=C2=B0C    sensor =3D thermistor
AUXTIN2:                  +127.0=C2=B0C    sensor =3D thermistor
AUXTIN3:                   +32.0=C2=B0C    sensor =3D thermistor
PECI Agent 0 Calibration:  +38.5=C2=B0C=20=20
PCH_CHIP_CPU_MAX_TEMP:      +0.0=C2=B0C=20=20
PCH_CHIP_TEMP:             +55.0=C2=B0C=20=20
PCH_CPU_TEMP:               +0.0=C2=B0C=20=20
intrusion0:               ALARM
intrusion1:               ALARM
beep_enable:              disabled

I will be using this kernel for a while and will report if I notice any rel=
ated
issues.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
