Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F73DC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Dec 2021 11:18:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233190AbhLELV4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Dec 2021 06:21:56 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:34768 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233086AbhLELV4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Dec 2021 06:21:56 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6097DB80E25
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 11:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33F6BC341D3
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 11:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638703107;
        bh=YFKE0/JvAQwExfNSexWUIk45iquSClr6IMTE4WxPquI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=B9l6L7ixGaMU2WUCBj8LRpH4jlpt6QGuUuNZT+BvpNDypTJYsBcSimeJkoBbOXRn5
         xDmwt++6DcIMEkmbkANLK40QV/YG4iYk5whazprg1x0BM4Gjk0WY3St3GG3HCwkoiB
         gFrPYzsoQC8VIZijjXI3sPU02syaa0+rOO/4Rmm3DP1B+LqDaOMQB6+BbEi0Dr6OCc
         26JoqcGC0NY9MrYFncob8dwPdeMLgOTUDyMUUqvFuMaQK2NC11PED/aDrGRp90VUXU
         VC1i4/8+19nZUohj35GQtKlg9ud6Pza5dXMtFtbPrWzHwGemybzr3p9rhJ53nEyNC6
         05gMc3dXTtOsQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 1B72D61164; Sun,  5 Dec 2021 11:18:27 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 05 Dec 2021 11:18:24 +0000
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
Message-ID: <bug-204807-215701-Mhqb49EIUk@https.bugzilla.kernel.org/>
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

--- Comment #178 from Denis Pauk (pauk.denis@gmail.com) ---
(In reply to Mikhail from comment #176)
> > What do you mean by missing "CPU FAN"? It has returned zero or does not
> exist
> > in listing?=20
>=20
> It has returned always zero even before your patch.
>=20
>=20
> $ sensors
> hidpp_battery_0-hid-3-10
> Adapter: HID adapter
> in0:           3.80 V=20=20
>=20
> amdgpu-pci-0b00
> Adapter: PCI adapter
> vddgfx:      775.00 mV=20
> fan1:           0 RPM  (min =3D    0 RPM, max =3D 3300 RPM)
> edge:         +52.0=C2=B0C  (crit =3D +100.0=C2=B0C, hyst =3D -273.1=C2=
=B0C)
>                        (emerg =3D +105.0=C2=B0C)
> junction:     +55.0=C2=B0C  (crit =3D +110.0=C2=B0C, hyst =3D -273.1=C2=
=B0C)
>                        (emerg =3D +115.0=C2=B0C)
> mem:          +54.0=C2=B0C  (crit =3D +100.0=C2=B0C, hyst =3D -273.1=C2=
=B0C)
>                        (emerg =3D +105.0=C2=B0C)
> power1:       22.00 W  (cap =3D 255.00 W)
>=20
> nvme-pci-0100
> Adapter: PCI adapter
> Composite:    +50.9=C2=B0C=20=20
>=20
> iwlwifi_1-virtual-0
> Adapter: Virtual device
> temp1:        +54.0=C2=B0C=20=20
>=20
> k10temp-pci-00c3
> Adapter: PCI adapter
> Tctl:         +76.6=C2=B0C=20=20
> Tccd1:        +71.0=C2=B0C=20=20
> Tccd2:        +74.5=C2=B0C=20=20
>=20
> ucsi_source_psy_0_00081-i2c-0-08
> Adapter: Synopsys DesignWare I2C adapter
> in0:           0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
> curr1:         0.00 A  (max =3D  +0.00 A)
>=20
>=20
What do you have in dmesg when you load driver?

> > It case it has returned zero, could you attach result of "acpidump -b -n
> > DSDT" ?
>=20
> [mikhail@primary-ws ~]$ sudo acpidump -b -n DSDT
> [mikhail@primary-ws ~]$

acpidump should create binary dump of DSDT section(dsdt.dat) of your board,
could you attach it here?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
