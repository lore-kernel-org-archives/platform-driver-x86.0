From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] fujitsu-laptop: Use IS_ENABLED() instead of checking for
 built-in or module
Date: Thu, 5 May 2016 13:53:23 -0700
Message-ID: <20160505205323.GB2113@f23x64.localdomain>
References: <1461709697-4152-1-git-send-email-javier@osg.samsung.com>
 <20160427234309.GB9930@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:47740 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754952AbcEEUx2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 5 May 2016 16:53:28 -0400
Content-Disposition: inline
In-Reply-To: <20160427234309.GB9930@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Thu, Apr 28, 2016 at 09:13:09AM +0930, Jonathan Woithe wrote:
> On Tue, Apr 26, 2016 at 06:28:17PM -0400, Javier Martinez Canillas wrote:
> > The IS_ENABLED() macro checks if a Kconfig symbol has been enabled either
> > built-in or as a module, use that macro instead of open coding the same.
> > 
> > Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> Acked-by: Jonathan Woithe <jwoithe@just42.net>

Queued, thank you.
-- 
Darren Hart
Intel Open Source Technology Center
