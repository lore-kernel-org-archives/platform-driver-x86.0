From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform: x86: Remove acpi_has_method() call in wmi.c
Date: Thu, 25 Jul 2019 20:58:43 +0300
Message-ID: <CAHp75Vc4qSNs6Kx6BdO163fi=fYNfPNHy+m3XVpO5v755pu2DA@mail.gmail.com>
References: <20190722031158.70311-1-skunberg.kelsey@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722031158.70311-1-skunberg.kelsey@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kelsey Skunberg <skunberg.kelsey@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, bjorn@helgaas.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel-mentees@lists.linuxfoundation.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jul 22, 2019 at 6:13 AM Kelsey Skunberg
<skunberg.kelsey@gmail.com> wrote:
>
> acpi_has_method() is unnecessary within __query_block() and should be
> removed to avoid extra work.
>
> wc_status is initialized to AE_ERROR before the acpi_has_method() call.
> acpi_has_method() and acpi_execute_simple_method() failing due to the
> method not existing will result in the same outcome from __query_block().
>

Pushed to my review and testing queue, thanks!

> Signed-off-by: Kelsey Skunberg <skunberg.kelsey@gmail.com>
> ---
>  drivers/platform/x86/wmi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 784cea8572c2..59e9aa0f9643 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -340,9 +340,7 @@ static acpi_status __query_block(struct wmi_block *wblock, u8 instance,
>                  * expensive, but have no corresponding WCxx method. So we
>                  * should not fail if this happens.
>                  */
> -               if (acpi_has_method(handle, wc_method))
> -                       wc_status = acpi_execute_simple_method(handle,
> -                                                               wc_method, 1);
> +               wc_status = acpi_execute_simple_method(handle, wc_method, 1);
>         }
>
>         strcpy(method, "WQ");
> --
> 2.20.1
>


-- 
With Best Regards,
Andy Shevchenko
