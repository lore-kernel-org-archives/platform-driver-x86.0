From: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Subject: Re: [PATCH] thinkpad-acpi: recognize latest
 V-Series using DMI_BIOS_VENDOR
Date: Mon, 6 Aug 2012 20:01:57 -0300
Message-ID: <20120806230157.GC8824@khazad-dum.debian.net>
References: <1344291669-9711-1-git-send-email-manoj.iyer@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1344291669-9711-1-git-send-email-manoj.iyer-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: manoj.iyer-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 06 Aug 2012, manoj.iyer-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org wrote:
> From: Manoj Iyer <manoj.iyer-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> 
> In the latest V-series bios DMI_PRODUCT_VERSION does not contain
> the string Lenovo or Thinkpad, but is set to the model number, this
> causes the thinkpad_acpi module to fail to load. Recognize laptop
> as Lenovo using DMI_BIOS_VENDOR instead, which is set to Lenovo.

Please add here the testing you did.

> Signed-off-by: Manoj Iyer <manoj.iyer-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> ---
>  drivers/platform/x86/thinkpad_acpi.c |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index e7f7328..66dfdef 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8663,6 +8663,14 @@ static int __must_check __init get_thinkpad_model_data(
>  		if (!tp->model_str)
>  			return -ENOMEM;
>  	}
> +	else {

Please fix this:  } else {   all in a single line.

> +		s = dmi_get_system_info(DMI_BIOS_VENDOR);
> +		if (s && !(strnicmp(s, "Lenovo", 6))) {
> +			tp->model_str = kstrdup(s, GFP_KERNEL);
> +			if (!tp->model_str)
> +				return -ENOMEM;
> +		}
> +	} 
>  
>  	s = dmi_get_system_info(DMI_PRODUCT_NAME);
>  	tp->nummodel_str = kstrdup(s, GFP_KERNEL);

That should be all.  You might want to get acquinted with the checkpatch
script, it would have pointed the "else" thing to you, I think (I didn't
notice it right away).

Anyway, other than the cosmetic stuff above, the patch looks good.  I
haven't tested it yet on a IBM thinkpad, though.  Will do later today.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

------------------------------------------------------------------------------
Live Security Virtual Conference
Exclusive live event will cover all the ways today's security and 
threat landscape has changed and how IT managers can respond. Discussions 
will include endpoint security, mobile security and the latest in malware 
threats. http://www.accelacomm.com/jaw/sfrnl04242012/114/50122263/
