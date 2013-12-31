From: Julian Andres Klode <jak@jak-linux.org>
Subject: Re: [ibm-acpi-devel] [PATCH 1/4] thinkpad_acpi: Add support for
 controlling charge thresholds
Date: Tue, 31 Dec 2013 23:46:05 +0100
Message-ID: <20131231224605.GA32669@jak-x230>
References: <1384178195-12218-1-git-send-email-jak@jak-linux.org>
 <1384178195-12218-2-git-send-email-jak@jak-linux.org>
 <20131230132915.GB24241@jak-x230>
 <20131230215843.GB4938@khazad-dum.debian.net>
 <20131230224045.GC4938@khazad-dum.debian.net>
 <20131231000115.GA28120@jak-x230>
 <20131231121231.GB25729@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131231121231.GB25729@khazad-dum.debian.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Julian Andres Klode <jak@jak-linux.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Matthew Garrett <matthew.garrett@nebula.com>, "open list:THINKPAD ACPI EXT..." <ibm-acpi-devel@lists.sourceforge.net>, "open list:THINKPAD ACPI EXT..." <platform-driver-x86@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Dec 31, 2013 at 10:12:31AM -0200, Henrique de Moraes Holschuh wrote:
> On Tue, 31 Dec 2013, Julian Andres Klode wrote:
> > We might be able to work around this by simple setting stop = start
> > if a new write causes the stop threshold to be below the start
> > threshold. But this also seems ugly.
> 
> It is the safest way, but the correct pseudo-code would be, assuiming
> unsigned:
> 
> when someone changes start:
> 
> if (start > 99)
> 	start = 99;

I think we should just return -EINVAL in such cases. Allowing users to
write larger percentages is a bit pointless (we don't allow them to write
negative ones either). And other promiment code (the backlight drivers)
seem to reject out-of-range values.

> set_thresholds(start, stop);

I think there should not be some common set_thresholds, because we also
need to write things in different orders for start / stop then:

	DECREASE STOP  => Write new start if needed, then write stop
	INCREASE START => Write new stop if needed, then write start

Otherwise we might have a very very very short time in which start
is greater than stop.

I'll incorporate this in real code and test it tomorrow. 

Sometimes after that, I'd like to tackle the integration with power_supply.
This is a bit more complicated, there even appear to be two battery drivers
in ACPI, namely battery and sbs, and battery is used on my system (I don't
know if that's the generic case on ThinkPads, or if is the case because
battery is builtin and sbs is not). How to do extend that is probably
something best discussed with ACPI maintainers, as I can't see
any mechanism for this.

-- 
Julian Andres Klode  - Debian Developer, Ubuntu Member

See http://wiki.debian.org/JulianAndresKlode and http://jak-linux.org/.

Please do not top-post if possible.
