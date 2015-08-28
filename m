From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] thinkpad_acpi: Remove side effects from vdbg_printk ->
 no_printk macro
Date: Fri, 28 Aug 2015 10:50:50 -0700
Message-ID: <20150828175050.GA33809@vmdeb7>
References: <1440612818.2780.24.camel@perches.com>
 <20150827173306.GB17280@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:47514 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752483AbbH1RvH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 28 Aug 2015 13:51:07 -0400
Content-Disposition: inline
In-Reply-To: <20150827173306.GB17280@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Joe Perches <joe@perches.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

On Thu, Aug 27, 2015 at 02:33:06PM -0300, Henrique de Moraes Holschuh wrote:
> On Wed, 26 Aug 2015, Joe Perches wrote:
> > vdbg_printk when not using CONFIG_THINKPAD_ACPI_DEBUG uses
> > no_printk which produces no logging output but always
> > evaluates arguments.
> > 
> > Change the macro to surround the no_printk call with
> > 	do { if (0) no_printk(...); } while (0)
> > to avoid the unnecessary argument evaluations.
> > 
> > $ size drivers/platform/x86/thinkpad_acpi.o*
> >    text	   data	    bss	    dec	    hex	filename
> >   60918	   6184	    824	  67926	  10956	drivers/platform/x86/thinkpad_acpi.o.new
> >   60927	   6184	    824	  67935	  1095f	drivers/platform/x86/thinkpad_acpi.o.old
> > 
> > Signed-off-by: Joe Perches <joe@perches.com>
> 
> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Queued, thanks.

-- 
Darren Hart
Intel Open Source Technology Center
