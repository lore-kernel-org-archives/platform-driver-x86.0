From: Mattia Dongili <malattia@linux.it>
Subject: Re: sony-laptop crash (Sony VPC SE 1V9E) for 3.8.0+
Date: Mon, 5 Aug 2013 07:14:54 +0900
Message-ID: <20130804221454.GB7707@kamineko.org>
References: <51FE2F39.4080504@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:47551 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753919Ab3HDWPW convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 4 Aug 2013 18:15:22 -0400
Content-Disposition: inline
In-Reply-To: <51FE2F39.4080504@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco =?iso-8859-1?Q?Kr=FCger?= <krgsch@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

On Sun, Aug 04, 2013 at 12:38:49PM +0200, Marco Kr=FCger wrote:
> Hey Mattia,
>=20
> since the kernel 3.8.0 (commit:
> 23caaeea271cfe3176f0e27374d2016bd7583ea8) the sony-laptop module
> chrashes for me.
> Initially reported to the Arch Linux Bugtracker [1]. Link [2] lists
> full module output with enabled debug parameter.
>=20
> Thanks!
>=20
> [  171.492147] ------------[ cut here ]------------
> [  171.492151] WARNING: at fs/sysfs/dir.c:530 sysfs_add_one+0xa5/0xd0=
()
> [  171.492153] sysfs: cannot create duplicate filename '/devices/plat=
form/sony-laptop/kbd_backlight'

So you seem to have both these that cause the above sysfs to be
attempted to be added twice
case 0x0143:
case 0x014b:

Could you send your DSDT?
--=20
mattia
:wq!
