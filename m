From: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Subject: Re: [PATCH] thinkpad_acpi: Fix warning
Date: Mon, 27 Apr 2015 08:55:50 -0300
Message-ID: <1430135750.3894493.259065913.17A66CB2@webmail.messagingengine.com>
References: <20150427094506.0aacec22@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20150427094506.0aacec22-R0o5gVi9kd7kN2dkZ6Wm7A@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
Cc: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Apr 27, 2015, at 04:45, Jean Delvare wrote:
> Fix the following warning:
> 
> warning: "static" is not at beginning of declaration
>  void static hotkey_mask_warn_incomplete_mask(void)
>  ^
> 
> Signed-off-by: Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>
> Cc: Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
> Cc: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>

Acked-by: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>

> ---
>  drivers/platform/x86/thinkpad_acpi.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-4.1-rc0.orig/drivers/platform/x86/thinkpad_acpi.c	2015-04-26 22:49:27.587460658 +0200
> +++ linux-4.1-rc0/drivers/platform/x86/thinkpad_acpi.c	2015-04-27 09:39:10.628031136 +0200
> @@ -2093,7 +2093,7 @@ static int hotkey_mask_get(void)
>  	return 0;
>  }
>  
> -void static hotkey_mask_warn_incomplete_mask(void)
> +static void hotkey_mask_warn_incomplete_mask(void)
>  {
>  	/* log only what the user can fix... */
>  	const u32 wantedmask = hotkey_driver_mask &
> 
> 
> -- 
> Jean Delvare
> SUSE L3 Support


-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

------------------------------------------------------------------------------
One dashboard for servers and applications across Physical-Virtual-Cloud 
Widest out-of-the-box monitoring support with 50+ applications
Performance metrics, stats and reports that give you Actionable Insights
Deep dive visibility with transaction tracing using APM Insight.
http://ad.doubleclick.net/ddm/clk/290420510;117567292;y
