From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] thinkpad_acpi: don't yell on unsupported brightness
 interfaces
Date: Wed, 21 Oct 2015 16:44:10 +0200
Message-ID: <20151021144410.GB29166@vmdeb7>
References: <1445424370-4725-1-git-send-email-dh.herrmann@gmail.com>
 <1445438032.750540.416379153.1ECC9658@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:42131 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750844AbbJUOoQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 21 Oct 2015 10:44:16 -0400
Content-Disposition: inline
In-Reply-To: <1445438032.750540.416379153.1ECC9658@webmail.messagingengine.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: David Herrmann <dh.herrmann@gmail.com>, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org

On Wed, Oct 21, 2015 at 12:33:52PM -0200, Henrique de Moraes Holschuh wrote:
> On Wed, Oct 21, 2015, at 08:46, David Herrmann wrote:
> > The thinkpad_acpi driver currently emits error messages on unsupported
> > brightness interfaces, giving the impression that someone will implement
> > those. However, this error is spit out on nearly every thinkpad in
> > production since 2 years now. Furthermore, the backlight interfaces on
> > those devices are supported by the i915 driver just fine.
> > 
> > Downgrade the error message to a normal pr_info() and stop telling people
> > to report it to IBM.
> 
> IBM?  Those reports go directly to me.
> 
> > Signed-off-by: David Herrmann <dh.herrmann@gmail.com>
> 
> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Thanks, Queued.

-- 
Darren Hart
Intel Open Source Technology Center
