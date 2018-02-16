From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 10/12] usb: typec: driver for Pericom PI3USB30532 Type-C
 cross switch
Date: Fri, 16 Feb 2018 15:33:59 +0200
Message-ID: <CAHp75VdboZ==0iWW8vTxfjJrVnqKiGA_abJkJANWCjUjb7MOZA@mail.gmail.com>
References: <20180216104751.8371-1-hdegoede@redhat.com> <20180216104751.8371-11-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f171.google.com ([209.85.216.171]:36904 "EHLO
        mail-qt0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1031222AbeBPNeA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Feb 2018 08:34:00 -0500
In-Reply-To: <20180216104751.8371-11-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, USB <linux-usb@vger.kernel.org>

On Fri, Feb 16, 2018 at 12:47 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> Add a driver for the Pericom PI3USB30532 Type-C cross switch /
> mux chip found on some devices with a Type-C port.


> +static int pi3usb30532_set_conf(struct pi3usb30532 *pi, u8 new_conf)
> +{
> +       int ret = 0;
> +
> +       if (pi->conf == new_conf)
> +               return 0;
> +
> +       ret = i2c_smbus_write_byte_data(pi->client, PI3USB30532_CONF, new_conf);

> +       if (ret == 0)
> +               pi->conf = new_conf;
> +       else
> +               dev_err(&pi->client->dev, "Error writing conf: %d\n", ret);

Usual pattern, please.

if (ret) {
 ...
 return ret;
}

return 0;

> +
> +       return ret;
> +}

-- 
With Best Regards,
Andy Shevchenko
