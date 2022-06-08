Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D01CCA47B
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Jun 2022 15:15:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243743AbiFHPPU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Jun 2022 11:15:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244293AbiFHPOX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 11:14:23 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC53412DBF3
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jun 2022 08:06:53 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id r123-20020a1c2b81000000b0039c1439c33cso11226865wmr.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jun 2022 08:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jATA95LsnhYFzxsaTpEfiLLPxPwn/THDoyk5wt0l0nI=;
        b=hbOY8G1cNdcNSM2rz9aqfN80nHdpQjF3stZaJaXKZ1lZ6OvH8TqhGf/WurVi4UR7My
         VVtmf2kO7y8EDorkGEycNEFb/gxL5p1HxdqniF/SCzMt3gGSzLbua7akAAkgGYPjo6RS
         Cp6Z4xJZMXZnN5UtvWBrqFrUqbgoCdjM6B3rhuQsRqbiQnP1UON3jfG+y54PDv3d/inF
         oJC+66zFO6/KhCZzWqtSm5CwwdguT2X2//ldNrfFB8QF9odQhhDBFMfjfo5tUqlJI4/4
         LrfM4vISzALHDnOqMxB1dLF4Iepfdrfzo4oT/FY0dRbeq2/JWHKoGWWS2CdUYldd7qdn
         ge1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jATA95LsnhYFzxsaTpEfiLLPxPwn/THDoyk5wt0l0nI=;
        b=GLZm3gIt58y4hQ0FwOfRNoOjoTP1Iefvtw9fi6ts5+zkqHrL1H/ASBTiVgrTdIWWV/
         XBuX/788hNN9qZpnAyYzupEuTKJl7qrM5c0YsbbHBW00xbqdRlyVqIURTSZooo0G8FCD
         kl7E48peFTMhCOVwp/YXDCd2HFlXPIK9/xn5KU7JGaUsCBWLlY0Xaf2D2EmJIs48dbjL
         lt/Dc7VODqSZKA8ksNpTOZP5A43EEng1nDvva1XuKwJ6+BPq+DFCqvEgHUHmwKLDSrQR
         CZCu+8YHHmt+4YGS9gffdpKE710yqPtPoioRMmfY1T9IemHMURPv8Oe42lx5LwalDoIJ
         oxcQ==
X-Gm-Message-State: AOAM530a6hCzkslVfRAZsN28TXCpvKdZjoXmPenfjXOlr5dIARhSgamw
        d/fu6qbAsoVniaSfkpHJtTiIuA==
X-Google-Smtp-Source: ABdhPJzQqTXDqbgmmxZv/Q2GpTtx2kbX9ghYxOw2jBT+X54NeFZwyWg1HZJNdvhY5FiyH3VIHer5TA==
X-Received: by 2002:a05:600c:1f05:b0:39c:51c6:7c85 with SMTP id bd5-20020a05600c1f0500b0039c51c67c85mr16583501wmb.33.1654700812170;
        Wed, 08 Jun 2022 08:06:52 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id f7-20020a1c3807000000b0039c5b9e9142sm5076671wma.17.2022.06.08.08.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 08:06:51 -0700 (PDT)
Date:   Wed, 8 Jun 2022 16:06:50 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Stephen Kitt <steve@sk2.org>
Cc:     "Lee, Chun-Yi" <jlee@suse.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] platform/x86: compal-laptop: Use backlight helper
Message-ID: <20220608150650.azsobwjurgf34jbm@maple.lan>
References: <20220607184635.1127913-1-steve@sk2.org>
 <20220607184635.1127913-4-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607184635.1127913-4-steve@sk2.org>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Jun 07, 2022 at 08:46:34PM +0200, Stephen Kitt wrote:
> Instead of manually checking the power state in struct
> backlight_properties, use backlight_is_blank().
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> Cc: Cezary Jackiewicz <cezary.jackiewicz@gmail.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Mark Gross <markgross@kernel.org>
> Cc: platform-driver-x86@vger.kernel.org

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
