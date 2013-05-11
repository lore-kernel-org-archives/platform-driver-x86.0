From: =?UTF-8?B?VG9yYWxmIEbDtnJzdGVy?= <toralf.foerster@gmx.de>
Subject: "thinkpad_acpi: EC reports that Thermal Table has changed" and after
 that the hd was remounted-
Date: Sat, 11 May 2013 12:14:02 +0200
Message-ID: <518E19EA.4070701@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.20]:60429 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752645Ab3EKKOG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 11 May 2013 06:14:06 -0400
Received: from mailout-de.gmx.net ([10.1.76.2]) by mrigmx.server.lan
 (mrigmx001) with ESMTP (Nemesis) id 0Mee1e-1Uuwz50G0O-00OHbu for
 <platform-driver-x86@vger.kernel.org>; Sat, 11 May 2013 12:14:03 +0200
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

While sitting near to my ThinkPad T420 suddenly a peep was produced and=
 in the
syslog I read :


2013-05-11T12:08:31.094+02:00 n22 kernel: thinkpad_acpi: EC reports tha=
t Thermal Table has changed
2013-05-11T12:08:31.000+02:00 n22 logger: ACPI event : ibm/hotkey HKEY =
00000080 00006030
2013-05-11T12:08:32.226+02:00 n22 kernel: ata1.00: configured for UDMA/=
100
2013-05-11T12:08:32.226+02:00 n22 kernel: ata1: EH complete
2013-05-11T12:08:32.226+02:00 n22 kernel: sd 0:0:0:0: [sda] Write cache=
: disabled, read cache: enabled, doesn't support DPO or FUA
2013-05-11T12:08:35.146+02:00 n22 kernel: EXT4-fs (sdb3): re-mounted. O=
pts: commit=3D600

/me just wonders why the hard disk (external USB drive, from that I boo=
ted
a 32 bit stable Gentoo, kernel 3.9.1) was re-mounted in such a case.

--=20
MfG/Sincerely
Toralf F=C3=B6rster
pgp finger print: 7B1A 07F4 EC82 0F90 D4C2 8936 872A E508 7DB6 9DA3
