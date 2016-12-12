From: Darren Hart <dvhart@infradead.org>
Subject: Re: [ibm-acpi-devel] [PATCH] thinkpad_acpi: Fix old style
 declaration GCC warning
Date: Mon, 12 Dec 2016 10:46:28 -0800
Message-ID: <20161212184628.GC77230@f23x64.localdomain>
References: <20161125131807.3885-1-tklauser@distanz.ch>
 <20161125153130.GA4302@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:54369 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752810AbcLLSqZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Dec 2016 13:46:25 -0500
Content-Disposition: inline
In-Reply-To: <20161125153130.GA4302@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Tobias Klauser <tklauser@distanz.ch>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Fri, Nov 25, 2016 at 01:31:30PM -0200, Henrique de Moraes Holschuh wrote:
> On Fri, 25 Nov 2016, Tobias Klauser wrote:
> > Fix an [-Wold-style-declaration] GCC warning by moving the inline
> > keyword before the return type.
> > 
> > Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> 
> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
> 

Queued to testing, thank you.

-- 
Darren Hart
Intel Open Source Technology Center
