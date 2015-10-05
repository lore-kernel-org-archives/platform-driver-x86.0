From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] platform: acer-wmi: update notice about deprecated user
 interface
Date: Mon, 5 Oct 2015 18:30:02 +0800
Message-ID: <20151005103002.GC2151@linux-rxt1.site>
References: <1443509198-11655-1-git-send-email-martink@posteo.de>
 <20150929095032.GF2115@linux-rxt1.site>
 <20151003172052.GF110874@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:40722 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752657AbbJEKaO (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
	Mon, 5 Oct 2015 06:30:14 -0400
Content-Disposition: inline
In-Reply-To: <20151003172052.GF110874@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Martin Kepplinger <martink@posteo.de>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Darren, 

On Sat, Oct 03, 2015 at 10:20:52AM -0700, Darren Hart wrote:
> On Tue, Sep 29, 2015 at 05:50:32PM +0800, joeyli wrote:
> > Hi Martin, 
> > 
> > On Tue, Sep 29, 2015 at 08:46:38AM +0200, Martin Kepplinger wrote:
> > > Signed-off-by: Martin Kepplinger <martink@posteo.de>
> > > ---
> > > This just looks odd in the logs. Feel free to ignore it or act on it
> > > differently ;)
> > > 
> > > 
> > 
> > Thanks for your patch and it reminds me to remove those interfaces in acer-wmi.
> > Please let me check and I am thinking direct remove those interfaces.
> 
> Joey, I will wait to hear from you on this patch (or a replacement).
> 
> Thanks,
>

Thanks for your reminding. I just sent patch to remove sysfs interface of acer-wmi.

Joey Lee
