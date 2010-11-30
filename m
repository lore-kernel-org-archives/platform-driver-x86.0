From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [RFC][PATCH] New ACPI-WMI driver for shuttle machines
Date: Wed, 1 Dec 2010 00:22:03 +0100
Message-ID: <AANLkTikQAQZGv20kWREvVKARpvCQN7aP5tcshpcMh+M2@mail.gmail.com>
References: <20101130152719.6f4f64b2@gotham.conectiva>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:59802 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750774Ab0K3XWG convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 30 Nov 2010 18:22:06 -0500
Received: by ewy5 with SMTP id 5so3195148ewy.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Nov 2010 15:22:03 -0800 (PST)
In-Reply-To: <20101130152719.6f4f64b2@gotham.conectiva>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Herton Ronaldo Krzesinski <herton@mandriva.com.br>
Cc: platform-driver-x86@vger.kernel.org

On Tue, Nov 30, 2010 at 6:27 PM, Herton Ronaldo Krzesinski
<herton@mandriva.com.br> wrote:
> Hi,
>
> Recently, I received some shuttle machines that are mostly a notebook=
 "glued"
> to a desktop form factor. They are notebook hardware, have a webcam, =
wireless,
> etc., but they don't have a notebook keyboard, and because of this no=
 way to
> control the hardware, like webcam on/off, etc. So, a driver is needed=
=2E
>
> The machines I have here is similar (not same) to this on shuttle web=
site:
> http://us.shuttle.com/X50v2.aspx
>
> What follows is a patch which adds a driver which exposes the control=
s
> available through ACPI-WMI. For now just a RFC to get feedback. Also,=
 on some
> shuttle machines, fn+<function> can have different values, and I need=
 to
