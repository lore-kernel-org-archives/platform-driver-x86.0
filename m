From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH platform-next v1 2/8] platform/mellanox: mlxreg-hotplug:
 Add environmental data to uevent
Date: Thu, 9 Jul 2020 19:32:17 +0300
Message-ID: <CAHp75VfXPxoQjeOTMRmO=Yf3YSsGJh2xRRSm9U7wTpRx9N8Bgw@mail.gmail.com>
References: <20200601091851.5491-1-vadimp@mellanox.com> <20200601091851.5491-3-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200601091851.5491-3-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jun 1, 2020 at 12:19 PM Vadim Pasternak <vadimp@mellanox.com> wrote:
>
> Send "udev" event with environmental data in order to allow handling
> "ENV{}" variables in "udev" rules.

...

> +static int
> +mlxreg_hotplug_udev_event_send(struct kobject *kobj,
> +                              struct mlxreg_core_data *data, bool action)
> +{
> +       char event_str[MLXREG_CORE_LABEL_MAX_SIZE + 2];
> +       char label[MLXREG_CORE_LABEL_MAX_SIZE] = { 0 };
> +       int i;
> +
> +       mlxreg_hotplug_udev_envp[0] = event_str;

> +       for (i = 0; data->label[i]; i++)
> +               label[i] = toupper(data->label[i]);

Sounds like a candidate to be in string_helpers.h

#include <ctype.h>
...
static inline void string_upper(char *dst, const char *src)
{
  do {
    *dst++ = toupper(*src);
  } while (*src++);
}

// similar for tolower
...

There are plenty existing users that can benefit and I can imagine how
many more will come.
So, If you add the first patch in the series to bring this in, I will take it.

> +       if (action)
> +               snprintf(event_str, MLXREG_CORE_LABEL_MAX_SIZE, "%s=1", label);
> +       else
> +               snprintf(event_str, MLXREG_CORE_LABEL_MAX_SIZE, "%s=0", label);

Wouldn't be easier to have

..."%s=%d" ... !!action...

?

> +
> +       return kobject_uevent_env(kobj, KOBJ_CHANGE, mlxreg_hotplug_udev_envp);
> +}

-- 
With Best Regards,
Andy Shevchenko
