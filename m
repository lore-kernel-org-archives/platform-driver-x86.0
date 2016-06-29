From: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Subject: RE: [PATCH] platform:x86 Remove Monitor MWAIT feature dependency
Date: Wed, 29 Jun 2016 03:03:02 +0000
Message-ID: <5F7315E704FA0841B5DFCE90329B2BB42CAE856B@BGSMSX102.gar.corp.intel.com>
References: <1466665198-14446-1-git-send-email-ong.hock.yu@intel.com>
 <1466665198-14446-2-git-send-email-ong.hock.yu@intel.com>
 <20160628202353.GJ3837@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:1938 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752450AbcF2DDK convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Jun 2016 23:03:10 -0400
In-Reply-To: <20160628202353.GJ3837@f23x64.localdomain>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, "Yu, Ong Hock" <ong.hock.yu@intel.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Wednesday, June 29, 2016 1:54 AM
> To: Yu, Ong Hock <ong.hock.yu@intel.com>
> Cc: Chakravarty, Souvik K <souvik.k.chakravarty@intel.com>; platform-driver-
> x86@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] platform:x86 Remove Monitor MWAIT feature
> dependency
> 
> On Thu, Jun 23, 2016 at 02:59:58PM +0800, ong.hock.yu@intel.com wrote:
> > From: "Yu, Ong Hock" <ong.hock.yu@intel.com>
> >
> > Telemetry capability does not depend on Monitor MWAIT feature.
> >
> > Signed-off-by: Yu, Ong Hock <ong.hock.yu@intel.com>
Acked-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>

> 
> Souvik, any objection?
Seems reasonable, since I have not heard anything break from the Chrome guys as well.

> 
> > ---
> >  drivers/platform/x86/intel_telemetry_debugfs.c | 2 +-
> > drivers/platform/x86/intel_telemetry_pltdrv.c  | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
