From: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Subject: RE: [PATCH 1/4] platform:x86: Add Intel Telemetry Core Driver
Date: Fri, 18 Sep 2015 04:29:59 +0000
Message-ID: <5F7315E704FA0841B5DFCE90329B2BB42AD0053F@BGSMSX102.gar.corp.intel.com>
References: <5F7315E704FA0841B5DFCE90329B2BB42ACFE57A@BGSMSX102.gar.corp.intel.com>
 <20150917175441.GB12959@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:40047 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751422AbbIREcI convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Sep 2015 00:32:08 -0400
In-Reply-To: <20150917175441.GB12959@vmdeb7>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Kasagar, Srinidhi" <srinidhi.kasagar@intel.com>, "Zha, Qipeng" <qipeng.zha@intel.com>, "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>

OK I will resend the set of patches.
Some encoding could have been messed up as I did an intermediate copy of the patches via Windows based editor.

BR,
Souvik

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Thursday, September 17, 2015 11:25 PM
> To: Chakravarty, Souvik K <souvik.k.chakravarty@intel.com>
> Cc: platform-driver-x86@vger.kernel.org; Kasagar, Srinidhi
> <srinidhi.kasagar@intel.com>; Zha, Qipeng <qipeng.zha@intel.com>
> Subject: Re: [PATCH 1/4] platform:x86: Add Intel Telemetry Core Driver
> 
> On Mon, Sep 14, 2015 at 10:12:28AM +0000, Chakravarty, Souvik K wrote:
> > Intel PM Telemetry is a software mechanism via which various SoC PM
> > and performance related parameters like PM counters, firmware trace
> > verbosity, the status of different devices inside the SoC, etc can be
> > monitored and analyzed. The different samples that may be monitored
> > can be configured at runtime via exported APIs.
> >
> > This patch adds the telemetry core driver that implements basic
> > exported APIs.
> >
> > CC: Srinidhi Kasagar <srinidhi.kasagar@intel.com>
> >
> > Signed-off-by: Souvik Kumar Chakravarty
> > <souvik.k.chakravarty@intel.com>
> 
> Hi Souvik,
> 
> These all fail initial tests and application due to some strange character
> encoding or something. Please try to download these from the mailing list and
> apply them yourself to determine what's wrong and resubmit.
> 
> For example:
> 
> ERROR: patch seems to be corrupt (line wrapped?)
> #72: FILE: arch/x86/include/asm/intel_telemetry.h:11:
> or
> 
> ERROR: spaces required around that '=' (ctx:WxV)
> #83: FILE: arch/x86/include/asm/intel_telemetry.h:22:
> +       TELEM_PSS =3D 0,
> 
> the 3D after every = character repeats many many times.
> 
> --
> Darren Hart
> Intel Open Source Technology Center
