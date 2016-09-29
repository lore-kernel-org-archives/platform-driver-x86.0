From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH RFT] platform/x86: intel_pmc_ipc: Convert to use
 platform_device_register_full
Date: Wed, 28 Sep 2016 18:15:52 -0700
Message-ID: <20160929011552.GA13545@f23x64.localdomain>
References: <1474689248-5925-1-git-send-email-axel.lin@ingics.com>
 <20160928233644.GC7630@f23x64.localdomain>
 <CAFRkauAVqnnEAbgWDBr7Nz06pX7HNWR4pjcpu+UTMWVKwndO7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:35815 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752058AbcI2BP4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Sep 2016 21:15:56 -0400
Content-Disposition: inline
In-Reply-To: <CAFRkauAVqnnEAbgWDBr7Nz06pX7HNWR4pjcpu+UTMWVKwndO7g@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@ingics.com>
Cc: Zha Qipeng <qipeng.zha@intel.com>, Aubrey Li <aubrey.li@linux.intel.com>, platform-driver-x86@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Sep 29, 2016 at 08:59:55AM +0800, Axel Lin wrote:
> 2016-09-29 7:36 GMT+08:00 Darren Hart <dvhart@infradead.org>:
> > +LKML
> >
> > Axel, please always include LKML on any patch.
> 
> I thought  +LKML is optional if you already have a dedicated
> platform-driver-x86 maillist.

Nope, LKML is never optional. All patches to the Linux Kernel must include LKML.


-- 
Darren Hart
Intel Open Source Technology Center
