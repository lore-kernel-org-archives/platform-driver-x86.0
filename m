From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] RFC: platform/x86: wmi: Fix check for method instance
 number
Date: Wed, 14 Jun 2017 13:39:06 -0700
Message-ID: <20170614203906.GE22450@fury>
References: <1495886134-8276-1-git-send-email-pali.rohar@gmail.com>
 <201706102115.57995@pali>
 <20170613164951.GI27850@fury>
 <201706132004.58051@pali>
 <20170613184228.GC22450@fury>
 <20170614154654.GA22981@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:59990 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751664AbdFNUjI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 14 Jun 2017 16:39:08 -0400
Content-Disposition: inline
In-Reply-To: <20170614154654.GA22981@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 14, 2017 at 05:46:54PM +0200, Pali Rohár wrote:
> On Tuesday 13 June 2017 11:42:28 Darren Hart wrote:
> > On Tue, Jun 13, 2017 at 08:04:57PM +0200, Pali Rohár wrote:
> > > On Tuesday 13 June 2017 18:49:51 Darren Hart wrote:
> > > > I'd suggest reaching out to the maintainers and contributors to the
> > > > drivers you mention to request some help in testing.
> > > 
> > > Seems sane. Grep for all methods with instance number different as zero 
> > > (or just number one -- which can be suspicious as somebody could thought 
> > > that indexing is from one, not zer) and try to receive ACPI/BMOF data 
> > > and verify it.
> > 
> > This would still be the ideal solution, verify we can do the right thing
> > without breaking existing drivers. Agreed.
> 
> Here is all usage:
> 

Thanks for pulling this together Pali.

...

> So problematic drivers which use instance=1 without any comments are:
> 
>   acer-wmi
>   alienware-wmi
>   asus-wmi
>   dell-wmi-led
>   mxm-wmi
> 

I'd suggest adding a WARN_ONCE() when instance >= instance_count (I guess only
== concerns us) as a way to draw out any problematic usage. We can let that go
while we try to collect data from the other driver maintainers and see if it
generates any more hits.

-- 
Darren Hart
VMware Open Source Technology Center
