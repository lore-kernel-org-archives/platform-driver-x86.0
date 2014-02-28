From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: ThinkPad T420 : 8 versus 16 brightness level steps
Date: Fri, 28 Feb 2014 09:15:03 +0100
Message-ID: <87fvn364c8.fsf@nemi.mork.no>
References: <530F750F.3010806@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from canardo.mork.no ([148.122.252.1]:55953 "EHLO canardo.mork.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751326AbaB1IPW convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 28 Feb 2014 03:15:22 -0500
In-Reply-To: <530F750F.3010806@gmx.de> ("Toralf =?utf-8?Q?F=C3=B6rster=22'?=
 =?utf-8?Q?s?= message of "Thu, 27
	Feb 2014 18:25:35 +0100")
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Toralf =?utf-8?Q?F=C3=B6rster?= <toralf.foerster@gmx.de>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

Toralf F=C3=B6rster <toralf.foerster@gmx.de> writes:

> /'m wondering why under a 64 bit RedHat 6.4 Linux with kernel 2.6.32+=
X
> I do have 16 levels in dimming the display brightness with Fn+Pos1/En=
d
> whereas under a 32 bit Gentoo Linux with recent 3.1x.y kernels I do
> just have 8 steps from min to max.

My guess would be this:
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/d=
rivers/platform/x86/thinkpad_acpi.c?id=3D122f26726b5e16174bf8a707df14be=
1d93c49d62



Bj=C3=B8rn
