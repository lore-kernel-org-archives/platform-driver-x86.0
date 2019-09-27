From: Pavel Machek <pavel@ucw.cz>
Subject: Re: Portege Z930 extra keys and leds
Date: Fri, 27 Sep 2019 15:53:13 +0200
Message-ID: <20190927135313.GC3557@bug>
References: <09e715a0-08d2-100d-4bc3-c4f6c87f2a98@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <09e715a0-08d2-100d-4bc3-c4f6c87f2a98@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi!

> does anybody happen to know how to drive the extra keys and leds
> of Toshiba Portege Z930 notebook ?
> 
> It has two extra keys above the keyboard (right next to the power
> button) and some indicator leds underneath the touch panel buttons.
> 
> Toshiba originally ships the notebook with some strange Windows software
> (for some mysterious "ECO" mode) that reacts on these two buttons and
> drives at least the rightmost LED directly - so there has to be *some*
> way to control them by software.
> 
> When in a terminal (on the console only when /dev/input/event10 -
> "Toshiba input device" is opened), both keys seem to generate an "x"
> keypress, but nothing coming in in the event device.

You may want to play with evtest.

And you may want to dump the ACPI tables, I'd expect it would be driven from
there.

You may also want to search drivers/platform/x86 (or something like that) on
the latest kernel...

Best regards,
								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
