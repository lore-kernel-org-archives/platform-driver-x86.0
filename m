From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 2/3] ideapad: Add nodes in sysfs
Date: Thu, 2 Jun 2011 11:48:30 +0200
Message-ID: <BANLkTik+-wMXcCgSb8cCWx6wxrT0JgAbpnbGqizCpk+3F6Wx_g@mail.gmail.com>
References: <1307006553-12667-1-git-send-email-ike.pan@canonical.com>
	<1307006645-12702-1-git-send-email-ike.pan@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:51639 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933050Ab1FBJsd convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 2 Jun 2011 05:48:33 -0400
In-Reply-To: <1307006645-12702-1-git-send-email-ike.pan@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Randy Dunlap <rdunlap@xenotime.net>

On Thu, Jun 2, 2011 at 11:24 AM, Ike Panhc <ike.pan@canonical.com> wrot=
e:
> Create the following nodes in sysfs
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ideapad/brightness
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ideapad/touchpad
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ideapad/cfg
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ideapad/backlight
>
> Signed-off-by: Ike Panhc <ike.pan@canonical.com>
> ---
> =C2=A0.../ABI/testing/sysfs-platform-ideapad-laptop =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 30 +++++
> =C2=A0drivers/platform/x86/ideapad-laptop.c =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A0128 +++++++++++++++++---
> =C2=A02 files changed, 140 insertions(+), 18 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop =
b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> index 807fca2..869f0c4 100644
> --- a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> +++ b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> @@ -4,3 +4,33 @@ KernelVersion: 2.6.37
> =C2=A0Contact: =C2=A0 =C2=A0 =C2=A0 "Ike Panhc <ike.pan@canonical.com=
>"
> =C2=A0Description:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Control the po=
wer of camera module. 1 means on, 0 means off.
> +
> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ideapa=
d/brightness
> +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Jun 2011
> +KernelVersion: 3.0.1
> +Contact: =C2=A0 =C2=A0 =C2=A0 "Ike Panhc <ike.pan@canonical.com>"
> +Description:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Brightness control=
=2E When reading, it shows <current>/<max>.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 When writing, it a=
ccepts new brightness value.
> +
> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ideapa=
d/touchpad
> +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Jun 2011
> +KernelVersion: 3.0.1
> +Contact: =C2=A0 =C2=A0 =C2=A0 "Ike Panhc <ike.pan@canonical.com>"
> +Description:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Control the power =
of touchpad. 1 means on, 0 means off.
> +
> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ideapa=
d/cfg
> +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Jun 2011
> +KernelVersion: 3.0.1
> +Contact: =C2=A0 =C2=A0 =C2=A0 "Ike Panhc <ike.pan@canonical.com>"
> +Description:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ideapad capability=
 bits.
> +
> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ideapa=
d/backlight
> +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Jun 2011
> +KernelVersion: 3.0.1
> +Contact: =C2=A0 =C2=A0 =C2=A0 "Ike Panhc <ike.pan@canonical.com>"
> +Description:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Control the power =
of backlight. 1 means on, 0 means off.
> +
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform=
/x86/ideapad-laptop.c
> index a5c0efa..9c09891 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -160,22 +160,25 @@ static int write_ec_cmd(acpi_handle handle, int=
 cmd, unsigned long data)
> =C2=A0}
>
> =C2=A0/*
> - * camera power
> + * sysfs helper
> =C2=A0*/
> -static ssize_t show_ideapad_cam(struct device *dev,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_attribute *attr,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *buf)
> +static ssize_t show_ideapad_helper(struct device *dev,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attribut=
e *attr,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *buf,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int cmd)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long result;
>
> - =C2=A0 =C2=A0 =C2=A0 if (read_ec_data(ideapad_handle, 0x1D, &result=
))
> + =C2=A0 =C2=A0 =C2=A0 if (read_ec_data(ideapad_handle, cmd, &result)=
)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return sprintf=
(buf, "-1\n");
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return sprintf(buf, "%lu\n", result);
> =C2=A0}
>
> -static ssize_t store_ideapad_cam(struct device *dev,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attribute *attr=
,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *buf, size_t count=
)
> +static ssize_t store_ideapad_helper(struct device *dev,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_attribu=
te *attr,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *buf,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t count,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int cmd)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret, state;
>
> @@ -183,14 +186,112 @@ static ssize_t store_ideapad_cam(struct device=
 *dev,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sscanf(buf, "%i", &state) !=3D 1)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;
