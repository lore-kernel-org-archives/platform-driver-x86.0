From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] Make asus-nb-wmi support the Zenbook UX430UQ
Date: Tue, 21 Nov 2017 16:15:44 +0200
Message-ID: <CAHp75VdH=b1MG3nQE_QKj501K9Mv4eMm3YBo_ZdMUtAySOt_fw@mail.gmail.com>
References: <20171120211844.6553-1-kah.listaddress@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171120211844.6553-1-kah.listaddress@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kiernan Hager <kah.listaddress@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 20, 2017 at 11:18 PM, Kiernan Hager
<kah.listaddress@gmail.com> wrote:
> This patch adds support for the Zenbook UX430UQ to the asus_nb_wmi
> driver. It also renames "quirk_asus_ux330uak" to "quirk_asus_forceals"
> because it is now used for more than one model of computer, and should
> thus have a more general name.
>

First of all, we use a common prefix "platform/x86: " in the Subject
line, second, your title and first line in commit message doesn't
clarify that this is ALS support.
And last, indentation in the patch is not okay followed by absence of comma.

Please, consider above for the future patches, no need to resend this one.
I have fixed the issues and pushed to my review and testing queue, thanks.

> Signed-off-by: Kiernan Hager <kah.listaddress@gmail.com>
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index 5269a01d9bdd..7fbb1c4bcdb5 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -111,7 +111,7 @@ static struct quirk_entry quirk_asus_x550lb = {
>         .xusb2pr = 0x01D9,
>  };
>
> -static struct quirk_entry quirk_asus_ux330uak = {
> +static struct quirk_entry quirk_asus_forceals = {
>         .wmi_force_als_set = true,
>  };
>
> @@ -387,7 +387,7 @@ static const struct dmi_system_id asus_quirks[] = {
>                         DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>                         DMI_MATCH(DMI_PRODUCT_NAME, "UX330UAK"),
>                 },
> -               .driver_data = &quirk_asus_ux330uak,
> +               .driver_data = &quirk_asus_forceals,
>         },
>         {
>                 .callback = dmi_matched,
> @@ -398,6 +398,15 @@ static const struct dmi_system_id asus_quirks[] = {
>                 },
>                 .driver_data = &quirk_asus_x550lb,
>         },
> +       {
> +               .callback = dmi_matched,
> +               .ident = "ASUSTeK COMPUTER INC. UX430UQ",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "UX430UQ")
> +               },
> +       .driver_data = &quirk_asus_forceals
> +       },
>         {},
>  };
>
> --
> 2.15.0
>



-- 
With Best Regards,
Andy Shevchenko
