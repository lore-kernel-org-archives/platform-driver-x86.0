Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAFDC32793
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Jan 2023 10:21:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbjARKVL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Jan 2023 05:21:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231153AbjARKUb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Jan 2023 05:20:31 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C24F7798E6;
        Wed, 18 Jan 2023 01:25:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 70D31B81C11;
        Wed, 18 Jan 2023 09:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0287FC433EF;
        Wed, 18 Jan 2023 09:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674033952;
        bh=KlUPGKsZLEMxW1G8jfwVen6ljbFd7VXHSO70h2nSXKM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JWCyvuyz7uf/Kb7lnxvy3/MFAUTdmCGWdoadgzJguVTIgKQrgNzrjH+MJuTFboAyp
         DKnAd3xZV0DNSuNHwo3bXRfT8/QYiOKf8g50aZh4fXuYcEwGN8alGYldTcdA/s5wKA
         V7a7dRDlHxBXxx9mNBV75zXOQi/xCXCQxWoFjFN+2GW0XhupAwAQvGOc/IRW23LMaV
         ey18YCyqhbhK6mK8fqgjHsJByTfTsTG720rE1ca+YHzZPQg6BxLVdl3/za/yz92Sjs
         6bbVc5Dhy7M8u0xXmsbB9ULRXztPf71s1oTUhY4jPeuk5DN6U9ayxq8z+E1D8XvKcH
         sfuOk7Obu5H8w==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pI4i0-0001fe-Aa; Wed, 18 Jan 2023 10:26:16 +0100
Date:   Wed, 18 Jan 2023 10:26:16 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Marc Zyngier <maz@kernel.org>, x86@kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>,
        Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Subject: Re: [PATCH v4 07/19] irqdomain: Look for existing mapping only once
Message-ID: <Y8e7OGlPXolkC1+R@hovoldconsulting.com>
References: <20230116135044.14998-1-johan+linaro@kernel.org>
 <20230116135044.14998-8-johan+linaro@kernel.org>
 <87wn5kkfqo.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wn5kkfqo.ffs@tglx>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Jan 17, 2023 at 10:34:07PM +0100, Thomas Gleixner wrote:
> On Mon, Jan 16 2023 at 14:50, Johan Hovold wrote:
> > Avoid looking for an existing mapping twice when creating a new mapping
> > using irq_create_fwspec_mapping() by factoring out the actual allocation
> > which is shared with irq_create_mapping_affinity().
> 
> This changelog is incomplete and it took me a while to figure out why
> this is before the race fix.
> 
> The point is that you need __irq_create_mapping_affinity() later to fix
> the shared mapping race. The double check avoidance is just a nice side
> effect.
> 
> So please spell it out and make it clear that this needs to be
> backported too, e.g. by adding:
> 
> The split out internal function will be used to fix a shared interrupt
> mapping race. This change is therefore tagged with the same fixes tag.
> 
> Fixes: ....

Sure. It was originally part of the fix of the race, but I was told to
clean up the code first (and not worry about backporting).

I'll see what I can do about reordering these again with the aim of
making things easier to backport.

> > +static unsigned int __irq_create_mapping_affinity(struct irq_domain *domain,
> > +						  irq_hw_number_t hwirq,
> > +						  const struct irq_affinity_desc *affinity)
> 
> Please rename to irq_create_mapping_affinity_locked() so it's clear what
> this is about and what the calling convention is. A lockdep assert to
> that effect would be nice too.

Will do.

Johan
