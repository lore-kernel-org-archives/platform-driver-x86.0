From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 03/12] usb: typec: API for controlling USB Type-C Multiplexers
Date: Fri, 16 Feb 2018 16:00:32 +0200
Message-ID: <CAHp75VdaK_LdsNeb5XY0kcA7sqH9G8OyjSLs7WRSftK9Zs98GQ@mail.gmail.com>
References: <20180216104751.8371-1-hdegoede@redhat.com> <20180216104751.8371-4-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180216104751.8371-4-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, USB <linux-usb@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Feb 16, 2018 at 12:47 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> USB Type-C connectors consist of various muxes and switches
> that route the pins on the connector to the right locations.
> The USB Type-C drivers need to be able to control the muxes,
> as they are the ones that know things like the cable plug
> orientation, and the current mode that was negotiated with
> the partner.
>
> This introduces a small API for registering and controlling
> cable plug orientation switches, and separate small API for
> registering and controlling pin multiplexer/demultiplexer
> switches that are needed with Accessory/Alternate Modes.

> +       sw = __device_find_connection(dev, "typec-switch", NULL,
> +                                     typec_switch_match);

Perhaps one line? (even if it takes ~83 characters)

-- 
With Best Regards,
Andy Shevchenko
