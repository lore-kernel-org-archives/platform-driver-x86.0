From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: wmi: declare device_type structure as constant
Date: Mon, 29 Oct 2018 15:49:45 +0200
Message-ID: <CAHp75Ve0ps=MmyZMA0z6ExOrsk8x3D-rw2JtYwWZ+FqmZ7SLKQ@mail.gmail.com>
References: <20181028060700.22110-1-bhumirks@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181028060700.22110-1-bhumirks@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bhumika Goyal <bhumirks@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Oct 28, 2018 at 8:07 AM Bhumika Goyal <bhumirks@gmail.com> wrote:
>
> The only usage of device_type structure is getting stored as
> a reference in the type field of device structure. This type
> field is declared const. Therefore, the device_type structure
> can never be modified and can be declared as const.
>

Pushed to my review and testing queue, thanks!

> Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
> ---
>  drivers/platform/x86/wmi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 04791ea5d97b..bea35be68706 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -987,19 +987,19 @@ static struct bus_type wmi_bus_type = {
>         .remove = wmi_dev_remove,
>  };
>
> -static struct device_type wmi_type_event = {
> +static const struct device_type wmi_type_event = {
>         .name = "event",
>         .groups = wmi_event_groups,
>         .release = wmi_dev_release,
>  };
>
> -static struct device_type wmi_type_method = {
> +static const struct device_type wmi_type_method = {
>         .name = "method",
>         .groups = wmi_method_groups,
>         .release = wmi_dev_release,
>  };
>
> -static struct device_type wmi_type_data = {
> +static const struct device_type wmi_type_data = {
>         .name = "data",
>         .groups = wmi_data_groups,
>         .release = wmi_dev_release,
> --
> 2.14.5
>


-- 
With Best Regards,
Andy Shevchenko
