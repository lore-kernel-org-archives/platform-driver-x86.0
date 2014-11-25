From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] platform: x86: dell-laptop: Add support for keyboard
 backlight
Date: Tue, 25 Nov 2014 15:01:43 -0800
Message-ID: <20141125230143.GB32102@vmdeb7>
References: <1415967813-7223-1-git-send-email-pali.rohar@gmail.com>
 <1416754245-15550-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1416754245-15550-1-git-send-email-pali.rohar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, libsmbios-devel@lists.us.dell.com, Srinivas_G_Gowda@dell.com, Michael_E_Brown@dell.com, Gabriele Mazzotta <gabriele.mzt@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Nov 23, 2014 at 03:50:45PM +0100, Pali Roh=E1r wrote:
> This patch adds support for configuring keyboard backlight settings o=
n supported
> Dell laptops. It exports kernel leds interface and uses Dell SMBIOS t=
okens or
> keyboard class interface.
>=20
> With this patch it is possible to set:
> * keyboard backlight level
> * timeout after which will be backlight automatically turned off
> * input activity triggers (keyboard, touchpad, mouse) which enable ba=
cklight
> * ambient light settings
>=20
> Settings are exported via sysfs:
> /sys/class/leds/dell::kbd_backlight/
>=20
> Code is based on newly released documentation by Dell in libsmbios pr=
oject.
>=20
> Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>
> Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>

Queued in Testing branch, but still pending a more thorough final revie=
w from me
as it is such a large patch.

--=20
Darren Hart
Intel Open Source Technology Center
