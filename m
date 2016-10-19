From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] ideapad-laptop: Add another DMI entry for Yoga 900
Date: Wed, 19 Oct 2016 19:36:42 +0300
Message-ID: <CAHp75Ve2a_p7A7TfZQL+9-8ws09_N4XG1fsQswrJO58x3o-j-w@mail.gmail.com>
References: <20161019102740.74567-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:36175 "EHLO
        mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751012AbcJSQgn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Oct 2016 12:36:43 -0400
Received: by mail-oi0-f42.google.com with SMTP id m72so37031293oik.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Oct 2016 09:36:43 -0700 (PDT)
In-Reply-To: <20161019102740.74567-1-mika.westerberg@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>

On Wed, Oct 19, 2016 at 1:27 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> This particular laptop has its motherboard replaced and after that, even
> with the latest BIOS, some DMI identification strings have become
> "INVALID". This includes DMI_PRODUCT_VERSION which results Wifi being
> blocked.
>
> It seems that DMI_BOARD_NAME is still valid so use that as an
> alternative for Lenovo Yoga 900.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Reviewed-by: Andy Shevchenko <andy.shevchenko@linux.intel.com>

> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -933,6 +933,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
>                         DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo YOGA 900"),
>                 },
>         },
> +       {
> +               .ident = "Lenovo Yoga 900",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_BOARD_NAME, "VIUU4"),
> +               },
> +       },
>         {}
>  };

-- 
With Best Regards,
Andy Shevchenko
