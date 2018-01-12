From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: suppress warning about palm detection
Date: Fri, 12 Jan 2018 15:50:42 +0200
Message-ID: <CAHp75Vc66ZfRmOoOKJRODpV0mS2aZru=b-r0cr8SKYH=hm+W6Q@mail.gmail.com>
References: <20180112110445.1876-1-dh.herrmann@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:37974 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933544AbeALNun (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 12 Jan 2018 08:50:43 -0500
In-Reply-To: <20180112110445.1876-1-dh.herrmann@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Herrmann <dh.herrmann@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Thode <mthode@mthode.org>

On Fri, Jan 12, 2018 at 1:04 PM, David Herrmann <dh.herrmann@gmail.com> wrote:
> This patch prevents the thinkpad_acpi driver from warning about 2 event
> codes returned for keyboard palm-detection. No behavioral changes,
> other than suppressing the warning in the kernel log. The events are
> still forwarded via acpi-netlink channels.
>
> We could, optionally, decide to forward the event through a
> input-switch on the tpacpi input device. However, so far no suitable
> input-code exists, and no similar drivers report such events. Hence,
> leave it an acpi event for now.
>
> Note that the event-codes are named based on empirical studies. On the
> ThinkPad X1 5th Gen the sensor can be found underneath the arrow key.
>

> Cc: Matthew Thode <mthode@mthode.org>

Shouldn't be Suggested-by or even Signed-off-by?

> Signed-off-by: David Herrmann <dh.herrmann@gmail.com>


> +       case TP_HKEY_EV_PALM_DETECTED:
> +       case TP_HKEY_EV_PALM_UNDETECTED:

> +               /* palm detected hovering the keyboard, forward to user-space
> +                * via netlink for consumption */

Comment style is
/*
 * Multi line comment.
 * This is an example.
 */

> +               return true;

I can fix the latter, but I have to be sure all credits are given properly.

-- 
With Best Regards,
Andy Shevchenko
