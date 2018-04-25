From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] thinkpad-acpi: silence
 false-positive-prone pr_warn
Date: Wed, 25 Apr 2018 17:16:53 +0300
Message-ID: <CAHp75Vfih7TcZL=yDi1ydv8Yd_ULAvmhQC7o_-d5_yxzxWvoFA@mail.gmail.com>
References: <CAHp75VciLyh1Y1sws69Hn=vN39suV+HH-JwNLcbeUnZ_dwrc0Q@mail.gmail.com>
 <20180424195605.17526-3-hmh@hmh.eng.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20180424195605.17526-3-hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Cc: Benjamin Berg <bberg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Christian Kellner <ckellner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Jordan Glover <Golden_Miller83-g/b1ySJe57IkP3XJZ0H8fw@public.gmane.org>, FP1 Zhang <zhangfp1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Apr 24, 2018 at 10:56 PM, Henrique de Moraes Holschuh
<hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org> wrote:
> Do not consider unknown HKEY events in the 0x6000 range to be thermal
> warnings.  Instead, handle them as a generic unknown HKEY event, which
> are reported to the kernel log at priority "notice", and do not trigger
> a thermal registers state dump to the log.
>

All 3 are pushed to my review and testing queue, thanks!

> Signed-off-by: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
> Tested-by: Jordan Glover <Golden_Miller83-g/b1ySJe57IkP3XJZ0H8fw@public.gmane.org>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 3d70ef7e8a68..a0e9ce0d85b9 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -4039,8 +4039,6 @@ static bool hotkey_notify_6xxx(const u32 hkey,
>                                  bool *send_acpi_ev,
>                                  bool *ignore_acpi_ev)
>  {
> -       bool known = true;
> -
>         /* 0x6000-0x6FFF: thermal alarms/notices and keyboard events */
>         *send_acpi_ev = true;
>         *ignore_acpi_ev = false;
> @@ -4107,13 +4105,12 @@ static bool hotkey_notify_6xxx(const u32 hkey,
>                 return true;
>
>         default:
> -               pr_warn("unknown possible thermal alarm or keyboard event received\n");
> -               known = false;
> +               /* report simply as unknown, no sensor dump */
> +               return false;
>         }
>
>         thermal_dump_all_sensors();
> -
> -       return known;
> +       return true;
>  }
>
>  static void hotkey_notify(struct ibm_struct *ibm, u32 event)
> --
> 2.11.0
>



-- 
With Best Regards,
Andy Shevchenko

------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
