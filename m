From: Darren Hart <dvhart@infradead.org>
Subject: Re: platform/x86/thinkpad_acpi: Adjustments for four function
 implementations
Date: Tue, 2 Jan 2018 16:10:34 -0800
Message-ID: <20180103001034.GC24794@fury>
References: <81459d11-693a-eb51-9173-9c189677f422@users.sourceforge.net>
 <CAHp75Vckgw1Eqao_vsq0n8RuYJRP2JZWJz6-MxZ6Wwb8eAEVgA@mail.gmail.com>
 <ea910da9-ca59-b895-b071-35d9c5cbd112@users.sourceforge.net>
 <20171223014033.jx7fzu7uzjfbzyca@khazad-dum.debian.net>
 <80ae8328-5851-01b0-cb31-474f7baf1686@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:33536 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751062AbeACAKj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Jan 2018 19:10:39 -0500
Content-Disposition: inline
In-Reply-To: <80ae8328-5851-01b0-cb31-474f7baf1686@users.sourceforge.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Shevchenko <andy@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Dec 23, 2017 at 08:12:21AM +0100, SF Markus Elfring wrote:
> >> Do you find the Linux allocation failure report insufficient in this case?
> > 
> > Leave those pr_ messages alone, please,
> 
> Have you got special software development concerns?
> 
> 
> > unless they are really causing some sort of issue (which?).
> 
> Can the code be redundant here?
> 
> 
> > Doing it just for "compliance" with a doc isn't nearly good enough reason.
> 
> Do you give only a low value to coding style guidelines in this use case?

Hi Markus,

Thanks for submitting the patch. I understand it can be frustrating to
encounter different policies across kernel maintainers. You'll even run
in to this with maintainers of the same subsystem from time to time.
While we try to be as consistent as possible, and to document policy as
we resolve vague areas, this is unfortunately still part of kernel
development.

I'm supportive of cleaning up old code in general, and we routinely
apply such patches as these developed with cocci. We have also had them
fail in unexpected ways.

Andy and Henrique raised a few reasons why these patches should not be
accepted:

1. This is init code )so any space savings is short lived)
2. There is no functional fix, and the change is to code which supports
   a lot of unique platforms, most of which we have no way to test. We are
   particularly cautious with drivers such as the thinkpad driver for this
   reason.

So it isn't that we place a low value on coding style guidelines, but
rather we place higher value on not perturbing code we can't fully test
without a demonstrable functional reasons to do so.

Thanks,

-- 
Darren Hart
VMware Open Source Technology Center
