From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] tc1100-wmi: Delete an unnecessary check before the
 function call "kfree"
Date: Fri, 26 Jun 2015 16:04:02 -0700
Message-ID: <20150626230402.GA57818@vmdeb7>
References: <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <558DA7C8.6060003@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:52574 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751940AbbFZXED (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 26 Jun 2015 19:04:03 -0400
Content-Disposition: inline
In-Reply-To: <558DA7C8.6060003@users.sourceforge.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Fri, Jun 26, 2015 at 09:28:08PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 26 Jun 2015 21:21:16 +0200
> 
> The kfree() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Queued, thanks.

-- 
Darren Hart
Intel Open Source Technology Center
