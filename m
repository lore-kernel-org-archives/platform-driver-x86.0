From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Linux 3.2-rc1
Date: Tue, 8 Nov 2011 12:44:37 -0800
Message-ID: <CA+55aFzPTiTP1+BohO2+1mZRuCm8nJ_dk0m2=Gyiytpgw7dgig@mail.gmail.com>
References: <CA+55aFzytqbGcOzWvYAo-EnJCeK5mFqdCF5OjMTeM5UBfeyCXw@mail.gmail.com>
 <CAKWSe6Dr7G3TgeMiff=hrT1bMc+StnXdtW0MEmQcuA5yFOWJYw@mail.gmail.com> <CA+55aFyojS9n=jP07X2BcxZ5z8YkBaZnNnthTs8xBkdtBdK1XA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:52960 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751687Ab1KHUo7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Nov 2011 15:44:59 -0500
In-Reply-To: <CA+55aFyojS9n=jP07X2BcxZ5z8YkBaZnNnthTs8xBkdtBdK1XA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alessandro Suardi <alessandro.suardi@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Nov 8, 2011 at 12:13 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Yeah, that sounds like the right fix. There are a lot of "select
> NEW_LEDS" around already, but apparently not the Dell driver.

Hmm. Interesting. Selecting NEW_LEDS (and LEDS_CLASS) leads to some
insane Kconfig warnings. Will have to take a look at what makes that
Dell driver different from the other laptop drivers that do the same..

               Linus
