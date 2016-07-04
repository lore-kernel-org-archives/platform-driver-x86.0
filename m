From: Dan O'Donovan <dan@emutex.com>
Subject: Re: UP Board and similar
Date: Mon, 4 Jul 2016 16:33:45 +0100
Message-ID: <577A81D9.4010800@emutex.com>
References: <CAHp75VcOMFygekkhCEtWigW+JaKOgNQrM9M-3MtKemBF3arBOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bert.emutex.com ([91.103.1.109]:33746 "EHLO bert.emutex.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932558AbcGDPdt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jul 2016 11:33:49 -0400
In-Reply-To: <CAHp75VcOMFygekkhCEtWigW+JaKOgNQrM9M-3MtKemBF3arBOQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: "Darren Hart (Google+)" <reply-101378268367730737515@profiles.google.com>, Mika Westerberg <mika.westerberg@linux.intel.com>

Hi Andy

On 06/30/2016 09:36 PM, Andy Shevchenko wrote:
> Hi!
>
> Thank you for the series and sorry to answer as a new mail, just
> subscribed to the list and didn't manage to retrieve archives (seems
> VGER doesn't have them).
Thanks very much for your reply.  I appreciate you kick-starting a
discussion on these patches.  :-)
>
> So, regarding to enabling UP Board and similar open connected  boards
> (Galileo, Edison/Arduino, etc.).
>
> The mentioned boards are x86. There is currently no way to handle
> pinctrl on them since they are ACPI-based. Moreover pinctrl doesn't
> have a way to configure stuff for customer needs!
>
> What is my vision on the issue. Currently we have pending ACPI patches
> from Octavian that help us to load ACPI DSDT overlays in a way as it
> works for DT. This will make possible to create a blob to configure
> pins. Thus, part of the patch series which hard codes the mappings is
> not needed. And therefore your drivers should go somewhere under
> drivers/pinctrl/intel folder which Mika (mostly) and I are supporting.
Yes, I think that makes sense.  This is essentially a pin control driver
(except for some LED control functionality).
>
> We still need to agree on the above: which folder and how those
> drivers should look like.
Darren has suggested that I re-post the patches for review, so I'll do
that next and see where the discussion takes us. 
>
> P.S. Dan, next time please include me and Mika into Cc list for such
> things. Thanks!
>
Will do, thanks!
