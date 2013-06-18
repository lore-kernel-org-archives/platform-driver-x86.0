From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH 1/3 v3] thinkpad_acpi: return -NODEV while operating
 uninitialized LEDs
Date: Mon, 17 Jun 2013 21:17:50 -0300
Message-ID: <20130618001750.GB27654@khazad-dum.debian.net>
References: <1370593209-21358-1-git-send-email-adam.lee@canonical.com>
 <1370681475-6601-1-git-send-email-adam.lee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:37866 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751337Ab3FRASA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 17 Jun 2013 20:18:00 -0400
Content-Disposition: inline
In-Reply-To: <1370681475-6601-1-git-send-email-adam.lee@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Adam Lee <adam.lee@canonical.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Matthew Garrett <matthew.garrett@nebula.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Alex Hung <alex.hung@canonical.com>, Bjorn Mork <bjorn@mork.no>, Amos Kong <kongjianjun@gmail.com>

On Sat, 08 Jun 2013, Adam Lee wrote:
> Not all 0-15 LEDs are available for all models, sometimes it's even not
> safe. This patch return -NODEV while operating uninitialized LEDs.
> 
> Signed-off-by: Adam Lee <adam.lee@canonical.com>

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

> ---
>  drivers/platform/x86/thinkpad_acpi.c |   10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 54d31c0..455384b 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -369,7 +369,7 @@ struct tpacpi_led_classdev {
>  	struct led_classdev led_classdev;
>  	struct work_struct work;
>  	enum led_status_t new_state;
> -	unsigned int led;
> +	int led;
>  };
>  
>  /* brightness level capabilities */
> @@ -5344,6 +5344,8 @@ static int __init led_init(struct ibm_init_struct *iibm)
>  					  ARRAY_SIZE(led_useful_qtable));
>  
>  	for (i = 0; i < TPACPI_LED_NUMLEDS; i++) {
> +		tpacpi_leds[i].led = -1;
> +
>  		if (!tpacpi_is_led_restricted(i) &&
>  		    test_bit(i, &useful_leds)) {
>  			rc = tpacpi_init_led(i);
> @@ -5401,9 +5403,13 @@ static int led_write(char *buf)
>  		return -ENODEV;
>  
>  	while ((cmd = next_cmd(&buf))) {
> -		if (sscanf(cmd, "%d", &led) != 1 || led < 0 || led > 15)
> +		if (sscanf(cmd, "%d", &led) != 1)
>  			return -EINVAL;
>  
> +		if (led < 0 || led > (TPACPI_LED_NUMLEDS - 1) ||
> +				tpacpi_leds[led].led < 0)
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
