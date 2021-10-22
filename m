Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14561C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Oct 2021 15:40:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE9F261108
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Oct 2021 15:40:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231453AbhJVPm3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 22 Oct 2021 11:42:29 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:58101 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231133AbhJVPm3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Oct 2021 11:42:29 -0400
Received: (Authenticated sender: peter@korsgaard.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A9A8C1BF207;
        Fri, 22 Oct 2021 15:40:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
        (envelope-from <peter@korsgaard.com>)
        id 1mdweO-0000Ix-MV; Fri, 22 Oct 2021 17:40:08 +0200
From:   Peter Korsgaard <peter@korsgaard.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     hdegoede@redhat.com, santoshkumar.yadav@barco.com,
        Peter Korsgaard <peter.korsgaard@barco.com>
Subject: Re: [PATCH] platform/x86: barco-p50-gpio: use KEY_VENDOR for button insted of KEY_RESTART
References: <150f27d2-32b9-403b-01ff-8ab7d971d1d1@redhat.com>
        <20211022124612.19780-1-peter@korsgaard.com>
Date:   Fri, 22 Oct 2021 17:40:08 +0200
In-Reply-To: <20211022124612.19780-1-peter@korsgaard.com> (Peter Korsgaard's
        message of "Fri, 22 Oct 2021 14:46:12 +0200")
Message-ID: <87r1cd5aqv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

Ups, s/insted/instead/ in the subject. Do you want me to send a v2 for that?

 > From: Peter Korsgaard <peter.korsgaard@barco.com>
 > It turns out that systemd-logind by default listens for KEY_RESTART input
 > events and reboots the machine, which isn't great - So use KEY_VENDOR for
 > the vendor specific identify button instead to not conflict.

 > Signed-off-by: Peter Korsgaard <peter.korsgaard@barco.com>
 > ---
 >  drivers/platform/x86/barco-p50-gpio.c | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platform/x86/barco-p50-gpio.c
 > index ca0b2564c407..f5c72e33f9ae 100644
 > --- a/drivers/platform/x86/barco-p50-gpio.c
 > +++ b/drivers/platform/x86/barco-p50-gpio.c
 > @@ -101,7 +101,7 @@ static struct gpio_led_platform_data leds_pdata = {
 >  /* GPIO keyboard */
 >  static struct gpio_keys_button buttons[] = {
 >  	{
 > -		.code = KEY_RESTART,
 > +		.code = KEY_VENDOR,
 >  		.gpio = P50_GPIO_LINE_BTN,
 >  		.active_low = 1,
 >  		.type = EV_KEY,
 > -- 
 > 2.20.1


-- 
Bye, Peter Korsgaard
