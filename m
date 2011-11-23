From: David Herrmann <dh.herrmann@googlemail.com>
Subject: Re: [PATCH 08/15] samsung-laptop: add battery life extender support
Date: Wed, 23 Nov 2011 17:17:50 +0100
Message-ID: <CANq1E4TPKrig6SUT6OWXFoi=K_Q+3KNd6eZD693zfoJSWGNmGg@mail.gmail.com>
References: <1321999366-23784-1-git-send-email-corentincj@iksaif.net>
	<1321999366-23784-9-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:36883 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750810Ab1KWQRw convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 23 Nov 2011 11:17:52 -0500
In-Reply-To: <1321999366-23784-9-git-send-email-corentincj@iksaif.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Randy Dunlap <rdunlap@xenotime.net>, Matthew Garrett <mjg@redhat.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Corentin

On Tue, Nov 22, 2011 at 11:02 PM, Corentin Chary <corentincj@iksaif.net=
> wrote:
> Signed-off-by: Corentin Chary <corentincj@iksaif.net>
> ---
> =A0.../ABI/testing/sysfs-driver-samsung-laptop =A0 =A0 =A0 =A0| =A0 1=
0 +++
> =A0drivers/platform/x86/samsung-laptop.c =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 82 ++++++++++++++++++++
> =A02 files changed, 92 insertions(+), 0 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-samsung-laptop b/=
Documentation/ABI/testing/sysfs-driver-samsung-laptop
> index 0a81023..a6a56e1 100644
> --- a/Documentation/ABI/testing/sysfs-driver-samsung-laptop
> +++ b/Documentation/ABI/testing/sysfs-driver-samsung-laptop
> @@ -17,3 +17,13 @@ Description: Some Samsung laptops have different "=
performance levels"
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Specifically, not all support the "ove=
rclock" option,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0and it's still unknown if this value e=
ven changes
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0anything, other than making the user f=
eel a bit better.
> +
> +What: =A0 =A0 =A0 =A0 =A0/sys/devices/platform/samsung/battery_life_=
extender
> +Date: =A0 =A0 =A0 =A0 =A0December 1, 2011
> +KernelVersion: 3.3
> +Contact: =A0 =A0 =A0 Corentin Chary <corentin.chary@gmail.com>
> +Description: =A0 Max battery charge level can be modified, battery c=
ycle
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 life can be extended by reducing the ma=
x battery charge
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 level.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 0 means normal battery mode (100% charg=
e)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 1 means battery life extender mode (80%=
 charge)
> diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform=
/x86/samsung-laptop.c
> index 6493542..16f45da 100644
> --- a/drivers/platform/x86/samsung-laptop.c
> +++ b/drivers/platform/x86/samsung-laptop.c
> @@ -104,6 +104,10 @@ struct sabi_commands {
> =A0 =A0 =A0 =A0u16 get_performance_level;
> =A0 =A0 =A0 =A0u16 set_performance_level;
>
> + =A0 =A0 =A0 /* 0x80 is off, 0x81 is on */
> + =A0 =A0 =A0 u16 get_battery_life_extender;
> + =A0 =A0 =A0 u16 set_battery_life_extender;
> +
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * Tell the BIOS that Linux is running on this machine=
=2E
> =A0 =A0 =A0 =A0 * 81 is on, 80 is off
> @@ -157,6 +161,9 @@ static const struct sabi_config sabi_configs[] =3D=
 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.get_performance_level=
 =3D 0x08,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.set_performance_level=
 =3D 0x09,
>
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .get_battery_life_exten=
der =3D 0xFFFF,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .set_battery_life_exten=
der =3D 0xFFFF,
> +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.set_linux =3D 0x0a,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
>
> @@ -204,6 +211,9 @@ static const struct sabi_config sabi_configs[] =3D=
 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.get_performance_level=
 =3D 0x31,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.set_performance_level=
 =3D 0x32,
>
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .get_battery_life_exten=
der =3D 0x65,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .set_battery_life_exten=
der =3D 0x66,
> +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.set_linux =3D 0xff,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
>
> @@ -531,8 +541,78 @@ static ssize_t set_performance_level(struct devi=
ce *dev,
> =A0static DEVICE_ATTR(performance_level, S_IWUSR | S_IRUGO,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 get_performance_level, set_perfor=
mance_level);
>
> +static int read_battery_life_extender(struct samsung_laptop *samsung=
)
> +{
> + =A0 =A0 =A0 const struct sabi_commands *commands =3D &samsung->conf=
ig->commands;
> + =A0 =A0 =A0 struct sabi_data data;
> + =A0 =A0 =A0 int retval;
> +
> + =A0 =A0 =A0 if (commands->get_battery_life_extender =3D=3D 0xFFFF)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
> +
> + =A0 =A0 =A0 memset(&data, 0, sizeof(data));
> + =A0 =A0 =A0 data.data[0] =3D 0x80;
> + =A0 =A0 =A0 retval =3D sabi_command(samsung, commands->get_battery_=
life_extender,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &data, &dat=
a);
> +
> + =A0 =A0 =A0 if (retval)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return retval;
> +
> + =A0 =A0 =A0 if (data.data[0] !=3D 0 && data.data[0] !=3D 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
> +
> + =A0 =A0 =A0 return data.data[0];
> +}
> +
> +static int write_battery_life_extender(struct samsung_laptop *samsun=
g,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0int enabled)
> +{
> + =A0 =A0 =A0 const struct sabi_commands *commands =3D &samsung->conf=
ig->commands;
> + =A0 =A0 =A0 struct sabi_data data;
> +
> + =A0 =A0 =A0 memset(&data, 0, sizeof(data));
> + =A0 =A0 =A0 data.data[0] =3D 0x80 | enabled;
> + =A0 =A0 =A0 return sabi_command(samsung, commands->set_battery_life=
_extender,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &data, NULL);
> +}
> +
> +static ssize_t get_battery_life_extender(struct device *dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0struct device_attribute *attr,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0char *buf)
> +{
> + =A0 =A0 =A0 struct samsung_laptop *samsung =3D dev_get_drvdata(dev)=
;
> + =A0 =A0 =A0 int ret;
> +
> + =A0 =A0 =A0 ret =3D read_battery_life_extender(samsung);
> + =A0 =A0 =A0 if (ret < 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> +
> + =A0 =A0 =A0 return sprintf(buf, "%d\n", ret);
> +}
> +
> +static ssize_t set_battery_life_extender(struct device *dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct device_attribute *attr,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 const char *buf, size_t count)
> +{
> + =A0 =A0 =A0 struct samsung_laptop *samsung =3D dev_get_drvdata(dev)=
;
> + =A0 =A0 =A0 int ret, value;
> +
> + =A0 =A0 =A0 if (!count || sscanf(buf, "%i", &value) !=3D 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> +
> + =A0 =A0 =A0 ret =3D write_battery_life_extender(samsung, !!value);
> + =A0 =A0 =A0 if (ret < 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> +
> + =A0 =A0 =A0 return count;
> +}
> +
> +static DEVICE_ATTR(battery_life_extender, S_IWUSR | S_IRUGO,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0get_battery_life_extender, set_b=
attery_life_extender);
> +
> =A0static struct attribute *platform_attributes[] =3D {
> =A0 =A0 =A0 =A0&dev_attr_performance_level.attr,
> + =A0 =A0 =A0 &dev_attr_battery_life_extender.attr,
> =A0 =A0 =A0 =A0NULL
> =A0};
>
> @@ -631,6 +711,8 @@ static mode_t samsung_sysfs_is_visible(struct kob=
ject *kobj,
>
> =A0 =A0 =A0 =A0if (attr =3D=3D &dev_attr_performance_level.attr)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ok =3D !!samsung->config->performance_=
levels[0].name;
> + =A0 =A0 =A0 if (attr =3D=3D &dev_attr_battery_life_extender.attr)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ok =3D !!(read_battery_life_extender(sa=
msung) >=3D 0);
>
> =A0 =A0 =A0 =A0return ok ? attr->mode : 0;
> =A0}
> --
> 1.7.5.4

My BIOS provides this option, too. However, this driver does not
detect it on my machine. During initialization I get:
samsung_laptop: SABI command 0x0078 failed with completion flag 0xaa

Maybe you can help debugging this. If there is something I can test
via debugfs, just tell me.

Regards
David
