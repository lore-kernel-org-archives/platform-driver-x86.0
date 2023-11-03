Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A9CC4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Nov 2023 11:42:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbjKCLm7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Nov 2023 07:42:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbjKCLm7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Nov 2023 07:42:59 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9486A1A8
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Nov 2023 04:42:52 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3287BC433C8
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Nov 2023 11:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699011772;
        bh=+n2DdkL4sl2Yugjy5ljKXsqvTc0NoQUmyridjqSQ2cI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WsXyQgk//w6Iip8TjGI2qD8axBWCFsB3VkVBMuzkLhk40sampvchKiWzOV5ZuyBNR
         y3r5M41yIV+ysd3/9yPU3YISGI6pnZqfQe0CPxxweyym9OFk3eXIAJXxuNHPGp/FyI
         JNEddJsmJag0dWSuqvplQueCEEDxbYETmNQTpv8TPDZaBJ2V1sdnmGbyJJ1KZBljEm
         miWve8KkwH9DaSNpZUdturjHa4Ai0FIQcW/nxiNBCSHkSYp6f11LeZhehlN0g17mho
         O+rgJWfXtQg7dDlaAbBbqNMXz/ujBOnWWXVniU8KqHQsO67avSCoz7V6GYhuEyhJbZ
         mYfPqqLjb1auQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 225B1C4332E; Fri,  3 Nov 2023 11:42:52 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Fri, 03 Nov 2023 11:42:51 +0000
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
Message-ID: <bug-218092-215701-XOmInv09UC@https.bugzilla.kernel.org/>
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

