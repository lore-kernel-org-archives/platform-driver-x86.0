Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27872C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun, 19 Sep 2021 22:04:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA4076126A
	for <platform-driver-x86@archiver.kernel.org>; Sun, 19 Sep 2021 22:04:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232269AbhISWFl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 19 Sep 2021 18:05:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:53866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229689AbhISWFl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 19 Sep 2021 18:05:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id CBE8A60F5B
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Sep 2021 22:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632089055;
        bh=HzFHM1VDSg4JWTuJ8n5+LVdmbbgi0qzoY7OFEEx23XY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=r27JNx5UZdlkBxb4mnXsw+hIh3+BkcEV47eebFFiw2Vsl3aC2EwmOMUpume91QkzX
         +E+p/+uQuh8KUY6OvicJp+wB5RR8DPO4cNREE7fn5qhVtXe3snayU/38+LHSo8wtCT
         3+S7Ekr2t0rX4PxC2wPr+/uYd5rTkVhTNj9YRz+yfN/j0yBltYsyC4P0LM5VqnXee6
         0xeRw8+5beQRPDqWubeSeWRASDBCoNRXFKMLaWB+Yrv5VmYRidof465TjN6t2V6b6w
         MYQ9yKNh1XsG+fKdd0g38ma7azElBpxd/gDFhLJ776lKET9sEVHG2qY2CS0m5cTDPg
         OD+MPHHfAwR2Q==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 19 Sep 2021 22:04:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pauk.denis@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-RsVqGCannn@https.bugzilla.kernel.org/>
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

--- Comment #123 from Denis Pauk (pauk.denis@gmail.com) ---
(In reply to Kamil Pietrzak from comment #122)
> I confrm patch works on my "TUF GAMING Z490-PLUS (WI-FI)".
>=20
> [1295150.017048] nct6775: Found NCT6798D or compatible chip at 0x0:0x290
....
>=20
> I also noticed that some voltage values reported by nct6775 differs from =
the
> ones reported by Asus software on Windows.
>=20
> I changed voltage scaling factors to those listed below and now voltages =
are
> reported like on Asus software on Windows.
>=20
> /*
>  * Some of the voltage inputs have internal scaling, the tables below
>  * contain 8 (the ADC LSB in mV) * scaling factor * 100
>  */
> static const u16 scale_in[15] =3D {
>       888, 4000, 1600, 1600, 9600, 800, 800, 1600, 1600, 1600, 1600, 1600,
> 800,
>       800, 800
> };

It looks like need to update code with custom scale values in relation to b=
oard
name. And it can be in future patches.=20

Also need to look what functionality is nondestructive and can be merged in:
* https://gitlab.com/CalcProgrammer1/OpenRGB/-/blob/master/OpenRGB.patch
*
https://github.com/zeule/asus-wmi-ec-sensors/blob/master/asus-wmi-ec-sensor=
s.c
* https://github.com/electrified/asus-wmi-sensors/
and cover maximum boards.

OpenRGB looks as good candidate for merge, as I see it uses i2c bus instead
asuswmi, and we already have ground for custom logic, it should be possible=
 if
we have list of boards where such access is implemented by ASUS?.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
