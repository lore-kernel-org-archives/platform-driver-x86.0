From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3] Add sysfs interface for touchpad state
Date: Fri, 17 Feb 2017 18:12:15 +0200
Message-ID: <CAHp75Vd8oqnJLRP4HLsTD_SUThwvRNegektN+-bbeT5L8h-NTQ@mail.gmail.com>
References: <20170217144815.11791-1-rrs@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170217144815.11791-1-rrs@debian.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ritesh Raj Sarraf <rrs@debian.org>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Feb 17, 2017 at 4:48 PM, Ritesh Raj Sarraf <rrs@debian.org> wrote:
> Lenovo Yoga (many variants: Yoga, Yoga2 Pro, Yoga2 13, Yoga3 Pro, Yoga 3
> 14 etc) has multiple modles that are a hybrid laptop, working in laptop
> mode as well as tablet mode.
>
> Currently, there is no easy interface to determine the touchpad status,
> which in case of the Yoga family of machines, can also be useful to
> assume tablet mode status.
> Note: The ideapad-laptop driver does not provide a SW_TABLET_MODE either
>
> For a detailed discussion  on why we want either of the interfaces,
> please see:
> https://bugs.launchpad.net/onboard/+bug/1366421/comments/43
>
> This patch adds a sysfs interface for read/write access under:
> /sys/bus/platform/devices/VPC2004\:00/touchpad_mode



> +static ssize_t touchpad_store(struct device *dev,
> +                                struct device_attribute *attr,
> +                                const char *buf, size_t count)
> +{
> +       struct ideapad_private *priv = dev_get_drvdata(dev);
> +       int ret, state;
> +
> +       ret = kstrtoint(buf, 0, &state);
> +       if (ret)
> +               return ret;

If it's intended to be boolean, better to use kstrtobool()

> +
> +       if (state != 0 && state != 1)
> +               return -EINVAL;
> +
> +       ret = write_ec_cmd(priv->adev->handle, VPCCMD_W_TOUCHPAD, state);
> +       if (ret < 0)
> +               return -EIO;
> +       return count;
> +}
> +
> +static DEVICE_ATTR_RW(touchpad);
> +
>  static struct attribute *ideapad_attributes[] = {
>         &dev_attr_camera_power.attr,
>         &dev_attr_fan_mode.attr,
> +       &dev_attr_touchpad.attr,
>         NULL
>  };
>
> --
> 2.11.0
>



-- 
With Best Regards,
Andy Shevchenko
