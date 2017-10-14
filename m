From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv2] thinkpad_acpi: Implement tablet mode
 resolving using GMMS method
Date: Sat, 14 Oct 2017 16:59:17 +0300
Message-ID: <CAHp75VcTwHQQpm6BgbN47oN9ih-F336N_EpAmwYmKpbq4jbgug@mail.gmail.com>
References: <20171010091249.11945-1-bberg@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20171010091249.11945-1-bberg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Benjamin Berg <bberg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Peter FP1 Zhang <zhangfp1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Oct 10, 2017 at 12:12 PM, Benjamin Berg <bberg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Many thinkpad laptops and convertibles provide the GMMS method to
> resolve how far the laptop has been opened and whether it has been
> converted into tablet mode. This allows reporting a more precise tablet
> mode state to userspace.
>
> The current implementation only reports a summarized tablet mode state
> which is triggered as soon as the input devices become unusable as they
> are folded away from the display.
>
> This will work on all models where the CMMD method was used previously and
> it may also work in other cases.
>
> Thanks to Peter Zhang of Lenovo for providing information on how to use the
> GMMS method to query the tablet mode.
>

It doesn't apply :-(

Please, rebase against our testing queue and resend.
Thanks!

> Signed-off-by: Benjamin Berg <bberg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: Peter FP1 Zhang <zhangfp1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
> Cc: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
> --
>
> v2:
>  - It appears that mode 4 may also report the FLAT state. This has
>    been observed on an X1 Yoga 2nd Generation.
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 135 +++++++++++++++++++++++++++++++----
>  1 file changed, 122 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 2242d6035d9e..298a0088eb0c 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -310,8 +310,7 @@ static struct {
>         enum {
>                 TP_HOTKEY_TABLET_NONE = 0,
>                 TP_HOTKEY_TABLET_USES_MHKG,
> -               /* X1 Yoga 2016, seen on BIOS N1FET44W */
> -               TP_HOTKEY_TABLET_USES_CMMD,
> +               TP_HOTKEY_TABLET_USES_GMMS,
>         } hotkey_tablet;
>         u32 kbdlight:1;
>         u32 light:1;
> @@ -2044,8 +2043,28 @@ static void hotkey_poll_setup(const bool may_warn);
>
>  /* HKEY.MHKG() return bits */
>  #define TP_HOTKEY_TABLET_MASK (1 << 3)
> -/* ThinkPad X1 Yoga (2016) */
> -#define TP_EC_CMMD_TABLET_MODE 0x6
> +enum {
> +       TP_ACPI_MULTI_MODE_INVALID      = 0,
> +       TP_ACPI_MULTI_MODE_UNKNOWN      = 1 << 0,
> +       TP_ACPI_MULTI_MODE_LAPTOP       = 1 << 1,
> +       TP_ACPI_MULTI_MODE_TABLET       = 1 << 2,
> +       TP_ACPI_MULTI_MODE_FLAT         = 1 << 3,
> +       TP_ACPI_MULTI_MODE_STAND        = 1 << 4,
> +       TP_ACPI_MULTI_MODE_TENT         = 1 << 5,
> +       TP_ACPI_MULTI_MODE_STAND_TENT   = 1 << 6,
> +};
> +
> +enum {
> +       /* The following modes are considered tablet mode for the purpose of
> +        * reporting the status to userspace. i.e. in all these modes it makes
> +        * sense to disable the laptop input devices such as touchpad and
> +        * keyboard.
> +        */
> +       TP_ACPI_MULTI_MODE_TABLET_LIKE  = TP_ACPI_MULTI_MODE_TABLET |
> +                                         TP_ACPI_MULTI_MODE_STAND |
> +                                         TP_ACPI_MULTI_MODE_TENT |
> +                                         TP_ACPI_MULTI_MODE_STAND_TENT,
> +};
>
>  static int hotkey_get_wlsw(void)
>  {
> @@ -2066,6 +2085,93 @@ static int hotkey_get_wlsw(void)
>         return (status) ? TPACPI_RFK_RADIO_ON : TPACPI_RFK_RADIO_OFF;
>  }
>
> +static int hotkey_gmms_get_tablet_mode(int s, int *has_tablet_mode)
> +{
> +       int type = (s >> 16) & 0xffff;
> +       int value = s & 0xffff;
> +       int mode = TP_ACPI_MULTI_MODE_INVALID;
> +       int valid_modes = 0;
> +
> +       if (has_tablet_mode)
> +               *has_tablet_mode = 0;
> +
> +       switch (type) {
> +       case 1:
> +               valid_modes = TP_ACPI_MULTI_MODE_LAPTOP |
> +                             TP_ACPI_MULTI_MODE_TABLET |
> +                             TP_ACPI_MULTI_MODE_STAND_TENT;
> +               break;
> +       case 2:
> +               valid_modes = TP_ACPI_MULTI_MODE_LAPTOP |
> +                             TP_ACPI_MULTI_MODE_FLAT |
> +                             TP_ACPI_MULTI_MODE_TABLET |
> +                             TP_ACPI_MULTI_MODE_STAND |
> +                             TP_ACPI_MULTI_MODE_TENT;
> +               break;
> +       case 3:
> +               valid_modes = TP_ACPI_MULTI_MODE_LAPTOP |
> +                             TP_ACPI_MULTI_MODE_FLAT;
> +               break;
> +       case 4:
> +               /* Flat mode is included here as it can be seen at least
> +                * on the X1 Yoga 2nd Gen. */
> +               valid_modes = TP_ACPI_MULTI_MODE_LAPTOP |
> +                             TP_ACPI_MULTI_MODE_FLAT |
> +                             TP_ACPI_MULTI_MODE_TABLET |
> +                             TP_ACPI_MULTI_MODE_STAND |
> +                             TP_ACPI_MULTI_MODE_TENT;
> +               break;
> +       case 5:
> +               valid_modes = TP_ACPI_MULTI_MODE_LAPTOP |
> +                             TP_ACPI_MULTI_MODE_FLAT |
> +                             TP_ACPI_MULTI_MODE_TABLET |
> +                             TP_ACPI_MULTI_MODE_STAND |
> +                             TP_ACPI_MULTI_MODE_TENT;
> +               break;
> +       default:
> +               pr_err("Unknown multi mode status type %d with value 0x%04X, please report this to %s\n",
> +                      type, value, TPACPI_MAIL);
> +               return 0;
> +       }
> +
> +       if (has_tablet_mode && (valid_modes & TP_ACPI_MULTI_MODE_TABLET_LIKE))
> +               *has_tablet_mode = 1;
> +
> +       switch (value) {
> +       case 1:
> +               mode = TP_ACPI_MULTI_MODE_LAPTOP;
> +               break;
> +       case 2:
> +               mode = TP_ACPI_MULTI_MODE_FLAT;
> +               break;
> +       case 3:
> +               mode = TP_ACPI_MULTI_MODE_TABLET;
> +               break;
> +       case 4:
> +               if (type == 1)
> +                       mode = TP_ACPI_MULTI_MODE_STAND_TENT;
> +               else
> +                       mode = TP_ACPI_MULTI_MODE_STAND;
> +               break;
> +       case 5:
> +               mode = TP_ACPI_MULTI_MODE_TENT;
> +               break;
> +       default:
> +               if (type == 5 && value == 0xffff) {
> +                       pr_warn("Multi mode status is undetected, assuming laptop\n");
> +                       return 0;
> +               }
> +       }
> +
> +       if (!(mode & valid_modes)) {
> +               pr_err("Unknown/reserved multi mode value 0x%04X for type %d, please report this to %s\n",
> +                      value, type, TPACPI_MAIL);
> +               return 0;
> +       }
> +
> +       return !!(mode & TP_ACPI_MULTI_MODE_TABLET_LIKE);
> +}
> +
>  static int hotkey_get_tablet_mode(int *status)
>  {
>         int s;
> @@ -2077,11 +2183,11 @@ static int hotkey_get_tablet_mode(int *status)
>
>                 *status = ((s & TP_HOTKEY_TABLET_MASK) != 0);
>                 break;
> -       case TP_HOTKEY_TABLET_USES_CMMD:
> -               if (!acpi_evalf(ec_handle, &s, "CMMD", "d"))
> +       case TP_HOTKEY_TABLET_USES_GMMS:
> +               if (!acpi_evalf(hkey_handle, &s, "GMMS", "dd", 0))
>                         return -EIO;
>
> -               *status = (s == TP_EC_CMMD_TABLET_MODE);
> +               *status = hotkey_gmms_get_tablet_mode(s, NULL);
>                 break;
>         default:
>                 break;
> @@ -3113,16 +3219,19 @@ static int hotkey_init_tablet_mode(void)
>         int in_tablet_mode = 0, res;
>         char *type = NULL;
>
> -       if (acpi_evalf(hkey_handle, &res, "MHKG", "qd")) {
> +       if (acpi_evalf(hkey_handle, &res, "GMMS", "qdd", 0)) {
> +               int has_tablet_mode;
> +
> +               in_tablet_mode = hotkey_gmms_get_tablet_mode(res,
> +                                                            &has_tablet_mode);
> +               if (has_tablet_mode)
> +                       tp_features.hotkey_tablet = TP_HOTKEY_TABLET_USES_GMMS;
> +               type = "GMMS";
> +       } else if (acpi_evalf(hkey_handle, &res, "MHKG", "qd")) {
>                 /* For X41t, X60t, X61t Tablets... */
>                 tp_features.hotkey_tablet = TP_HOTKEY_TABLET_USES_MHKG;
>                 in_tablet_mode = !!(res & TP_HOTKEY_TABLET_MASK);
>                 type = "MHKG";
> -       } else if (acpi_evalf(ec_handle, &res, "CMMD", "qd")) {
> -               /* For X1 Yoga (2016) */
> -               tp_features.hotkey_tablet = TP_HOTKEY_TABLET_USES_CMMD;
> -               in_tablet_mode = res == TP_EC_CMMD_TABLET_MODE;
> -               type = "CMMD";
>         }
>
>         if (!tp_features.hotkey_tablet)
> --
> 2.13.6
>



-- 
With Best Regards,
Andy Shevchenko

------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
