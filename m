From: Julian Andres Klode <jak@jak-linux.org>
Subject: Re: [PATCH 1/4] thinkpad_acpi: Add support for controlling charge
 thresholds
Date: Mon, 30 Dec 2013 14:29:15 +0100
Message-ID: <20131230132915.GB24241@jak-x230>
References: <1384178195-12218-1-git-send-email-jak@jak-linux.org>
 <1384178195-12218-2-git-send-email-jak@jak-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f47.google.com ([209.85.214.47]:49319 "EHLO
	mail-bk0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751542Ab3L3N3T (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 30 Dec 2013 08:29:19 -0500
Content-Disposition: inline
In-Reply-To: <1384178195-12218-2-git-send-email-jak@jak-linux.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Julian Andres Klode <jak@jak-linux.org>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Matthew Garrett <matthew.garrett@nebula.com>, "open list:THINKPAD ACPI EXT..." <ibm-acpi-devel@lists.sourceforge.net>, "open list:THINKPAD ACPI EXT..." <platform-driver-x86@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

On Mon, Nov 11, 2013 at 02:56:30PM +0100, Julian Andres Klode wrote:
> Add support for battery charge thresholds in new Sandy Bridge and Ivy Bridge
> ThinkPads. Based on the unofficial documentation in tpacpi-bat.
> 
> The threshold files support the values '0' for the controller's default,
> and 1-99 as percentages. Values outside of that range are rejected. The
> behaviour of '0' might be confusing, especially for the stop case where
> it basically seems to mean '100'.

Thinking more about this, it might make more sense to simply accept a 100
value and not accept a 0 value in the stop case (I tried multiple times to
write 100 to a stop_charge_thresh file, because that feels more natural).

Having a 0 mean 100% is just odd. So stop_charge_thresh should simply
accepts integer values in the range [1, 100] (and start_charge_thresh
should continue accept [0, 99], as 0 really means 0 there).
-- 
Julian Andres Klode  - Debian Developer, Ubuntu Member

See http://wiki.debian.org/JulianAndresKlode and http://jak-linux.org/.

Please do not top-post if possible.
