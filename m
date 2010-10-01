From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 01/10] WMI: remove EC region handler when _WDG parsing
 fails
Date: Fri, 1 Oct 2010 10:00:12 -0700
Message-ID: <20101001170012.GB15390@core.coreip.homeip.net>
References: <20100826071442.7976.93972.stgit@localhost.localdomain>
 <201009121814.37059.carlos@strangeworlds.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:55856 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752025Ab0JARAZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Oct 2010 13:00:25 -0400
Received: by pwj5 with SMTP id 5so608675pwj.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 01 Oct 2010 10:00:24 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <201009121814.37059.carlos@strangeworlds.co.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Carlos Corbacho <carlos@strangeworlds.co.uk>

On Sun, Sep 12, 2010 at 06:14:36PM +0100, Carlos Corbacho wrote:
> On Thursday 26 August 2010 08:14:42 Dmitry Torokhov wrote:
> > Driver initialization was forgetting to remove EC address space handler
> > in cases when parse_wdg() method failed.
> > 
> > Signed-off-by: Dmitry Torokhov <dtor@mail.ru>
> 
> Acked-by: Carlos Corbacho <carlos@strangeworlds.co.uk>
> 

Matthew,

Do you need me to resend the series with Carlos's acks?

Thanks.

-- 
Dmitry
