From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 1/1] alix2: supplement driver to include GPIO button
 support
Date: Wed, 25 Jan 2012 15:16:22 -0800
Message-ID: <20120125151622.6621f6ce.akpm@linux-foundation.org>
References: <1327348589-9601-1-git-send-email-philipp@redfish-solutions.com>
	<20120125145742.338086b8.akpm@linux-foundation.org>
	<4F208A70.1050709@redfish-solutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:56856 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750832Ab2AYXQX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 Jan 2012 18:16:23 -0500
In-Reply-To: <4F208A70.1050709@redfish-solutions.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Philip Prindeville <philipp@redfish-solutions.com>
Cc: platform-driver-x86@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Richard Purdie <rpurdie@rpsys.net>, Andres Salomon <dilinger@queued.net>, Ed Wildgoose <kernel@wildgooses.com>, David Woodhouse <dwmw2@infradead.org>

On Wed, 25 Jan 2012 16:04:16 -0700
Philip Prindeville <philipp@redfish-solutions.com> wrote:

> > This is odd.  There are no references to this from outside this file
> > and it's hard to see how a wireless driver could use this - any such
> > driver would have to load this module on *all* machines (even non-x86)
> > simply to resolve this symbol.
> 
> It's for an out-of-tree driver that's only ever built for Alix hardware.

This should have been changelogged!  And a code comment would be good,
too - if it confused me now, it will confused others later.  And such a
code comment will help prevent others from coming in and "cleaning up"
the code later on.

Out-of-tree drivers are unpopular.  Where is this driver, what is its
license and what are the prospects of making it in-tree?

I don't personally have problems with helping out-of-tree drivers but
making it EXPORT_SYMBOL_GPL() would set minds at rest.

> Since it's only 4 bytes and one exported symbol, I figured it was acceptable...
> 
> I can remove it, resubmit, and use a patch locally in my tree if that's preferable

What we should do depends on the above issues...