> implement a more flexible way to change command numbers (fn+n) depend=
ing on
> model of shuttle machine, so it isn't a final version yet. And on Shu=
ttle
> DA18IE, the interface for video switch isn't final and could change, =
which
> may affect the driver.
>
> [PATCH] Add shuttle-wmi driver
>
> This adds a new platform driver for shuttle machines. On some desktop
> machines, shuttle is using laptop hardware, but without laptop keyboa=
rd.
> Thus, for some features like turn on/off webcam, a way is need to
> control the hardware. The driver uses ACPI-WMI interface provided to
> export available controls through sysfs.
>
> Signed-off-by: Herton Ronaldo Krzesinski <herton@mandriva.com.br>
> ---
> =C2=A0.../ABI/testing/sysfs-platform-shuttle-wmi =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | =C2=A0161 ++++
> =C2=A0drivers/platform/x86/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 16 +
> =C2=A0drivers/platform/x86/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A01 +
> =C2=A0drivers/platform/x86/shuttle-wmi.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0843 ++++++++++++++++++++
> =C2=A04 files changed, 1021 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 Documentation/ABI/testing/sysfs-platform-shu=
ttle-wmi
> =C2=A0create mode 100644 drivers/platform/x86/shuttle-wmi.c
>
> diff --git a/Documentation/ABI/testing/sysfs-platform-shuttle-wmi b/D=
ocumentation/ABI/testing/sysfs-platform-shuttle-wmi
> new file mode 100644
> index 0000000..63a8c8b
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-platform-shuttle-wmi
> @@ -0,0 +1,161 @@
> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shuttl=
e_wmi/brightness_down
> +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> +KernelVersion: 2.6.37
> +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton@ma=
ndriva.com.br>
> +Description:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write on=
ly option (accepts any single value, eg.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > brightne=
ss_down") that is equivalent of pressing
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn+<brightness dow=
n> function on notebooks. This option exists
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 because of shuttle=
 machines that are notebooks in desktop form
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 factor, and which =
don't have the notebook keyboard, thus no
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 way to use fn+<bri=
ghtness down>.
> +
> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shuttl=
e_wmi/brightness_up
> +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> +KernelVersion: 2.6.37
> +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton@ma=
ndriva.com.br>
> +Description:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write on=
ly option (accepts any single value, eg.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > brightne=
ss_up") that is equivalent of pressing
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn+<brightness up>=
 function on notebooks. This option exists
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 because of shuttle=
 machines that are notebooks in desktop form
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 factor, and which =
don't have the notebook keyboard, thus no
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 way to use fn+<bri=
ghtness up>.

Why such files ? Can't we do the same using the backlight device ?

> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shuttl=
e_wmi/cut_lvds
> +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> +KernelVersion: 2.6.37
> +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton@ma=
ndriva.com.br>
> +Description:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write on=
ly option. Writing any single non-zero value
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to it enables main=
 screen output, 0 to disable.

Same, could be handled by the backlight device.

> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shuttl=
e_wmi/lcd_auto_adjust
> +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> +KernelVersion: 2.6.37
> +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton@ma=
ndriva.com.br>
> +Description:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write on=
ly option (accepts any single value, eg.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > lcd_auto=
_adjust") that starts LCD auto-adjust
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 function. Some shu=
ttle machines have LCD attached to analog
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VGA connector, so =
uses/needs auto-adjust.
> +
> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shuttl=
e_wmi/lbar_brightness_down
> +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> +KernelVersion: 2.6.37
> +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton@ma=
ndriva.com.br>
> +Description:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write on=
ly option (accepts any single value, eg.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > lbar_bri=
ghtness_down"). Decreases one step of lightbar
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brightness.
> +
> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shuttl=
e_wmi/lbar_brightness_up
> +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> +KernelVersion: 2.6.37
> +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton@ma=
ndriva.com.br>
> +Description:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write on=
ly option (accepts any single value, eg.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > lbar_bri=
ghtness_up"). Increases one step of lightbar
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brightness.

What is the lightbar exactly ? Some kind of led ? Can't you use the
led class instead ?
Also the driver seems to reference keyboard brightness, if available,
this should be
implemented as a led named shuttle::kbd_backlight.

> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shuttl=
e_wmi/model_name
> +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> +KernelVersion: 2.6.37
> +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton@ma=
ndriva.com.br>
> +Description:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a read onl=
y attribute which outputs a string with model
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name of the machin=
e. When shuttle-wmi can't determine which
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 model it is, "Unkn=
own" is returned. Otherwise, the possible
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 models are "Shuttl=
e MA", "Shuttle DA18IE" or "Shuttle DA18IM".
> +
> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shuttl=
e_wmi/panel_set_default
> +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> +KernelVersion: 2.6.37
> +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton@ma=
ndriva.com.br>
> +Description:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write on=
ly option (accepts any single value, eg.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > panel_se=
t_default"). Probably resets panel/lcd to
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default configurat=
ion, function not explained in shuttle wmi
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 documentation.
> +
> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shuttl=
e_wmi/powersave
> +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> +KernelVersion: 2.6.37
> +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton@ma=
ndriva.com.br>
> +Description:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Control powersave =
state. 1 means on, 0 means off.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 When enabled, it b=
asically forces the cpu to stay on powersave
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state (similar to =
powersave governor in cpufreq) when machine is
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 only running on ba=
ttery. If not running on battery, this
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 function isn't exp=
ected to work, any attempt to enable this
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 returns -EIO. The =
function is equal to fn+<cpu> switch on some
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 notebooks.
> +
> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shuttl=
e_wmi/sleep
> +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> +KernelVersion: 2.6.37
> +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton@ma=
ndriva.com.br>
> +Description:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write on=
ly option (accepts any single value, eg.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > sleep") =
that is equivalent of pressing fn+<sleep>
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 function on notebo=
oks.
> +
> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shuttl=
e_wmi/sound_mute
> +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> +KernelVersion: 2.6.37
> +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton@ma=
ndriva.com.br>
> +Description:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write on=
ly option (accepts any single value, eg.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > sound_mu=
te") that is equivalent of pressing fn+<mute>
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 function on notebo=
oks.
> +
> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shuttl=
e_wmi/switch_video
> +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> +KernelVersion: 2.6.37
> +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton@ma=
ndriva.com.br>
> +Description:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write on=
ly option (accepts any single value, eg.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > switch_v=
ideo") that is equivalent of pressing
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn+<display switch=
> function on notebooks.
> +
> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shuttl=
e_wmi/touchpad
> +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> +KernelVersion: 2.6.37
> +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton@ma=
ndriva.com.br>
> +Description:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Control touchpad s=
tate. 1 means on, 0 means off.
> +
> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shuttl=
e_wmi/volume_down
> +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> +KernelVersion: 2.6.37
> +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton@ma=
ndriva.com.br>
> +Description:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write on=
ly option (accepts any single value, eg.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > volume_d=
own") that is equivalent of pressing
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn+<volume down> f=
unction on notebooks.
> +
> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shuttl=
e_wmi/volume_up
> +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> +KernelVersion: 2.6.37
> +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton@ma=
ndriva.com.br>
> +Description:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write on=
ly option (accepts any single value, eg.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > volume_u=
p") that is equivalent of pressing
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn+<volume up> fun=
ction on notebooks.

Are volume_down and volume_up really needed ? can't alsamixer do the sa=
me ?

> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shuttl=
e_wmi/webcam
> +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> +KernelVersion: 2.6.37
> +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton@ma=
ndriva.com.br>
> +Description:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Control webcam sta=
te. 1 means on, 0 means off.
> +
> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shuttl=
e_wmi/white_balance
> +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> +KernelVersion: 2.6.37
> +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton@ma=
ndriva.com.br>
> +Description:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write on=
ly option (accepts any single value, eg.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > white_ba=
lance"). Probably triggers an automatic
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 white balance adju=
stment for lcd, function not explained in
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shuttle wmi docume=
ntation.


Here, I don't really understand why you reference "fn+<keys>". We
don't really care about the keys right ? What we want is make the featu=
re
available for the user.

Some of the files likes volume_up/volume_down seems to be here for
debug purpose. Maybe you could add a simple debugfs interface
to send custom commands to the wmi device.

> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kcon=
fig
> index faec777..ef84a4d 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -639,4 +639,20 @@ config XO1_RFKILL
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Support for enabling/disabling the =
WLAN interface on the OLPC XO-1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0laptop.
>
> +config SHUTTLE_WMI
> + =C2=A0 =C2=A0 =C2=A0 tristate "Shuttle WMI Extras"
> + =C2=A0 =C2=A0 =C2=A0 depends on ACPI
> + =C2=A0 =C2=A0 =C2=A0 depends on BACKLIGHT_CLASS_DEVICE
> + =C2=A0 =C2=A0 =C2=A0 depends on RFKILL
> + =C2=A0 =C2=A0 =C2=A0 depends on INPUT
> + =C2=A0 =C2=A0 =C2=A0 select ACPI_WMI
> + =C2=A0 =C2=A0 =C2=A0 select INPUT_SPARSEKMAP
> + =C2=A0 =C2=A0 =C2=A0 ---help---
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a driver for Shuttle machines (=
mainly for laptops in desktop
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 form factor). It adds controls for wire=
less, bluetooth, and 3g control
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 radios, webcam switch, backlight contro=
ls, among others.
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 If you have an Shuttle machine with ACP=
I-WMI interface say Y or M
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 here.
> +

Add some DA18IE/DA18IM/MA ref here ?

> =C2=A0endif # X86_PLATFORM_DEVICES
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Mak=
efile
> index 9950ccc..6a8fa82 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -33,3 +33,4 @@ obj-$(CONFIG_INTEL_IPS) =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 +=3D intel_ips.o
> =C2=A0obj-$(CONFIG_GPIO_INTEL_PMIC) =C2=A0+=3D intel_pmic_gpio.o
> =C2=A0obj-$(CONFIG_XO1_RFKILL) =C2=A0 =C2=A0 =C2=A0 +=3D xo1-rfkill.o
> =C2=A0obj-$(CONFIG_IBM_RTL) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D ib=
m_rtl.o
> +obj-$(CONFIG_SHUTTLE_WMI) =C2=A0 =C2=A0 =C2=A0+=3D shuttle-wmi.o
> diff --git a/drivers/platform/x86/shuttle-wmi.c b/drivers/platform/x8=
6/shuttle-wmi.c
> new file mode 100644
> index 0000000..389a16d
> --- /dev/null
> +++ b/drivers/platform/x86/shuttle-wmi.c
> @@ -0,0 +1,843 @@
> +/*
> + * ACPI-WMI driver for Shuttle DA18IE/DA18IM/MA
> + *
> + * Copyright (c) 2009 Herton Ronaldo Krzesinski <herton@mandriva.com=
=2Ebr>

2010 ?

> + * Development of this driver was funded by Positivo Informatica S.A=
=2E
> + * Parts of the driver were based on some WMI documentation provided=
 by Shuttle
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/types.h>
> +#include <linux/acpi.h>
> +#include <linux/platform_device.h>
> +#include <linux/rfkill.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>
> +#include <linux/backlight.h>
> +#include <linux/fb.h>
> +
> +MODULE_AUTHOR("Herton Ronaldo Krzesinski");
> +MODULE_DESCRIPTION("Shuttle DA18IE/DA18IM/MA WMI Extras Driver");
> +MODULE_LICENSE("GPL");
> +
> +#define SHUTTLE_WMI_SETGET_GUID "abbc0f6f-8ea1-11d1-00a0-c9062910000=
0"
> +#define SHUTTLE_WMI_EVENT_GUID "abbc0f72-8ea1-11d1-00a0-c90629100000=
"
> +MODULE_ALIAS("wmi:"SHUTTLE_WMI_SETGET_GUID);
> +MODULE_ALIAS("wmi:"SHUTTLE_WMI_EVENT_GUID);
> +
> +#define CMD_WRITEEC =C2=A0 =C2=A0 0x00
> +#define CMD_READEC =C2=A0 =C2=A0 =C2=A00x01
> +#define CMD_SCMD =C2=A0 =C2=A0 =C2=A0 =C2=A00x02
> +#define CMD_INT15 =C2=A0 =C2=A0 =C2=A0 0x03
> +#define CMD_HWSW =C2=A0 =C2=A0 =C2=A0 =C2=A00x07
> +#define CMD_LCTRL =C2=A0 =C2=A0 =C2=A0 0x09
> +#define CMD_CUTLVDS =C2=A0 =C2=A0 0x11
> +#define CMD_MA =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x18
> +#define CMD_DA18IE =C2=A0 =C2=A0 =C2=A00x19
> +#define CMD_DA18IM =C2=A0 =C2=A0 =C2=A00x20
> +
> +#define ECRAM_ER0 =C2=A0 =C2=A0 =C2=A0 0x443
> +#define ECRAM_ER1 =C2=A0 =C2=A0 =C2=A0 0x47b
> +#define ECRAM_ER2 =C2=A0 =C2=A0 =C2=A0 0x758
> +
> +struct shuttle_id {
> + =C2=A0 =C2=A0 =C2=A0 unsigned char cmd_id;
> + =C2=A0 =C2=A0 =C2=A0 char *model_name;
> + =C2=A0 =C2=A0 =C2=A0 bool step_brightness;
> +};
> +
> +static struct shuttle_id shuttle_ids[] =3D {
> + =C2=A0 =C2=A0 =C2=A0 { CMD_MA, "Shuttle MA", false },
> + =C2=A0 =C2=A0 =C2=A0 { CMD_DA18IE, "Shuttle DA18IE", true },
> + =C2=A0 =C2=A0 =C2=A0 { CMD_DA18IM, "Shuttle DA18IM", false }
> +};
> +
> +struct shuttle_wmi_priv {
> + =C2=A0 =C2=A0 =C2=A0 struct platform_device *pdev;
> + =C2=A0 =C2=A0 =C2=A0 struct input_dev *inputdev;
> + =C2=A0 =C2=A0 =C2=A0 struct shuttle_id *id;
> + =C2=A0 =C2=A0 =C2=A0 struct backlight_device *bd;
> +};

I would only name it struct shuttle_wmi, but not very important.

> +struct shuttle_cmd {
> + =C2=A0 =C2=A0 =C2=A0 u16 param2;
> + =C2=A0 =C2=A0 =C2=A0 u16 param1;
> + =C2=A0 =C2=A0 =C2=A0 u8 arg;
> + =C2=A0 =C2=A0 =C2=A0 u8 cmd;
> + =C2=A0 =C2=A0 =C2=A0 u16 hdr;
> +};
> +
> +static acpi_status wmi_setget_mtd(struct shuttle_cmd *scmd, u32 **re=
s)
> +{
> + =C2=A0 =C2=A0 =C2=A0 acpi_status status;
> + =C2=A0 =C2=A0 =C2=A0 union acpi_object *obj;
> + =C2=A0 =C2=A0 =C2=A0 struct acpi_buffer input;
> + =C2=A0 =C2=A0 =C2=A0 static DEFINE_MUTEX(mtd_lock);
> + =C2=A0 =C2=A0 =C2=A0 struct acpi_buffer output =3D { ACPI_ALLOCATE_=
BUFFER, NULL };
> +
> + =C2=A0 =C2=A0 =C2=A0 input.length =3D sizeof(struct shuttle_cmd);
> + =C2=A0 =C2=A0 =C2=A0 scmd->hdr =3D 0xec00;
> + =C2=A0 =C2=A0 =C2=A0 input.pointer =3D (u8 *) scmd;
> +
> + =C2=A0 =C2=A0 =C2=A0 mutex_lock(&mtd_lock);
> + =C2=A0 =C2=A0 =C2=A0 status =3D wmi_evaluate_method(SHUTTLE_WMI_SET=
GET_GUID, 0, 2,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&input, &output=
);
> + =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&mtd_lock);

I'm not sure why you need a mutex here ?

> + =C2=A0 =C2=A0 =C2=A0 if (ACPI_FAILURE(status))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return status;
> +
> + =C2=A0 =C2=A0 =C2=A0 obj =3D output.pointer;
> + =C2=A0 =C2=A0 =C2=A0 if (obj) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (obj->type =3D=3D=
 ACPI_TYPE_INTEGER) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (*res)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 **res =3D obj->integer.value;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 pr_err("Unsupported object returned (%s)", __func__);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(obj);
> + =C2=A0 =C2=A0 =C2=A0 } else {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*res) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 pr_warning("No result from WMI method (%s)", __func__);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 *res =3D NULL;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 return AE_OK;
> +}
>

wmi_setget_mtd would probably be simpler like that:

static int wmi_setget_mtd(struct shuttle_cmd *scmd, u32 *res).
You don't really need to return the acpi_status, you just want to
return -1, 0, 1 for wmi_ec_cmd.

> +static int wmi_ec_cmd(unsigned char cmd, unsigned char arg,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 unsigned short param1, unsigned short param2,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 u32 *res)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct shuttle_cmd scmd =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .cmd =3D cmd,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arg =3D arg,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .param1 =3D param1=
,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .param2 =3D param2
> + =C2=A0 =C2=A0 =C2=A0 };
> +
> + =C2=A0 =C2=A0 =C2=A0 if (ACPI_FAILURE(wmi_setget_mtd(&scmd, &res)))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;
> + =C2=A0 =C2=A0 =C2=A0 return (res) ? 0 : 1;
> +}
> +
> +struct shuttle_rfkill {
> + =C2=A0 =C2=A0 =C2=A0 char *name;
> + =C2=A0 =C2=A0 =C2=A0 struct rfkill *rfk;
> + =C2=A0 =C2=A0 =C2=A0 enum rfkill_type type;
> + =C2=A0 =C2=A0 =C2=A0 unsigned short fn;
> + =C2=A0 =C2=A0 =C2=A0 u32 mask;
> + =C2=A0 =C2=A0 =C2=A0 u32 list_on[3];
> + =C2=A0 =C2=A0 =C2=A0 u32 list_off[3];
> +};
> +
> +static struct shuttle_rfkill shuttle_rfk_list[] =3D {
> + =C2=A0 =C2=A0 =C2=A0 { "shuttle_wlan", NULL, RFKILL_TYPE_WLAN,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x04, 0x80, { 0x08 }, { 0x09 } },
> + =C2=A0 =C2=A0 =C2=A0 { "shuttle_bluetooth", NULL, RFKILL_TYPE_BLUET=
OOTH,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0d, 0x20, { 0x0c, 0x29 }, { 0x0d, 0x2=
a } },
> + =C2=A0 =C2=A0 =C2=A0 { "shuttle_3g", NULL, RFKILL_TYPE_WWAN,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x05, 0x40, { 0x10, 0x29 }, { 0x11, 0x2=
a } },
> +};

I would rather use simple if/else constructs instead of list_on/list_of=
f,
it would probably be more easy to read.

> +static int rfkill_common_set_block(void *data, bool blocked)
> +{
> + =C2=A0 =C2=A0 =C2=A0 u32 val;
> + =C2=A0 =C2=A0 =C2=A0 bool sw;
> + =C2=A0 =C2=A0 =C2=A0 struct shuttle_rfkill *srfk =3D data;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_ER1, &v=
al))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
> + =C2=A0 =C2=A0 =C2=A0 sw =3D val & srfk->mask;
> +
> + =C2=A0 =C2=A0 =C2=A0 if ((blocked && sw) || (!blocked && !sw))

Maybe
sw =3D !!(val &  srfk->mask);
if (blocked =3D=3D sw)
?

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wmi_ec_cmd(CMD_SCM=
D, 0, 0, srfk->fn, NULL);
> + =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_ER1, &v=
al))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
> + =C2=A0 =C2=A0 =C2=A0 return ((val & srfk->mask) !=3D blocked) ? 0 :=
 -EIO;
> +}
> +
> +static const struct rfkill_ops rfkill_common_ops =3D {
> + =C2=A0 =C2=A0 =C2=A0 .set_block =3D rfkill_common_set_block,
> +};
> +
> +static int common_rfkill_init(struct shuttle_rfkill *srfk, struct de=
vice *dev,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 init_val)
> +{
> + =C2=A0 =C2=A0 =C2=A0 int rc;
> +
> + =C2=A0 =C2=A0 =C2=A0 srfk->rfk =3D rfkill_alloc(srfk->name, dev, sr=
fk->type,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&rfkill_common_ops, srfk);
> + =C2=A0 =C2=A0 =C2=A0 if (!srfk->rfk)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;
> +
> + =C2=A0 =C2=A0 =C2=A0 rfkill_init_sw_state(srfk->rfk, !(init_val & s=
rfk->mask));
> +
> + =C2=A0 =C2=A0 =C2=A0 rc =3D rfkill_register(srfk->rfk);
> + =C2=A0 =C2=A0 =C2=A0 if (rc) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rfkill_destroy(srf=
k->rfk);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srfk->rfk =3D NULL=
;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return rc;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +static int shuttle_rfkill_init(struct platform_device *pdev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 int rc, i;
> + =C2=A0 =C2=A0 =C2=A0 u32 val;
> + =C2=A0 =C2=A0 =C2=A0 struct shuttle_rfkill *srfk;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_ER1, &v=
al))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
> +
> + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < ARRAY_SIZE(shuttle_rfk_list)=
; i++) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srfk =3D &shuttle_=
rfk_list[i];
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* check that hard=
ware is available (when missing we can't
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* unblock it=
), to avoid having rfkill switch when not needed;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* after chec=
k, reset to initial setting */
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rfkill_common_=
set_block(srfk, false))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 continue;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(val & srfk->=
mask))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 rfkill_common_set_block(srfk, true);

There is no other solution  to guess if the hardware is present ? Becau=
se
I don't think it's a good idea to toggle every devices on load (may tak=
e time,
etc...)

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D common_rfki=
ll_init(srfk, &pdev->dev, val);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 goto err_rfk_init;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +
> +err_rfk_init:
> + =C2=A0 =C2=A0 =C2=A0 for (i--; i >=3D 0; i--) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srfk =3D &shuttle_=
rfk_list[i];
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (srfk->rfk) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 rfkill_unregister(srfk->rfk);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 rfkill_destroy(srfk->rfk);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 srfk->rfk =3D NULL;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 }

Just call shuttfle_rfkill_remove, the if(srfk->rfk) should
make it work without any issue.

> + =C2=A0 =C2=A0 =C2=A0 return rc;
> +}
> +
> +static void shuttle_rfkill_remove(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 int i;
> + =C2=A0 =C2=A0 =C2=A0 struct shuttle_rfkill *srfk;
> +
> + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < ARRAY_SIZE(shuttle_rfk_list)=
; i++) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srfk =3D &shuttle_=
rfk_list[i];
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (srfk->rfk) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 rfkill_unregister(srfk->rfk);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 rfkill_destroy(srfk->rfk);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 srfk->rfk =3D NULL;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 }
> +}
> +
> +static bool set_rfkill_sw(u32 *list, u32 code, struct rfkill *rfk, b=
ool blocked)
> +{
> + =C2=A0 =C2=A0 =C2=A0 while (*list) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*list =3D=3D c=
ode) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 rfkill_set_sw_state(rfk, blocked);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return true;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 list++;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 return false;
> +}
> +
> +static bool notify_switch_rfkill(u32 code)
> +{
> + =C2=A0 =C2=A0 =C2=A0 int i;
> + =C2=A0 =C2=A0 =C2=A0 struct rfkill *rfk;
> + =C2=A0 =C2=A0 =C2=A0 u32 *rfk_evnt;
> + =C2=A0 =C2=A0 =C2=A0 bool res =3D false;
> +
> + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < ARRAY_SIZE(shuttle_rfk_list)=
; i++) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rfk =3D shuttle_rf=
k_list[i].rfk;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!rfk)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 continue;
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rfk_evnt =3D shutt=
le_rfk_list[i].list_on;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (set_rfkill_sw(=
rfk_evnt, code, rfk, false)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 res =3D true;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 continue;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rfk_evnt =3D shutt=
le_rfk_list[i].list_off;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (set_rfkill_sw(=
rfk_evnt, code, rfk, true))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 res =3D true;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 return res;
> +}

See my previous comment, but I believe that the code would be
more obvious with basic if/else (or at least a command explaining
what is does).

> +static bool notify_switch_attr(struct platform_device *pdev, u32 cod=
e)
> +{
> + =C2=A0 =C2=A0 =C2=A0 int i;
> + =C2=A0 =C2=A0 =C2=A0 struct shuttle_switch {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 switch_on;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 switch_off;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *sys_attr;
> + =C2=A0 =C2=A0 =C2=A0 };
> + =C2=A0 =C2=A0 =C2=A0 static const struct shuttle_switch codes[] =3D=
 {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { 0x04, 0x05, "tou=
chpad" },
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { 0x12, 0x13, "web=
cam" },
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { 0x31, 0x32, "pow=
ersave" }
> + =C2=A0 =C2=A0 =C2=A0 };
> +
> + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < ARRAY_SIZE(codes); i++) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (codes[i].switc=
h_on =3D=3D code || codes[i].switch_off =3D=3D code) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 sysfs_notify(&pdev->dev.kobj, NULL, codes[i].sys_attr);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return true;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 return false;
> +}
> +
> +static void shuttle_wmi_notify(u32 value, void *data)
> +{
> + =C2=A0 =C2=A0 =C2=A0 acpi_status status;
> + =C2=A0 =C2=A0 =C2=A0 union acpi_object *obj;
> + =C2=A0 =C2=A0 =C2=A0 u8 type;
> + =C2=A0 =C2=A0 =C2=A0 u32 code;
> + =C2=A0 =C2=A0 =C2=A0 struct acpi_buffer res =3D { ACPI_ALLOCATE_BUF=
=46ER, NULL };
> + =C2=A0 =C2=A0 =C2=A0 struct shuttle_wmi_priv *priv =3D data;
> +
> + =C2=A0 =C2=A0 =C2=A0 status =3D wmi_get_event_data(value, &res);
> + =C2=A0 =C2=A0 =C2=A0 if (status !=3D AE_OK) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_warning("unable=
 to retrieve wmi event status"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0" (error=3D0x%x)\n", status);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 obj =3D (union acpi_object *) res.pointer;
> + =C2=A0 =C2=A0 =C2=A0 if (!obj)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> + =C2=A0 =C2=A0 =C2=A0 if (obj->type !=3D ACPI_TYPE_INTEGER) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_info("unknown o=
bject returned in wmi event\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto notify_exit;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 type =3D (obj->integer.value >> 24) & 0xFF;
> + =C2=A0 =C2=A0 =C2=A0 switch (type) {
> + =C2=A0 =C2=A0 =C2=A0 case 0: /* OSD/Scancode event */
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 code =3D obj->inte=
ger.value & 0xFFFFFF;
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* update rfkill s=
witches */
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (notify_switch_=
rfkill(code))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 break;
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* send notificati=
on on state switch attributes */
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (notify_switch_=
attr(priv->pdev, code))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 break;
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (priv->bd && (c=
ode =3D=3D 0x14 || code =3D=3D 0x15))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 backlight_force_update(priv->bd,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0BACKLIGHT_UPDATE_HOTKEY);
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!sparse_keymap=
_report_event(priv->inputdev, code, 1, true))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 pr_info("unhandled scancode (0x%06x)\n", code);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 case 1: /* Power management event */
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Events not used=
=2E
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Possible v=
alues for obj->integer.value:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 0x01000000=
 - silent mode
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 0x01010000=
 - brightness sync */
> + =C2=A0 =C2=A0 =C2=A0 case 2: /* i-PowerXross event */
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* i-PowerXross is=
 a overclocking feature, not
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* implemente=
d, there are no further details, possible
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* values for=
 obj->integer.value in documentation:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 0x02000000=
 - idle mode
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 0x02010000=
 - action mode
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 0x02020000=
 - entry s3 */
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 case 0xec: /* Lost event */
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (printk_ratelim=
it())
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 pr_warning("lost event because of buggy BIOS");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 default:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_info("unknown w=
mi notification type (0x%02x)\n", type);
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> +notify_exit:
> + =C2=A0 =C2=A0 =C2=A0 kfree(obj);
> +}
> +
> +static const struct key_entry shuttle_wmi_keymap[] =3D {
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x14, { KEY_BRIGHTNESSUP } },
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x15, { KEY_BRIGHTNESSDOWN } },
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x16, { KEY_FASTFORWARD } },
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x17, { KEY_REWIND } },
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x18, { KEY_F13 } }, /* OSD Beep */
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x2b, { KEY_F14 } }, /* OSD menu 1 *=
/
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x2c, { KEY_F15 } }, /* OSD menu 2 *=
/
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x2d, { KEY_F16 } }, /* OSD menu 3 *=
/
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x2e, { KEY_F17 } }, /* OSD menu 4 *=
/
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x33, { KEY_F18 } }, /* Update OSD b=
ar status */
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x90, { KEY_WWW } },
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x95, { KEY_PREVIOUSSONG } },
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0xa0, { KEY_PROG1 } }, /* Call OSD s=
oftware */
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0xa1, { KEY_VOLUMEDOWN } },
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0xa3, { KEY_MUTE } },
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0xb2, { KEY_VOLUMEUP } },
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0xb4, { KEY_PLAYPAUSE } },
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0xbb, { KEY_STOPCD } },
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0xc8, { KEY_MAIL } },
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0xcd, { KEY_NEXTSONG } },
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0xd0, { KEY_MEDIA } },
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Known non hotkey events don't handled or th=
at we don't care */
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x01, }, /* Caps Lock toggled */
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x02, }, /* Num Lock toggled */
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x03, }, /* Scroll Lock toggled *=
/
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x06, }, /* Downclock/Silent on *=
/
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x07, }, /* Downclock/Silent off =
*/
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x0a, }, /* WiMax on */
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x0b, }, /* WiMax off */
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x0e, }, /* RF on */
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x0f, }, /* RF off */
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x1a, }, /* Auto Brightness on */
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x1b, }, /* Auto Brightness off *=
/
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x1c, }, /* Auto-KB Brightness on=
 */
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x1d, }, /* Auto-KB Brightness of=
f */
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x1e, }, /* Light Bar Brightness =
up */
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x1f, }, /* Light Bar Brightness =
down */
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x20, }, /* China Telecom AP enab=
le */
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x21, }, /* China Mobile AP enabl=
e */
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x22, }, /* Huawei AP enable */
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x23, }, /* Docking in */
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x24, }, /* Docking out */
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x25, }, /* Device no function */
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x26, }, /* i-PowerXross OverCloc=
king */
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x27, }, /* i-PowerXross PowerSav=
ing */
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x28, }, /* i-PowerXross off */
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x2f, }, /* Optimus on */
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x30, }, /* Optimus off */
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x91, }, /* ICO 2 on */
> + =C2=A0 =C2=A0 =C2=A0 { KE_IGNORE, 0x92, }, /* ICO 2 off */
> +
> + =C2=A0 =C2=A0 =C2=A0 { KE_END, 0 }
> +};
> +
> +static int shuttle_wmi_input_init(struct shuttle_wmi_priv *priv)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct input_dev *input;
> + =C2=A0 =C2=A0 =C2=A0 int rc;
> +
> + =C2=A0 =C2=A0 =C2=A0 input =3D input_allocate_device();
> + =C2=A0 =C2=A0 =C2=A0 if (!input)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;
> +
> + =C2=A0 =C2=A0 =C2=A0 input->name =3D "Shuttle WMI hotkeys";
> + =C2=A0 =C2=A0 =C2=A0 input->phys =3D KBUILD_MODNAME "/input0";
> + =C2=A0 =C2=A0 =C2=A0 input->id.bustype =3D BUS_HOST;
> +
> + =C2=A0 =C2=A0 =C2=A0 rc =3D sparse_keymap_setup(input, shuttle_wmi_=
keymap, NULL);
> + =C2=A0 =C2=A0 =C2=A0 if (rc)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_free_dev;
> +
> + =C2=A0 =C2=A0 =C2=A0 rc =3D input_register_device(input);
> + =C2=A0 =C2=A0 =C2=A0 if (rc)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_free_keym=
ap;
> +
> + =C2=A0 =C2=A0 =C2=A0 priv->inputdev =3D input;
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +
> +err_free_keymap:
> + =C2=A0 =C2=A0 =C2=A0 sparse_keymap_free(input);
> +err_free_dev:
> + =C2=A0 =C2=A0 =C2=A0 input_free_device(input);
> + =C2=A0 =C2=A0 =C2=A0 return rc;
> +}
> +
> +static void shuttle_wmi_input_remove(struct shuttle_wmi_priv *priv)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct input_dev *input =3D priv->inputdev;
> +
> + =C2=A0 =C2=A0 =C2=A0 sparse_keymap_free(input);
> + =C2=A0 =C2=A0 =C2=A0 input_unregister_device(input);
> +}
> +
> +static int shuttle_wmi_get_bl(struct backlight_device *bd)
> +{
> + =C2=A0 =C2=A0 =C2=A0 u32 val;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_ER0, &v=
al))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
> + =C2=A0 =C2=A0 =C2=A0 return val & 0x7;
> +}
> +
> +static int shuttle_wmi_update_bl(struct backlight_device *bd)
> +{
> + =C2=A0 =C2=A0 =C2=A0 int rc, steps;
> + =C2=A0 =C2=A0 =C2=A0 u32 val;
> + =C2=A0 =C2=A0 =C2=A0 struct shuttle_wmi_priv *priv =3D bl_get_data(=
bd);
> +
> + =C2=A0 =C2=A0 =C2=A0 if (!priv->id->step_brightness) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D ec_write(0x=
79, bd->props.brightness);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return rc;
> + =C2=A0 =C2=A0 =C2=A0 } else {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* change brightne=
ss by steps, this is a quirk for shuttle
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* machines w=
hich don't accept direct write to ec for this */
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD=
_READEC, 0, 0, ECRAM_ER0, &val))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return -EIO;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val &=3D 0x7;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 steps =3D bd->prop=
s.brightness - val;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (steps > 0) =
{
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 wmi_ec_cmd(CMD_SCMD, 0, 0, 0x0c, NULL);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 steps--;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (steps < 0) =
{
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 wmi_ec_cmd(CMD_SCMD, 0, 0, 0x0b, NULL);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 steps++;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +static const struct backlight_ops shuttle_wmi_bl_ops =3D {
> + =C2=A0 =C2=A0 =C2=A0 .get_brightness =3D shuttle_wmi_get_bl,
> + =C2=A0 =C2=A0 =C2=A0 .update_status =3D shuttle_wmi_update_bl,
> +};
> +
> +static int shuttle_wmi_backlight_init(struct shuttle_wmi_priv *priv)
> +{
> + =C2=A0 =C2=A0 =C2=A0 u32 val;
> + =C2=A0 =C2=A0 =C2=A0 struct backlight_properties props;
> + =C2=A0 =C2=A0 =C2=A0 struct backlight_device *bd;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_ER0, &v=
al))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
> + =C2=A0 =C2=A0 =C2=A0 val &=3D 0x7;
> + =C2=A0 =C2=A0 =C2=A0 memset(&props, 0, sizeof(struct backlight_prop=
erties));
> + =C2=A0 =C2=A0 =C2=A0 props.max_brightness =3D 7;
> + =C2=A0 =C2=A0 =C2=A0 props.brightness =3D val;
> + =C2=A0 =C2=A0 =C2=A0 props.power =3D FB_BLANK_UNBLANK;
> +
> + =C2=A0 =C2=A0 =C2=A0 bd =3D backlight_device_register(KBUILD_MODNAM=
E, &priv->pdev->dev, priv,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&shuttle=
_wmi_bl_ops, &props);
> + =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(bd))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PTR_ERR(bd)=
;
> + =C2=A0 =C2=A0 =C2=A0 priv->bd =3D bd;
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +static void shuttle_wmi_backlight_exit(struct shuttle_wmi_priv *priv=
)
> +{
> + =C2=A0 =C2=A0 =C2=A0 if (priv->bd)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 backlight_device_u=
nregister(priv->bd);
> +}
> +
> +static int __devinit shuttle_wmi_probe(struct platform_device *pdev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct shuttle_wmi_priv *priv;
> + =C2=A0 =C2=A0 =C2=A0 int rc, i;
> + =C2=A0 =C2=A0 =C2=A0 acpi_status status;
> + =C2=A0 =C2=A0 =C2=A0 u32 val;
> + =C2=A0 =C2=A0 =C2=A0 static struct shuttle_id id_unknown =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .model_name =3D "U=
nknown",
> + =C2=A0 =C2=A0 =C2=A0 };
> +
> + =C2=A0 =C2=A0 =C2=A0 priv =3D kzalloc(sizeof(struct shuttle_wmi_pri=
v), GFP_KERNEL);
> + =C2=A0 =C2=A0 =C2=A0 if (!priv)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;
> + =C2=A0 =C2=A0 =C2=A0 priv->pdev =3D pdev;
> + =C2=A0 =C2=A0 =C2=A0 platform_set_drvdata(pdev, priv);
> +
> + =C2=A0 =C2=A0 =C2=A0 rc =3D shuttle_rfkill_init(pdev);
> + =C2=A0 =C2=A0 =C2=A0 if (rc)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_rfk;
> +
> + =C2=A0 =C2=A0 =C2=A0 rc =3D shuttle_wmi_input_init(priv);
> + =C2=A0 =C2=A0 =C2=A0 if (rc)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_input;
> +
> + =C2=A0 =C2=A0 =C2=A0 status =3D wmi_install_notify_handler(SHUTTLE_=
WMI_EVENT_GUID,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 shuttle_wmi_notify, priv);
> + =C2=A0 =C2=A0 =C2=A0 if (ACPI_FAILURE(status)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D -EIO;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_notify;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < ARRAY_SIZE(shuttle_ids); i++=
) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D wmi_ec_cmd(=
shuttle_ids[i].cmd_id, 0, 0, 0, &val);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!rc && val =3D=
=3D 1) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 priv->id =3D &shuttle_ids[i];
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 if (i =3D=3D ARRAY_SIZE(shuttle_ids))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv->id =3D &id_u=
nknown;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (!acpi_video_backlight_support()) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D shuttle_wmi=
_backlight_init(priv);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 goto err_backlight;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +
> +err_backlight:
> + =C2=A0 =C2=A0 =C2=A0 wmi_remove_notify_handler(SHUTTLE_WMI_EVENT_GU=
ID);
> +err_notify:
> + =C2=A0 =C2=A0 =C2=A0 shuttle_wmi_input_remove(priv);
> +err_input:
> + =C2=A0 =C2=A0 =C2=A0 shuttle_rfkill_remove();
> +err_rfk:
> + =C2=A0 =C2=A0 =C2=A0 kfree(priv);
> + =C2=A0 =C2=A0 =C2=A0 return rc;
> +}
> +
> +static int __devexit shuttle_wmi_remove(struct platform_device *pdev=
)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct shuttle_wmi_priv *priv =3D platform_get=
_drvdata(pdev);
> +
> + =C2=A0 =C2=A0 =C2=A0 shuttle_wmi_backlight_exit(priv);
> + =C2=A0 =C2=A0 =C2=A0 wmi_remove_notify_handler(SHUTTLE_WMI_EVENT_GU=
ID);
> + =C2=A0 =C2=A0 =C2=A0 shuttle_wmi_input_remove(priv);
> + =C2=A0 =C2=A0 =C2=A0 shuttle_rfkill_remove();
> + =C2=A0 =C2=A0 =C2=A0 kfree(priv);
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +#ifdef CONFIG_PM

