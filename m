From: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Subject: RE: [PATCH] intel_punit_ipc: add NULL check for input parameters
Date: Tue, 12 Jan 2016 03:59:04 +0000
Message-ID: <5F7315E704FA0841B5DFCE90329B2BB42C0F5B78@BGSMSX102.gar.corp.intel.com>
References: <1452249147-34712-1-git-send-email-qipeng.zha@intel.com>
 <20160108112644.4a64e49e@lxorguk.ukuu.org.uk>
 <20160111175229.GA10643@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:29984 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760856AbcALD7J convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Jan 2016 22:59:09 -0500
In-Reply-To: <20160111175229.GA10643@malice.jf.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc: "Zha, Qipeng" <qipeng.zha@intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>



> -----Original Message-----
> From: platform-driver-x86-owner@vger.kernel.org [mailto:platform-driver-
> x86-owner@vger.kernel.org] On Behalf Of Darren Hart
> Sent: Monday, January 11, 2016 11:22 PM
> To: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
> Cc: Zha, Qipeng <qipeng.zha@intel.com>; platform-driver-
> x86@vger.kernel.org; andriy.shevchenko@linux.intel.com; Chakravarty,
> Souvik K <souvik.k.chakravarty@intel.com>
> Subject: Re: [PATCH] intel_punit_ipc: add NULL check for input parameters
> 
> On Fri, Jan 08, 2016 at 11:26:44AM +0000, One Thousand Gnomes wrote:
> > On Fri,  8 Jan 2016 18:32:27 +0800
> > Qipeng Zha <qipeng.zha@intel.com> wrote:
> >
> > > intel_punit_ipc_command() maybe called when in or out data pointers
> > > are NULL.
> >
> > In which case what happens: the command is not issued but there seems
> > to be no way for the caller to discover this, and nohing is logged.
> >
> > Alan
> >
> 
> These functinos are not void, it seems an errcode or a message is in order.
> 
> Also, the commit message needs to document in what scenario
> intel_punit_ipc_command() may be called with null pointers - and why we
> consider that to be OK.

Darren,
In Punit IPC, all of the commands do not need an Input parameter; similarly all cmds do not need an output parameter(eg setting events).
Telemetry uses all the flavors. (This fix is already there in our internal codebase for a long time, but somehow got missed during upstreaming).
So this is not an error condition & the API needs to handle all cases properly. 
> 
> --
> Darren Hart
> Intel Open Source Technology Center
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86"
> in the body of a message to majordomo@vger.kernel.org More majordomo
> info at  http://vger.kernel.org/majordomo-info.html
