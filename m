Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E8BC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Sep 2021 18:37:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B170611C0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Sep 2021 18:37:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345805AbhIHSi3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Sep 2021 14:38:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:53260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240231AbhIHSi3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Sep 2021 14:38:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id F06A961175
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Sep 2021 18:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631126241;
        bh=orHVxalOAWgripUwGYT0x4KESbglsLQdkobJTL32wik=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=J6d5r8y3T0hueLQk9Gd8+hfDrVFJzEHBUzbOX8PDS/iKpWtET30EFO16tLJ12QJfq
         RS+CprWw613oXqmoU9wzD3oHc4n9jVTmxuhu6fTpTJfZ5ELgORIM0lk7uts9IK296S
         M7O6LFhuLVHebvZokLpBGq4Kn0CsaCLjaevIegbvJhKsM/+WI3i2z6o3vaoyrittk+
         GMU+nwwgvvr3QkVttCw8lyTZlQcLRax8W3JwdglN0/YYxMs00nrN0GeD0gj5WVmtlB
         yXtmLrpmSOT9jZIlHVUK8o5gbjt8FVmghEGeQpH8gU996abSPqASW24Zq82NXr8SNd
         7mfgwciRZetpQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 08 Sep 2021 18:37:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: napalmllama@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-Inl23rVpWh@https.bugzilla.kernel.org/>
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

--- Comment #96 from Tom Lloyd (napalmllama@gmail.com) ---
(In reply to Denis Pauk from comment #88)
> Created attachment 298669 [details]
> POC: Add support for access via Asus WMI to nct6775 by board/vendor name
> detect
>=20
> Updated version with check vendor name and fix for possible issues with n=
on
> ASUS motherboards, added names of motherboards have mentioned in bug. I w=
ill
> also check possible way for use functions pointers instead conditional
> checks equal to access_wmi. After that I will try to send patch to review.
>=20
> (In reply to comment #87)
> > I added my board "ROG STRIX B550-F GAMING (WI-FI)" and added patch agai=
nst
> > 5.14.1-arch1-1 BIOS 2423 08/10/2021.
>=20
> Thank you, I have added your board also.
>=20
> (In reply to comment #86)
> > Please add my board name "TUF GAMING B550-PLUS".
>=20
> Thank you, I have added it to list. What the distro do you use?=20
>=20
> For debian it can be:
> * git clone
> git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
> * cd linux-stable
> * git check v5.14
> * cp /boot/config-5.10.0-8-amd64 .config
> * make CC=3D"ccache gcc" -j 32
> * make CC=3D"ccache gcc" -j 32 bindeb-pkg
> * sudo dpkg -i ../linux-image-5.14.0+_5.14.0+-1_amd64.deb
>=20
> Look to https://wiki.debian.org/BuildADebianKernelPackage

Denis,

I'm on Gentoo, and already have the kernel sources unpacked and ready to go
(5.13.13-gentoo).  I did the following:

# rmmod nct6775
# cd /usrc/src/linux
# patch -i ~/nct6775_wmi_v3.patch -p1
# make modules -j12
# mv
/lib/modules/5.13.13-gentoo-splig-3-sensors/kernel/drivers/hwmon/nct6775.ko
/lib/modules/5.13.13-gentoo-splig-3-sensors/kernel/drivers/hwmon/nct6775.ko=
.orig
# cp drivers/hwmon/nct6775.ko
/lib/modules/5.13.13-gentoo-splig-3-sensors/kernel/drivers/hwmon/nct6775.ko
# modprobe nct6775

"sensors" output remains the same:
nct6798-isa-0290
Adapter: ISA adapter
in0:                      376.00 mV (min =3D  +0.00 V, max =3D  +1.74 V)
in1:                      1000.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  =
ALARM
in2:                        3.39 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in3:                        3.30 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in4:                        1.01 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in5:                      880.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in6:                      256.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in7:                        3.39 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in8:                        3.28 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in9:                      904.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in10:                     264.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in11:                       1.02 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in12:                       1.04 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in13:                     368.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in14:                     272.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
fan1:                        0 RPM  (min =3D    0 RPM)
fan2:                      716 RPM  (min =3D    0 RPM)
fan3:                      496 RPM  (min =3D    0 RPM)
fan4:                      327 RPM  (min =3D    0 RPM)
fan5:                        0 RPM  (min =3D    0 RPM)
fan6:                        0 RPM  (min =3D    0 RPM)
fan7:                        0 RPM  (min =3D    0 RPM)
SYSTIN:                    +33.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
CPUTIN:                    +35.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)  sensor =3D
thermistor
AUXTIN0:                   +85.0=C2=B0C    sensor =3D thermistor
AUXTIN1:                   +55.0=C2=B0C    sensor =3D thermistor
AUXTIN2:                   -61.0=C2=B0C    sensor =3D thermistor
AUXTIN3:                   +79.0=C2=B0C    sensor =3D thermistor
PECI Agent 0 Calibration:  +34.5=C2=B0C=20=20
PCH_CHIP_CPU_MAX_TEMP:      +0.0=C2=B0C=20=20
PCH_CHIP_TEMP:              +0.0=C2=B0C=20=20
PCH_CPU_TEMP:               +0.0=C2=B0C=20=20
intrusion0:               ALARM
intrusion1:               ALARM
beep_enable:              disabled

dmesg with tree module:
[ 3596.867638] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
[ 3596.867642] ACPI Warning: SystemIO range
0x0000000000000295-0x0000000000000296 conflicts with OpRegion
0x0000000000000290-0x0000000000000299 (\AMW0.SHWM) (20210331/utaddress-204)
[ 3596.867645] ACPI: OSL: Resource conflict; ACPI support missing from driv=
er?
[ 3596.867646] ACPI: OSL: Resource conflict: System may be unstable or beha=
ve
erratically

dmesg with patched module:
[ 3681.885428] nct6775: Using Asus WMI to access chip
[ 3681.885468] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290

/proc/cmdline:
BOOT_IMAGE=3D/boot/vmlinuz-5.13.13-gentoo-splig-3-sensors root=3D/dev/nvme0=
n1p3 ro
module_blacklist=3Dnouveau acpi_enforce_resources=3Dlax


I hope that's of some use.  The differing dmesg output suggests that the pa=
tch
is helping, but shouldn't there be a change (improvement) to the sensors
output?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