WMI depends on ACPI
ACPI depends on PM

So it's not really needed.

> +static int shuttle_wmi_resume(struct device *dev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 u32 val;
> + =C2=A0 =C2=A0 =C2=A0 int i;
> + =C2=A0 =C2=A0 =C2=A0 struct shuttle_rfkill *srfk;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_ER1, &v=
al))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
> +
> + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < ARRAY_SIZE(shuttle_rfk_list)=
; i++) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srfk =3D &shuttle_=
rfk_list[i];
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (srfk->rfk)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 rfkill_set_sw_state(srfk->rfk, !(val & srfk->mask));
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}

You're code would probably be cleaner with a rfkill helper to get the c=
urrent
state of a given deivce, to avoid playing with masks everytime.

> +
> +static const struct dev_pm_ops shuttle_wmi_pm_ops =3D {
> + =C2=A0 =C2=A0 =C2=A0 .restore =3D shuttle_wmi_resume,
> + =C2=A0 =C2=A0 =C2=A0 .resume =3D shuttle_wmi_resume,
> +};
> +#endif
> +
> +static struct platform_driver shuttle_wmi_driver =3D {
> + =C2=A0 =C2=A0 =C2=A0 .driver =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D KBUILD_M=
ODNAME,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner =3D THIS_MO=
DULE,
> +#ifdef CONFIG_PM
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pm =3D &shuttle_w=
mi_pm_ops,
> +#endif
> + =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 .probe =3D shuttle_wmi_probe,
> + =C2=A0 =C2=A0 =C2=A0 .remove =3D __devexit_p(shuttle_wmi_remove),
> +};
> +
> +static struct platform_device *shuttle_wmi_device;
> +
> +static ssize_t show_state_common(char *buf, unsigned short ecram, u3=
2 mask)
> +{
> + =C2=A0 =C2=A0 =C2=A0 u32 val;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD_READEC, 0, 0, ecram, &val))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
> + =C2=A0 =C2=A0 =C2=A0 return sprintf(buf, "%d\n", (val & mask) ? 1 :=
 0);
