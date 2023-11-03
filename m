Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7ABCC4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Nov 2023 11:48:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346241AbjKCLs1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Nov 2023 07:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345362AbjKCLs0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Nov 2023 07:48:26 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FCD91A8
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Nov 2023 04:48:24 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC0ABC433C7
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Nov 2023 11:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699012103;
        bh=veasoQ0IxTVhp79Yj/R6AvBqX1rElGm/T8i/VfBjmJU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WfFVzbWAmE/0rld9SzXLwzV8j10CgZ5FwZmOehIMsZuS1snSaNaLLI1fYL64bGgVv
         U4L1W81QODdpNLYAVeCDkoG6UdBKpEyZNbpi0UXLXhz4+9ZgYhYRItyCL76oui3rjN
         2JGRSiUwRo1zBYObpH8UQqGa5VcVmwdB9hUVAOv99D35Epz8XJX8JZRkzealSYhJUK
         Cu6BypYmVhel/7j4frtbTl5LcYr7Jx4KnI/dvKxfM4X3qyMmLVOK9PRZ6p93dE9G6r
         w4au87X81a96c894lUWvQvip9XO3AWraCal365izGD/Tph+gLXqN4PkbbkORVKaZW0
         gfohT5lPv1D9A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 92C14C4332E; Fri,  3 Nov 2023 11:48:23 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Fri, 03 Nov 2023 11:48:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ertugruluyar.personal@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218092-215701-rEYMfEy39h@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218092-215701@https.bugzilla.kernel.org/>
References: <bug-218092-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218092

