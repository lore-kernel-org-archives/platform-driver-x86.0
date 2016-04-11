From: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Subject: RE: [PATCH] platform:x86 decouple telemetry driver from the
 optional IPC resources
Date: Mon, 11 Apr 2016 04:04:55 +0000
Message-ID: <5F7315E704FA0841B5DFCE90329B2BB42CAC7024@BGSMSX102.gar.corp.intel.com>
References: <1459452489-46827-1-git-send-email-aubrey.li@linux.intel.com>
 <20160410024513.GA18689@dvhart-mobl5.amr.corp.intel.com>
 <C6287702A945AC47BE5DB5DFD4B5C6DD039027C0@SHSMSX104.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <C6287702A945AC47BE5DB5DFD4B5C6DD039027C0@SHSMSX104.ccr.corp.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Zha, Qipeng" <qipeng.zha@intel.com>, Darren Hart <dvhart@infradead.org>, Aubrey Li <aubrey.li@linux.intel.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org



> -----Original Message-----
> From: Zha, Qipeng
> Sent: Monday, April 11, 2016 7:34 AM
> To: Darren Hart <dvhart@infradead.org>; Aubrey Li
> <aubrey.li@linux.intel.com>; Chakravarty, Souvik K
> <souvik.k.chakravarty@intel.com>
> Cc: platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: RE: [PATCH] platform:x86 decouple telemetry driver from the
> optional IPC resources
> 
> >> Currently the optional IPC resources prevent telemetry driver from
> >> probing if these resources are not in ACPI table. This patch
> >> decouples telemetry driver from these optional resources, so that
> >> telemetry driver has dependency only on the necessary ACPI resources.
> >>
> >> Signed-off-by: Aubrey Li <aubrey.li@linux.intel.com>
> 
> >Given the impact to their recent contributions, I'm looking for reviews from
> Qipeng and Souvik before I merge this.
> 
> >Qipeng, as the listed maintainer for these two files, I particularly need to
> hear from you.
> 
> >Thanks,
> 
> Hi Darren,  I think this is a reasonable solution for such issue.
> Thanks Aubrey for this fixing patch.

We went over this internally once. So OK from my POV.
