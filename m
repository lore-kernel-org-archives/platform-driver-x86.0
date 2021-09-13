Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24D6C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 18:52:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78ED160E9C
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 18:52:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239100AbhIMSxj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Sep 2021 14:53:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:36468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233322AbhIMSxj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Sep 2021 14:53:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4651361108
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Sep 2021 18:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631559143;
        bh=TWDyTqCLmLfjypp62/TubciTdHd8SHzkYtzP+x+FrM4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oqiUvkp7verAz92OxoR7r1Kx7s/GaQbAVv21221CK+pVoZWTX+fTjvUgNyXUBipIZ
         I51L4QxZzhlvWAcpx6Z3t7kioW7e/e9T06dGykCDWcnCAv69VTOKozxhESq1ss0yel
         s5RyXwQcNsi4wtQN7Fpo6ah8Aaws5Bk3kgXcg4jnEZYXRrd9NTxiSmt2OZCluS8PiG
         tcZrcTrnlUbbn/VmllmcEBVhiAPd83QvjuuiU9VvxBfV70zGLEic6i6F179Bpocopi
         VZdE7raGIM440rqC3tNI4yxGr9TqYeNlewD8ZTsBj9q4A1rnjtqiB6QxfXj0qDfA2h
         kHjbBANhi5yTg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 13 Sep 2021 18:52:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: igor@svelig.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-u8GH8lkcEQ@https.bugzilla.kernel.org/>
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

Igor (igor@svelig.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |igor@svelig.com

--- Comment #104 from Igor (igor@svelig.com) ---
Hi guys,

I have tried the patch for my "ROG STRIX B550-I GAMING", LGFM:
```
nct6798-isa-0290
Adapter: ISA adapter
Vcore:                    472.00 mV (min =3D  +0.00 V, max =3D  +1.74 V)
in1:                        1.02 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
AVSB:                       3.39 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
3VCC:                       3.38 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
+12V:                      12.19 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in5:                      856.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
+5V:                        1.48 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
3.3V:                       3.38 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
Vbat:                       3.47 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in9:                      896.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in13:                     280.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in14:                     280.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
fan1:                      750 RPM  (min =3D    0 RPM)
CPU Fan:                   585 RPM  (min =3D    0 RPM)
CHA_FAN1:                    0 RPM  (min =3D    0 RPM)
SYSTIN:                    +34.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
CPUTIN:                    +33.5=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
AUXTIN0:                   +80.5=C2=B0C    sensor =3D thermistor
AUXTIN1:                   +34.0=C2=B0C    sensor =3D thermistor
AUXTIN2:                   +34.0=C2=B0C    sensor =3D thermistor
AUXTIN3:                   +86.0=C2=B0C    sensor =3D thermistor
PECI Agent 0 Calibration:  +33.0=C2=B0C=20=20
beep_enable:              disabled
```

The TUF-GAMING-X570-PLUS.conf config file was used from the comment 98.
Just wonder, so high temperature on AUXTIN0 and on AUXTIN3 is something rea=
l?
And what it could be? Or it could be because the TUF-GAMING-X570-PLUS.conf =
is
badly applicable/adjusted for another MB model?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
