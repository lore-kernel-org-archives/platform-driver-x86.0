From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi:
 Cleanup quirks macros
Date: Tue, 11 Dec 2018 12:17:08 +0200
Message-ID: <CAHp75VeHFqNxE0h0Yaq5Ly5Uox+T_YooRXyS=USA2KxMaKDRMA@mail.gmail.com>
References: <20181205111752.GA9780@Mindship-03>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20181205111752.GA9780@Mindship-03>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Jouke Witteveen <j.witteveen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Dec 5, 2018 at 1:18 PM Jouke Witteveen <j.witteveen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> - Use generic quirks macros for fan quirks
> The fan-specific quirks macros were duplicates of the generic ones.
>
> - Remove useless #undef lines
> The referenced macros are not defined anywhere.
>

Patch had been pushed, thanks!

> Signed-off-by: Jouke Witteveen <j.witteveen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
> ---
>
> This time, with a more detailed commit message.
>
>  drivers/platform/x86/thinkpad_acpi.c | 45 ++++++++--------------------
>  1 file changed, 13 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index fde08a997..e1e51bfb3 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -478,6 +478,12 @@ do {                                                                       \
>           .ec = TPACPI_MATCH_ANY,               \
>           .quirks = (__quirk) }
>
> +#define TPACPI_QEC_IBM(__id1, __id2, __quirk)  \
> +       { .vendor = PCI_VENDOR_ID_IBM,          \
> +         .bios = TPACPI_MATCH_ANY,             \
> +         .ec = TPID(__id1, __id2),             \
> +         .quirks = (__quirk) }
> +
>  #define TPACPI_QEC_LNV(__id1, __id2, __quirk)  \
>         { .vendor = PCI_VENDOR_ID_LENOVO,       \
>           .bios = TPACPI_MATCH_ANY,             \
> @@ -5973,9 +5979,6 @@ static const struct tpacpi_quirk led_useful_qtable[] __initconst = {
>         },
>  };
>
> -#undef TPACPI_LEDQ_IBM
> -#undef TPACPI_LEDQ_LNV
> -
>  static enum led_access_mode __init led_init_detect_mode(void)
>  {
>         acpi_status status;
> @@ -8710,40 +8713,18 @@ static const struct attribute_group fan_attr_group = {
>         .attrs = fan_attributes,
>  };
>
> -#define        TPACPI_FAN_Q1   0x0001          /* Unitialized HFSP */
> +#define TPACPI_FAN_Q1  0x0001          /* Unitialized HFSP */
>  #define TPACPI_FAN_2FAN        0x0002          /* EC 0x31 bit 0 selects fan2 */
>
> -#define TPACPI_FAN_QI(__id1, __id2, __quirks)  \
> -       { .vendor = PCI_VENDOR_ID_IBM,          \
> -         .bios = TPACPI_MATCH_ANY,             \
> -         .ec = TPID(__id1, __id2),             \
> -         .quirks = __quirks }
> -
> -#define TPACPI_FAN_QL(__id1, __id2, __quirks)  \
> -       { .vendor = PCI_VENDOR_ID_LENOVO,       \
> -         .bios = TPACPI_MATCH_ANY,             \
> -         .ec = TPID(__id1, __id2),             \
> -         .quirks = __quirks }
> -
> -#define TPACPI_FAN_QB(__id1, __id2, __quirks)  \
> -       { .vendor = PCI_VENDOR_ID_LENOVO,       \
> -         .bios = TPID(__id1, __id2),           \
> -         .ec = TPACPI_MATCH_ANY,               \
> -         .quirks = __quirks }
> -
>  static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
> -       TPACPI_FAN_QI('1', 'Y', TPACPI_FAN_Q1),
> -       TPACPI_FAN_QI('7', '8', TPACPI_FAN_Q1),
> -       TPACPI_FAN_QI('7', '6', TPACPI_FAN_Q1),
> -       TPACPI_FAN_QI('7', '0', TPACPI_FAN_Q1),
> -       TPACPI_FAN_QL('7', 'M', TPACPI_FAN_2FAN),
> -       TPACPI_FAN_QB('N', '1', TPACPI_FAN_2FAN),
> +       TPACPI_QEC_IBM('1', 'Y', TPACPI_FAN_Q1),
> +       TPACPI_QEC_IBM('7', '8', TPACPI_FAN_Q1),
> +       TPACPI_QEC_IBM('7', '6', TPACPI_FAN_Q1),
> +       TPACPI_QEC_IBM('7', '0', TPACPI_FAN_Q1),
> +       TPACPI_QEC_LNV('7', 'M', TPACPI_FAN_2FAN),
> +       TPACPI_Q_LNV('N', '1', TPACPI_FAN_2FAN),
>  };
>
> -#undef TPACPI_FAN_QL
> -#undef TPACPI_FAN_QI
> -#undef TPACPI_FAN_QB
> -
>  static int __init fan_init(struct ibm_init_struct *iibm)
>  {
>         int rc;
> --
> 2.19.2
>


-- 
With Best Regards,
Andy Shevchenko
