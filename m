From: Dario Messina <nanodario-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4] thinkpad_acpi: Add support for dual
 fan control on select models
Date: Mon, 27 Apr 2020 20:41:11 +0200
Message-ID: <11041815.WYjWQN8m1R@lenovodario>
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
Cc: agk-mA9ux5SlULTR7s880joybQ@public.gmane.org, kjslag-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bastidoerner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org, arc-e1Wt+8K1Ta8ZEwqihLH0+Q@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Apr 23, 2020 at 23:57:59 CEST, Lars <larsh-1oDqGaOF3Lkdnm+yROfE0A@public.gmane.org> wrote:
> This adds dual fan control for the following models:
> P50, P51, P52, P70, P71, P72, P1 gen1, X1E gen1, P2 gen2, and X1E gen2.
> 
> Both fans are controlled together as if they were a single fan.
> [...]
> Background:
> I tested the BIOS default behavior on my X1E gen2 and both fans are always
> changed together. So rather than adding controls for each fan, this controls
> both fans together as the BIOS would do.
Hi Lars, why have you chosen to control multiple fans in this way?
I know that BIOS controls both fans together, but the EC has the capabilities 
to control both fans independently, so maybe it can be convenient to expose 
this feature.


Distinti saluti/Best regards,
Dario Messina