--- Comment #46 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
(In reply to Bagas Sanjaya from comment #44)
> Created attachment 305355 [details]
> signature.asc
>=20
> On Fri, Nov 03, 2023 at 07:16:24AM +0000, bugzilla-daemon@kernel.org wrot=
e:
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D218092
> >=20
> > --- Comment #43 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
> > I don't know what happened exactly but it's building .deb files now. I =
d=C4=B1d
> > this
> > things:
> > https://github.com/openssl/openssl/issues/20293#issuecomment-1461877599=
 -->
> I
> > did make modules then make modules_sign. make modules_sign give error a=
nd I
> > did
> > this: https://askubuntu.com/a/1178467
> > then, to create signature, I think, click the link:
> > https://superuser.com/a/1322832 --> In this, I did this:=20
> > "In your linux kernel root folder that you're compiling go to the certs
> > folder
> > and run:"
> > openssl req -new -nodes -utf8 -sha512 -days 36500 -batch -x509 -config
> > x509.genkey -outform DER -out signing_key.x509 -keyout signing_key.pem
> > Then I tried this: "make modules_sign" and "make modules_install" and g=
et
> > error, so I decided to disable module signing:
> >
> >
> https://stackoverflow.com/questions/29806414/how-to-disable-kernel-module=
-signing-in-linux
> > but I didn't change the value from this UI. So I manually change .config
> > file:
> > CONFIG_MODULE_SIG=3Dn
> > CONFIG_MODULE_SIG_ALL=3Dn
> > I was change this and copy to linux6.6/ folder and then run "make
> -j$(nproc)
> > bindeb-pkg" then I checked the .config file while is building. In the
> .config
> > file that used for last building:=20
> > CONFIG_MODULE_SIG=3Dy
> > # CONFIG_MODULE_SIG_ALL is not set
>=20
> To use your own key pair, you need to set CONFIG_MODULE_SIG_KEY to the pa=
th
> of the desired key.
>=20
> >=20
> > NOW, I have this .deb file. How I am gonna install this, do I have to u=
se
> > command or I just click and open with KDE Discover. And which file shou=
ld I
> > install?
> > -----
> > dpkg-deb: building package 'linux-image-6.6.0' in
> > '../linux-image-6.6.0_6.6.0-6_amd64.deb'.
> > dpkg-deb: building package 'linux-libc-dev' in
> > '../linux-libc-dev_6.6.0-6_amd64.deb'.
> > dpkg-deb: building package 'linux-headers-6.6.0' in
> > '../linux-headers-6.6.0_6.6.0-6_amd64.deb'.
> > dpkg-deb: building package 'linux-image-6.6.0-dbg' in
> > '../linux-image-6.6.0-dbg_6.6.0-6_amd64.deb'.
> >  dpkg-genbuildinfo --build=3Dbinary
> -O../linux-upstream_6.6.0-6_amd64.buildinfo
> >  dpkg-genchanges --build=3Dbinary -O../linux-upstream_6.6.0-6_amd64.cha=
nges
> > dpkg-genchanges: info: binary-only upload (no source code included)
> >  dpkg-source --after-build .
> > dpkg-buildpackage: info: binary-only upload (no source included)
>=20
> Use apt (the package manager). Only kernel headers and images are needed
> to get the kernel running:
>=20
> ```
> # apt install ../linux-headers-6.6.0_6.6.0-6_amd64.deb
> ../linux-image-6.6.0_6.6.0-6_amd64.deb
> ```
>=20
> Thanks.

I think, something doesn't work:

ertugruluyar@ertugruluyar-pc:~/Desktop/linux-6.6$ sudo apt install
../linux-headers-6.6.0_6.6.0-6_amd64.deb ../linux-image-6.6.0_6.6.0-6_amd64=
.deb
[sudo] password for ertugruluyar:=20
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Note, selecting 'linux-headers-6.6.0' instead of
'../linux-headers-6.6.0_6.6.0-6_amd64.deb'
Note, selecting 'linux-image-6.6.0' instead of
'../linux-image-6.6.0_6.6.0-6_amd64.deb'
The following NEW packages will be installed:
  linux-headers-6.6.0 linux-image-6.6.0
0 upgraded, 2 newly installed, 0 to remove and 0 not upgraded.
Need to get 0 B/1.799 MB of archives.
After this operation, 1.874 MB of additional disk space will be used.
Get:1 /home/ertugruluyar/Desktop/linux-headers-6.6.0_6.6.0-6_amd64.deb
linux-headers-6.6.0 amd64 6.6.0-6 [9.750 kB]
Get:2 /home/ertugruluyar/Desktop/linux-image-6.6.0_6.6.0-6_amd64.deb
linux-image-6.6.0 amd64 6.6.0-6 [1.789 MB]=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Selecting previously unselected package linux-headers-6.6.0.=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
(Reading database ... 334966 files and directories currently installed.)
Preparing to unpack .../linux-headers-6.6.0_6.6.0-6_amd64.deb ...
Unpacking linux-headers-6.6.0 (6.6.0-6) ...
Selecting previously unselected package linux-image-6.6.0.
Preparing to unpack .../linux-image-6.6.0_6.6.0-6_amd64.deb ...
Unpacking linux-image-6.6.0 (6.6.0-6) ...
Setting up linux-image-6.6.0 (6.6.0-6) ...
 * dkms: running auto installation service for kernel 6.6.0=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Kernel preparation unnecessary for this kernel. Skipping...

Building module:
cleaning build area...
make -j6 KERNELRELEASE=3D6.6.0 -C /lib/modules/6.6.0/build
M=3D/var/lib/dkms/r8125/9.011.01/build......
Signing module:
Secure Boot not enabled on this system.
cleaning build area...

r8125.ko.zst:
Running module version sanity check.
 - Original module
   - No original module exists within this kernel
 - Installation
   - Installing to /lib/modules/6.6.0/updates/dkms/

depmod........

Kernel preparation unnecessary for this kernel. Skipping...

Building module:
cleaning build area...
make -j6 KERNELRELEASE=3D6.6.0 KDIR=3D/lib/modules/6.6.0/build....
Signing module:
Secure Boot not enabled on this system.
cleaning build area...

tuxedo_keyboard.ko.zst:
Running module version sanity check.
 - Original module
   - No original module exists within this kernel
 - Installation
   - Installing to /lib/modules/6.6.0/updates/dkms/

clevo_wmi.ko.zst:
Running module version sanity check.
 - Original module
   - No original module exists within this kernel
 - Installation
   - Installing to /lib/modules/6.6.0/updates/dkms/

clevo_acpi.ko.zst:
Running module version sanity check.
 - Original module
   - No original module exists within this kernel
 - Installation
   - Installing to /lib/modules/6.6.0/updates/dkms/

tuxedo_io.ko.zst:
Running module version sanity check.
 - Original module
   - No original module exists within this kernel
 - Installation
   - Installing to /lib/modules/6.6.0/updates/dkms/

uniwill_wmi.ko.zst:
Running module version sanity check.
 - Original module
   - No original module exists within this kernel
 - Installation
   - Installing to /lib/modules/6.6.0/updates/dkms/

depmod.........
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
                                                    [ OK ]
update-initramfs: Generating /boot/initrd.img-6.6.0
W: Possible missing firmware /lib/firmware/amdgpu/ip_discovery.bin for modu=
le
amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/vega10_cap.bin for module
amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/sienna_cichlid_cap.bin for
module amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/navi12_cap.bin for module
amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/psp_14_0_0_ta.bin for mod=
ule
amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/psp_14_0_0_toc.bin for mo=
dule
amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/psp_13_0_6_ta.bin for mod=
ule
amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/psp_13_0_6_sos.bin for mo=
dule
amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/aldebaran_cap.bin for mod=
ule
amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/aldebaran_sjt_mec2.bin for
module amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/aldebaran_sjt_mec.bin for
module amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/gc_9_4_3_rlc.bin for modu=
le
amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/gc_9_4_3_mec.bin for modu=
le
amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/gc_11_0_0_toc.bin for mod=
ule
amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/sdma_4_4_2.bin for module
amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/sdma_6_1_0.bin for module
amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/sienna_cichlid_mes1.bin f=
or
module amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/sienna_cichlid_mes.bin for
module amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/navi10_mes.bin for module
amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/gc_11_0_3_mes.bin for mod=
ule
amdgpu
W: Possible missing firmware /lib/firmware/amdgpu/vcn_4_0_3.bin for module
amdgpu
I: The initramfs will attempt to resume from /dev/nvme0n1p3
I: (UUID=3D7d6d065d-987c-406a-904d-0709695ab9e6)
I: Set the RESUME variable to override this.
Sourcing file `/etc/default/grub'
Sourcing file `/etc/default/grub.d/init-select.cfg'
Sourcing file `/etc/default/grub.d/tuxedo-theme.cfg'
Sourcing file `/etc/default/grub.d/tuxedo.cfg'
Generating grub configuration file ...
Found theme: /usr/share/grub/themes/tuxedo/theme.txt
Found linux image: /boot/vmlinuz-6.6.0
Found initrd image: /boot/initrd.img-6.6.0
Found linux image: /boot/vmlinuz-6.5.0-10006-tuxedo
Found initrd image: /boot/initrd.img-6.5.0-10006-tuxedo
Found linux image: /boot/vmlinuz-6.5.0-10005-tuxedo
Found initrd image: /boot/initrd.img-6.5.0-10005-tuxedo
Memtest86+ needs a 16-bit boot, that is not available on EFI, exiting
Warning: os-prober will be executed to detect other bootable partitions.
Its output will be used to detect bootable binaries on them and create new =
boot
entries.
Adding boot menu entry for UEFI Firmware Settings ...
done
Setting up linux-headers-6.6.0 (6.6.0-6) ...
N: Download is performed unsandboxed as root as file
'/home/ertugruluyar/Desktop/linux-headers-6.6.0_6.6.0-6_amd64.deb' couldn't=
 be
accessed by user '_apt'. - pkgAcquire::Run (13: Permission denied)
ertugruluyar@ertugruluyar-pc:~/Desktop/linux-6.6$ uname -a
Linux ertugruluyar-pc 6.5.0-10006-tuxedo #6 SMP PREEMPT_DYNAMIC Fri Oct 13
22:06:56 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
