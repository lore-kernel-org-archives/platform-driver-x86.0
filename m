From: Alex Hung <alex.hung-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH] thinkpad-acpi: fix issuing duplicated
 key events for brightness up/down
Date: Tue, 24 Apr 2012 16:44:50 +0800
Message-ID: <4F966802.10907@canonical.com>
References: <1335256852-19146-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1335256852-19146-1-git-send-email-alex.hung-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Alex Hung <alex.hung-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On 04/24/2012 04:40 PM, Alex Hung wrote:
> The tp_features.bright_acpimode will not be set correctly for brightness
> control because ACPI_VIDEO_HID will not be located in ACPI. As a result,
> a duplicated key event will always be sent. acpi_video_backlight_support()
> is sufficient to detect standard ACPI brightness control.
>
> Signed-off-by: Alex Hung<alex.hung-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> ---
>   drivers/platform/x86/thinkpad_acpi.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 7b82868..7d032d5 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -3405,7 +3405,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>   	/* Do not issue duplicate brightness change events to
>   	 * userspace. tpacpi_detect_brightness_capabilities() must have
>   	 * been called before this point  */
> -	if (tp_features.bright_acpimode&&  acpi_video_backlight_support()) {
> +	if (acpi_video_backlight_support()) {
>   		pr_info("This ThinkPad has standard ACPI backlight "
>   			"brightness control, supported by the ACPI "
>   			"video driver\n");

Hi,
I tested the patch on thinkpad x200 and x220, and the brightness up/down 
key presses will no longer generate a duplicated event, i.e. output from 
"sudo showkey".

Best Regards,
Alex Hung

------------------------------------------------------------------------------
Live Security Virtual Conference
Exclusive live event will cover all the ways today's security and 
threat landscape has changed and how IT managers can respond. Discussions 
will include endpoint security, mobile security and the latest in malware 
threats. http://www.accelacomm.com/jaw/sfrnl04242012/114/50122263/
