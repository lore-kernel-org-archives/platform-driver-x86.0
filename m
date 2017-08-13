From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel_mid_powerbtn: fix error return code
 in mid_pb_probe()
Date: Sun, 13 Aug 2017 15:30:22 +0300
Message-ID: <CAHp75Vfa7YFz0UMUAa+4YiV9fRVaiYD9OS2vbgbd5p2rnK4YmQ@mail.gmail.com>
References: <20170809160054.GA27501@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:37067 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752545AbdHMMaX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 13 Aug 2017 08:30:23 -0400
In-Reply-To: <20170809160054.GA27501@embeddedgus>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Aug 9, 2017 at 7:00 PM, Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
> platform_get_irq() returns an error code, but the intel_mid_powerbtn
> driver ignores it and always returns -EINVAL. This is not correct and,
> prevents -EPROBE_DEFER from being propagated properly.
>
> Print error message and propagate the return value of platform_get_irq
> on failure.
>
> This issue was detected with the help of Coccinelle.

Pushed to testing, thanks!

>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/platform/x86/intel_mid_powerbtn.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
> index 871cfa6..854a16d 100644
> --- a/drivers/platform/x86/intel_mid_powerbtn.c
> +++ b/drivers/platform/x86/intel_mid_powerbtn.c
> @@ -142,8 +142,10 @@ static int mid_pb_probe(struct platform_device *pdev)
>         if (!id)
>                 return -ENODEV;
>
> -       if (irq < 0)
> -               return -EINVAL;
> +       if (irq < 0) {
> +               dev_err(&pdev->dev, "Failed to get IRQ: %d\n", irq);
> +               return irq;
> +       }
>
>         input = devm_input_allocate_device(&pdev->dev);
>         if (!input)
> --
> 2.5.0
>



-- 
With Best Regards,
Andy Shevchenko
