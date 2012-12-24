From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] samsung-laptop: Set keyboard backlight initially
Date: Mon, 24 Dec 2012 09:41:15 +0100
Message-ID: <CAHR064iQeQrQF0qrGXJoCmYny2H_H_JnV_h8OvRSmD=bGE5eYA@mail.gmail.com>
References: <1356283278-5046-1-git-send-email-stigge@antcom.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f49.google.com ([209.85.214.49]:47388 "EHLO
	mail-bk0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752884Ab2LXIrO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 24 Dec 2012 03:47:14 -0500
In-Reply-To: <1356283278-5046-1-git-send-email-stigge@antcom.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Roland Stigge <stigge@antcom.de>
Cc: gregkh@linuxfoundation.org, Matthew Garrett <mjg@redhat.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Sun, Dec 23, 2012 at 6:21 PM, Roland Stigge <stigge@antcom.de> wrote:
> After boot, /sys/devices/platform/samsung/leds/samsung::kbd_backlight/brightness
> shows the maximum value (8) by readout, but the led is off. I need to manually
> set it to the respective value to have keyboard backlight.

If the led is set to 0, what's the value after reboot ? 0 or 8 ?
What's the behavior on windows ?

--
Corentin Chary
http://xf.iksaif.net
