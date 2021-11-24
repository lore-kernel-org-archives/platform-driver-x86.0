Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57AB5C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Nov 2021 15:53:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347013AbhKXP5G (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Nov 2021 10:57:06 -0500
Received: from todd.t-8ch.de ([159.69.126.157]:38319 "EHLO todd.t-8ch.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237606AbhKXP5F (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Nov 2021 10:57:05 -0500
Date:   Wed, 24 Nov 2021 16:53:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=t-8ch.de; s=mail;
        t=1637769232; bh=7nNK0HfvYKWkyadfEm8cdojoRbJZhadbEjbd85EFuew=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CABk3CZOF/zAGiKhwJ3tPnBOPhJ3F23Gx5YzFn/Nt/eoXMucn6AdrWvNpEjVq3H+n
         TKmz2CYToPvX3x3aGbIBNT7QdciDPQ/jiZYvfHJUKE+M8a1PeI7XAR+HvgFru2JvYx
         j+Q+wcniP0t2gHZdzXcAyu1fncwce49p8fQUcNpo=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/x86: thinkpad_acpi: Add lid-logo-led to the
 list of safe LEDs
Message-ID: <ca16bf3e-2efe-49a6-94a2-4aeb66f398dc@t-8ch.de>
References: <20211123210524.266705-1-hdegoede@redhat.com>
 <20211123210524.266705-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211123210524.266705-2-hdegoede@redhat.com>
Jabber-ID: thomas@t-8ch.de
X-Accept: text/plain, text/html;q=0.2, text/*;q=0.1
X-Accept-Language: en-us, en;q=0.8, de-de;q=0.7, de;q=0.6
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2021-11-23 22:05+0100, Hans de Goede wrote:
> There have been various bugs / forum threads about allowing control of
> the LED in the ThinkPad logo on the lid of various models.
> 
> This seems to be something which users want to control and there really
> is no reason to require setting CONFIG_THINKPAD_ACPI_UNSAFE_LEDS for this.
> 
> The lid-logo-led is LED number 10, so change the name of the 10th led
> from unknown_led2 to lid_logo_led and add it to the TPACPI_SAFE_LEDS mask.
> 
> Link: https://www.reddit.com/r/thinkpad/comments/7n8eyu/thinkpad_led_control_under_gnulinux/
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1943318
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 49fdf16b2db9..28f0299ecab0 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -5661,11 +5661,11 @@ static const char * const tpacpi_led_names[TPACPI_LED_NUMLEDS] = {
>  	"tpacpi::standby",
>  	"tpacpi::dock_status1",
>  	"tpacpi::dock_status2",
> -	"tpacpi::unknown_led2",
> +	"tpacpi::lid_logo_led",

The suffix "_led" looks a bit redundant. Also non of the other LEDs have it.

Also currently the reported brightness is 0 before writing to it, although the
LED is powered on by default, not sure how this could be fixed though.

>  	"tpacpi::unknown_led3",
>  	"tpacpi::thinkvantage",
>  };
> -#define TPACPI_SAFE_LEDS	0x1081U
> +#define TPACPI_SAFE_LEDS	0x1481U
>  
>  static inline bool tpacpi_is_led_restricted(const unsigned int led)
>  {

Thomas