> - =C2=A0 =C2=A0 =C2=A0 ret =3D write_ec_cmd(ideapad_handle, 0x1E, sta=
te);
> + =C2=A0 =C2=A0 =C2=A0 ret =3D write_ec_cmd(ideapad_handle, cmd, stat=
e);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret < 0)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return count;
> =C2=A0}
>
> +/*
> + * sysfs node
> + */
> +static ssize_t show_ideapad_cam(struct device *dev,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_attribute *attr,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *buf)
> +{
> + =C2=A0 =C2=A0 =C2=A0 return show_ideapad_helper(dev, attr, buf, 0x1=
D);
> +}
> +
> +static ssize_t store_ideapad_cam(struct device *dev,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attribute *attr=
,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *buf, size_t count=
)
> +{
> + =C2=A0 =C2=A0 =C2=A0 return store_ideapad_helper(dev, attr, buf, co=
unt, 0x1E);
> +}
> +
> =C2=A0static DEVICE_ATTR(camera_power, 0644, show_ideapad_cam, store_=
ideapad_cam);
>
> +static ssize_t show_ideapad_touchpad(struct device *dev,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_a=
ttribute *attr,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *buf)
> +{
> + =C2=A0 =C2=A0 =C2=A0 return show_ideapad_helper(dev, attr, buf, 0x1=
B);
> +}
> +
> +static ssize_t store_ideapad_touchpad(struct device *dev,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_=
attribute *attr,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *bu=
f, size_t count)
> +{
> + =C2=A0 =C2=A0 =C2=A0 return store_ideapad_helper(dev, attr, buf, co=
unt, 0x1C);
> +}
> +
> +static DEVICE_ATTR(touchpad, 0644, show_ideapad_touchpad,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0store=
_ideapad_touchpad);
> +
> +static ssize_t show_ideapad_brightness(struct device *dev,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct d=
evice_attribute *attr,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *bu=
f)
> +{
> + =C2=A0 =C2=A0 =C2=A0 unsigned long now, max;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (read_ec_data(ideapad_handle, 0x11, &max))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max =3D -1;
> + =C2=A0 =C2=A0 =C2=A0 if (read_ec_data(ideapad_handle, 0x12, &now))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 now =3D -1;
> + =C2=A0 =C2=A0 =C2=A0 return sprintf(buf, "%lu/%lu\n", now, max);
> +}
> +
> +static ssize_t store_ideapad_brightness(struct device *dev,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct =
device_attribute *attr,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const c=
har *buf, size_t count)
> +{
> + =C2=A0 =C2=A0 =C2=A0 return store_ideapad_helper(dev, attr, buf, co=
unt, 0x13);
> +}
> +
> +static DEVICE_ATTR(brightness, 0644, show_ideapad_brightness,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0store=
_ideapad_brightness);
> +
> +static ssize_t show_ideapad_cfg(struct device *dev,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_attribute *attr,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *buf)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct ideapad_private *priv =3D dev_get_drvda=
ta(dev);
> +
> + =C2=A0 =C2=A0 =C2=A0 return sprintf(buf, "0x%.8X\n", (unsigned int)=
(priv->cfg));
> +}
> +
> +static DEVICE_ATTR(cfg, 0444, show_ideapad_cfg, NULL);
> +
> +static ssize_t show_ideapad_backlight(struct device *dev,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_=
attribute *attr,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *buf)
> +{
> + =C2=A0 =C2=A0 =C2=A0 return show_ideapad_helper(dev, attr, buf, 0x1=
8);
> +}
> +
> +static ssize_t store_ideapad_backlight(struct device *dev,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct d=
evice_attribute *attr,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const ch=
ar *buf, size_t count)
> +{
> + =C2=A0 =C2=A0 =C2=A0 return store_ideapad_helper(dev, attr, buf, co=
unt, 0x33);
> +}
> +
> +static DEVICE_ATTR(backlight, 0644, show_ideapad_backlight,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0store=
_ideapad_backlight);
> +
> +static struct attribute *ideapad_attributes[] =3D {
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_camera_power.attr,
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_brightness.attr,
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_touchpad.attr,
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_cfg.attr,
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_backlight.attr,
> + =C2=A0 =C2=A0 =C2=A0 NULL
> +};
> +
> +static struct attribute_group ideapad_attribute_group =3D {
> + =C2=A0 =C2=A0 =C2=A0 .attrs =3D ideapad_attributes
> +};
> +
> =C2=A0/*
> =C2=A0* Rfkill
> =C2=A0*/
> @@ -285,15 +386,6 @@ static void __devexit ideapad_unregister_rfkill(=
struct acpi_device *adevice,
> =C2=A0/*
> =C2=A0* Platform device
> =C2=A0*/
> -static struct attribute *ideapad_attributes[] =3D {
> - =C2=A0 =C2=A0 =C2=A0 &dev_attr_camera_power.attr,
> - =C2=A0 =C2=A0 =C2=A0 NULL
> -};
> -
> -static struct attribute_group ideapad_attribute_group =3D {
> - =C2=A0 =C2=A0 =C2=A0 .attrs =3D ideapad_attributes
> -};
> -
> =C2=A0static int __devinit ideapad_platform_init(struct ideapad_priva=
te *priv)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int result;
> --
> 1.7.4.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>

Hi Ike,
Why do you want to add=C2=A0/sys/devices/platform/ideapad/brightness an=
d
 =C2=A0 =C2=A0/sys/devices/platform/ideapad/backlight ?
Both of these files should be handled by the generic backlight class
(using brightness and bl_power).

Also, could you describe what are these "capabilities" in the sysfs doc=
 file ?

Thanks


--=20
Corentin Chary
http://xf.iksaif.net
