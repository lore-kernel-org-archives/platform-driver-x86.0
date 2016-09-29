From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] sony-laptop: add new thermal control handle and setting
Date: Wed, 28 Sep 2016 17:00:33 -0700
Message-ID: <20160929000033.GA12156@f23x64.localdomain>
References: <20160913134109.5614-1-lkml@stefanseidel.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:45814 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754295AbcI2AAh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Sep 2016 20:00:37 -0400
Content-Disposition: inline
In-Reply-To: <20160913134109.5614-1-lkml@stefanseidel.info>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Stefan Seidel <lkml@stefanseidel.info>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

On Tue, Sep 13, 2016 at 01:41:09PM +0000, Stefan Seidel wrote:
> On at least the SVD11 there is an additional thermal control handle that
> is found at a different handle address but otherwise behaves the same as
> the other one. This patch also introduces an additional thermal control
> setting "cooling", which, however, may not be available on all platforms.
> 

Thanks Stefan, and sorry for the long delay.

These sound like to two distinct functional changes to the driver. Is there a
compelling reason to merge them together in one patch? (I suspect not)

Please split these apart and submit separately.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
