From: "Gabriel M. Elder" <gabriel@tekgnowsys.com>
Subject: RE: keyboard backlight =?UTF-8?Q?max=5Fbrightness=20bug=20on=20Dell=20Lat?=
 =?UTF-8?Q?itude=20E=36=34=31=30?=
Date: Thu, 14 Sep 2017 06:35:15 -0700
Message-ID: <20170914063515.669a95d04dbb6b53be537852cb8ecb8c.39d3e774b5.wbe@email22.secureserver.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from p3plsmtp22-06-2.prod.phx3.secureserver.net ([68.178.252.64]:41129
        "EHLO p3plsmtp22-06.prod.phx3.secureserver.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751165AbdINNfr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Sep 2017 09:35:47 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?UTF-8?Q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org


output from smbios-keyboard-ctl --info:

Libsmbios version : 2.3.0
smbios-keyboard-ctl version : 2.3.0

 Capabilities of KeyBoard Illumination on your system: 
-------------------------------------------------------------------
 Supported USER Selectable Modes : 
	 Always OFF
	 Auto: ALS- and input-activity-based On; input-activity based Off
	 Auto: Input-activity-based On; input-activity based Off

 Supported Keyboard illumination type :  Backlight

 Supports Keyboard illumination on : 
	Any Keystroke
	Touchpad activity
	Pointing stick

 Can configure Keyboard illumination timeout unit in : 
	Seconds
	Minutes
	Hours

 Supported Keyboard light brightness levels :  10

 Maximum acceptable seconds timeout value   :  255

 Maximum acceptable minutes timeout value   :  255

 Maximum acceptable hours timeout value     :  12

 Maximum acceptable days timeout value      :  0


output from smbios-keyboard-ctl --get-status:

Helper function to print current status of keyboard illumination

 Current status of KeyBoard Illumination setting on your system: 
-------------------------------------------------------------------

 Configured mode state: 
	 Auto: Input-activity-based On; input-activity based Off

 Your Keyboard will illumination on: 
	Any Keystroke
	Touchpad activity
	Pointing stick

 Keyboard illumination timeout has bee set at: 10  Seconds

 Current setting of ALS value that turns the light on or off: 18
 Current ALS Reading : 16
 Current keyboard light level : 9


-------- Original Message --------
Subject: Re: keyboard backlight max_brightness bug on Dell Latitude
E6410
From: Pali Rohár <pali.rohar@gmail.com>
Date: Thu, September 14, 2017 3:06 am
To: "Gabriel M. Elder" <gabriel@tekgnowsys.com>
Cc: dvhart@infradead.org, andy@infradead.org,
platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Monday 11 September 2017 23:25:27 Gabriel M. Elder wrote:
> Hi all,
> Hans de Goede, one of the upower maintainers, suggested I alert you all to this bug:
> 
> https://bugs.freedesktop.org/show_bug.cgi?id=100041
> 
> and the new one I filed via the kernel bugzilla:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=196913
> "keyboard backlight max_brightness value outside allowable range on Dell Latitude E6410 laptop"
> 
> Please check it out at your earliest convenience.
> 
> thanks,
> - Gabriel</html>

Hi Gabriel, please avoid sending such html emails to mailing list as it
is hard to read them and also you have a very big chance that email
would be eaten by spam filter or other developers would completely
ignore it...

To debug your problem, can you run smbios-keyboard-ctl tool from the
libsmbios project? https://github.com/dell/libsmbios

We would need output from --info parameter and also from --get-status.

-- 
Pali Rohár
pali.rohar@gmail.com
