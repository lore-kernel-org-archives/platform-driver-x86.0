From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v5 11/11] intel_sgx: driver documentation
Date: Tue, 28 Nov 2017 22:46:16 +0200
Message-ID: <20171128204616.aqll77bnyhg3eov7@linux.intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-12-jarkko.sakkinen@linux.intel.com>
 <20171117214310.GB25974@fury>
 <alpine.DEB.2.20.1711180023440.2186@nanos>
 <20171120230843.ozqhqhj5h3uuds3f@linux.intel.com>
 <1511802219.9392.44.camel@intel.com>
 <20171128203748.vnf6qxs526djghin@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:54752 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932187AbdK1UqQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Nov 2017 15:46:16 -0500
Content-Disposition: inline
In-Reply-To: <20171128203748.vnf6qxs526djghin@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>

On Tue, Nov 28, 2017 at 10:37:48PM +0200, Jarkko Sakkinen wrote:
> On Mon, Nov 27, 2017 at 09:03:39AM -0800, Sean Christopherson wrote:
> > I have a branch based on Jarkko's patches (I believe it's up-to-date with v5)
> > that implements what I described.  I'd be happy to send RFC patches if that
> > would help.
> 
> That would only slow things down. The code is easy to move around and
> I'm doing infrastructure changes as part of the review process. The
> latest version (v6) that I sent on Sat has struct sgx_epc_page removed
> just to name an example.
> 
> Rather than sending any deprecated patches it would be more useful to
> get input (in English) on directory layout.
> 
> I guess you missed v6 as it I had to drop the 01.org list temporarily.
> It will be back in v7 as I was able to retrieve the admin password and
> configure it in suitable way.

Once my series has been landed, you could drop a series for review. Then
it does make sense. I won't of course add any exports needed by KVM etc.
I'm only doing "lowest common denominator" groundwork.

/Jarkko