> +}
> +
> +static ssize_t store_state_common(const char *buf, size_t count,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned short ecram, u32 ma=
sk,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned short fn)
> +{
> + =C2=A0 =C2=A0 =C2=A0 int enable;
> + =C2=A0 =C2=A0 =C2=A0 int rc;
> + =C2=A0 =C2=A0 =C2=A0 u32 val;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (sscanf(buf, "%i", &enable) !=3D 1)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD_READEC, 0, 0, ecram, &val))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
> + =C2=A0 =C2=A0 =C2=A0 val &=3D mask;

Here again, having to use a mask makes the code harder to read.
Can't you use !!(val & mask) instead of val & mask ? Maybe a wrapper
around CMD_READEC to do that ? int wmi_ec_read_state(ecram, mask) ?

> + =C2=A0 =C2=A0 =C2=A0 if ((val && !enable) ||
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (!val && enable)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wmi_ec_cmd(CMD_SCM=
D, 0, 0, fn, NULL);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D wmi_ec_cmd(=
CMD_READEC, 0, 0, ecram, &val);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val &=3D mask;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc || (!val &&=
 enable) ||
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (val=
 && !enable))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return -EIO;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 return count;
> +}
> +
> +#define SHUTTLE_STATE_ATTR(_name, _ecram, _mask, _fn) =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> + =C2=A0 =C2=A0 =C2=A0 static ssize_t show_##_name(struct device *dev=
, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_attribu=
te *attr, =C2=A0 =C2=A0 =C2=A0\
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *buf) =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0\
> + =C2=A0 =C2=A0 =C2=A0 { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return show_state_=
common(buf, _ecram, _mask); =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 } =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 static ssize_t store_##_name(struct device *de=
v, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_a=
ttribute *attr, =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *buf=
, size_t count) =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return store_state=
_common(buf, count, _ecram, _mask, =C2=A0 =C2=A0\
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
_fn); =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 } =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 static DEVICE_ATTR(_name, 0644, show_##_name, =
store_##_name);
> +
> +SHUTTLE_STATE_ATTR(powersave, ECRAM_ER2, 0x10, 0x02)
> +SHUTTLE_STATE_ATTR(touchpad, ECRAM_ER1, 0x02, 0x06)
> +SHUTTLE_STATE_ATTR(webcam, ECRAM_ER1, 0x10, 0x07)
> +
> +#define SHUTTLE_CMD_ATTR(_name, _cmd, _arg, _fn) =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 static ssize_t store_##_name(struct device *de=
v, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_a=
ttribute *attr, =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *buf=
, size_t count) =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wmi_ec_cmd(_cmd, _=
arg, 0, _fn, NULL); =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return count; =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 } =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 static DEVICE_ATTR(_name, 0200, NULL, store_##=
_name);
> +
> +SHUTTLE_CMD_ATTR(sleep, CMD_SCMD, 0, 0x01)
> +SHUTTLE_CMD_ATTR(switch_video, CMD_SCMD, 0, 0x03)
> +SHUTTLE_CMD_ATTR(sound_mute, CMD_SCMD, 0, 0x08)
> +SHUTTLE_CMD_ATTR(volume_down, CMD_SCMD, 0, 0x09)
> +SHUTTLE_CMD_ATTR(volume_up, CMD_SCMD, 0, 0x0a)
> +SHUTTLE_CMD_ATTR(brightness_down, CMD_SCMD, 0, 0x0b)
> +SHUTTLE_CMD_ATTR(brightness_up, CMD_SCMD, 0, 0x0c)
> +SHUTTLE_CMD_ATTR(lcd_auto_adjust, CMD_SCMD, 0, 0x81)
> +SHUTTLE_CMD_ATTR(white_balance, CMD_SCMD, 0, 0x82)
> +SHUTTLE_CMD_ATTR(panel_set_default, CMD_SCMD, 0, 0x83)
> +SHUTTLE_CMD_ATTR(lbar_brightness_down, CMD_LCTRL, 1, 0)
> +SHUTTLE_CMD_ATTR(lbar_brightness_up, CMD_LCTRL, 1, 1)
> +
> +static ssize_t show_model_name(struct device *dev,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attribute *attr,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *buf)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct platform_device *pdev =3D to_platform_d=
evice(dev);
> + =C2=A0 =C2=A0 =C2=A0 struct shuttle_wmi_priv *priv =3D platform_get=
_drvdata(pdev);
> +
> + =C2=A0 =C2=A0 =C2=A0 return sprintf(buf, "%s\n", priv->id->model_na=
me);
> +}
> +
> +static DEVICE_ATTR(model_name, 0444, show_model_name, NULL);
> +
> +static ssize_t store_cut_lvds(struct device *dev,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_attribute *attr,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *buf, size_t count)
> +{
> + =C2=A0 =C2=A0 =C2=A0 int cut;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (sscanf(buf, "%i", &cut) !=3D 1)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (cut)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wmi_ec_cmd(CMD_CUT=
LVDS, 0, 0, 1, NULL);
> + =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wmi_ec_cmd(CMD_CUT=
LVDS, 0, 0, 0, NULL);
> +
> + =C2=A0 =C2=A0 =C2=A0 return count;
> +}
> +static DEVICE_ATTR(cut_lvds, 0200, NULL, store_cut_lvds);
> +
> +static struct attribute *shuttle_platform_attributes[] =3D {
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_powersave.attr,
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_touchpad.attr,
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_webcam.attr,
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_sleep.attr,
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_switch_video.attr,
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_sound_mute.attr,
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_volume_down.attr,
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_volume_up.attr,
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_brightness_down.attr,
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_brightness_up.attr,
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_lcd_auto_adjust.attr,
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_white_balance.attr,
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_panel_set_default.attr,
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_lbar_brightness_down.attr,
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_lbar_brightness_up.attr,
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_model_name.attr,
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_cut_lvds.attr,
> + =C2=A0 =C2=A0 =C2=A0 NULL
> +};
> +
> +static struct attribute_group shuttle_attribute_group =3D {
> + =C2=A0 =C2=A0 =C2=A0 .attrs =3D shuttle_platform_attributes
> +};
> +
> +static int __init shuttle_wmi_init(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 int rc;
> + =C2=A0 =C2=A0 =C2=A0 u32 val;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (!wmi_has_guid(SHUTTLE_WMI_SETGET_GUID) ||
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !wmi_has_guid(SHUTTLE_WMI_EVENT_=
GUID)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("Required W=
MI GUID not available\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Check that we are really on a shuttle BIOS =
*/
> + =C2=A0 =C2=A0 =C2=A0 rc =3D wmi_ec_cmd(CMD_INT15, 0, 0, 0, &val);
> + =C2=A0 =C2=A0 =C2=A0 if (rc || val !=3D 0x534c) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("Shuttle WM=
I device not found or unsupported"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0" (val=3D0x%08x)\n", val);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 rc =3D platform_driver_register(&shuttle_wmi_d=
river);
> + =C2=A0 =C2=A0 =C2=A0 if (rc)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_driver_re=
gister;
> + =C2=A0 =C2=A0 =C2=A0 shuttle_wmi_device =3D platform_device_alloc(K=
BUILD_MODNAME, -1);
> + =C2=A0 =C2=A0 =C2=A0 if (!shuttle_wmi_device) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D -ENOMEM;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_device_al=
loc;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 rc =3D platform_device_add(shuttle_wmi_device)=
;
> + =C2=A0 =C2=A0 =C2=A0 if (rc)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_device_ad=
d;
> +
> + =C2=A0 =C2=A0 =C2=A0 rc =3D sysfs_create_group(&shuttle_wmi_device-=
>dev.kobj,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &shuttle_attribute_group);
> + =C2=A0 =C2=A0 =C2=A0 if (rc)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_sysfs;
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +
> +err_sysfs:
> + =C2=A0 =C2=A0 =C2=A0 platform_device_del(shuttle_wmi_device);
> +err_device_add:
> + =C2=A0 =C2=A0 =C2=A0 platform_device_put(shuttle_wmi_device);
> +err_device_alloc:
> + =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&shuttle_wmi_driver=
);
> +err_driver_register:
> + =C2=A0 =C2=A0 =C2=A0 return rc;
> +}
> +
> +static void __exit shuttle_wmi_exit(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 sysfs_remove_group(&shuttle_wmi_device->dev.ko=
bj,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&shuttle_attribute_group);
> + =C2=A0 =C2=A0 =C2=A0 platform_device_unregister(shuttle_wmi_device)=
;
> + =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&shuttle_wmi_driver=
);
> +}
> +
> +module_init(shuttle_wmi_init);
> +module_exit(shuttle_wmi_exit);
> --
> 1.7.3.2
>
> --
> []'s
> Herton
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>



--=20
Corentin Chary
http://xf.iksaif.net
