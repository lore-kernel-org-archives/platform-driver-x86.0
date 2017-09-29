From: "Gabriel M. Elder" <gabriel@tekgnowsys.com>
Subject: RE: keyboard backlight =?UTF-8?Q?max=5Fbrightness=20bug=20on=20Dell=20Lat?=
 =?UTF-8?Q?itude=20E=36=34=31=30?=
Date: Fri, 29 Sep 2017 07:08:23 -0700
Message-ID: <20170929070823.669a95d04dbb6b53be537852cb8ecb8c.0314fabe33.wbe@email22.secureserver.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?UTF-8?Q?Roh=C3=A1r?= <pali.rohar@gmail.com>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario Limonciello <Mario_Limonciello@Dell.com>
Cc: Darren Hart <dvhart@infradead.org>, andy@infradead.org, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

FYI, latest update and info relating to
https://bugzilla.kernel.org/show_bug.cgi?id=196913


--- a/drivers/platform/x86/dell-laptop.c	
+++ a/drivers/platform/x86/dell-laptop.c	
@@ -1217,7 +1217,7 @@ static int kbd_get_info(struct kbd_info *info)
 static unsigned int kbd_get_max_level(void)
 {
 	if (kbd_info.levels != 0)
-		return kbd_info.levels;
+		return kbd_info.levels - 1;
 	if (kbd_mode_levels_count > 0)
 		return kbd_mode_levels_count - 1;
 	return 0;


Finally had a chance to make this mod, compile and try it out. Based on
my testing, it seems to completely correct the problem.

Upon initially opening the power panel in gnome-control-center, the
keyboard brightness slider is all the way over to the right, where one
would expect it to be, as well as all of the brightness step levels.
Closing the lid, putting it to sleep and waking it back up does not have
the annoying keyboard backlight disabling side-effect that I previously
described.

- Gabriel


-------- Original Message --------
Subject: Re: keyboard backlight max_brightness bug on Dell Latitude
E6410
From: Pali Rohár <pali.rohar@gmail.com>
Date: Thu, September 14, 2017 10:25 am
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario Limonciello
<Mario_Limonciello@Dell.com>
Cc: "Gabriel M. Elder" <gabriel@tekgnowsys.com>, Darren Hart
<dvhart@infradead.org>, andy@infradead.org,
"platform-driver-x86@vger.kernel.org"
<platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org"
<linux-kernel@vger.kernel.org>

On Thursday 14 September 2017 16:33:57 Gabriele Mazzotta wrote:
> 2017-09-14 15:54 GMT+02:00 Pali Rohár <pali.rohar@gmail.com>:
> > Adding Gabriele to thread, IIRC you have machine which uses
> > "supported keyboard light brightness levels"
> > Can you look at this bug, if your machine is affected by it too?
> 
> My keyboard has two brightness levels + off. The value of
> max_brightness is 2, as expected.

Ah :-(

So you have "Supported Keyboard light brightness levels : 2" and you
can se value 0, 1 or 2.

And Gabriel has "Supported Keyboard light brightness levels : 10" and
can set only values 0..9. But not 10.

Any idea how to solve this situation?

CCing Mario from Dell. Can you recheck what is wrong here? Or why
Dell Latitude E6410 behaves differently?

> Gabriele
> 
> Yes, my laptop uses "supported keyboard light brightness levels".
> >
> > Important parts in ouptput:
> >
> >> ... --info
> >> Supported Keyboard light brightness levels : 10
> >
> >> ... --get-status
> >> Current keyboard light level : 9
> >
> > Gabriel, can you play with this tool, which values can be set via
> > --set-level= parameter? Is 10 accepted? --get-status can be used to
> > check if value was accepted.
> >
> > On Thursday 14 September 2017 06:35:15 Gabriel M. Elder wrote:
> >>
> >> output from smbios-keyboard-ctl --info:
> >>
> >> Libsmbios version : 2.3.0
> >> smbios-keyboard-ctl version : 2.3.0
> >>
> >> Capabilities of KeyBoard Illumination on your system:
> >> -------------------------------------------------------------------
> >> Supported USER Selectable Modes :
> >> Always OFF
> >> Auto: ALS- and input-activity-based On; input-activity based Off
> >> Auto: Input-activity-based On; input-activity based Off
> >>
> >> Supported Keyboard illumination type : Backlight
> >>
> >> Supports Keyboard illumination on :
> >> Any Keystroke
> >> Touchpad activity
> >> Pointing stick
> >>
> >> Can configure Keyboard illumination timeout unit in :
> >> Seconds
> >> Minutes
> >> Hours
> >>
> >> Supported Keyboard light brightness levels : 10
> >>
> >> Maximum acceptable seconds timeout value : 255
> >>
> >> Maximum acceptable minutes timeout value : 255
> >>
> >> Maximum acceptable hours timeout value : 12
> >>
> >> Maximum acceptable days timeout value : 0
> >>
> >>
> >> output from smbios-keyboard-ctl --get-status:
> >>
> >> Helper function to print current status of keyboard illumination
> >>
> >> Current status of KeyBoard Illumination setting on your system:
> >> -------------------------------------------------------------------
> >>
> >> Configured mode state:
> >> Auto: Input-activity-based On; input-activity based Off
> >>
> >> Your Keyboard will illumination on:
> >> Any Keystroke
> >> Touchpad activity
> >> Pointing stick
> >>
> >> Keyboard illumination timeout has bee set at: 10 Seconds
> >>
> >> Current setting of ALS value that turns the light on or off: 18
> >> Current ALS Reading : 16
> >> Current keyboard light level : 9
> >>
> >>
> >> -------- Original Message --------
> >> Subject: Re: keyboard backlight max_brightness bug on Dell Latitude
> >> E6410
> >> From: Pali Rohár <pali.rohar@gmail.com>
> >> Date: Thu, September 14, 2017 3:06 am
> >> To: "Gabriel M. Elder" <gabriel@tekgnowsys.com>
> >> Cc: dvhart@infradead.org, andy@infradead.org,
> >> platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
> >>
> >> On Monday 11 September 2017 23:25:27 Gabriel M. Elder wrote:
> >> > Hi all,
> >> > Hans de Goede, one of the upower maintainers, suggested I alert you all to this bug:
> >> >
> >> > https://bugs.freedesktop.org/show_bug.cgi?id=100041
> >> >
> >> > and the new one I filed via the kernel bugzilla:
> >> >
> >> > https://bugzilla.kernel.org/show_bug.cgi?id=196913
> >> > "keyboard backlight max_brightness value outside allowable range on Dell Latitude E6410 laptop"
> >> >
> >> > Please check it out at your earliest convenience.
> >> >
> >> > thanks,
> >> > - Gabriel</html>
> >>
> >> Hi Gabriel, please avoid sending such html emails to mailing list as it
> >> is hard to read them and also you have a very big chance that email
> >> would be eaten by spam filter or other developers would completely
> >> ignore it...
> >>
> >> To debug your problem, can you run smbios-keyboard-ctl tool from the
> >> libsmbios project? https://github.com/dell/libsmbios
> >>
> >> We would need output from --info parameter and also from --get-status.
> >>
> >
> > --
> > Pali Rohár
> > pali.rohar@gmail.com

-- 
Pali Rohár
pali.rohar@gmail.com
