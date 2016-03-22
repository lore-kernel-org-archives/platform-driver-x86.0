From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] fujitsu-laptop: Support radio LED
Date: Tue, 22 Mar 2016 12:27:38 +0100
Message-ID: <20160322112738.GA26924@xo-6d-61-c0.localdomain>
References: <1458127687-25366-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:50923 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756088AbcDJS3K (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 10 Apr 2016 14:29:10 -0400
Content-Disposition: inline
In-Reply-To: <1458127687-25366-1-git-send-email-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi!

> Sadly, this implementation is unsuitable for use with "heavy" LED
> triggers, like phy0rx.  Once blinking frequency achieves a certain
> level, the system hangs.  I'm not sure how much of an issue this is as
> I'm pretty sure other LEDs registered by fujitsu-laptop would also cause
> a hang when assigned to a similar trigger as they are also controlled
> using ACPI.

Something to do with triggers working in interrupt context?

Cc led people?

> +
> +static enum led_brightness radio_led_get(struct led_classdev *cdev);
> +static void radio_led_set(struct led_classdev *cdev,
> +			       enum led_brightness brightness);
> +
> +static struct led_classdev radio_led = {
> + .name = "fujitsu::radio_led",
> + .brightness_get = radio_led_get,
> + .brightness_set = radio_led_set
> +};

Is the naming consistent with other drivers?

Should there be default trigger so that it works out of the box?

Best regards,
									Pavel
