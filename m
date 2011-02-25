From: Martin Pitt <martin.pitt@ubuntu.com>
Subject: Re: [PATCH] eeepc-wmi: set the touchpad toggle key code to F21
Date: Fri, 25 Feb 2011 10:53:56 +0100
Message-ID: <20110225095356.GA2681@piware.de>
References: <1298611140-21573-1-git-send-email-keng-yu.lin@canonical.com>
 <AANLkTim_JKQU9J3OJ0FRQ_ZVPktAPbnzr2t8SvhL2Uzj@mail.gmail.com>
 <20110225071827.GA14053@core.coreip.homeip.net>
 <AANLkTim6pxadoTSsNqYV_gmRGOwyFRvfErSvcwRtaavy@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from www.piware.de ([213.9.93.70]:44200 "EHLO mail.piware.de"
	rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1754271Ab1BYKCR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 25 Feb 2011 05:02:17 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTim6pxadoTSsNqYV_gmRGOwyFRvfErSvcwRtaavy@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?iso-8859-1?Q?Keng-Y=FC?= Lin <keng-yu.lin@canonical.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, tyson.chen@canonical.com

Keng-Y=FC Lin [2011-02-25 17:22 +0800]:
> Can udev re-map a key code to another?

Not directly, as udev itself doesn't actually process the input
events. It just pokes the scan code -> keycode map into the kernel.

What it can do is to re-map an existing key (scan code) to a different
key code, which provides the same effect in most cases.

Martin
--=20
Martin Pitt                        | http://www.piware.de
Ubuntu Developer (www.ubuntu.com)  | Debian Developer  (www.debian.org)
