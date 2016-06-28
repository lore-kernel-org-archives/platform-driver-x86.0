From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] fujitsu-laptop: Add support for eco LED
Date: Tue, 28 Jun 2016 11:09:08 -0700
Message-ID: <20160628180908.GH3837@f23x64.localdomain>
References: <20160621080918.GA3333@Matej-PC.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:38927 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752071AbcF1SJJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Jun 2016 14:09:09 -0400
Content-Disposition: inline
In-Reply-To: <20160621080918.GA3333@Matej-PC.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matej Groma <matejgroma@gmail.com>
Cc: jwoithe@just42.net, platform-driver-x86@vger.kernel.org

On Tue, Jun 21, 2016 at 10:09:21AM +0200, Matej Groma wrote:
> There is an indicator LED signaling activated power saving mode
> on certain Fujitsu laptop models. This has currently no use on Linux.
> Export it to userspace.

Hi Matej,

Thanks for your patch. I was going to point out the checkpatch failures in
codingstyle, but you were probably as consistent as you could be given the state
of this driver and it's rather inconsistent use of whitespace.

Queued to testing for 4.8.

-- 
Darren Hart
Intel Open Source Technology Center
