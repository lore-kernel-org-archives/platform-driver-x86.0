From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] toshiba-wmi: Fix loading the driver on non Toshiba
 laptops
Date: Thu, 20 Oct 2016 22:01:57 -0700
Message-ID: <20161021050157.GB90338@f23x64.localdomain>
References: <20160825185055.12143-1-coproscefalo@gmail.com>
 <20160828170037.GC96930@f23x64.localdomain>
 <CAGdLNWGderHFpsqcRc5FjHYOCokoKzfsTeMUkjyZYhAU3guQ0w@mail.gmail.com>
 <20161019202643.GB78689@f23x64.localdomain>
 <CAGdLNWFz8g3q15Ha5uvc9og6aiYFcKCLa7SDqz_e3xnLGnWa+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:38812 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753674AbcJUFBg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 Oct 2016 01:01:36 -0400
Content-Disposition: inline
In-Reply-To: <CAGdLNWFz8g3q15Ha5uvc9og6aiYFcKCLa7SDqz_e3xnLGnWa+w@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Carlos Corbacho <carlos@strangeworlds.co.uk>

On Wed, Oct 19, 2016 at 05:27:49PM -0600, Azael Avalos wrote:
> Hi Darren,
> 
> 2016-10-19 14:26 GMT-06:00 Darren Hart <dvhart@infradead.org>:
> 

> >
> > Want to going to stable?
> 
> If possible, yes, as this issue affects other laptop manufacturers,
> we may never know if someone might try to load an older kernel
> on an affected laptop and end up with the toshiba_wmi loaded
> instead of the actual laptop support module, however, I'm not
> sure if this is a "big" issue to bother stable, if not, simply drop
> the cc to stable for me please.

My addled brain somehow skipped right over the Cc stable in your original patch,
I saw it later :-) Kept it.

-- 
Darren Hart
Intel Open Source Technology Center
