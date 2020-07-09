From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH platform-next v1 1/8] platform/mellanox: mlxreg-hotplug:
 Use capability register for attribute creation
Date: Thu, 9 Jul 2020 19:06:13 +0300
Message-ID: <CAHp75VfFdf=ZxuURpVR6LRaDm+x4VQsPgR6FLrcZPhLMn8MOpw@mail.gmail.com>
References: <20200601091851.5491-1-vadimp@mellanox.com> <20200601091851.5491-2-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200601091851.5491-2-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jun 1, 2020 at 12:19 PM Vadim Pasternak <vadimp@mellanox.com> wrote:
>
> Create the 'sysfs' attributes according to configuration provided
> through the capability register, which purpose is to indicate the
> actual number of the components within the particular group.
> Such components could be, for example the FAN or power supply units.
> The motivation is to avoid adding a new code in the future in order to
> distinct between the systems types supported different number of the

supported -> supporting a

> components like power supplies, FANs, ASICs, line cards.

...

>                 /* Go over all units within the item. */
> -               for (j = 0; j < item->count; j++, data++, id++) {
> +               for (j = 0, k = 0; j < item->count; j++, data++) {
> +                       /* Skip if bit in mask is not set. */
> +                       if (!(item->mask & BIT(j)))
> +                               continue;

Instead of splitted comments and this code, perhaps

/* Go over all unmasked units within item */
for_each_set_bit(j, &item->mask, item->count) {
...
}

It might require a mask defined as unsigned long, though. Or temporary
variables.

>                 }
> +               num_attrs += k;
>         }

-- 
With Best Regards,
Andy Shevchenko
