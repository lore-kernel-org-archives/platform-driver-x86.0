From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: ideapad: Add Y530-15ICH to no_hw_rfkill
Date: Mon, 29 Oct 2018 15:50:02 +0200
Message-ID: <CAHp75Vdqm8ryJMRnOdsWd7Y8AKGLSuXDOgL37q-UE+_0S356FQ@mail.gmail.com>
References: <20181026230723.12215-1-zombah@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181026230723.12215-1-zombah@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: zombah@gmail.com
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Oct 27, 2018 at 2:08 AM Misha Komarovskiy <zombah@gmail.com> wrote:
>
> Lenovo Legion Y530-15ICH is another model without
> hardware radio switch. Add it to no_hw_rfkill to
> enable wireless.
>

Pushed to my review and testing queue, thanks!

> Signed-off-by: Misha Komarovskiy <zombah@gmail.com>
> ---
>  drivers/platform/x86/ideapad-laptop.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index f856d59361f2..b6489cba2985 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1147,6 +1147,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
>                 },
>         },
>         {
> +               .ident = "Lenovo Legion Y530-15ICH",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Legion Y530-15ICH"),
> +               },
> +       },
> +       {
>                 .ident = "Lenovo Legion Y720-15IKB",
>                 .matches = {
>                         DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> --
> 2.13.7
>


-- 
With Best Regards,
Andy Shevchenko
