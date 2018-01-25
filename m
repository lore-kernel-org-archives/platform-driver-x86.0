From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] Revert "apple-gmux: lock iGP IO to protect from vgaarb
 changes"
Date: Thu, 25 Jan 2018 14:38:00 -0800
Message-ID: <20180125223800.GG24122@fury>
References: <3671c3081a0ea3226dbb4c04e780ad7b6be0f201.1516793407.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:35945 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751204AbeAYWiI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Jan 2018 17:38:08 -0500
Content-Disposition: inline
In-Reply-To: <3671c3081a0ea3226dbb4c04e780ad7b6be0f201.1516793407.git.lukas@wunner.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, Petri Hodju <petrihodju@yahoo.com>, Bjorn Helgaas <bhelgaas@google.com>, Bruno Premont <bonbons@linux-vserver.org>, Andy Ritger <aritger@nvidia.com>, Ronald Tschalaer <ronald@innovation.ch>, Wilfried Klaebe <linux-kernel@lebenslange-mailadresse.de>

On Wed, Jan 24, 2018 at 07:35:45PM +0100, Lukas Wunner wrote:
> Commit 4eebd5a4e726 ("apple-gmux: lock iGP IO to protect from vgaarb
> changes") amended this driver's ->probe hook to lock decoding of normal
> (non-legacy) I/O space accesses to the integrated GPU on dual-GPU
> MacBook Pros.  The lock stays in place until the driver is unbound.
> 
...
> 
> So let's revert commit 4eebd5a4e726 please.  Users experiencing the
> issue with the proprietary nvidia driver can comment out the above-
> quoted problematic code as a workaround (or try updating the BIOS).
> 
> Cc: Petri Hodju <petrihodju@yahoo.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Bruno Prémont <bonbons@linux-vserver.org>
> Cc: Andy Ritger <aritger@nvidia.com>
> Cc: Ronald Tschalär <ronald@innovation.ch>

I presume we'd like to see this applied to linux-stable as well?

-- 
Darren Hart
VMware Open Source Technology Center
