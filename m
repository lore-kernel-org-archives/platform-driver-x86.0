From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4] thinkpad_acpi: Add support for dual
 fan control on select models
Date: Fri, 24 Apr 2020 14:11:51 +0300
Message-ID: <CAHp75VeX2SjX5J-w933FKh_yii=cJ9_tWj3RRNx7Q6vijtt6AQ@mail.gmail.com>
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
Cc: Alexander Kappner <agk-mA9ux5SlULTR7s880joybQ@public.gmane.org>, Kevin Slagle <kjslag-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Sebastian_D=C3=B6rner?= <bastidoerner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dario Messina <nanodario-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Marc Burkhardt <marc-e1Wt+8K1Ta8ZEwqihLH0+Q@public.gmane.org>, Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thinkpad-acpi devel ML <ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
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
> [1]: https://github.com/vmatare/thinkfan/issues/58
>
> Signed-off-by: Lars <larsh-1oDqGaOF3Lkdnm+yROfE0A@public.gmane.org>

One question though, is Lars your real name here? [1]

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

-- 
With Best Regards,
Andy Shevchenko
