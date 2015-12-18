From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH][v2] intel-hid: new hid event driver for hotkeys
Date: Fri, 18 Dec 2015 10:56:45 -0800
Message-ID: <20151218185645.GA15346@malice.jf.intel.com>
References: <1450452670-26556-1-git-send-email-alex.hung@canonical.com>
 <CALCETrVFkd4=LqtVexusQcpNi8F1rMXmwEh_zYuc-eTc20tSVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:37663 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932958AbbLRS4r (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Dec 2015 13:56:47 -0500
Content-Disposition: inline
In-Reply-To: <CALCETrVFkd4=LqtVexusQcpNi8F1rMXmwEh_zYuc-eTc20tSVw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org

On Fri, Dec 18, 2015 at 08:41:32AM -0800, Andy Lutomirski wrote:
> On Fri, Dec 18, 2015 at 7:31 AM, Alex Hung <alex.hung@canonical.com> wrote:
> > This driver supports various HID events including hotkeys.
> > Dell XPS 13 9350 requires it for the wireless hotkey.
> >
> 
> Still:
> 
> Reviewed-and-tested-by: Andy Lutomirski <luto@kernel.org>
> 
> with the single character nitpick:
> 
> > +config INTEL_HID_EVENT
> > +       tristate "INTEL HID Event"
> > +       depends on ACPI
> > +       depends on INPUT
> > +       help
> > +        This driver provides support for the Intel HID Event hotkey interface.
> > +        Some aptops require this driver for hotkey support.
> 
> laptops

Thanks,

I'll correct.

-- 
Darren Hart
Intel Open Source Technology Center
