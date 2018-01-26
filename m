From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH] Revert "apple-gmux: lock iGP IO to protect from vgaarb
 changes"
Date: Fri, 26 Jan 2018 01:57:05 +0100
Message-ID: <20180126005705.GA9276@wunner.de>
References: <3671c3081a0ea3226dbb4c04e780ad7b6be0f201.1516793407.git.lukas@wunner.de>
 <20180125223800.GG24122@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bmailout3.hostsharing.net ([176.9.242.62]:39799 "EHLO
        bmailout3.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751826AbeAZBER (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Jan 2018 20:04:17 -0500
Content-Disposition: inline
In-Reply-To: <20180125223800.GG24122@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, Petri Hodju <petrihodju@yahoo.com>, Bjorn Helgaas <bhelgaas@google.com>, Bruno Premont <bonbons@linux-vserver.org>, Andy Ritger <aritger@nvidia.com>, Ronald Tschalaer <ronald@innovation.ch>, Wilfried Klaebe <linux-kernel@lebenslange-mailadresse.de>

On Thu, Jan 25, 2018 at 02:38:00PM -0800, Darren Hart wrote:
> On Wed, Jan 24, 2018 at 07:35:45PM +0100, Lukas Wunner wrote:
> > Commit 4eebd5a4e726 ("apple-gmux: lock iGP IO to protect from vgaarb
> > changes") amended this driver's ->probe hook to lock decoding of normal
> > (non-legacy) I/O space accesses to the integrated GPU on dual-GPU
> > MacBook Pros.  The lock stays in place until the driver is unbound.
> > 
> ...
> > 
> > So let's revert commit 4eebd5a4e726 please.  Users experiencing the
> > issue with the proprietary nvidia driver can comment out the above-
> > quoted problematic code as a workaround (or try updating the BIOS).
> > 
> > Cc: Petri Hodju <petrihodju@yahoo.com>
> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: Bruno Prémont <bonbons@linux-vserver.org>
> > Cc: Andy Ritger <aritger@nvidia.com>
> > Cc: Ronald Tschalär <ronald@innovation.ch>
> 
> I presume we'd like to see this applied to linux-stable as well?

Fine by me.  Can you add the stable designation when applying or
would you prefer me to respin?

Thanks,

Lukas
