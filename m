From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3] dmi: Make dmi_walk and dmi_walk_early return real
 error codes
Date: Fri, 12 Feb 2016 16:12:33 -0800
Message-ID: <20160213001233.GA30568@dvhart-mobl5.amr.corp.intel.com>
References: <0e75e48f9944d14ed914342a4780c199095ad747.1453247603.git.luto@kernel.org>
 <20160122101222.3a29841d@endymion.delvare>
 <20160130180517.GB1862@malice.jf.intel.com>
 <CALCETrXbvv2nQ6XJSocbEukoFQbWd437jaRQ4WjGigxjrMNtGw@mail.gmail.com>
 <20160130201850.3fd167e9@endymion.delvare>
 <20160202170029.GA1779@malice.jf.intel.com>
 <CALCETrUr2-y8vrgKeDqYnMGGT3=cVL8VqEcjTBgYAW4L2R+OSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:52425 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751320AbcBMAMm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 12 Feb 2016 19:12:42 -0500
Content-Disposition: inline
In-Reply-To: <CALCETrUr2-y8vrgKeDqYnMGGT3=cVL8VqEcjTBgYAW4L2R+OSA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Jean Delvare <jdelvare@suse.de>, Andy Lutomirski <luto@kernel.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Feb 12, 2016 at 10:59:10AM -0800, Andy Lutomirski wrote:
> On Tue, Feb 2, 2016 at 9:00 AM, Darren Hart <dvhart@infradead.org> wrote:
> > On Sat, Jan 30, 2016 at 08:18:50PM +0100, Jean Delvare wrote:
> >> On Sat, 30 Jan 2016 10:13:09 -0800, Andy Lutomirski wrote:
> >> > On Sat, Jan 30, 2016 at 10:05 AM, Darren Hart <dvhart@infradead.org> wrote:
> >> > > If I understand this correctly, this is the first of 5 patches, and this one has
> >> > > some unanswered questions from Jean here. If this patch gets respun, the
> >> > > following are also impacted:
> >> > >
> >> > > dell-wmi: Stop storing pointers to DMI tables
> >> > > dell-wmi, dell-laptop: select DMI
> >> > > dell-wmi: Clean up hotkey table size check
> >> > > dell-wmi: Support new hotkeys on the XPS 13 9350 (Skylake)
> >> > >
> >> > > Is that correct?
> >> >
> >> > Not really.  It's just the three patches here:
> >> >
> >> > http://article.gmane.org/gmane.linux.drivers.platform.x86.devel/8503
> >> >
> >> > This patch (the dmi_walk error code one) is no longer really related.
> >> > Due to Jean's earlier comment about what happens if DMI isn't enabled
> >> > at all, I no longer propagate the error code from dmi_walk in
> >> > dell-wmi, so the error code won't have any effect.  (Instead I just
> >> > warn and let the driver load in legacy mode, which matches the current
> >> > behavior.)
> >> >
> >> > I think the way to go is for the v3 "dell-wmi: DMI misuse fixes"
> >> > series to go in through your tree, and I'll hash out the error code
> >> > thing separately with Jean.
> >> >
> >> > Does that seem sensible?
> >>
> >> Yes, I agree that this patch is independent from the dell-wmi patch
> >> series now.
> >
> > Excellent, works for me.
> >
> 
> Is any further action from me needed here?

Now that the Dell SMBIOS update is in (yesterday), I am looking for a
consolidated patch series from you, ending with the skylake support.

-- 
Darren Hart
Intel Open Source Technology Center
