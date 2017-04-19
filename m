From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 2/2] hp-wmi: Fix detection for dock and tablet mode
Date: Wed, 19 Apr 2017 13:12:26 -0700
Message-ID: <20170419201226.GB17351@fury>
References: <20170409135608.15621-1-carlo@caione.org>
 <20170409135608.15621-3-carlo@caione.org>
 <20170413182150.GI2064@fury>
 <CAL9uMOG_3Ov6+bgDoHWYUgSKG9YbXs-vk0XsnOYAt+rDV48e7w@mail.gmail.com>
 <20170413230749.GA11189@fury>
 <CAHp75VcPm878U+m9s+AEdy7nnkkSWoqB1j2w5b5SuwSH31Y=sQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:37689 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S969295AbdDSUM2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Apr 2017 16:12:28 -0400
Content-Disposition: inline
In-Reply-To: <CAHp75VcPm878U+m9s+AEdy7nnkkSWoqB1j2w5b5SuwSH31Y=sQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Carlo Caione <carlo@endlessm.com>, Carlo Caione <carlo@caione.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>

On Wed, Apr 19, 2017 at 07:23:39PM +0300, Andy Shevchenko wrote:
> On Fri, Apr 14, 2017 at 2:07 AM, Darren Hart <dvhart@infradead.org> wrote:
> > On Thu, Apr 13, 2017 at 10:09:43PM +0200, Carlo Caione wrote:
> >> On Thu, Apr 13, 2017 at 8:21 PM, Darren Hart <dvhart@infradead.org> wrote:
> >> > On Sun, Apr 09, 2017 at 03:56:08PM +0200, Carlo Caione wrote:
> 
> > EINVAL is being used to broadly here. If the input values are incorrect, then
> > yes -EINVAL is the right response. However, if the query was unsuccessful, that
> > is more appropriately -EIO.
> >
> > If the handle/method doesn't exist, that would be -ENXIO.
> >
> > However, your changes make the driver self-consistent and I'll apply them as is
> > to testing.
> 
> Darren, if it's not yet in for-next, I would like Carlo to update his
> patch 1. I think it's better if we not shadow negative error code from
> the callee.

See my response in the V2 Carlo submitted.

-- 
Darren Hart
VMware Open Source Technology Center
