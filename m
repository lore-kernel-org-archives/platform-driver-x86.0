From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] intel_punit_ipc: add NULL check for input parameters
Date: Thu, 14 Jan 2016 14:22:59 -0800
Message-ID: <20160114222259.GB1989@malice.jf.intel.com>
References: <1452249147-34712-1-git-send-email-qipeng.zha@intel.com>
 <20160108112644.4a64e49e@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:33900 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752476AbcANWXD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 14 Jan 2016 17:23:03 -0500
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

My reading of this is different.

A command receives a type and a val. It may or may not also require data in the
"in" buffer, and the caller may or may not provide an out buffer.

The command is issued in any case.

I have merged this to avoid a crash, but we can certainly revisit this if I have
missed something.

-- 
Darren Hart
Intel Open Source Technology Center
