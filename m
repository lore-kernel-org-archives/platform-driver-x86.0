From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [patch v4 2/3] platform/mellanox: mlxreg-hotplug: allow driver
 for ARM architecture
Date: Tue, 17 Oct 2017 22:16:07 +0300
Message-ID: <CAHp75VcMBsn2ZzHsyaNzxZ-aAraebSn-QYfVwFKDQhGgEOLc5w@mail.gmail.com>
References: <1508264554-184107-1-git-send-email-vadimp@mellanox.com> <1508264554-184107-3-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508264554-184107-3-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Oct 17, 2017 at 9:22 PM, Vadim Pasternak <vadimp@mellanox.com> wrote:
> It allows driver to run on x86 and ARM architecture based systems.
> And allows to specify hotplug device parameters through the device
> table tree files.
> Also some unnecessary includes are removed.

>  menuconfig MELLANOX_PLATFORM
>         bool "Platform support for Mellanox hardware"
> -       depends on X86 || COMPILE_TEST
> +       depends on (X86 && !OF_DYNAMIC) || ARM || COMPILE_TEST

I'm not sure I now understand why you need a tricky dependency chain here...

> +#if defined(CONFIG_OF_DYNAMIC) && !defined(CONFIG_COMPILE_TEST)

...and what's wrong with COMPILE_TEST here.

> +static int mlxreg_hotplug_of_device_create(struct mlxreg_hotplug_device *data)
> +{
> +       return of_update_property(data->np, &mlxreg_hotplug_device_en);
> +}
> +
> +static void
> +mlxreg_hotplug_of_device_destroy(struct mlxreg_hotplug_device *data)
> +{
> +       of_update_property(data->np, &mlxreg_hotplug_device_dis);
> +       of_node_clear_flag(data->np, OF_POPULATED);
> +}
> +#else

> +#endif

-- 
With Best Regards,
Andy Shevchenko
