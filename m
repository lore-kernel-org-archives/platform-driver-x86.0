From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: hp_accel: Add support for HP ZBook 17 G5
Date: Thu, 25 Jul 2019 20:44:13 +0300
Message-ID: <CAHp75VdO01EmsYXPjXdjyzqa4vvs26H3yJ0C+fhxmY1hrgg+Xg@mail.gmail.com>
References: <20190710053326.26247-1-kai.heng.feng@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190710053326.26247-1-kai.heng.feng@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: Eric Piel <eric.piel@tremplin-utc.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jul 10, 2019 at 8:33 AM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> HP ZBook 17 G5 needs a non-standard mapping, x_inverted.
>

Pushed to my review and testing queue, thanks!

> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  drivers/platform/x86/hp_accel.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp_accel.c
> index f61b8a176e20..cfc0e36a7a5e 100644
> --- a/drivers/platform/x86/hp_accel.c
> +++ b/drivers/platform/x86/hp_accel.c
> @@ -239,6 +239,7 @@ static const struct dmi_system_id lis3lv02d_dmi_ids[] = {
>         AXIS_DMI_MATCH("HPB64xx", "HP EliteBook 84", xy_swap),
>         AXIS_DMI_MATCH("HPB65xx", "HP ProBook 65", x_inverted),
>         AXIS_DMI_MATCH("HPZBook15", "HP ZBook 15", x_inverted),
> +       AXIS_DMI_MATCH("HPZBook17G5", "HP ZBook 17 G5", x_inverted),
>         AXIS_DMI_MATCH("HPZBook17", "HP ZBook 17", xy_swap_yz_inverted),
>         { NULL, }
>  /* Laptop models without axis info (yet):
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
