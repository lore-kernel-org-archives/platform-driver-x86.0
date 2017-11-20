From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v5 11/11] intel_sgx: driver documentation
Date: Tue, 21 Nov 2017 01:08:43 +0200
Message-ID: <20171120230843.ozqhqhj5h3uuds3f@linux.intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-12-jarkko.sakkinen@linux.intel.com>
 <20171117214310.GB25974@fury>
 <alpine.DEB.2.20.1711180023440.2186@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:64209 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751159AbdKTXIu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2017 18:08:50 -0500
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1711180023440.2186@nanos>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>

On Sat, Nov 18, 2017 at 12:34:33AM +0100, Thomas Gleixner wrote:
> This is architecural. From the cursory read of that series it seems there
> are two parts to it:
> 
>   1) The actual core handling, which should be in arch/x86 because that
>      hardly qualifies as a 'platform' device driver.
> 
>   2) The user space interface, which can be separated out perhaps.
> 
> I don't know how intertwingled they are, but that's hard to tell from the
> actual patches w/o doing a deep inspection. Jarkko should be able to answer
> that.
> 
> Thanks,
> 
> 	tglx

Darren, tglx,

You can leave user space device as separate module as sgx_ioctl.c merely
calls stuff that I have inside sgx_encl.c. VMA creation is bound to file
operations.

My questions would be:

1. What is your recommendation on the deployment under arch/x86?
2. Which parts should be compilable as a LKM? Only the user interface
   or both parts?

/Jarkko
