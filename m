From: Valdis Kletnieks <Valdis.Kletnieks@vt.edu>
Subject: dell_rbtn - kernel panic at boot...
Date: Thu, 21 May 2015 22:06:43 -0400
Message-ID: <5875.1432260403@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1432260403_2099P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali Rohar <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

--==_Exmh_1432260403_2099P
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

So after I made both config variables =3Dy, the resulting kernel built, b=
ut
died a glorious death at boot.

Dell Latitude E6530, most current released BIOS.

=5B    1.760739=5D BUG: unable to handle kernel NULL pointer dereference =
at 0000000000000090
=5B    1.760778=5D IP: =5B<ffffffffa79460cc>=5D klist_next+0x1c/0x1d0
=5B    1.760804=5D PGD 0=20
=5B    1.760816=5D Oops: 0000 =5B=231=5D PREEMPT SMP=20
=5B    1.760842=5D Modules linked in:
=5B    1.761268=5D CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.1.0-rc4-ne=
xt-20150521 =2355
=5B    1.761295=5D Hardware name: Dell Inc. Latitude E6530/07Y85M, BIOS A=
16 09/24/2014
=5B    1.761320=5D task: ffff88022ca10010 ti: ffff88022ca14000 task.ti: f=
fff88022ca14000
=5B    1.761346=5D RIP: 0010:=5B<ffffffffa79460cc>=5D  =5B<ffffffffa79460=
cc>=5D klist_next+0x1c/0x1d0
=5B    1.761377=5D RSP: 0000:ffff88022ca17d58  EFLAGS: 00010292
=5B    1.761396=5D RAX: 0000000000000000 RBX: 0000000000000000 RCX: fffff=
fffa7633580
=5B    1.761420=5D RDX: 0000000000000000 RSI: ffff88022ca17db0 RDI: 00000=
00000000040
=5B    1.761445=5D RBP: ffff88022ca17d98 R08: 0000000000000000 R09: 00000=
000000a204a
=5B    1.761469=5D R10: 0000000000000000 R11: 0000000000000000 R12: ffff8=
8022ca17db0
=5B    1.761471=5D sd 0:0:0:0: =5Bsda=5D 976773168 512-byte logical block=
s: (500 GB/465 GiB)
=5B    1.761473=5D sd 0:0:0:0: =5Bsda=5D 4096-byte physical blocks
=5B    1.761533=5D R13: 0000000000000000 R14: ffffffffa7ff466d R15: 00000=
00000000000
=5B    1.761558=5D FS:  0000000000000000(0000) GS:ffff88022dc80000(0000) =
knlGS:0000000000000000
=5B    1.761585=5D CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
=5B    1.761605=5D CR2: 0000000000000090 CR3: 0000000027e0b000 CR4: 00000=
000001406e0
=5B    1.761628=5D Stack:
=5B    1.761633=5D sd 0:0:0:0: =5Bsda=5D Write Protect is off
=5B    1.761635=5D sd 0:0:0:0: =5Bsda=5D Mode Sense: 00 3a 00 00
=5B    1.761671=5D  ffff88022ca17dd8 ffffffffa73b8929 0000000000000000
=5B    1.761694=5D sd 0:0:0:0: =5Bsda=5D Write cache: enabled, read cache=
: enabled, doesn't support DPO or FUA
=5B    1.761725=5D  0000000000000000
=5B    1.761743=5D  ffff88022ca17dfc ffffffffa7633580 ffffffffa7ff466d 00=
00000000000000
=5B    1.761782=5D  ffff88022ca17de8 ffffffffa74a202c ffffffffa7f07f10 00=
00000000000040
=5B    1.761846=5D Call Trace:
=5B    1.761871=5D  =5B<ffffffffa73b8929>=5D ? ___preempt_schedule+0x12/0=
x14
=5B    1.761894=5D  =5B<ffffffffa7633580>=5D ? rbtn_rfkill_set_block+0x10=
/0x10
=5B    1.761916=5D  =5B<ffffffffa7ff466d>=5D ? find_tokens+0xa2/0xa2
=5B    1.761938=5D  =5B<ffffffffa74a202c>=5D driver_for_each_device+0x6c/=
0xb0
=5B    1.761960=5D  =5B<ffffffffa7633752>=5D dell_rbtn_notifier_register+=
0x42/0xc0
=5B    1.761984=5D  =5B<ffffffffa7ff4981>=5D dell_init+0x314/0x98c
=5B    1.762003=5D  =5B<ffffffffa7ff466d>=5D ? find_tokens+0xa2/0xa2
=5B    1.762024=5D  =5B<ffffffffa70002b9>=5D do_one_initcall+0x99/0x210
=5B    1.762046=5D  =5B<ffffffffa7081300>=5D ? parse_args+0x140/0x3b0
=5B    1.762068=5D  =5B<ffffffffa7fb0237>=5D kernel_init_freeable+0x1c0/0=
x261
=5B    1.762090=5D  =5B<ffffffffa7946b90>=5D ? rest_init+0x140/0x140
=5B    1.762110=5D  =5B<ffffffffa7946b9e>=5D kernel_init+0xe/0xe0
=5B    1.762129=5D  =5B<ffffffffa795b00f>=5D ret_from_fork+0x3f/0x70
=5B    1.762149=5D  =5B<ffffffffa7946b90>=5D ? rest_init+0x140/0x140
=5B    1.762168=5D Code: ff ff 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 55 =
48 89 e5 41 57 41 56 41 55 41 54 49 89 fc 53 48 83 ec 18 48 8b 3f 4d 8b 6=
c 24 08 <4c> 8b 77 50 e8 2b 3b 01 00 4d 85 ed 0f 84 30 01 00 00 49 8b 45 =

