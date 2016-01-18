From: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Subject: RE: [PATCH v2 0/4] Add Intel Telemetry Support
Date: Mon, 18 Jan 2016 03:01:40 +0000
Message-ID: <5F7315E704FA0841B5DFCE90329B2BB42C0F980D@BGSMSX102.gar.corp.intel.com>
References: <1452594613-20409-1-git-send-email-souvik.k.chakravarty@intel.com>
 <20160114223859.GD1989@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:13746 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752842AbcARDBo convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 17 Jan 2016 22:01:44 -0500
In-Reply-To: <20160114223859.GD1989@malice.jf.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Kasagar, Srinidhi" <srinidhi.kasagar@intel.com>, "Zha, Qipeng" <qipeng.zha@intel.com>, "Muralidhar, Rajeev D" <rajeev.d.muralidhar@intel.com>, "Ghorai, Sukumar" <sukumar.ghorai@intel.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Li, Aubrey" <aubrey.li@intel.com>, "Ginat, David" <david.ginat@intel.com>

Thanks Darren for your patient feedback throughout. This was a lengthy patchset by all counts :)

BR,
Souvik

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Friday, January 15, 2016 4:09 AM
> To: Chakravarty, Souvik K <souvik.k.chakravarty@intel.com>
> Cc: platform-driver-x86@vger.kernel.org; rjw@rjwysocki.net; linux-
> kernel@vger.kernel.org; Kasagar, Srinidhi <srinidhi.kasagar@intel.com>; Zha,
> Qipeng <qipeng.zha@intel.com>; Muralidhar, Rajeev D
> <rajeev.d.muralidhar@intel.com>; Ghorai, Sukumar
> <sukumar.ghorai@intel.com>; Yu, Ong Hock <ong.hock.yu@intel.com>; Li,
> Aubrey <aubrey.li@intel.com>; Ginat, David <david.ginat@intel.com>
> Subject: Re: [PATCH v2 0/4] Add Intel Telemetry Support
> 
> On Tue, Jan 12, 2016 at 04:00:13PM +0530, Souvik Kumar Chakravarty wrote:
> > This set of 4 patches enables PM Telemetry Support for Intel
> > Platforms. Intel PM Telemetry is a software mechanism via which
> > various SoC PM and performance related parameters like PM counters,
> > firmware trace verbosity, the status of different devices inside the
> > SoC, etc can be monitored and analyzed.
> > The statictics are fetched via IPC from the Punit & PMC firmware and
> > hence it depends on the PMC & PUNIT IPC driver. The different samples
> > that may be monitored can be configured at runtime via exported APIs.
> >
> > Currently it supports Intel ApolloLake platform and is intended to be
> > extended to future platforms as well.
> 
> Thank you for sticking with this and seeing it through Souvik, this was an
> unusually long merge process with the dependency on the punit driver and
> the changes in underwent.
> 
> I have queued this to testing. Pending any issues from the CI robots, it'll hit
> next by tomorrow, and still make this merge window.
> 
> 
> --
> Darren Hart
> Intel Open Source Technology Center
