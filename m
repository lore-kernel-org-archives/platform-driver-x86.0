From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] msi-wmi: remove unnecessary static in msi_wmi_notify()
Date: Wed, 19 Jul 2017 21:11:39 +0300
Message-ID: <CAHp75VebNSGoHC-dVHsORh1np-RwvmxC1ACqGeGAJ6EqT4m4Ug@mail.gmail.com>
References: <20170718214937.GA27363@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:32849 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756030AbdGSSLl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Jul 2017 14:11:41 -0400
In-Reply-To: <20170718214937.GA27363@embeddedgus>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jul 19, 2017 at 12:49 AM, Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
> Remove unnecessary static on local variable _key_. Such variable is
> initialized before being used, on every execution path throughout
> the function. The static has no benefit and, removing it reduces
> the object file size.
>
> This issue was detected using Coccinelle and the following semantic patch:
> https://github.com/GustavoARSilva/coccinelle/blob/master/static/static_unused.cocci
>
> In the following log you can see a significant difference in the object
> file size. Also, there is a significant difference in the bss segment.
> This log is the output of the size command, before and after the code
> change:
>
> before:
>    text    data     bss     dec     hex filename
>    6530    3736     320   10586    295a drivers/platform/x86/msi-wmi.o
>
> after:
>    text    data     bss     dec     hex filename
>    6494    3648     256   10398    289e drivers/platform/x86/msi-wmi.o
>

Pushed to testing, thanks.

P.S. Please, use subsystem prefix next time.

> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/platform/x86/msi-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
> index f6209b7..6201382 100644
> --- a/drivers/platform/x86/msi-wmi.c
> +++ b/drivers/platform/x86/msi-wmi.c
> @@ -184,7 +184,7 @@ static const struct backlight_ops msi_backlight_ops = {
>  static void msi_wmi_notify(u32 value, void *context)
>  {
>         struct acpi_buffer response = { ACPI_ALLOCATE_BUFFER, NULL };
> -       static struct key_entry *key;
> +       struct key_entry *key;
>         union acpi_object *obj;
>         acpi_status status;
>
> --
> 2.5.0
>



-- 
With Best Regards,
Andy Shevchenko
