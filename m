From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/3] platform/dell-wmi: Fix driver interface version query
Date: Tue, 1 Aug 2017 12:52:42 -0700
Message-ID: <20170801195242.GA3110@fury>
References: <cover.1501601667.git.luto@kernel.org>
 <0cc9b015ed366f3fd104d2de707083c6ca2c2a5a.1501601667.git.luto@kernel.org>
 <20170801154312.GA25574@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:59649 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751965AbdHATwo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Aug 2017 15:52:44 -0400
Content-Disposition: inline
In-Reply-To: <20170801154312.GA25574@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org

On Tue, Aug 01, 2017 at 05:43:12PM +0200, Pali Rohár wrote:
> On Tuesday 01 August 2017 08:37:26 Andy Lutomirski wrote:
> > When I converted dell-wmi to the new bus infrastructure, I left the
> > call to dell_wmi_check_descriptor_buffer() in dell_wmi_init().  This
> > could cause two problems:
> > 
> >  - An error message when loading the driver on a system without
> >    dell-wmi.  We'd try to read the event descriptor even if the WMI
> >    GUID wasn't there.
> > 
> >  - A possible race if dell-wmi was loaded manually before wmi was
> >    fully initialized.
> > 
> > Fix it by moving the call to the probe function where it belongs.
> > 
> > Fixes: bff589be59c5 ("platform/x86: dell-wmi: Convert to the WMI bus infrastructure")
> > Signed-off-by: Andy Lutomirski <luto@kernel.org>

> Hi! You should move also dell_wmi_events_set_enabled() into
> dell_wmi_probe() as there is no need to enable receiving events prior to
> creating input device.

That is a good idea, but it is a separate functional change. Especially as this
is addressing a specific bug, let's keep this as is, and add a second patch to
move the enable receiving events.


-- 
Darren Hart
VMware Open Source Technology Center
