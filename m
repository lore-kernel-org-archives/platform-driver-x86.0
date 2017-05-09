From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: peaq-wmi: Add new peaq-wmi driver
Date: Tue, 9 May 2017 07:32:47 -0700
Message-ID: <20170509143247.GA12520@fury>
References: <20170508195631.2704-1-hdegoede@redhat.com>
 <20170508210441.GG17700@fury>
 <050e6240-0000-b078-2f41-9f117c1ca903@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:59981 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752360AbdEIOcu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 May 2017 10:32:50 -0400
Content-Disposition: inline
In-Reply-To: <050e6240-0000-b078-2f41-9f117c1ca903@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 09, 2017 at 08:42:21AM +0200, Hans de Goede wrote:
> On 08-05-17 23:04, Darren Hart wrote:
> > On Mon, May 08, 2017 at 09:56:31PM +0200, Hans de Goede wrote:

> > > +	peaq_poll_dev->input->name = "PEAQ WMI hotkeys";
> > 
> > Are there additional keys/buttons?
> 
> Not through the WMI interface on this model, I decided on the
> "PEAQ WMI hotkeys" name rather then say "PEAQ Dolby button"
> as future proofing (this gets exported to userspace so
> we should not change it in the future) in case this driver
> ends up delivering events for more special buttons on
> PEAQ devices.
> 
> As for all the other remarks from both you and Dmitry I agree
> with all of them and I will send a v2 addressing them all.
> 

Sounds good, thanks Hans.

-- 
Darren Hart
VMware Open Source Technology Center
