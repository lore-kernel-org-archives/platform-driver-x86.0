From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Linux 3.2-rc1
Date: Tue, 8 Nov 2011 12:13:16 -0800
Message-ID: <CA+55aFyojS9n=jP07X2BcxZ5z8YkBaZnNnthTs8xBkdtBdK1XA@mail.gmail.com>
References: <CA+55aFzytqbGcOzWvYAo-EnJCeK5mFqdCF5OjMTeM5UBfeyCXw@mail.gmail.com>
 <CAKWSe6Dr7G3TgeMiff=hrT1bMc+StnXdtW0MEmQcuA5yFOWJYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:42430 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750769Ab1KHUNi convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Nov 2011 15:13:38 -0500
In-Reply-To: <CAKWSe6Dr7G3TgeMiff=hrT1bMc+StnXdtW0MEmQcuA5yFOWJYw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alessandro Suardi <alessandro.suardi@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Nov 8, 2011 at 6:53 AM, Alessandro Suardi
<alessandro.suardi@gmail.com> wrote:
>
> Dell laptop support (and I'd suspect other drivers using LED support)
> =A0doesn't build with undefined LED-related functions, as in:
>
> ERROR: "led_classdev_unregister" [drivers/platform/x86/dell-laptop.ko=
]
> undefined!
> ERROR: "led_classdev_register" [drivers/platform/x86/dell-laptop.ko] =
undefined!
> make[1]: *** [__modpost] Error 1
> make: *** [modules] Error 2
>
> It's enough to configure NEW_LEDS (unneeded in 3.1.0) to allow the bu=
ild to go
> =A0through; maybe NEW_LEDS should be auto-selected in Kconfig by driv=
ers that
> =A0make use of led_classdev_* functions ?

Yeah, that sounds like the right fix. There are a lot of "select
NEW_LEDS" around already, but apparently not the Dell driver.

Matthew?

                 Linus