=5B    1.762415=5D RIP  =5B<ffffffffa79460cc>=5D klist_next+0x1c/0x1d0
=5B    1.762437=5D  RSP <ffff88022ca17d58>
=5B    1.762450=5D CR2: 0000000000000090
=5B    1.762466=5D ---=5B end trace 24f4c0df0e74c2d0 =5D---
=5B    1.762737=5D scsi 1:0:0:0: CD-ROM            MATSHITA DVD+-RW UJ8C2=
    1.02 PQ: 0 ANSI: 5
=5B    1.765506=5D  sda: sda1 sda2 sda3
=5B    1.766304=5D sd 0:0:0:0: =5Bsda=5D Attached SCSI disk
=5B    1.905686=5D=20
=5B    1.905686=5D Kernel panic - not syncing: Attempted to kill init=21 =
exitcode=3D0x00000009
=5B    1.909713=5D Kernel Offset: 0x26000000 from 0xffffffff81000000 (rel=
ocation range: 0xffffffff80000000-0xffffffffbfffffff)


--==_Exmh_1432260403_2099P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Exmh version 2.5 07/13/2001

iQIVAwUBVV6PMgdmEQWDXROgAQIg8g/+IQcMEmT5lZVcljg4tbYjkBK2vhtJLdeX
+d8pWfui7axwPROF/yGOUk84fAyALvamcVYrNyeI61syx6QQzaQFuiTu5Df3xt9p
7GrthTZR+76ivhDtiZr3Gwz5YGOLr/Vu6kD47cXStw+VZCSsYMw6hwF2YZjZp1Pq
ehFqUf0j8jvS07b0aNusHktBYL4JkSxEiImB8FasWBmXM/LvTDcAezx0wXoQeyF+
XbwHSbCETVOfmsrEMakztWIhJZq674NfSX3nX6JKdCUX6dBsXeFtLqQgM2sBJIKY
RrcsMO6BhJV8zIaxpYln1X/OnlktGVp9cAKuEXy3RYBPG432Z/TqmFDhKEU+vNJ7
arrxnnbLevOx4EIXHtQaJqEZEGA6TPGOmkLBPG2Is/oIxZcfVtAvF315v8DmY2+w
zX9opA8s9d5S011CVYMi0LXZNxpbp7v97P8zR8aMau37Hy2sDnoW8NTVHfnt17Lm
CNXvSojHBhs3VK06Yd/nRBsy3or1BkFAfRMnHUdMoY8uje9oO6vmSVco+I/cnjNr
SUfGnkzqWiJLMabQLQ2MkLZvs6Ta/Y7LqQJ3R57oMb1XjZQ67+8bqg+ao1WnxwBK
07QehR4gtE677hkMmcxJwEVnsBw9XMP5WxeLn1QNLTQWOmJaA6X7auYkTuuxbo8+
+E/xwBEMdZc=
=XW9F
-----END PGP SIGNATURE-----

--==_Exmh_1432260403_2099P--
