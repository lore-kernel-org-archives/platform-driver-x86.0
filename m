From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] platform/x86: peaq-wmi: silence a static checker warning
Date: Wed, 19 Jul 2017 21:11:09 +0300
Message-ID: <CAHp75Vck_T6Fi8qfu5SPUN7t3bdjmOxYRvoenOH4pyRUUSPb7A@mail.gmail.com>
References: <CAHp75VdSD0zVFtnwF8oWt24P8DM6vZQNO93F_38yaCYBzCCBRw@mail.gmail.com>
 <20170719130718.gcskf2ofko5wv6rw@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:35983 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756025AbdGSSLL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Jul 2017 14:11:11 -0400
In-Reply-To: <20170719130718.gcskf2ofko5wv6rw@mwanda>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Darren Hart <dvhart@infradead.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Jul 19, 2017 at 4:07 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> There is a harmless static checker warning here that unsigned values are
> always >= 0.  The code looks like:
>
>         if (peaq_ignore_events_counter && --peaq_ignore_events_counter >= 0)
>
> The first part of the condition ensures that we never wrap around so the
> code works as intended.  I've tweaked it slightly to avoid the warning.
>

Pushed to testing, thanks.

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Andy Shevchenko's approach is cleaner
>
> diff --git a/drivers/platform/x86/peaq-wmi.c b/drivers/platform/x86/peaq-wmi.c
> index 77d1f90b0794..c68bd76954fd 100644
> --- a/drivers/platform/x86/peaq-wmi.c
> +++ b/drivers/platform/x86/peaq-wmi.c
> @@ -51,7 +51,7 @@ static void peaq_wmi_poll(struct input_polled_dev *dev)
>                 return;
>         }
>
> -       if (peaq_ignore_events_counter && --peaq_ignore_events_counter >= 0)
> +       if (peaq_ignore_events_counter && peaq_ignore_events_counter--)
>                 return;
>
>         if (obj.integer.value) {



-- 
With Best Regards,
Andy Shevchenko
