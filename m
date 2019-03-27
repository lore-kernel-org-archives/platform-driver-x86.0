From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: Bugfix thinkpad_acpi.c / proper
 fanquirk-matching for P50 series
Date: Wed, 27 Mar 2019 15:35:30 +0200
Message-ID: <20190327133530.GL9224@smile.fi.intel.com>
References: <20190327113250.GA193745@kobayashi-maru.wspse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190327113250.GA193745-nicfhH0yBYWNnpJ0YFltfDhxOgj/DBv4@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Matthias Hensler <matthias-zx6oZbK/1Go@public.gmane.org>
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Mar 27, 2019 at 12:32:50PM +0100, Matthias Hensler wrote:
> Hi Andy,
> 
> as far as I see you are responsible for pushing bugfixes to the
> thinkpad_acpi-module. If not please point me in the correct direction,
> thanks a lot.

Thanks for the report and fix.

The best way to submit this is to use kernel source tree, where you can run

scripts/get_maintainer.pl -f drivers/platform/x86/thinkpad_acpi.c

to get people responsible for the driver in upstream, followed by

git format-patch ... (you need to commit your fix first)
git send-email...

commands.

For your convenience I Cc'ed this mail to all stakeholders, though it doesn't
abrogate the need to follow the process described above.

> Commit 846a416b4630fc960c10500b4194ad504bc22d4b changed the
> quirk-matching for modern thinkpads to use three characters instead of
> two. Unfortunately that commit did break the fan-quirk matching for my
> P50. With commit 599eefffcf6b9cff3e8cc2d96fd8eebfadab339c there were
> some cleanups in the quirk-macros, but still did not fix the wrong
> matching for the P50.
> 
> Please find attached a patch to fix the quirk-macro to properly detect
> the second fan on the P50 (Modell N1Exxx). I guess there should be some
> additional definitions for the P70 and newer P-series, but I do not know
> the exact model-numbers unfortunately.
> 
> 
> Additional what I would also like to see, is a possibility to also
> control the second fan. I use a modified version of a patch that was
> posted some years ago to the mailinglist for that, but it is really
> ugly. If you want I can try to reimplement that in a cleaner way, but
> for now at least the wrong quirk-matching should be fixed. Thanks again.
> 
> 
> Regards,
> Matthias

> --- thinkpad_acpi.c	2019-03-27 12:26:11.977106074 +0100
> +++ thinkpad_acpi.c.fixed	2019-03-27 12:27:44.090340050 +0100
> @@ -8721,7 +8721,7 @@
>  	TPACPI_QEC_IBM('7', '6', TPACPI_FAN_Q1),
>  	TPACPI_QEC_IBM('7', '0', TPACPI_FAN_Q1),
>  	TPACPI_QEC_LNV('7', 'M', TPACPI_FAN_2FAN),
> -	TPACPI_Q_LNV('N', '1', TPACPI_FAN_2FAN),
> +	TPACPI_Q_LNV3('N', '1', 'E', TPACPI_FAN_2FAN),
>  };
>  
>  static int __init fan_init(struct ibm_init_struct *iibm)




-- 
With Best Regards,
Andy Shevchenko
