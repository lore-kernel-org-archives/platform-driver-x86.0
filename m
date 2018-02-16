From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 01/12] drivers: base: Unified device connection lookup
Date: Fri, 16 Feb 2018 13:00:32 +0200
Message-ID: <CAHp75VcyrUvPzojY1J2cUheuYz6mRCP_VppSx740ELanNaQ+Hw@mail.gmail.com>
References: <20180216104751.8371-1-hdegoede@redhat.com> <20180216104751.8371-2-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180216104751.8371-2-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, USB <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Feb 16, 2018 at 12:47 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> From: Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>
> Several frameworks - clk, gpio, phy, pmw, etc. - maintain
> lookup tables for describing connections and provide custom
> API for handling them. This introduces a single generic
> lookup table and API for the connections.
>
> The motivation for this commit is centralizing the
> connection lookup, but the goal is to ultimately extract the
> connection descriptions also from firmware by using the
> fwnode_graph_* functions and other mechanisms that are
> available.

> +void *__device_find_connection(struct device *dev, const char *con_id,

> +                              void *data,
> +                              void *(*match)(struct devcon *con, int ep,
> +                                             void *data))

Perhaps swap them, since data is dependent parameter to match.

And put match function on one line disregard 80 character limit?

> +/**
> + * struct devcon - Device Connection Descriptor
> + * @endpoint: The names of the two devices connected together
> + * @id: Unique identifier for the connection
> + */
> +struct devcon {
> +       const char              *endpoint[2];
> +       const char              *id;
> +       struct list_head        list;
> +};
> +

> +void *__device_find_connection(struct device *dev, const char *con_id,
> +                              void *data,
> +                              void *(*match)(struct devcon *con, int ep,
> +                                             void *data));

Ditto.

> +
> +struct device *device_find_connection(struct device *dev, const char *con_id);
> +
> +#define DEVCON(_ep0, _ep1, _id)                { { _ep0, _ep1 }, _id, }

Please use (struct devcon) here to make it possible to do like

struct devcon foo;

foo = DEVCON(...);


-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
