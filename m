From: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Subject: Re: [PATCH] thinkpad_acpi: Add support for
	keyboard backlight
Date: Sat, 09 Jan 2016 15:46:41 -0200
Message-ID: <1452361601.676356.487415834.4652D305@webmail.messagingengine.com>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
	<20160104201231.GB5847@amd>
	<1452361154.673684.487414482.6CCEAE4B@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1452361154.673684.487414482.6CCEAE4B-2RFepEojUI2N1INw9kWLP6GC3tUn3ZHUQQ4Iyu8u01E@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, =?ISO-8859-1?Q?Pali=20Roh=E1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabio D'Urso <fabiodurso-PkbjNfxxIASonA0d6jMUrA@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Jan 9, 2016, at 15:39, Henrique de Moraes Holschuh wrote:
> On Mon, Jan 4, 2016, at 18:12, Pavel Machek wrote:
> > > This patch adds support for controlling keyboard backlight via standa=
rd
> > > linux led class interface (::kbd_backlight). It uses ACPI HKEY device=
 with
> > > MLCG and MLCS methods.
> > > =

> > > Signed-off-by: Pali Roh=E1r <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > Tested-by: Fabio D'Urso <fabiodurso-PkbjNfxxIASonA0d6jMUrA@public.gmane.org>
> > =

> > On my thinkpad, keyboard light is controlled by
> > =

> > /sys/class/leds/tpacpi\:\:thinklight/brightness
> > =

> > (that's a bad name).
> =

> That's because the driver was not updated to support your laptop, AND I
> don't recall if someone mapped the full behavior of the ACPI thinklight
> interface in your thinkpad :-(

Argh.  If by "keyboard light" you mean the LED above the *screen* that
shines down on the whole keyboard, please disregard my previous reply...

As for the naming, the idea of a LED up there shining in the keyboard
is:
 1. patented by IBM
 2. named "ThinkLight" by IBM, one of the "Think Technologies" in the
 "ThinkPad" (add TM after everything :p)  and every
     old-timer thinkpad user knew it by that name.
 4. called "thinklight" by the driver since before the LED sysfs class
 even existed :p

ibm-acpi, since then renamed thinkpad-acpi *predates* most generic
interfaces.  Heck, it predates sysfs.

So, this is ABI set in stone.  If there is a way to add an "alias" of
kbd_backlight that won't drive userspace crazy, we might do that though.
 But it looks quite risky to me...

-- =

  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

---------------------------------------------------------------------------=
---
Site24x7 APM Insight: Get Deep Visibility into Application Performance
APM + Mobile APM + RUM: Monitor 3 App instances at just $35/Month
Monitor end-to-end web transactions and take corrective actions now
Troubleshoot faster and improve end-user experience. Signup Now!
http://pubads.g.doubleclick.net/gampad/clk?id=3D267308311&iu=3D/4140
