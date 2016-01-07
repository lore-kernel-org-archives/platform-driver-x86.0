From: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Subject: RE: [PATCH v3 1/5] platform:x86: Add Intel Telemetry Core Driver
Date: Thu, 7 Jan 2016 08:55:08 +0000
Message-ID: <5F7315E704FA0841B5DFCE90329B2BB42C0F4EB7@BGSMSX102.gar.corp.intel.com>
References: <1450867350-11253-1-git-send-email-souvik.k.chakravarty@intel.com>
 <20151230005031.GB29978@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:40636 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750707AbcAGIzN convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Jan 2016 03:55:13 -0500
In-Reply-To: <20151230005031.GB29978@malice.jf.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Kasagar, Srinidhi" <srinidhi.kasagar@intel.com>, "Zha, Qipeng" <qipeng.zha@intel.com>, "Muralidhar, Rajeev D" <rajeev.d.muralidhar@intel.com>, "Ghorai, Sukumar" <sukumar.ghorai@intel.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Li, Aubrey" <aubrey.li@intel.com>



> -----Original Message-----
> From: platform-driver-x86-owner@vger.kernel.org [mailto:platform-driver-
> x86-owner@vger.kernel.org] On Behalf Of Darren Hart
> Sent: Wednesday, December 30, 2015 6:21 AM
> To: Chakravarty, Souvik K <souvik.k.chakravarty@intel.com>
> Cc: platform-driver-x86@vger.kernel.org; Kasagar, Srinidhi
> <srinidhi.kasagar@intel.com>; Zha, Qipeng <qipeng.zha@intel.com>;
> Muralidhar, Rajeev D <rajeev.d.muralidhar@intel.com>; Ghorai, Sukumar
> <sukumar.ghorai@intel.com>; Yu, Ong Hock <ong.hock.yu@intel.com>; Li,
> Aubrey <aubrey.li@intel.com>
> Subject: Re: [PATCH v3 1/5] platform:x86: Add Intel Telemetry Core Driver
> 
> On Wed, Dec 23, 2015 at 04:12:30PM +0530, Souvik Kumar Chakravarty wrote:
> > Intel PM Telemetry is a software mechanism via which various SoC PM
> > and performance related parameters like PM counters, firmware trace
> > verbosity, the status of different devices inside the SoC, etc can be
> > monitored and analyzed. The different samples that may be monitored
> > can be configured at runtime via exported APIs.
> >
> > This patch adds the telemetry core driver that implements basic
> > exported APIs.
> >
> > Signed-off-by: Souvik Kumar Chakravarty
> > <souvik.k.chakravarty@intel.com>
> 
> Qipeng, would you please review this series and confirm that you and Souvik
> have aligned on this implementation?

Yes I have already aligned with Qipeng internally for this telemetry PMC resource addition.
> 
> 
> >
> > ---
> > Changes in v3:
> > * Clean code using checkpatch.pl from Kernel v4.3-rc4
> > ---
> > Changes in v2:
> > * Fix issues in code style, indentation & comments
> > * Follow kernel-doc sytle comments
> > * Changed Banner to include "All Rights Reserved"
> > * Change telemetry_plt_config.telem_in_use type to bool
> > * Introduce Default empty platform specific callbacks to remove NULL
> > checks
> > * Use pr_fmt in init
> > * Change to MODULE_LICENSE to GPL
> > ---
> 
> ...
> 
> > +static inline int telemetry_get_pssevtname(enum telemetry_unit
> telem_unit,
> > +					   const char **name, int len)
> > +{
> > +	struct telemetry_unit_config psscfg;
> > +	int i = 0;
> 
> It's a minor nit, but i doesn't need to be initialized here or in the function
> below as its initial value is set in the for loop.
> 
> 
> --
> Darren Hart
> Intel Open Source Technology Center
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86"
> in the body of a message to majordomo@vger.kernel.org More majordomo
> info at  http://vger.kernel.org/majordomo-info.html
