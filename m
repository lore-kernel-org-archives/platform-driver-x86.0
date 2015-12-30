From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 4/5] platform:x86: Add Intel Telemetry Debugfs
 interfaces
Date: Tue, 29 Dec 2015 23:26:13 -0800
Message-ID: <20151230072613.GF29978@malice.jf.intel.com>
References: <1450867456-11366-1-git-send-email-souvik.k.chakravarty@intel.com>
 <20151230005005.GA29978@malice.jf.intel.com>
 <5F7315E704FA0841B5DFCE90329B2BB42B74AE95@BGSMSX105.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:49516 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751187AbbL3H0P (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 30 Dec 2015 02:26:15 -0500
Content-Disposition: inline
In-Reply-To: <5F7315E704FA0841B5DFCE90329B2BB42B74AE95@BGSMSX105.gar.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Cc: Rafael Wysocki <rjw@rjwysocki.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Kasagar, Srinidhi" <srinidhi.kasagar@intel.com>, "Zha, Qipeng" <qipeng.zha@intel.com>, "Muralidhar, Rajeev D" <rajeev.d.muralidhar@intel.com>, "Ghorai, Sukumar" <sukumar.ghorai@intel.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Li, Aubrey" <aubrey.li@intel.com>

On Wed, Dec 30, 2015 at 04:48:42AM +0000, Chakravarty, Souvik K wrote:
> 
> 
> > -----Original Message-----
> > From: platform-driver-x86-owner@vger.kernel.org [mailto:platform-driver-
> > x86-owner@vger.kernel.org] On Behalf Of Darren Hart
> > Sent: Wednesday, December 30, 2015 6:20 AM
> > To: Chakravarty, Souvik K <souvik.k.chakravarty@intel.com>; Rafael Wysocki
> > <rjw@rjwysocki.net>
> > Cc: platform-driver-x86@vger.kernel.org; Kasagar, Srinidhi
> > <srinidhi.kasagar@intel.com>; Zha, Qipeng <qipeng.zha@intel.com>;
> > Muralidhar, Rajeev D <rajeev.d.muralidhar@intel.com>; Ghorai, Sukumar
> > <sukumar.ghorai@intel.com>; Yu, Ong Hock <ong.hock.yu@intel.com>; Li,
> > Aubrey <aubrey.li@intel.com>
> > Subject: Re: [PATCH v2 4/5] platform:x86: Add Intel Telemetry Debugfs
> > interfaces
> > 
> > On Wed, Dec 23, 2015 at 04:14:16PM +0530, Souvik Kumar Chakravarty wrote:

...

> > What is the plan for supporting future SoCs here? You have APL incorporated
> > into this file. Do you intend to add each generation to this file?
> 
> Yes that is the intention.

OK, I guess we'll see how it scales and how many SoC generations follow with
this interface.

...

> > 
> > > +				d3_sts[idx] =
> > > +				(evtlog[index].telem_evtlog >>
> > > +				debugfs_conf->ioss_d0ix_data[idx].bit_pos)
> > &
> > > +				TELEM_MASK_BIT;
> > 
> > By the time you have indented 4, and really should be 5, the preference is to
> > determine if this can be refactored into a shallower nesting structure.
> > 
> > Perhaps a macro of some sort as these all seem fairly repetitive.
> 
> We can get in a macro or inline function, something like this:  
>         for (index = 0; index < ret; index++) {
>                 seq_printf(s, "%-32s %llu\n",
>                            name[index], evtlog[index].telem_evtlog);
> 
>                 if (evtlog[index].telem_evtid == debugfs_conf->pss_idle_id) 
> 		TELEM_PARSE_LOG(debugfs_conf->ioss_d3_id, debugfs_conf->ioss_d0ix_evts , d3_sts , debugfs_conf->ioss_d0ix_data)
> 	If.....
> 

With a shorter alians for debugfs_conf, something like this is much more legible
and far less repetitive (easier to maintain).

> 	}
> 
> #define TELEM_PARSE_LOG (EVTS, BUF, EVT_DATA)     \    
>                         for (int idx = 0; idx < EVTS; idx++) \
>                                	BUF[idx] = (evtlog[index].telem_evtlog >> EVT_DATA[idx].bit_pos) & TELEM_MASK_BIT; \
>                         continue; \
> 
> And something on the same lines for parsing counters.
> 
> Or we could have TELEM_CHECK_AND_PARSE where even the 'if' is moved inside the macro.
> Does that look OK?

I think the above will work, but if you think you can remove some of the
redundancy with a CHECK_AND_PARSE without obfuscating the logic too much, give
it a shot.

-- 
Darren Hart
Intel Open Source Technology Center
