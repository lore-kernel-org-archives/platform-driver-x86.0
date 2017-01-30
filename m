From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] Add sysfs interface for touchpad state
Date: Mon, 30 Jan 2017 22:25:49 +0200
Message-ID: <CAHp75VcekiLxkGbHFXbPvTX7SwBHobQFmnx5Y-uFWXZSEN9ujA@mail.gmail.com>
References: <20170130105749.17338-1-rrs@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:36158 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754464AbdA3U0G (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2017 15:26:06 -0500
Received: by mail-qk0-f195.google.com with SMTP id i34so18008005qkh.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2017 12:25:55 -0800 (PST)
In-Reply-To: <20170130105749.17338-1-rrs@debian.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ritesh Raj Sarraf <rrs@debian.org>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>

On Mon, Jan 30, 2017 at 12:57 PM, Ritesh Raj Sarraf <rrs@debian.org> wrote:
> Lenovo Yoga (many variants: Yoga, Yoga2 Pro, Yoga2 13, Yoga3 Pro, Yoga 3
> 14 etc) has multiple modles that are a hybrid laptop, working in laptop
> mode as well as tablet mode.

The main question is who is the initiator of the mode change? Do you
need to do anything in UI to prepare OS for such switch?

> There is no interface available to query the physical state of these
> devices. Also, from the driver, it doesn't look to be having an EC
> command to get that information from the acpi driver.
>
> When in tablet mode, the hardware keyboard and touchpad get disabled.
> This could be one sub-optimal way to assume that under such condition
> (touchpad disabled) the machine is in Tablet-Mode. Other than this, I've
> not come across another way to determine the physical state of the
> hardware.
>
> Currently, some of the hardware status is provided through debugfs,
> which is useless for unprivileged processes. (This already has many
> broken reports: radio and wifi, which are active/on as I write this)

This should be fixed.

> root@learner:/sys/kernel/debug# cat ideapad/status
> Backlight max:  16
> Backlight now:  3
> BL power value: On
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Radio status:   Off(0)
> Wifi status:    Off(0)
> BT status:      Off(0)
> 3G status:      Off(0)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Touchpad status:On(1)
> SW_TABLET_MODE: Off(0)
> Camera status:  On(1)
>
> This patch adds a sysfs interface for unprivileged process access under:
> /sys/bus/platform/devices/VPC2004\:00/touchpad_state
>
> rrs@learner:/sys/bus/platform/devices/VPC2004:00$ cat touchpad_state
> 1
> 2017-01-30 / 16:12:00 =E2=99=92=E2=99=92=E2=99=92  =E2=98=BA
> rrs@learner:/sys/bus/platform/devices/VPC2004:00$ cat touchpad_state
> 0
> 2017-01-30 / 16:12:06 =E2=99=92=E2=99=92=E2=99=92  =E2=98=BA

You introduce an ABI without documenting it.

>
> Signed-off-by: Ritesh Raj Sarraf <rrs@debian.org>
> ---
>  drivers/platform/x86/ideapad-laptop.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86=
/ideapad-laptop.c
> index a7614fc542b5..3a1622ef2f45 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -423,9 +423,33 @@ static ssize_t store_ideapad_fan(struct device *dev,
>
>  static DEVICE_ATTR(fan_mode, 0644, show_ideapad_fan, store_ideapad_fan);
>
> +
> +static ssize_t show_touchpad_state(struct device *dev,
> +                               struct device_attribute *attr,
> +                               char *buf)
> +{
> +       unsigned long result;
> +       struct ideapad_private *priv =3D dev_get_drvdata(dev);
> +
> +       if (read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &result))

> +               return sprintf(buf, "-1\n");

That is bad. Return the error code what read_ec_data() returns. If it
is not suitable convert it here.

> +       return sprintf(buf, "%lu\n", result);

> +}
> +
> +static ssize_t store_touchpad_state(struct device *dev,
> +                                struct device_attribute *attr,
> +                                const char *buf, size_t count)
> +{
> +        /* Don't enable writing here */
> +        return -1;

And why you can't just drop this completely?

> +}
> +
> +static DEVICE_ATTR(touchpad_state, 0644, show_touchpad_state, store_touc=
hpad_state);
> +
>  static struct attribute *ideapad_attributes[] =3D {
>         &dev_attr_camera_power.attr,
>         &dev_attr_fan_mode.attr,
> +       &dev_attr_touchpad_state.attr,

Is it really state, btw? Reading your commit message I would assume
this is also "mode" for touchpad.

>         NULL
>  };

--=20
With Best Regards,
Andy Shevchenko
