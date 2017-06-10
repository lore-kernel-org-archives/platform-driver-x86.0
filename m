From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 09/11] platform: thinkpad_acpi: convert to use
 DRIVER_ATTR_RO/RW
Date: Fri, 9 Jun 2017 17:50:35 -0700
Message-ID: <20170610005035.GD22981@fury>
References: <20170609090314.13991-1-gregkh@linuxfoundation.org>
 <20170609090314.13991-9-gregkh@linuxfoundation.org>
 <CAHp75VfG1OuX=FtUc79YburcCxwM3Su3j3M=0ijnU+AM8KV==A@mail.gmail.com>
 <20170609100225.GA1297@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:40620 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751562AbdFJAuh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Jun 2017 20:50:37 -0400
Content-Disposition: inline
In-Reply-To: <20170609100225.GA1297@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>

On Fri, Jun 09, 2017 at 12:02:25PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Jun 09, 2017 at 12:35:35PM +0300, Andy Shevchenko wrote:
> > On Fri, Jun 9, 2017 at 12:03 PM, Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > > We are trying to get rid of DRIVER_ATTR(), and the thinkpad_acpi
> > > driver's attributes can be trivially changed to use DRIVER_ATTR_RO() and
> > > DRIVER_ATTR_RW().
> > 
> > Which tree is it supposed to go through?
> > We might need an immutable tag / branch.
> 
> I can take it in my tree, sorry for not saying that in a 00/11 email, I
> forgot that for this series.

OK, no dependencies that I see, but it's a simple mechanical change. Happy for
it to go through Greg's tree.

Reviewed-by: Darren Hart (VMware) <dvhart@infradead.org>

-- 
Darren Hart
VMware Open Source Technology Center
