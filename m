From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4] thinkpad_acpi: Add support for dual
 fan control on select models
Date: Fri, 24 Apr 2020 12:59:29 +0300
Message-ID: <CAHp75VdZtrGr597WK6gCrpGDKct12xSScJKNMV8LNmmgBYNe_w@mail.gmail.com>
References: <20200423165457.54388-1-larsh@apache.org>
 <20200423215709.72993-1-larsh@apache.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20200423215709.72993-1-larsh-1oDqGaOF3Lkdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Lars <larsh-1oDqGaOF3Lkdnm+yROfE0A@public.gmane.org>
Cc: Alexander Kappner <agk-mA9ux5SlULTR7s880joybQ@public.gmane.org>, Kevin Slagle <kjslag-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Sebastian_D=C3=B6rner?= <bastidoerner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dario Messina <nanodario-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thinkpad-acpi devel ML <ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, arc-e1Wt+8K1Ta8ZEwqihLH0+Q@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Apr 24, 2020 at 12:57 AM Lars <larsh-1oDqGaOF3Lkdnm+yROfE0A@public.gmane.org> wrote:
>
> This adds dual fan control for the following models:
> P50, P51, P52, P70, P71, P72, P1 gen1, X1E gen1, P2 gen2, and X1E gen2.
>
> Both fans are controlled together as if they were a single fan.
>
> Tested on an X1 Extreme Gen1, an X1 Extreme Gen2, and a P50.
>
> The patch is defensive, it adds only specific supported machines, and falls
> back to the old behavior if both fans cannot be controlled.
>
> Background:
> I tested the BIOS default behavior on my X1E gen2 and both fans are always
> changed together. So rather than adding controls for each fan, this controls
> both fans together as the BIOS would do.
>
> This was inspired by a discussion on dual fan support for the thinkfan tool
> [1].
> All BIOS ids are taken from there. The X1E gen2 id is verified on my machine.
>
> Thanks to GitHub users voidworker and civic9 for the earlier patches and BIOS
> ids, and to users peter-stoll and sassman for testing the patch on their
> machines.
>

Pushed to my review and testing queue, thank you!

> [1]: https://github.com/vmatare/thinkfan/issues/58
>
> Signed-off-by: Lars <larsh-1oDqGaOF3Lkdnm+yROfE0A@public.gmane.org>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 43 ++++++++++++++++++++++++----
>  1 file changed, 37 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index da794dcfdd92..9e0f65e567be 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -318,6 +318,7 @@ static struct {
>         u32 uwb:1;
>         u32 fan_ctrl_status_undef:1;
>         u32 second_fan:1;
> +       u32 second_fan_ctl:1;
>         u32 beep_needs_two_args:1;
>         u32 mixer_no_level_control:1;
>         u32 battery_force_primary:1;
> @@ -8325,11 +8326,19 @@ static int fan_set_level(int level)
>
>         switch (fan_control_access_mode) {
>         case TPACPI_FAN_WR_ACPI_SFAN:
> -               if (level >= 0 && level <= 7) {
> -                       if (!acpi_evalf(sfan_handle, NULL, NULL, "vd", level))
> -                               return -EIO;
> -               } else
> +               if ((level < 0) || (level > 7))
>                         return -EINVAL;
> +
> +               if (tp_features.second_fan_ctl) {
> +                       if (!fan_select_fan2() ||
> +                           !acpi_evalf(sfan_handle, NULL, NULL, "vd", level)) {
> +                               pr_warn("Couldn't set 2nd fan level, disabling support\n");
> +                               tp_features.second_fan_ctl = 0;
> +                       }
> +                       fan_select_fan1();
> +               }
> +               if (!acpi_evalf(sfan_handle, NULL, NULL, "vd", level))
> +                       return -EIO;
>                 break;
>
>         case TPACPI_FAN_WR_ACPI_FANS:
> @@ -8346,6 +8355,15 @@ static int fan_set_level(int level)
>                 else if (level & TP_EC_FAN_AUTO)
>                         level |= 4;     /* safety min speed 4 */
>
> +               if (tp_features.second_fan_ctl) {
> +                       if (!fan_select_fan2() ||
> +                           !acpi_ec_write(fan_status_offset, level)) {
> +                               pr_warn("Couldn't set 2nd fan level, disabling support\n");
> +                               tp_features.second_fan_ctl = 0;
> +                       }
> +                       fan_select_fan1();
> +
> +               }
>                 if (!acpi_ec_write(fan_status_offset, level))
>                         return -EIO;
>                 else
> @@ -8764,6 +8782,7 @@ static const struct attribute_group fan_attr_group = {
>
>  #define TPACPI_FAN_Q1  0x0001          /* Unitialized HFSP */
>  #define TPACPI_FAN_2FAN        0x0002          /* EC 0x31 bit 0 selects fan2 */
> +#define TPACPI_FAN_2CTL        0x0004          /* selects fan2 control */
>
>  static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>         TPACPI_QEC_IBM('1', 'Y', TPACPI_FAN_Q1),
> @@ -8772,6 +8791,13 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>         TPACPI_QEC_IBM('7', '0', TPACPI_FAN_Q1),
>         TPACPI_QEC_LNV('7', 'M', TPACPI_FAN_2FAN),
>         TPACPI_Q_LNV('N', '1', TPACPI_FAN_2FAN),
> +       TPACPI_Q_LNV3('N', '1', 'D', TPACPI_FAN_2CTL),  /* P70 */
> +       TPACPI_Q_LNV3('N', '1', 'E', TPACPI_FAN_2CTL),  /* P50 */
> +       TPACPI_Q_LNV3('N', '1', 'T', TPACPI_FAN_2CTL),  /* P71 */
> +       TPACPI_Q_LNV3('N', '1', 'U', TPACPI_FAN_2CTL),  /* P51 */
> +       TPACPI_Q_LNV3('N', '2', 'C', TPACPI_FAN_2CTL),  /* P52 / P72 */
> +       TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2CTL),  /* P1 / X1 Extreme (1st gen) */
> +       TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2CTL),  /* P1 / X1 Extreme (2nd gen) */
>  };
>
>  static int __init fan_init(struct ibm_init_struct *iibm)
> @@ -8789,6 +8815,7 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>         fan_watchdog_maxinterval = 0;
>         tp_features.fan_ctrl_status_undef = 0;
>         tp_features.second_fan = 0;
> +       tp_features.second_fan_ctl = 0;
>         fan_control_desired_level = 7;
>
>         if (tpacpi_is_ibm()) {
> @@ -8813,8 +8840,12 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>                                 fan_quirk1_setup();
>                         if (quirks & TPACPI_FAN_2FAN) {
>                                 tp_features.second_fan = 1;
> -                               dbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_FAN,
> -                                       "secondary fan support enabled\n");
> +                               pr_info("secondary fan support enabled\n");
> +                       }
> +                       if (quirks & TPACPI_FAN_2CTL) {
> +                               tp_features.second_fan = 1;
> +                               tp_features.second_fan_ctl = 1;
> +                               pr_info("secondary fan control enabled\n");
>                         }
>                 } else {
>                         pr_err("ThinkPad ACPI EC access misbehaving, fan status and control unavailable\n");
> --
> 2.25.3
>


-- 
With Best Regards,
Andy Shevchenko
