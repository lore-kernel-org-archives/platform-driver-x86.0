Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3711BC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Dec 2021 11:08:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233090AbhLELL0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Dec 2021 06:11:26 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:58352 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233086AbhLELL0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Dec 2021 06:11:26 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 76DE6B80D34
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 11:07:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3EADCC341CB
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 11:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638702477;
        bh=+dXLszGqHsPHXPfcgO1/xPWY/MGKzm5vNLZQFssoONw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Ul2ekHkq7dv2mKdmwNfKVPNZh3ofjs9YP8pvcsnYWwM2htAh830VJS1Xdbr6VAMFj
         S3IU4eVzjOhWGJVlMZrARllPVknaj6rfsbYxozANYoKKi1tgkC3vajIDPl/sU1XHEk
         leIUIJePzF8RxIgtTHqWu6gZGsKdhzNarHrQ+evWy217y7GZw6CeQBgBWTkskgOlki
         7xlTZ8qIjijbWtCODkm/tp2Uco981Khp4gWz2ELnsRygw2yoYlcG83L5VVE0neyoR1
         mJ6L1VRvpRCX/aURtUB6b7lMN+5BRbUd2GFsK7FSVUtyzu/tW26z8E0XwahFavOjfG
         kv6Ty5yaJfozQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 2F31C60F55; Sun,  5 Dec 2021 11:07:57 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 05 Dec 2021 11:07:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mikhail.v.gavrilov@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-gcOd4FRka2@https.bugzilla.kernel.org/>
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

--- Comment #176 from Mikhail (mikhail.v.gavrilov@gmail.com) ---
> What do you mean by missing "CPU FAN"? It has returned zero or does not e=
xist
> in listing?=20

It has returned always zero even before your patch.


$ sensors
hidpp_battery_0-hid-3-10
Adapter: HID adapter
in0:           3.80 V=20=20

amdgpu-pci-0b00
Adapter: PCI adapter
vddgfx:      775.00 mV=20
fan1:           0 RPM  (min =3D    0 RPM, max =3D 3300 RPM)
edge:         +52.0=C2=B0C  (crit =3D +100.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +105.0=C2=B0C)
junction:     +55.0=C2=B0C  (crit =3D +110.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +115.0=C2=B0C)
mem:          +54.0=C2=B0C  (crit =3D +100.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +105.0=C2=B0C)
power1:       22.00 W  (cap =3D 255.00 W)

nvme-pci-0100
Adapter: PCI adapter
Composite:    +50.9=C2=B0C=20=20

iwlwifi_1-virtual-0
Adapter: Virtual device
temp1:        +54.0=C2=B0C=20=20

k10temp-pci-00c3
Adapter: PCI adapter
Tctl:         +76.6=C2=B0C=20=20
Tccd1:        +71.0=C2=B0C=20=20
Tccd2:        +74.5=C2=B0C=20=20

ucsi_source_psy_0_00081-i2c-0-08
Adapter: Synopsys DesignWare I2C adapter
in0:           0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
curr1:         0.00 A  (max =3D  +0.00 A)


> It case it has returned zero, could you attach result of "acpidump -b -n
> DSDT" ?

[mikhail@primary-ws ~]$ sudo acpidump -b -n DSDT
[mikhail@primary-ws ~]$

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
