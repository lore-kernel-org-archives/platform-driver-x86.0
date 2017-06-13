From: Darren Hart <dvhart@infradead.org>
Subject: Re: WMI and Kernel:User interface
Date: Tue, 13 Jun 2017 08:44:19 -0700
Message-ID: <20170613154419.GD27850@fury>
References: <20170509231639.GB11404@fury>
 <201706101236.40663@pali>
 <20170612170249.GA27850@fury>
 <201706130017.29023@pali>
 <20170613012435.GB27850@fury>
 <20170613070535.GA13252@infradead.org>
 <20170613120741.GG5248@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:50353 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752695AbdFMPoX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jun 2017 11:44:23 -0400
Content-Disposition: inline
In-Reply-To: <20170613120741.GG5248@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Mario Limonciello <mario_limonciello@dell.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Lutomirski <luto@amacapital.net>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Tue, Jun 13, 2017 at 02:07:41PM +0200, Pali Rohár wrote:
> On Tuesday 13 June 2017 00:05:35 Christoph Hellwig wrote:
> > On Mon, Jun 12, 2017 at 06:24:35PM -0700, Darren Hart wrote:
> > > This is a big topic for sure. Speed and scale of platform enabling is something
> > > I would like to see us support better. The barrier to entry to kernel
> > > changes is high, especially for trivial things, like adding IDs, GUIDs, etc.
> > > which would ideally, IMHO, be in the hands of the OEMs.
> > 
> > It's not.  It's a trivial patch, and you cover all Linux users.  Very
> > much unlike say the windows world where you are stuck with installing
> > a vendor specific set of drivers forever.
> 
> Yes, adding new GUID is same hard as adding new PCI ID or USB ID. It is
> really trivial patch.


See my response to Christoph - it's not the complexity of the patch, it's the
timeline. As Christoph points out, however, dynamic IDs may address this
concern.

> 
> In some cases filter function can be simple in some cases hard. I can
> image that usage of while listing, plus in some cases also filtering
> (when it would be relatively easy to implement).

See my response to Christoph - to address the concern of breaking userspace
later, if we consider this a proxy instead of a filter, we can make it
transparent to userspace and maintain kernel driver state. The driver can
register a wmi_method_proxy callback which can choose to proxy the method call
or not. If it does, it can update it's own state and perform the requested
action through it's own infrastructure, populate the out buffer and send it back
up to userspace. I would hope to see as few of these as possible, but they would
allow for protecting the kernel drivers while still enabling userspace usage of
WMI.

-- 
Darren Hart
VMware Open Source Technology Center
