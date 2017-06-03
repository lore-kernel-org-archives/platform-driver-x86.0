From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 0/8] fujitsu-laptop: use device-specific data instead
 of module-wide globals
Date: Sat, 3 Jun 2017 12:06:15 -0700
Message-ID: <20170603190615.GD4854@fury>
References: <20170519074448.12716-1-kernel@kempniu.pl>
 <20170521232323.GD28475@marvin.atrad.com.au>
 <20170524000018.GF11878@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:55827 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750991AbdFCTGT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 3 Jun 2017 15:06:19 -0400
Content-Disposition: inline
In-Reply-To: <20170524000018.GF11878@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, May 24, 2017 at 09:30:18AM +0930, Jonathan Woithe wrote:
> Hi Michael
> 
> On Mon, May 22, 2017 at 08:53:23AM +0930, Jonathan Woithe wrote:
> > On Fri, May 19, 2017 at 09:44:40AM +0200, Micha?? K??pie?? wrote:
> > > fujitsu-laptop registers two ACPI drivers that access each other's
> > > module-wide structures.  To improve data encapsulation and lay the
> > > groundwork for separating the two aforementioned ACPI drivers into
> > > separate modules, move away from module-wide global data structures by
> > > using device-specific data instead.
> > > :
> > 
> > I have had a quick look through this series.  To my eye it addresses the
> > outcome of our discussion over the last couple of weeks, and looks good.  I
> > had one query regarding patch 5/8, but that might just be a case of me not
> > knowing about a subtlety of WARN_ONCE().  In any case this isn't a major
> > issue and would be easily resolved if needed.
> > 
> > Once I get feedback on patch 5/8 (and after seeing any additional comments
> > from Darren et al) I can send through a reviewed-by.
> 
> With the minor query in 5.8 sorted, I'm happy to proceed with this (subject
> of course to any further comments from Darren or Andy).  While not an
> endpoint in and of itslef, it is never-the-less an important step towards
> the agreed goal to separate the fujitsu-laptop module into two drivers. 
> This is motivated by the current use of two ACPI devices by the single
> fujitsu-laptop module, which is inconsistent with the kernel's "one driver
> per module" approach.
> 
> Reviewed-by: Jonathan Woithe <jwoithe@just42.net>

Apologies for the delay gents. Reviewed and pushed to testing.

-- 
Darren Hart
VMware Open Source Technology Center
