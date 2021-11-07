Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22150C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun,  7 Nov 2021 16:20:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 097ED60EE9
	for <platform-driver-x86@archiver.kernel.org>; Sun,  7 Nov 2021 16:20:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235747AbhKGQXW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 7 Nov 2021 11:23:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:43652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235754AbhKGQXW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 7 Nov 2021 11:23:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 2FA06617E3
        for <platform-driver-x86@vger.kernel.org>; Sun,  7 Nov 2021 16:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636302039;
        bh=GVfarMl0mwk1pmHf7YrGfKA8bdsi4bDE8GQVIAyw+sk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Y4w9bTLoN1uv6aKUCURcn5XhfvBMwYaUlesz1VsQa4+p7YXEo05Y9rAOCiHu+gsGt
         6AbuwwuoGkNCFyiuUWq+ZdX/6WKDZoambdz8PO3fjTRnK8AGuhcYEES7CJVk/uDE6R
         4bcic60xFdW8TyFIUnNamn0CMtoOZ4cHs9jrkEPS7cMhr63FvYwwuyRVJNBgDZ6K9E
         PKDkzOfJKPOBsjJ+hxpXnYjIuN0hLf1EsRgwSKQ158AJtnIGZx55lXPr5Jys68IOrD
         EfpwBzlX/ofkjBRR9zSEl59kGFFLWI5Qb774+vp8VV23Ee0OXHg2yuGfeognYI2/Xa
         zfPY673fy9irw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 07 Nov 2021 16:20:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: olli.asikainen@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-VkqzsXRI9j@https.bugzilla.kernel.org/>
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

--- Comment #161 from Olli Asikainen (olli.asikainen@gmail.com) ---
(In reply to Denis Pauk from comment #159)
> Created attachment 299483 [details]
> Check MAXIMUS_VII_HERO by lock mutex directly
>=20
> (In reply to Olli Asikainen from comment #151)
> > Created attachment 299459 [details]
> > acpidump -b -n DSDT
>=20
> Could you check with updated patch? It has only nct6798d part and only for
> check idea.

It works! (as far as I can tell)

[    5.109607] nct6775: Using Asus WMI mutex.
[    5.109633] nct6775: Enabling hardware monitor logical device mappings.
[    5.109641] nct6775: Found NCT6791D or compatible chip at 0x2e:0x290

nct6791-isa-0290
Adapter: ISA adapter
Vcore:                 928.00 mV (min =3D  +0.00 V, max =3D  +1.74 V)
in1:                   1000.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  ALA=
RM
AVCC:                    3.31 V  (min =3D  +2.98 V, max =3D  +3.63 V)
+3.3V:                   3.31 V  (min =3D  +2.98 V, max =3D  +3.63 V)
in4:                   1000.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  ALA=
RM
in5:                     1.94 V  (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
in6:                     0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
3VSB:                    3.42 V  (min =3D  +2.98 V, max =3D  +3.63 V)
Vbat:                    3.30 V  (min =3D  +2.70 V, max =3D  +3.63 V)
in9:                     1.01 V  (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
in10:                    0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
in11:                  936.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
in12:                    0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
in13:                    8.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
in14:                    8.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
fan1:                     0 RPM  (min =3D    0 RPM)
fan2:                     0 RPM  (min =3D    0 RPM)
fan3:                     0 RPM  (min =3D    0 RPM)
fan4:                     0 RPM  (min =3D    0 RPM)
fan5:                     0 RPM  (min =3D    0 RPM)
fan6:                     0 RPM  (min =3D    0 RPM)
SYSTIN:                 +28.0=C2=B0C  (high =3D  +0.0=C2=B0C, hyst =3D  +0.=
0=C2=B0C)  ALARM=20
sensor =3D thermistor
CPUTIN:                 +30.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +75.=
0=C2=B0C)  sensor =3D
thermistor
AUXTIN0:               -128.0=C2=B0C    sensor =3D thermistor
AUXTIN1:               -128.0=C2=B0C    sensor =3D thermistor
AUXTIN2:                +29.0=C2=B0C    sensor =3D thermistor
AUXTIN3:               +127.0=C2=B0C    sensor =3D thermistor
PECI Agent 0:           +30.0=C2=B0C
PCH_CHIP_CPU_MAX_TEMP:   +0.0=C2=B0C
PCH_CHIP_TEMP:           +0.0=C2=B0C
PCH_CPU_TEMP:            +0.0=C2=B0C
intrusion0:            ALARM
intrusion1:            ALARM
beep_enable:           disabled

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
