From: "Zha, Qipeng" <qipeng.zha@intel.com>
Subject: RE: [PATCH v3 1/5] platform:x86: Add Intel Telemetry Core Driver
Date: Fri, 8 Jan 2016 01:00:11 +0000
Message-ID: <C6287702A945AC47BE5DB5DFD4B5C6DD03844C45@SHSMSX104.ccr.corp.intel.com>
References: <1450867350-11253-1-git-send-email-souvik.k.chakravarty@intel.com>
 <20151230005031.GB29978@malice.jf.intel.com>
 <5F7315E704FA0841B5DFCE90329B2BB42C0F4EB7@BGSMSX102.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:51303 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753498AbcAHBAP convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Jan 2016 20:00:15 -0500
In-Reply-To: <5F7315E704FA0841B5DFCE90329B2BB42C0F4EB7@BGSMSX102.gar.corp.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>, Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Kasagar, Srinidhi" <srinidhi.kasagar@intel.com>, "Muralidhar, Rajeev D" <rajeev.d.muralidhar@intel.com>, "Ghorai, Sukumar" <sukumar.ghorai@intel.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Li, Aubrey" <aubrey.li@intel.com>

> -----Original Message-----
> From: platform-driver-x86-owner@vger.kernel.org 
> [mailto:platform-driver- x86-owner@vger.kernel.org] On Behalf Of 
> Darren Hart
> Sent: Wednesday, December 30, 2015 6:21 AM
> To: Chakravarty, Souvik K <souvik.k.chakravarty@intel.com>
> Cc: platform-driver-x86@vger.kernel.org; Kasagar, Srinidhi 
> <srinidhi.kasagar@intel.com>; Zha, Qipeng <qipeng.zha@intel.com>; 
> Muralidhar, Rajeev D <rajeev.d.muralidhar@intel.com>; Ghorai, Sukumar 
> <sukumar.ghorai@intel.com>; Yu, Ong Hock <ong.hock.yu@intel.com>; Li, 
> Aubrey <aubrey.li@intel.com>
> Subject: Re: [PATCH v3 1/5] platform:x86: Add Intel Telemetry Core 
> Driver
> 
> On Wed, Dec 23, 2015 at 04:12:30PM +0530, Souvik Kumar Chakravarty wrote:
> > Intel PM Telemetry is a software mechanism via which various SoC PM 
> > and performance related parameters like PM counters, firmware trace 
> > verbosity, the status of different devices inside the SoC, etc can 
> > be monitored and analyzed. The different samples that may be 
> > monitored can be configured at runtime via exported APIs.
> >
> > This patch adds the telemetry core driver that implements basic 
> > exported APIs.
> >
> > Signed-off-by: Souvik Kumar Chakravarty 
> > <souvik.k.chakravarty@intel.com>
> 
> Qipeng, would you please review this series and confirm that you and 
> Souvik have aligned on this implementation?

> Yes I have already aligned with Qipeng internally for this telemetry PMC resource addition.
Yes,  I think it's ok for the PMC resource additition.