--- Comment #47 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
(In reply to Ertugrul Uyar from comment #46)
>=20
> I think, something doesn't work:
>=20
> ertugruluyar@ertugruluyar-pc:~/Desktop/linux-6.6$ sudo apt install
> ../linux-headers-6.6.0_6.6.0-6_amd64.deb
> ../linux-image-6.6.0_6.6.0-6_amd64.deb
> [sudo] password for ertugruluyar:=20
> Reading package lists... Done
> Building dependency tree... Done
> Reading state information... Done
> Note, selecting 'linux-headers-6.6.0' instead of
> '../linux-headers-6.6.0_6.6.0-6_amd64.deb'
> Note, selecting 'linux-image-6.6.0' instead of
> '../linux-image-6.6.0_6.6.0-6_amd64.deb'
> The following NEW packages will be installed:
>   linux-headers-6.6.0 linux-image-6.6.0
> 0 upgraded, 2 newly installed, 0 to remove and 0 not upgraded.
> Need to get 0 B/1.799 MB of archives.
> After this operation, 1.874 MB of additional disk space will be used.
> Get:1 /home/ertugruluyar/Desktop/linux-headers-6.6.0_6.6.0-6_amd64.deb
> linux-headers-6.6.0 amd64 6.6.0-6 [9.750 kB]
> Get:2 /home/ertugruluyar/Desktop/linux-image-6.6.0_6.6.0-6_amd64.deb
> linux-image-6.6.0 amd64 6.6.0-6 [1.789 MB]=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> Selecting previously unselected package linux-headers-6.6.0.=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
>=20
> (Reading database ... 334966 files and directories currently installed.)
> Preparing to unpack .../linux-headers-6.6.0_6.6.0-6_amd64.deb ...
> Unpacking linux-headers-6.6.0 (6.6.0-6) ...
> Selecting previously unselected package linux-image-6.6.0.
> Preparing to unpack .../linux-image-6.6.0_6.6.0-6_amd64.deb ...
> Unpacking linux-image-6.6.0 (6.6.0-6) ...
> Setting up linux-image-6.6.0 (6.6.0-6) ...
>  * dkms: running auto installation service for kernel 6.6.0=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
>=20
> Kernel preparation unnecessary for this kernel. Skipping...
>=20
> Building module:
> cleaning build area...
> make -j6 KERNELRELEASE=3D6.6.0 -C /lib/modules/6.6.0/build
> M=3D/var/lib/dkms/r8125/9.011.01/build......
> Signing module:
> Secure Boot not enabled on this system.
> cleaning build area...
>=20
> r8125.ko.zst:
> Running module version sanity check.
>  - Original module
>    - No original module exists within this kernel
>  - Installation
>    - Installing to /lib/modules/6.6.0/updates/dkms/
>=20
> depmod........
>=20
> Kernel preparation unnecessary for this kernel. Skipping...
>=20
> Building module:
> cleaning build area...
> make -j6 KERNELRELEASE=3D6.6.0 KDIR=3D/lib/modules/6.6.0/build....
> Signing module:
> Secure Boot not enabled on this system.
> cleaning build area...
>=20
> tuxedo_keyboard.ko.zst:
> Running module version sanity check.
>  - Original module
>    - No original module exists within this kernel
>  - Installation
>    - Installing to /lib/modules/6.6.0/updates/dkms/
>=20
> clevo_wmi.ko.zst:
> Running module version sanity check.
>  - Original module
>    - No original module exists within this kernel
>  - Installation
>    - Installing to /lib/modules/6.6.0/updates/dkms/
>=20
> clevo_acpi.ko.zst:
> Running module version sanity check.
>  - Original module
>    - No original module exists within this kernel
>  - Installation
>    - Installing to /lib/modules/6.6.0/updates/dkms/
>=20
> tuxedo_io.ko.zst:
> Running module version sanity check.
>  - Original module
>    - No original module exists within this kernel
>  - Installation
>    - Installing to /lib/modules/6.6.0/updates/dkms/
>=20
> uniwill_wmi.ko.zst:
> Running module version sanity check.
>  - Original module
>    - No original module exists within this kernel
>  - Installation
>    - Installing to /lib/modules/6.6.0/updates/dkms/
>=20
> depmod.........
>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20
> [ OK ]
> update-initramfs: Generating /boot/initrd.img-6.6.0
> W: Possible missing firmware /lib/firmware/amdgpu/ip_discovery.bin for
> module amdgpu
> W: Possible missing firmware /lib/firmware/amdgpu/vega10_cap.bin for modu=
le
> amdgpu
> W: Possible missing firmware /lib/firmware/amdgpu/sienna_cichlid_cap.bin =
for
> module amdgpu
> W: Possible missing firmware /lib/firmware/amdgpu/navi12_cap.bin for modu=
le
> amdgpu
> W: Possible missing firmware /lib/firmware/amdgpu/psp_14_0_0_ta.bin for
> module amdgpu
> W: Possible missing firmware /lib/firmware/amdgpu/psp_14_0_0_toc.bin for
> module amdgpu
> W: Possible missing firmware /lib/firmware/amdgpu/psp_13_0_6_ta.bin for
> module amdgpu
> W: Possible missing firmware /lib/firmware/amdgpu/psp_13_0_6_sos.bin for
> module amdgpu
> W: Possible missing firmware /lib/firmware/amdgpu/aldebaran_cap.bin for
> module amdgpu
> W: Possible missing firmware /lib/firmware/amdgpu/aldebaran_sjt_mec2.bin =
for
> module amdgpu
> W: Possible missing firmware /lib/firmware/amdgpu/aldebaran_sjt_mec.bin f=
or
> module amdgpu
> W: Possible missing firmware /lib/firmware/amdgpu/gc_9_4_3_rlc.bin for
> module amdgpu
> W: Possible missing firmware /lib/firmware/amdgpu/gc_9_4_3_mec.bin for
> module amdgpu
> W: Possible missing firmware /lib/firmware/amdgpu/gc_11_0_0_toc.bin for
> module amdgpu
> W: Possible missing firmware /lib/firmware/amdgpu/sdma_4_4_2.bin for modu=
le
> amdgpu
> W: Possible missing firmware /lib/firmware/amdgpu/sdma_6_1_0.bin for modu=
le
> amdgpu
> W: Possible missing firmware /lib/firmware/amdgpu/sienna_cichlid_mes1.bin
> for module amdgpu
> W: Possible missing firmware /lib/firmware/amdgpu/sienna_cichlid_mes.bin =
for
> module amdgpu
> W: Possible missing firmware /lib/firmware/amdgpu/navi10_mes.bin for modu=
le
> amdgpu
> W: Possible missing firmware /lib/firmware/amdgpu/gc_11_0_3_mes.bin for
> module amdgpu
> W: Possible missing firmware /lib/firmware/amdgpu/vcn_4_0_3.bin for module
> amdgpu
> I: The initramfs will attempt to resume from /dev/nvme0n1p3
> I: (UUID=3D7d6d065d-987c-406a-904d-0709695ab9e6)
> I: Set the RESUME variable to override this.
> Sourcing file `/etc/default/grub'
> Sourcing file `/etc/default/grub.d/init-select.cfg'
> Sourcing file `/etc/default/grub.d/tuxedo-theme.cfg'
> Sourcing file `/etc/default/grub.d/tuxedo.cfg'
> Generating grub configuration file ...
> Found theme: /usr/share/grub/themes/tuxedo/theme.txt
> Found linux image: /boot/vmlinuz-6.6.0
> Found initrd image: /boot/initrd.img-6.6.0
> Found linux image: /boot/vmlinuz-6.5.0-10006-tuxedo
> Found initrd image: /boot/initrd.img-6.5.0-10006-tuxedo
> Found linux image: /boot/vmlinuz-6.5.0-10005-tuxedo
> Found initrd image: /boot/initrd.img-6.5.0-10005-tuxedo
> Memtest86+ needs a 16-bit boot, that is not available on EFI, exiting
> Warning: os-prober will be executed to detect other bootable partitions.
> Its output will be used to detect bootable binaries on them and create new
> boot entries.
> Adding boot menu entry for UEFI Firmware Settings ...
> done
> Setting up linux-headers-6.6.0 (6.6.0-6) ...
> N: Download is performed unsandboxed as root as file
> '/home/ertugruluyar/Desktop/linux-headers-6.6.0_6.6.0-6_amd64.deb' couldn=
't
> be accessed by user '_apt'. - pkgAcquire::Run (13: Permission denied)
> ertugruluyar@ertugruluyar-pc:~/Desktop/linux-6.6$ uname -a
> Linux ertugruluyar-pc 6.5.0-10006-tuxedo #6 SMP PREEMPT_DYNAMIC Fri Oct 13
> 22:06:56 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux

I think, it is installed, I just need reboot:

ertugruluyar@ertugruluyar-pc:~/Desktop/linux-6.6$ sudo apt install
../linux-headers-6.6.0_6.6.0-6_amd64.deb ../linux-image-6.6.0_6.6.0-6_amd64=
.deb
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Note, selecting 'linux-headers-6.6.0' instead of
'../linux-headers-6.6.0_6.6.0-6_amd64.deb'
Note, selecting 'linux-image-6.6.0' instead of
'../linux-image-6.6.0_6.6.0-6_amd64.deb'
linux-headers-6.6.0 is already the newest version (6.6.0-6).
linux-image-6.6.0 is already the newest version (6.6.0-6).
The following packages were automatically installed and are no longer requi=
red:
  linux-headers-6.5.0-10005-tuxedo linux-image-6.5.0-10005-tuxedo
linux-modules-6.5.0-10005-tuxedo linux-modules-extra-6.5.0-10005-tuxedo
  linux-tuxedo-6.5-headers-6.5.0-10005
Use 'sudo apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
