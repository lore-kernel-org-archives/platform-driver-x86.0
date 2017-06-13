From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: WMI and Kernel:User interface
Date: Tue, 13 Jun 2017 18:05:47 +0200
Message-ID: <20170613160547.GA25404@kroah.com>
References: <20170509231639.GB11404@fury>
 <201706101236.40663@pali>
 <20170612170249.GA27850@fury>
 <201706130017.29023@pali>
 <20170613012435.GB27850@fury>
 <20170613070535.GA13252@infradead.org>
 <20170613120741.GG5248@pali>
 <20170613154419.GD27850@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:43992 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750899AbdFMQFz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jun 2017 12:05:55 -0400
Content-Disposition: inline
In-Reply-To: <20170613154419.GD27850@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Christoph Hellwig <hch@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, Mario Limonciello <mario_limonciello@dell.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Lutomirski <luto@amacapital.net>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Tue, Jun 13, 2017 at 08:44:19AM -0700, Darren Hart wrote:
> > In some cases filter function can be simple in some cases hard. I can
> > image that usage of while listing, plus in some cases also filtering
> > (when it would be relatively easy to implement).
> 
> See my response to Christoph - to address the concern of breaking userspace
> later, if we consider this a proxy instead of a filter, we can make it
> transparent to userspace and maintain kernel driver state. The driver can
> register a wmi_method_proxy callback which can choose to proxy the method call
> or not. If it does, it can update it's own state and perform the requested
> action through it's own infrastructure, populate the out buffer and send it back
> up to userspace. I would hope to see as few of these as possible, but they would
> allow for protecting the kernel drivers while still enabling userspace usage of
> WMI.

Ok, I think we need to see some real code here to get any further with
this.  There's a reason we don't do big design discussions without
patches, as that usually answers all of the questions involved.

Please, let's see some code before anything else.

thanks,

greg k-h
