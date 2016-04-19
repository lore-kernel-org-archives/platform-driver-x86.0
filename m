From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform:x86 decouple telemetry driver from the optional
 IPC resources
Date: Tue, 19 Apr 2016 14:17:19 -0700
Message-ID: <20160419211719.GD1899@f23x64.localdomain>
References: <1459452489-46827-1-git-send-email-aubrey.li@linux.intel.com>
 <CAHp75VeKgVwOQ7U9=a92hcts8tPJriRtNJ3h2nHL_BXVXc7D5Q@mail.gmail.com>
 <570A5948.8000405@linux.intel.com>
 <20160415003236.GA3232@f23x64.localdomain>
 <57104F92.9060908@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:42961 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753852AbcDSVRV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 Apr 2016 17:17:21 -0400
Content-Disposition: inline
In-Reply-To: <57104F92.9060908@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Li, Aubrey" <aubrey.li@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, qipeng.zha@intel.com, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Apr 15, 2016 at 10:18:58AM +0800, Li, Aubrey wrote:
> On 2016/4/15 8:32, Darren Hart wrote:
> > On Sun, Apr 10, 2016 at 09:46:48PM +0800, Li, Aubrey wrote:
> >> On 2016/4/10 21:17, Andy Shevchenko wrote:
> >>> On Thu, Mar 31, 2016 at 10:28 PM, Aubrey Li <aubrey.li@linux.intel.com> wrote:
> >>>> Currently the optional IPC resources prevent telemetry driver from
> >>>> probing if these resources are not in ACPI table. This patch decouples
> >>>> telemetry driver from these optional resources, so that telemetry driver
> >>>> has dependency only on the necessary ACPI resources.
> >>>
> >>> Darren, I have comments as well.
> >>>
> >>>>
> >>>> Signed-off-by: Aubrey Li <aubrey.li@linux.intel.com>

Lacking any additional follow-up, I've queued this to fixes for 4.6.

-- 
Darren Hart
Intel Open Source Technology Center
