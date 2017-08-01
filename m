From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/3] platform/dell-wmi: Fix driver interface version query
Date: Tue, 1 Aug 2017 12:54:05 -0700
Message-ID: <20170801195405.GB3110@fury>
References: <cover.1501601667.git.luto@kernel.org>
 <0cc9b015ed366f3fd104d2de707083c6ca2c2a5a.1501601667.git.luto@kernel.org>
 <20170801154312.GA25574@pali>
 <CALCETrUHw-bDMo6mrNM8+tdNDn71-ycb-aDtFTv82B0s8FiKHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:60846 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751965AbdHATyH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Aug 2017 15:54:07 -0400
Content-Disposition: inline
In-Reply-To: <CALCETrUHw-bDMo6mrNM8+tdNDn71-ycb-aDtFTv82B0s8FiKHA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org

On Tue, Aug 01, 2017 at 11:08:26AM -0700, Andy Lutomirski wrote:
> On Tue, Aug 1, 2017 at 8:43 AM, Pali Rohár <pali.rohar@gmail.com> wrote:
> > On Tuesday 01 August 2017 08:37:26 Andy Lutomirski wrote:
> >> When I converted dell-wmi to the new bus infrastructure, I left the
> >> call to dell_wmi_check_descriptor_buffer() in dell_wmi_init().  This
> >> could cause two problems:
> >>
> >>  - An error message when loading the driver on a system without
> >>    dell-wmi.  We'd try to read the event descriptor even if the WMI
> >>    GUID wasn't there.
> >>
> >>  - A possible race if dell-wmi was loaded manually before wmi was
> >>    fully initialized.
> >>
> >> Fix it by moving the call to the probe function where it belongs.
> >>
> >> Fixes: bff589be59c5 ("platform/x86: dell-wmi: Convert to the WMI bus infrastructure")
> >> Signed-off-by: Andy Lutomirski <luto@kernel.org>

> > Hi! You should move also dell_wmi_events_set_enabled() into
> > dell_wmi_probe() as there is no need to enable receiving events prior to
> > creating input device.
> 
> I thought of that and intentionally didn't do it: I wanted to leave
> enable and the disable paired properly, and there's nothing that
> tracks the enabled state per device.  Also, it's at least
> theoretically possible to have more than one instance of dell-wmi in a
> system (my laptop already has *two* wmi busses), and moving this code
> to ->probe would break this.
> 
> (The current wmi.c code can't handle the same GUID on two busses, but
> it could easily be added if anyone ever finds a laptop that does
> that.)
> 

Better still, thanks Andy.

-- 
Darren Hart
VMware Open Source Technology Center
