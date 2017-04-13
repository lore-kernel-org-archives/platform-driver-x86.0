From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/2] hp-wmi: Fix dock status and tablet mode reporting
Date: Thu, 13 Apr 2017 10:23:03 -0700
Message-ID: <20170413172303.GG2064@fury>
References: <20170409135608.15621-1-carlo@caione.org>
 <CAL9uMOEd0ocoV5-Chkk7KE-9AkV_6Q27N_OvJtHKqjJyvi9mWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:43713 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752537AbdDMRXG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 13 Apr 2017 13:23:06 -0400
Content-Disposition: inline
In-Reply-To: <CAL9uMOEd0ocoV5-Chkk7KE-9AkV_6Q27N_OvJtHKqjJyvi9mWQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Carlo Caione <carlo@endlessm.com>
Cc: Carlo Caione <carlo@caione.org>, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Linux Upstreaming Team <linux@endlessm.com>

On Thu, Apr 13, 2017 at 08:28:38AM +0200, Carlo Caione wrote:
> On Sun, Apr 9, 2017 at 3:56 PM, Carlo Caione <carlo@caione.org> wrote:
> > From: Carlo Caione <carlo@endlessm.com>
> >
> > Several HP laptops cannot be put to sleep using the LID since systemd complains
> > that the system is docked even though the laptop is not even dockable (see
> > [1]).
> >
> > This is due to a bug in hp-wmi where the driver is failing to check for errors
> > before creating the input switches.
> >
> > [1]: https://bugs.launchpad.net/ubuntu/+source/systemd/+bug/1574120
> >
> > Carlo Caione (2):
> >   hp-wmi: Fix error value for hp_wmi_tablet_state
> >   hp-wmi: Fix detection for dock and tablet mode
> 
> Gentle ping.

Hi Carlo,

To set expectations. I try to get to patches within 48 hours, but depending on a
variety of things it can be as long as a week under normal circumstances. If you
do not hear a response within a week, please do ping. At 4 days, this is just a
little long, but not out of the norm. I'll get to these today.

-- 
Darren Hart
VMware Open Source Technology Center
