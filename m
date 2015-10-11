From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 5/5] intel_scu_ipc: move ipclock to struct
 intel_scu_ipc_dev
Date: Sat, 10 Oct 2015 21:43:49 -0700
Message-ID: <20151011044349.GE2958@malice.jf.intel.com>
References: <1444399896-78599-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <1444399896-78599-5-git-send-email-andriy.shevchenko@linux.intel.com>
 <1444404097.8361.551.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:33987 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750712AbbJKEnv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 11 Oct 2015 00:43:51 -0400
Content-Disposition: inline
In-Reply-To: <1444404097.8361.551.camel@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org

On Fri, Oct 09, 2015 at 06:21:37PM +0300, Andy Shevchenko wrote:
> On Fri, 2015-10-09 at 17:11 +0300, Andy Shevchenko wrote:
> > No need to use global variable for a mutex. Move it to be a member of 
> > SCU IPC
> > device structure.
> 
> This one is wrong, sorry.
> 
> > 
> > While here, protect dev member assignment in ->remove() since user 
> > may
> > potentially call unbind from sysfs even if driver is built-in.
> 
> This part is still right.

OK.

With my minor comment to 1/5 and this change, care to send a v2?

-- 
Darren Hart
Intel Open Source Technology Center
