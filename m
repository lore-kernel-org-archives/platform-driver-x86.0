From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2] dell-wmi: process Dell Instant Launch hotkey on Dell
 Vostro V131
Date: Fri, 4 Dec 2015 09:56:24 +0100
Message-ID: <20151204085624.GN10982@pali>
References: <20151130211542.GE30553@malice.jf.intel.com>
 <1654e7bcde98f1cf89f698a1e359110c06c6fcd4.1448999372.git.kernel@kempniu.pl>
 <20151204011606.GI1800@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:33329 "EHLO
	mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755472AbbLDI41 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 4 Dec 2015 03:56:27 -0500
Content-Disposition: inline
In-Reply-To: <20151204011606.GI1800@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>

On Thursday 03 December 2015 17:16:06 Darren Hart wrote:
> This looks fine to me, and if Pali will ack it, I'll move it from for=
-review to
> testing and Andy will need to update patch 14/14 to accomodate - unle=
ss you guys
> decide to include this in his.

This patch is not enough for enabling 0xe025 key on that Vostro machine=
=2E
Some extra SMBIOS call is needed, without them ACPI will not send WMI
keypress event.

Dell SMBIOS call can be done either via WMI or via SMI inb/outb
instructions which implements dcdbas.ko driver. Module dell-laptop.ko
uses only SMBIOS API for all functionality and uses dcdbas.ko.

There is another driver which uses SMBIOS API, but use WMI calls. It is
dell-led.ko in leds subsystem.

So now I do not know where to put that needed SMBIOS call for enabling
0xe025 hotkey event and also I do not know if it is better to use WMI o=
r
dcdbas.ko.

Maybe now it could make sense to unify Dell SMBIOS API in kernel and
move common functions to one place and let drivers to use just common
functions. According to older Dell ACPI WMI documentation in DMI is bit
which specify if BIOS support SMBIOS via WMI or not.

At least I think this one patch should not be included into kernel unti=
l
there will be full support for 0xe025 key (adding that SMBIOS call).

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
