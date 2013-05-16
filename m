From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 2/3] driver: provide sysfs interfaces to access TXT
 config space
Date: Thu, 16 May 2013 18:03:12 +0200
Message-ID: <20130516160311.GA12299@amd.pavel.ucw.cz>
References: <1368465884-14779-1-git-send-email-qiaowei.ren@intel.com>
 <1368465884-14779-3-git-send-email-qiaowei.ren@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:54540 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752163Ab3EPQDO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 16 May 2013 12:03:14 -0400
Content-Disposition: inline
In-Reply-To: <1368465884-14779-3-git-send-email-qiaowei.ren@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Qiaowei Ren <qiaowei.ren@intel.com>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Xiaoyan Zhang <xiaoyan.zhang@intel.com>, Gang Wei <gang.wei@intel.com>, Greg KH <greg@kroah.com>

On Tue 2013-05-14 01:24:43, Qiaowei Ren wrote:
> These interfaces are located in /sys/devices/platform/intel_txt/config,
> and including totally 37 files, providing access to Intel TXT
> configuration registers.

This looks like very wrong interface... equivalent of /dev/mem.

> +What:		/sys/devices/platform/intel_txt/config/STS_raw
> +Date:		May 2013
> +KernelVersion:	3.9
> +Contact:	"Qiaowei Ren" <qiaowei.ren@intel.com>
> +Description:	TXT.STS is the general status register. This read-only register
> +		is used by AC modules and the MLE to get the status of various
> +		Intel TXT features.

This is not enough to allow people to understand what this does/should
do, nor does it allow (for example) ARM people to implement something
compatible.

Is there specific reason why "better" interface is impossible?
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
