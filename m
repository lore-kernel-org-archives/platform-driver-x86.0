From: joeyli <jlee@suse.com>
Subject: Re: [PATCH 5/6] msi-laptop: Add missing ABI documentation
Date: Wed, 28 Nov 2012 11:36:28 +0800
Message-ID: <1354073788.21227.1007.camel@linux-s257.site>
References: <1353796141-1470-1-git-send-email-maxtram95@gmail.com>
	 <1353796141-1470-6-git-send-email-maxtram95@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:34459 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751879Ab2K1Dh1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 27 Nov 2012 22:37:27 -0500
In-Reply-To: <1353796141-1470-6-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, jlee@novell.com, mjg@redhat.com

=E6=96=BC =E6=97=A5=EF=BC=8C2012-11-25 =E6=96=BC 00:29 +0200=EF=BC=8CMa=
xim Mikityanskiy =E6=8F=90=E5=88=B0=EF=BC=9A
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> ---
>  .../ABI/testing/sysfs-platform-msi-laptop          | 83 ++++++++++++=
++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-platform-msi-lapt=
op
>=20
> diff --git a/Documentation/ABI/testing/sysfs-platform-msi-laptop b/Do=
cumentation/ABI/testing/sysfs-platform-msi-laptop
> new file mode 100644
> index 0000000..f621027
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-platform-msi-laptop
> @@ -0,0 +1,83 @@
> +What:		/sys/devices/platform/msi-laptop-pf/lcd_level
> +Date:		Oct 2006
> +KernelVersion:	2.6.19
> +Contact:	"Lennart Poettering <mzxreary@0pointer.de>"
> +Description:
> +		Screen brightness: contains a single integer in the range 0..8.
> +
> +What:		/sys/devices/platform/msi-laptop-pf/auto_brightness
> +Date:		Oct 2006
> +KernelVersion:	2.6.19
> +Contact:	"Lennart Poettering <mzxreary@0pointer.de>"
> +Description:
> +		Enable automatic brightness control: contains either 0 or 1. If
> +		set to 1 the hardware adjusts the screen brightness
> +		automatically when the power cord is plugged/unplugged.
> +
> +What:		/sys/devices/platform/msi-laptop-pf/wlan
> +Date:		Oct 2006
> +KernelVersion:	2.6.19
> +Contact:	"Lennart Poettering <mzxreary@0pointer.de>"
> +Description:
> +		WLAN subsystem enabled: contains either 0 or 1.
> +
> +What:		/sys/devices/platform/msi-laptop-pf/bluetooth
> +Date:		Oct 2006
> +KernelVersion:	2.6.19
> +Contact:	"Lennart Poettering <mzxreary@0pointer.de>"
> +Description:
> +		Bluetooth subsystem enabled: contains either 0 or 1. Please
> +		note that this file is constantly 0 if no Bluetooth hardware is
> +		available.
> +
> +What:		/sys/devices/platform/msi-laptop-pf/touchpad
> +Date:		Nov 2012
> +KernelVersion:	3.7
> +Contact:	"Maxim Mikityanskiy <maxtram95@gmail.com>"
> +Description:
> +		Contains either 0 or 1 and indicates if touchpad is turned on.
> +		Touchpad state can only be toggled by pressing Fn+F3.
> +

I think we don't need another interface to raise the touchpad status
because we already send key code to user space.

Except touchpad, other content in this documentation patch is good!

Signed-off-by: Lee, Chun-Yi <jlee@suse.com>


Thanks a lot!
Joey Lee

> +What:		/sys/devices/platform/msi-laptop-pf/turbo_mode
> +Date:		Nov 2012
> +KernelVersion:	3.7
> +Contact:	"Maxim Mikityanskiy <maxtram95@gmail.com>"
> +Description:
> +		Contains either 0 or 1 and indicates if turbo mode is turned
> +		on. In turbo mode power LED is orange and processor is
> +		overclocked. Turbo mode is available only if charging. It is
> +		only possible to toggle turbo mode state by pressing Fn+F10,
> +		and there is a few seconds cooldown between subsequent toggles.
> +		If user presses Fn+F10 too frequent, turbo mode state is not
> +		changed.
> +
> +What:		/sys/devices/platform/msi-laptop-pf/eco_mode
> +Date:		Nov 2012
> +KernelVersion:	3.7
> +Contact:	"Maxim Mikityanskiy <maxtram95@gmail.com>"
> +Description:
> +		Contains either 0 or 1 and indicates if ECO mode is turned on.
> +		In ECO mode power LED is green and userspace should do some
> +		powersaving actions. ECO mode is available only on battery
> +		power. ECO mode can only be toggled by pressing Fn+F10.
> +
> +What:		/sys/devices/platform/msi-laptop-pf/turbo_cooldown
> +Date:		Nov 2012
> +KernelVersion:	3.7
> +Contact:	"Maxim Mikityanskiy <maxtram95@gmail.com>"
> +Description:
> +		Contains value in range 0..3:
> +			* 0 -> Turbo mode is off
> +			* 1 -> Turbo mode is on, cannot be turned off yet
> +			* 2 -> Turbo mode is off, cannot be turned on yet
> +			* 3 -> Turbo mode is on
> +
> +What:		/sys/devices/platform/msi-laptop-pf/auto_fan
> +Date:		Nov 2012
> +KernelVersion:	3.7
> +Contact:	"Maxim Mikityanskiy <maxtram95@gmail.com>"
> +Description:
> +		Contains either 0 or 1 and indicates if fan speed is controlled
> +		automatically (1) or fan runs at maximal speed (0). Can be
> +		toggled in software.
> +
