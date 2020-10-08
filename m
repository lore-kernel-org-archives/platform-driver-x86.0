Return-Path: <SRS0=7IVD=DP=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1ABC433E7
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Oct 2020 07:29:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AC0C2184D
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Oct 2020 07:29:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PyZni2Zi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725888AbgJHH3R (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Oct 2020 03:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbgJHH3Q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Oct 2020 03:29:16 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DF22C061755
        for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2020 00:29:16 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id d3so5401814wma.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Oct 2020 00:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=83OQc7yj1ycxNTqltziVLrghBwISxh6MY5DYj2Gusr8=;
        b=PyZni2Zig8mPvwxEQBVJ4I67bKxcD4vwVJR47XIlRlSXEuOUq4n7MVlTpfNC0GWLDH
         l4T6OetvE+jrEHdNqux3z2DndvxLy6QNO7lAMKBKHqYds/8Jqrlp46ktC+THd1G3FbPa
         +JphX/earyN9jx2cjoo7ywgYLcju/BZOHSAP+PUQLRWZROopETRrIckziHxV0vfdzQSP
         i2ARfAOYhLWpEHsiYf0+Ace0FQsVF7JVIfNtfnRuxDCArmnIerEuaUc9JtLm7DHSB0F5
         ubxE0k94gwYz8Y8702i1x9AUVudi1Sbw2p7VOrK060w6EHqch1a7hnkwNLGK6J6IPLVf
         4S8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=83OQc7yj1ycxNTqltziVLrghBwISxh6MY5DYj2Gusr8=;
        b=flC4YQ6z/Man/KWPZkllbTyt6zie82rGeIByVfjqlJFSk/NwxGlBcfhg3VGFzyKVhZ
         g6N3rRENutGZbo4OkPZkM9xU2E5PAgxN+limV/+/FldANHpCzOtbauhH3nA8R16CPdiE
         EeiJebNAe7n72XykRVZ4ZQZYUe2zFRjhjW+SJZvsjccdc2weEMQmx5YWEqJof7FUffLo
         9UysFanlSIAWZe6CBQnwYNC2XK0odS558KhX3UKUtc4ykEI1UgNQ/3CNR+4iYBW/cl8Z
         PJ4zavmoEMihbegBetzPgna9sRyiSViQW5GNCFcDYp3ibPtmRGTlqkLC7+gxV91UVQK4
         z1nA==
X-Gm-Message-State: AOAM533+6Y0cLzOG87kGDSZTpEBF3WNJLW3t+07+YzL9YergBE8gsbF3
        qIRC4pGrLNh1O1MilpFRZSqvHMdU9x6b4g==
X-Google-Smtp-Source: ABdhPJyuC3XwwRXUfeZuE1phg/rUbjcM5TrrxmGrK81G52/bQqiA/CR6+U3wLYGb34QTxTgS95ZQkw==
X-Received: by 2002:a1c:28a:: with SMTP id 132mr7184593wmc.9.1602142155147;
        Thu, 08 Oct 2020 00:29:15 -0700 (PDT)
Received: from dell ([91.110.221.232])
        by smtp.gmail.com with ESMTPSA id 1sm6266201wre.61.2020.10.08.00.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 00:29:14 -0700 (PDT)
Date:   Thu, 8 Oct 2020 08:29:12 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "David E. Box" <david.e.box@linux.intel.com>,
        Bjorn Helgaas <helgaas@kernel.org>, dvhart@infradead.org,
        andy@infradead.org, bhelgaas@google.com,
        alexey.budankov@linux.intel.com,
        Andy Shevchenko <andy.shevchenko@gmail.com>, rjw@rjwysocki.net,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: Re: [PATCH V8 1/5] PCI: Add defines for Designated Vendor-Specific
 Extended Capability
Message-ID: <20201008072912.GE1763265@dell>
References: <20201007005118.GA3230211@bjorn-Precision-5520>
 <dcaea6b4e1d5b4a452c304fadb034b7b1e1c40af.camel@linux.intel.com>
 <20201007065451.GB6148@dell>
 <e09f4c44-e3d0-e14b-297f-6981516ea3bf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e09f4c44-e3d0-e14b-297f-6981516ea3bf@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 07 Oct 2020, Hans de Goede wrote:

> Hi,
> 
> On 10/7/20 8:54 AM, Lee Jones wrote:
> > On Tue, 06 Oct 2020, David E. Box wrote:
> > 
> > > On Tue, 2020-10-06 at 19:51 -0500, Bjorn Helgaas wrote:
> > > > On Tue, Oct 06, 2020 at 03:45:54PM -0700, David E. Box wrote:
> > > > > Hi Bjorn,
> > > > > 
> > > > > This patch has been acked and unchanged for weeks. Is it possible
> > > > > to
> > > > > get this pulled into next? We have SIOV and CXL related work that
> > > > > is
> > > > > using these definitions. Thanks.
> > > > 
> > > > I acked it because I expected you to merge it along with the rest of
> > > > the series.
> > > > 
> > > > I guess I could merge this patch via the PCI tree if you really want,
> > > > but that ends up being a hassle because we have to worry about which
> > > > order things get merged to Linus' tree.  Better if the whole series
> > > > is
> > > > merged via the same tree.
> > > 
> > > Agreed. The hope is that this series is ready for the next merge window
> > > but no ack yet on V8. And if the series does not make it I'd like this
> > > patch to at least get in.
> > 
> > If Bjorn is happy to take this patch so late in the release cycle then
> > please go ahead.  The other patches are due for v5.11.
> 
> I agree (that the other patches are for 5.11) talking about merging
> this series patch 2 is a mfd patch and patches 3-5 are drivers/platform/x86
> patches.
> 
> Lee, FYI I'm taking over drivers/platform/x86 maintainership from Andy.

Congratulations, Hans.

> I suggest that we merge the entire series through a single tree
> (with acks or reviewed-by-s from the other maintainer)
> either through the mfd tree or through the drivers/platform/x86
> tree. Since most changes are in drivers/platform/x86 the latter
> probably makes more sense, but either way works for me.
> So how would you like to proceed with this series ?

I'm happy either way, but bear in mind that, due to the intrinsic
heterogeneous nature of MFD, I already have infrastructure to easily
apply (and send pull-requests for) cross-subsystem patch-sets.

If however, you decide that you'd really like to take the set, that's
also fine but I will require a pull-request from an immutable branch.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
