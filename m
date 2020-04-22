From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] thinkpad_acpi: Add support for dual
 fan control on select models
Date: Wed, 22 Apr 2020 16:50:15 +0300
Message-ID: <CAHp75VexAMt3yM+p7HeXdyO51BfB5FOuoEjq9xTUi+tR-jj4JA@mail.gmail.com>
References: <20200417201426.24033-1-larsh@apache.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20200417201426.24033-1-larsh-1oDqGaOF3Lkdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Lars <larsh-1oDqGaOF3Lkdnm+yROfE0A@public.gmane.org>, Kevin Slagle <kjslag-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Sebastian_D=C3=B6rner?= <bastidoerner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dario Messina <nanodario-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>, Alexander Kappner <agk-mA9ux5SlULTR7s880joybQ@public.gmane.org>, Marc Burkhardt <marc-e1Wt+8K1Ta8ZEwqihLH0+Q@public.gmane.org>
Cc: Thinkpad-acpi devel ML <ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

+Cc: people who lately involved in 2nd fan discussions here and there

Lars, also one question regarding the code below.

On Fri, Apr 17, 2020 at 11:15 PM Lars <larsh-1oDqGaOF3Lkdnm+yROfE0A@public.gmane.org> wrote:
>
> This patch allows controlling multiple fans as if they were a single fan.
>
> This adds P52, P72, X1E, and X1E gen2 to dual fan quirks. Both fans are controlled together.
>
> Tested on an X1 Extreme Gen2.
>
> The patch is defensive, it adds only specific supported machines, and falls back to the old behavior if both fans cannot be controlled.
> However, it does attempt single fan control for all previously white-listed Thinkpads.
>
> Background:
> I tested the BIOS default behavior on my X1E gen2 and both fans are always changed together.
> So rather than adding controls for each fan, this controls both fans together as the BIOS would do.
>
> This was inspired by a discussion on dual fan support for the thinkfan tool (https://github.com/vmatare/thinkfan/issues/58).
> (Thanks to Github users voidworker, and civic9.)
>
> The BIOS ids for P52/P72 and X1E are taken from there. The X1E gen2 id is verified on my machine.
>
> (In the first version my mail client botched the white-spacing - my apologies, this is my first Kernel patch. Used git send-email and gmail this time.)
>
> Signed-off-by: Lars <larsh-1oDqGaOF3Lkdnm+yROfE0A@public.gmane.org>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 33 +++++++++++++++++++++++-----
>  1 file changed, 27 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 8eaadbaf8ffa..cbc0e85d89d2 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8324,11 +8324,20 @@ static int fan_set_level(int level)
>
>         switch (fan_control_access_mode) {
>         case TPACPI_FAN_WR_ACPI_SFAN:
> -               if (level >= 0 && level <= 7) {
> -                       if (!acpi_evalf(sfan_handle, NULL, NULL, "vd", level))
> -                               return -EIO;
> -               } else
> +               if (((level < 0) || (level > 7)))
>                         return -EINVAL;
> +
> +               if (tp_features.second_fan) {
> +                       if (!fan_select_fan2() ||
> +                           !acpi_evalf(sfan_handle, NULL, NULL, "vd", level)) {
> +                               fan_select_fan1();
> +                               pr_warn("Couldn't set 2nd fan level, disabling support\n");
> +                               tp_features.second_fan = 0;
> +                       }
> +                       fan_select_fan1();
> +               }
> +               if (!acpi_evalf(sfan_handle, NULL, NULL, "vd", level))
> +                       return -EIO;
>                 break;
>
>         case TPACPI_FAN_WR_ACPI_FANS:
> @@ -8345,6 +8354,16 @@ static int fan_set_level(int level)
>                 else if (level & TP_EC_FAN_AUTO)
>                         level |= 4;     /* safety min speed 4 */
>
> +               if (tp_features.second_fan) {
> +                       if (!fan_select_fan2() ||
> +                           !acpi_ec_write(fan_status_offset, level)) {

> +                               fan_select_fan1();

(1)

> +                               pr_warn("Couldn't set 2nd fan level, disabling support\n");
> +                               tp_features.second_fan = 0;
> +                       }

> +                       fan_select_fan1();

(2)

I'm not sure I got a logic behind this. Why do you need to call it twice?

> +
> +               }
>                 if (!acpi_ec_write(fan_status_offset, level))
>                         return -EIO;
>                 else
> @@ -8771,6 +8790,9 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>         TPACPI_QEC_IBM('7', '0', TPACPI_FAN_Q1),
>         TPACPI_QEC_LNV('7', 'M', TPACPI_FAN_2FAN),
>         TPACPI_Q_LNV('N', '1', TPACPI_FAN_2FAN),
> +       TPACPI_Q_LNV3('N', '2', 'C', TPACPI_FAN_2FAN),  /* P52 / P72 */
> +       TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2FAN),  /* X1 Extreme (1st gen) */
> +       TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2FAN),  /* X1 Extreme (2nd gen) */
>  };
>
>  static int __init fan_init(struct ibm_init_struct *iibm)
> @@ -8812,8 +8834,7 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>                                 fan_quirk1_setup();
>                         if (quirks & TPACPI_FAN_2FAN) {
>                                 tp_features.second_fan = 1;
> -                               dbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_FAN,
> -                                       "secondary fan support enabled\n");
> +                               pr_info("secondary fan support enabled\n");
>                         }
>                 } else {
>                         pr_err("ThinkPad ACPI EC access misbehaving, fan status and control unavailable\n");
> --
> 2.25.2
>
--
With Best Regards,
Andy Shevchenko
