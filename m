From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] intel_punit_ipc: add NULL check for input parameters
Date: Mon, 11 Jan 2016 09:52:29 -0800
Message-ID: <20160111175229.GA10643@malice.jf.intel.com>
References: <1452249147-34712-1-git-send-email-qipeng.zha@intel.com>
 <20160108112644.4a64e49e@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:50492 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760109AbcAKRwb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Jan 2016 12:52:31 -0500
Content-Disposition: inline
In-Reply-To: <20160108112644.4a64e49e@lxorguk.ukuu.org.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc: Qipeng Zha <qipeng.zha@intel.com>, platform-driver-x86@vger.kernel.org, andriy.shevchenko@linux.intel.com, souvik.k.chakravarty@intel.com

On Fri, Jan 08, 2016 at 11:26:44AM +0000, One Thousand Gnomes wrote:
> On Fri,  8 Jan 2016 18:32:27 +0800
> Qipeng Zha <qipeng.zha@intel.com> wrote:
> 
> > intel_punit_ipc_command() maybe called when in or out
> > data pointers are NULL.
> 
> In which case what happens: the command is not issued but there seems to
> be no way for the caller to discover this, and nohing is logged.
> 
> Alan
> 

These functinos are not void, it seems an errcode or a message is in order.

Also, the commit message needs to document in what scenario
intel_punit_ipc_command() may be called with null pointers - and why we consider
that to be OK.

-- 
Darren Hart
Intel Open Source Technology Center
