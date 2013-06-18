From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH 1/3] thinkpad_acpi: return -NODEV while operating
 uninitialized LEDs
Date: Mon, 17 Jun 2013 21:12:34 -0300
Message-ID: <20130618001234.GA27654@khazad-dum.debian.net>
References: <1370593209-21358-1-git-send-email-adam.lee@canonical.com>
 <1370593209-21358-2-git-send-email-adam.lee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1370593209-21358-2-git-send-email-adam.lee@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Lee <adam.lee@canonical.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Matthew Garrett <matthew.garrett@nebula.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Alex Hung <alex.hung@canonical.com>, Bjorn Mork <bjorn@mork.no>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 07 Jun 2013, Adam Lee wrote:
> Not all 0-15 LEDs are available for all models, sometimes it's even not
> safe. This patch return -NODEV while operating uninitialized LEDs.
> 
> Signed-off-by: Adam Lee <adam.lee@canonical.com>
Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

> ---
>  drivers/platform/x86/thinkpad_acpi.c |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 54d31c0..bea57ae 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -5401,9 +5401,12 @@ static int led_write(char *buf)
>  		return -ENODEV;
>  
>  	while ((cmd = next_cmd(&buf))) {
> -		if (sscanf(cmd, "%d", &led) != 1 || led < 0 || led > 15)
> +		if (sscanf(cmd, "%d", &led) != 1)
>  			return -EINVAL;
>  
> +		if (!tpacpi_leds[led].led)
> +			return -ENODEV;
> +
>  		if (strstr(cmd, "off")) {
>  			s = TPACPI_LED_OFF;
>  		} else if (strstr(cmd, "on")) {

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
