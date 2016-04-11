From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform:x86 decouple telemetry driver from the optional
 IPC resources
Date: Sun, 10 Apr 2016 23:48:21 -0700
Message-ID: <20160411064821.GA14283@dvhart-mobl5.amr.corp.intel.com>
References: <1459452489-46827-1-git-send-email-aubrey.li@linux.intel.com>
 <20160410024513.GA18689@dvhart-mobl5.amr.corp.intel.com>
 <C6287702A945AC47BE5DB5DFD4B5C6DD039027C0@SHSMSX104.ccr.corp.intel.com>
 <5F7315E704FA0841B5DFCE90329B2BB42CAC7024@BGSMSX102.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5F7315E704FA0841B5DFCE90329B2BB42CAC7024@BGSMSX102.gar.corp.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Cc: "Zha, Qipeng" <qipeng.zha@intel.com>, Aubrey Li <aubrey.li@linux.intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Apr 11, 2016 at 04:04:55AM +0000, Chakravarty, Souvik K wrote:
> 
> 
> > -----Original Message-----
> > From: Zha, Qipeng
> > Sent: Monday, April 11, 2016 7:34 AM
> > To: Darren Hart <dvhart@infradead.org>; Aubrey Li
> > <aubrey.li@linux.intel.com>; Chakravarty, Souvik K
> > <souvik.k.chakravarty@intel.com>
> > Cc: platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: RE: [PATCH] platform:x86 decouple telemetry driver from the
> > optional IPC resources
> > 
> > >> Currently the optional IPC resources prevent telemetry driver from
> > >> probing if these resources are not in ACPI table. This patch
> > >> decouples telemetry driver from these optional resources, so that
> > >> telemetry driver has dependency only on the necessary ACPI resources.
> > >>
> > >> Signed-off-by: Aubrey Li <aubrey.li@linux.intel.com>
> > 
> > >Given the impact to their recent contributions, I'm looking for reviews from
> > Qipeng and Souvik before I merge this.
> > 
> > >Qipeng, as the listed maintainer for these two files, I particularly need to
> > hear from you.
> > 
> > >Thanks,
> > 
> > Hi Darren,  I think this is a reasonable solution for such issue.
> > Thanks Aubrey for this fixing patch.
> 
> We went over this internally once. So OK from my POV.

Qipeng and Souvik, I appreciate the responses.

As a point of process, I won't include a "Reviewed-by:" unless you explicitly
include it in your response.

-- 
Darren Hart
Intel Open Source Technology Center
