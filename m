From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Accept flat mode for type 4
 multi mode status
Date: Tue, 14 Nov 2017 18:58:58 +0200
Message-ID: <CAHp75VeQXSF0ZqE6dr1=Mm0n25OJsAJ5_6uT-nb7TLKgpbsWFg@mail.gmail.com>
References: <20171114161414.14297-1-bberg@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:47327 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754190AbdKNQ67 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2017 11:58:59 -0500
Received: by mail-qt0-f196.google.com with SMTP id y5so10371916qtk.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Nov 2017 08:58:59 -0800 (PST)
In-Reply-To: <20171114161414.14297-1-bberg@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Benjamin Berg <bberg@redhat.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, Peter FP1 Zhang <zhangfp1@lenovo.com>, Lyude <lyude@redhat.com>

On Tue, Nov 14, 2017 at 6:14 PM, Benjamin Berg <bberg@redhat.com> wrote:
> On the X1 Yoga 2nd Generation and most likely other notebooks the FLAT
> mode is reported. Decode it correctly rather than warning about an
> unexpected multi mode status to be reported.

If we can't check on all available hardware, better to avoid "doing
for all" fixes.
I suppose DMI match can help here.

It would be nice to hear from Henrique and others as well.


>         case 4:
> -               valid_modes = TP_ACPI_MULTI_MODE_LAPTOP |
> -                             TP_ACPI_MULTI_MODE_TABLET |
> -                             TP_ACPI_MULTI_MODE_STAND |
> -                             TP_ACPI_MULTI_MODE_TENT;
> -               break;

The common practice is to put
/* fallthrough */
instead.

>         case 5:

> +               /* In mode 4, FLAT is not specified as a valid mode. However,
> +                * it can be seen at least on the X1 Yoga 2nd Generation.
> +                */

We don't use network subsystem style of comments.

>                 valid_modes = TP_ACPI_MULTI_MODE_LAPTOP |
>                               TP_ACPI_MULTI_MODE_FLAT |
>                               TP_ACPI_MULTI_MODE_TABLET |
>                               TP_ACPI_MULTI_MODE_STAND |
>                               TP_ACPI_MULTI_MODE_TENT;
>                 break;


-- 
With Best Regards,
Andy Shevchenko
