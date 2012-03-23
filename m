From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] [thinkpad-acpi] Add T410s and T420s LED support
Date: Fri, 23 Mar 2012 16:39:51 -0300
Message-ID: <20120323193951.GA24054@khazad-dum.debian.net>
References: <20120322234934.GA8338@endeavour.taprogge.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:51257 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757341Ab2CWTkC (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 23 Mar 2012 15:40:02 -0400
Received: from compute6.internal (compute6.nyi.mail.srv.osa [10.202.2.46])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 87C1A2162A
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Mar 2012 15:40:01 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20120322234934.GA8338@endeavour.taprogge.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Jens Taprogge <jens.taprogge@taprogge.org>, platform-driver-x86@vger.kernel.org

On Fri, 23 Mar 2012, Jens Taprogge wrote:
> A new LED is integrated into the Microphone mute button.  On the other
> hand many LEDs are missing and have been masked out from useful_leds.
> 
> The mute LED is not added to the TPACPI_SAFE_LEDS.  Safe handling of
> muting should first be worked out.  I have tested all the masked out
> LEDs (attached to dock) but I could not observe any effect.
> 
> Signed-off-by: Jens Taprogge <jens.taprogge@taprogge.org>

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Matthew, could you pick this one up for the next merge window (or the
currently open one if it is possible to do so, since the patch is a rather
safe one?)

Thanks.

> diff --git a/Documentation/laptops/thinkpad-acpi.txt b/Documentation/laptops/thinkpad-acpi.txt
> index 9d66682..de7ddac 100644
> --- a/Documentation/laptops/thinkpad-acpi.txt
> +++ b/Documentation/laptops/thinkpad-acpi.txt
> @@ -826,7 +826,9 @@ mapping:
>  	9 - dock status 2
>  	10, 11 - (unknown)
>  	12 - thinkvantage
> -	13, 14, 15 - (unknown)
> +	13 - (unknown)
> +	14 - mute mic
> +	15 - (unknown)
>  
>  All of the above can be turned on and off and can be made to blink.
>  
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index ea0c607..a0bc79f 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -169,6 +169,7 @@ enum tpacpi_hkey_event_t {
>  	TP_HKEY_EV_VOL_UP		= 0x1015, /* Volume up or unmute */
>  	TP_HKEY_EV_VOL_DOWN		= 0x1016, /* Volume down or unmute */
>  	TP_HKEY_EV_VOL_MUTE		= 0x1017, /* Mixer output mute */
> +	TP_HKEY_EV_VOL_MUTE_MIC		= 0x101b, /* Microphone mute */
>  
>  	/* Reasons for waking up from S3/S4 */
>  	TP_HKEY_EV_WKUP_S3_UNDOCK	= 0x2304, /* undock requested, S3 */
> @@ -5055,6 +5056,8 @@ static const char * const tpacpi_led_names[TPACPI_LED_NUMLEDS] = {
>  	"tpacpi::unknown_led2",
>  	"tpacpi::unknown_led3",
>  	"tpacpi::thinkvantage",
> +	"tpacpi::unknown_led4",
> +	"tpacpi::mute_mic",
>  };
>  #define TPACPI_SAFE_LEDS	0x1081U
>  
> @@ -5272,6 +5275,9 @@ static const struct tpacpi_quirk led_useful_qtable[] __initconst = {
>  	TPACPI_Q_IBM('7', 'F', 0x1f97), /* Z61* (1) */
>  	TPACPI_Q_IBM('7', 'B', 0x1fb7), /* X60 (1) */
>  
> +	TPACPI_Q_LNV('6', 'U', 0x4087), /* T410s */
> +	TPACPI_Q_LNV('8', 'C', 0x4087), /* T420s */
> +
>  	/* (1) - may have excess leds enabled on MSB */
>  
>  	/* Defaults (order matters, keep last, don't reorder!) */

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
