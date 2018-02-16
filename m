From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 02/12] usb: typec: Start using ERR_PTR
Date: Fri, 16 Feb 2018 13:07:24 +0200
Message-ID: <CAHp75VfRX3sPKS8Fbt-5cRskRg=75XYfnE7UYLO5c37iUvkgWg@mail.gmail.com>
References: <20180216104751.8371-1-hdegoede@redhat.com> <20180216104751.8371-3-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f171.google.com ([209.85.216.171]:42508 "EHLO
        mail-qt0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935119AbeBPLH0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Feb 2018 06:07:26 -0500
In-Reply-To: <20180216104751.8371-3-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, USB <linux-usb@vger.kernel.org>

On Fri, Feb 16, 2018 at 12:47 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>
> In order to allow the USB Type-C Class driver take care of
> things like muxes and other possible dependencies for the
> port drivers, returning ERR_PTR instead of NULL from the
> registration functions in case of failure.
>
> The reason for taking over control of the muxes for example
> is because handling them in the port drivers would be just
> boilerplate.

>  void typec_unregister_altmode(struct typec_altmode *alt)
>  {
> -       if (alt)
> -               device_unregister(&alt->dev);
> +       device_unregister(&alt->dev);
>  }

But it's a pattern to guarantee that unregister type of functions are
NULL (or ERR_PTR) aware.


>  void typec_unregister_partner(struct typec_partner *partner)
>  {
> -       if (partner)
> -               device_unregister(&partner->dev);
> +       device_unregister(&partner->dev);
>  }

Ditto.

-- 
With Best Regards,
Andy Shevchenko
