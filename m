From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH 1/1] thinkpad_acpi: Add support for
 status (external cover) LED
Date: Sun, 7 May 2017 18:38:12 +0200
Message-ID: <20170507163812.GA14896@xo-6d-61-c0.localdomain>
References: <20170119172132.36029-1-agoode@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170119172132.36029-1-agoode-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Adam Goode <agoode-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu 2017-01-19 12:21:32, Adam Goode wrote:
> This allows the control of the red status LED, which is the dot of the "i"
> in the word "ThinkPad" on the outside cover of newer models.
> 
> In the manual, both this LED and the power LED are referred to as
> the "system-status indicators" without distinction between the two, so
> I chose "status" as the LED name.

Could we name it something like external_status or something? "status" is way too generic.

										Pavel
> 
> Signed-off-by: Adam Goode <agoode-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index cacb43fb1df7..6577bf8e5635 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -5611,11 +5611,11 @@ static const char * const tpacpi_led_names[TPACPI_LED_NUMLEDS] = {
>  	"tpacpi::standby",
>  	"tpacpi::dock_status1",
>  	"tpacpi::dock_status2",
> -	"tpacpi::unknown_led2",
> +	"tpacpi::status",
>  	"tpacpi::unknown_led3",
>  	"tpacpi::thinkvantage",
>  };
> -#define TPACPI_SAFE_LEDS	0x1081U
> +#define TPACPI_SAFE_LEDS	0x1481U
>  
>  static inline bool tpacpi_is_led_restricted(const unsigned int led)
>  {
> -- 
> 2.11.0.390.gc69c2f50cf-goog

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
