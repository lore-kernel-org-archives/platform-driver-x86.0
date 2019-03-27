From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fix fan-quirk macro for Lenovo P50
Date: Wed, 27 Mar 2019 21:53:24 +0200
Message-ID: <CAHp75Vf9bJR6zUvoSsiBnJO4xBfLyaknb1UcyuBGDLW3aVFgSg@mail.gmail.com>
References: <20190327133530.GL9224@smile.fi.intel.com>
 <20190327192508.349725-1-matthias@wspse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20190327192508.349725-1-matthias-zx6oZbK/1Go@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Matthias Hensler <matthias-zx6oZbK/1Go@public.gmane.org>
Cc: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Mar 27, 2019 at 9:25 PM Matthias Hensler <matthias-zx6oZbK/1Go@public.gmane.org> wrote:
>
> Commit 846a416b4630fc960c10500b4194ad504bc22d4b changed the
> quirk-matching for modern thinkpads to use three characters instead of
> two. Unfortunately that commit did break the fan-quirk matching for the
> P50. With commit 599eefffcf6b9cff3e8cc2d96fd8eebfadab339c there were
> some cleanups in the quirk-macros, but still did not fix the wrong
> matching for the P50.
>
> Note: I guess the quirk-list needs to be expanded for the P70 and
>       newer models.

You need to put your Signed-off-by tag as well.
This is according to the process:
https://www.kernel.org/doc/Documentation/process/submitting-patches.rst

In any case, don't send updated version right now. We still have time
in this release cycle and I would like to hear Henrique and others
opinions.

> ---
>  drivers/platform/x86/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 726341f2b638..575a1ea161f0 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8721,7 +8721,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>         TPACPI_QEC_IBM('7', '6', TPACPI_FAN_Q1),
>         TPACPI_QEC_IBM('7', '0', TPACPI_FAN_Q1),
>         TPACPI_QEC_LNV('7', 'M', TPACPI_FAN_2FAN),
> -       TPACPI_Q_LNV('N', '1', TPACPI_FAN_2FAN),
> +       TPACPI_Q_LNV3('N', '1', 'E', TPACPI_FAN_2FAN),
>  };
>
>  static int __init fan_init(struct ibm_init_struct *iibm)
> --
> 2.20.1
>


-- 
With Best Regards,
Andy Shevchenko
