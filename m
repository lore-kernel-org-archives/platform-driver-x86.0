From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform: x86: dell-laptop: Add support for keyboard
 backlight
Date: Fri, 6 Mar 2015 10:05:46 -0800
Message-ID: <20150306180546.GD19001@vmdeb7>
References: <1424343509-13639-1-git-send-email-gabriele.mzt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:44160 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752344AbbCFSFt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 6 Mar 2015 13:05:49 -0500
Content-Disposition: inline
In-Reply-To: <1424343509-13639-1-git-send-email-gabriele.mzt@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: mjg59@srcf.ucam.org, pali.rohar@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, A.Sloman@cs.bham.ac.uk, computersforpeace@gmail.com, dan.carpenter@oracle.com

On Thu, Feb 19, 2015 at 11:58:29AM +0100, Gabriele Mazzotta wrote:
> This patch adds the support for the configuration of the keyboard
> backlight on supported Dell laptops.
>=20
> With this patch it is possible to set:
> * keyboard backlight level
> * timeout after which the backlight will be automatically turned off
> * input activity triggers (keyboard, touchpad, mouse) that enable the=
 backlight
> * ambient light settings
>=20
> The settings are exposed via /sys/class/leds/dell::kbd_backlight/
>=20
> The code is based on the newly released documentation by Dell in the
> libsmbios project.
>=20
> Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>
> Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>

Queued for 4.1, thanks everyone.

--=20
Darren Hart
Intel Open Source Technology Center
