From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 5/5] intel_scu_ipc: move ipclock to struct
 intel_scu_ipc_dev
Date: Mon, 12 Oct 2015 11:02:32 +0300
Message-ID: <1444636952.8361.556.camel@linux.intel.com>
References: <1444399896-78599-1-git-send-email-andriy.shevchenko@linux.intel.com>
	 <1444399896-78599-5-git-send-email-andriy.shevchenko@linux.intel.com>
	 <1444404097.8361.551.camel@linux.intel.com>
	 <20151011044349.GE2958@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:53888 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751157AbbJLICr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 12 Oct 2015 04:02:47 -0400
In-Reply-To: <20151011044349.GE2958@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org

On Sat, 2015-10-10 at 21:43 -0700, Darren Hart wrote:
> On Fri, Oct 09, 2015 at 06:21:37PM +0300, Andy Shevchenko wrote:
> > On Fri, 2015-10-09 at 17:11 +0300, Andy Shevchenko wrote:
> > > No need to use global variable for a mutex. Move it to be a 
> > > member of 
> > > SCU IPC
> > > device structure.
> > 
> > This one is wrong, sorry.
> > 
> > > 
> > > While here, protect dev member assignment in ->remove() since 
> > > user 
> > > may
> > > potentially call unbind from sysfs even if driver is built-in.
> > 
> > This part is still right.
> 
> OK.
> 
> With my minor comment to 1/5 and this change, care to send a v2?

Will do later this week.
Also I will update message of the patch 4 as you suggested.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
