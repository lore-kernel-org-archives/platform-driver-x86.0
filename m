From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] thinkpad_acpi: Add support for dual
 fan control on select models
Date: Fri, 24 Apr 2020 00:10:16 +0300
Message-ID: <CAHp75VdsR=uADmb7h0Bj_n0ALRVX39_gLjEpUfPbfQ=ZygtSxQ@mail.gmail.com>
References: <20200417194344.22597-1-larsh@apache.org>
 <20200423165238.54109-1-larsh@apache.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20200423165238.54109-1-larsh-1oDqGaOF3Lkdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Lars <larsh-1oDqGaOF3Lkdnm+yROfE0A@public.gmane.org>
Cc: Alexander Kappner <agk-mA9ux5SlULTR7s880joybQ@public.gmane.org>, kjslag-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, =?UTF-8?Q?Sebastian_D=C3=B6rner?= <bastidoerner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nanodario-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thinkpad-acpi devel ML <ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, arc-e1Wt+8K1Ta8ZEwqihLH0+Q@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Apr 23, 2020 at 7:56 PM Lars <larsh-1oDqGaOF3Lkdnm+yROfE0A@public.gmane.org> wrote:
>
> This patch allows controlling multiple fans as if they were a single fan.
>
> This adds P52, P72, X1E, and X1E gen2 to dual fan quirks.
> Both fans are controlled together.
>
> Tested on an X1 Extreme Gen2.
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
> [1]. Thanks to Github users voidworker and civic9.

GitHub

>
> The BIOS ids are taken from there. The X1E gen2 id is verified on my machine.
>

I got two mails, which one is correct?
So, please send a new version only one time, thanks.

Some comments below.

> [1]: vmatare/thinkfan#58

Please, use full URL her.

...

> +               if (((level < 0) || (level > 7)))
>                         return -EINVAL;

Maybe you didn't check what I did for previous version...
Here is too many parentheses.

> +       TPACPI_Q_LNV3('N', '1', 'D', TPACPI_FAN_2CTL),  /* P70 */
> +       TPACPI_Q_LNV3('N', '1', 'E', TPACPI_FAN_2CTL),  /* P50 */
> +       TPACPI_Q_LNV3('N', '1', 'T', TPACPI_FAN_2CTL),  /* P71 */
> +       TPACPI_Q_LNV3('N', '1', 'U', TPACPI_FAN_2CTL),  /* P51 */
> +       TPACPI_Q_LNV3('N', '2', 'C', TPACPI_FAN_2CTL),  /* P52 / P72 */
> +       TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2CTL),  /* X1 Extreme (1st gen) */
> +       TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2CTL),  /* X1 Extreme (2nd gen) */

This has been expanded, but commit message still old, please, update
commit message as well (and perhaps give a credit to people who
suggested / tested other models).

-- 
With Best Regards,
Andy Shevchenko
