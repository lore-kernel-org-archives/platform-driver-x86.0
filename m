Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7585C636CC
	for <platform-driver-x86@archiver.kernel.org>; Sat, 18 Feb 2023 19:17:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjBRTRk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 18 Feb 2023 14:17:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjBRTRj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Feb 2023 14:17:39 -0500
X-Greylist: delayed 187 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 18 Feb 2023 11:17:37 PST
Received: from mail1.nippynetworks.com (mail1.nippynetworks.com [91.220.24.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 869BB149AE;
        Sat, 18 Feb 2023 11:17:37 -0800 (PST)
Received: from [192.168.105.188] (unknown [212.69.38.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ed@wildgooses.com)
        by mail1.nippynetworks.com (Postfix) with ESMTPSA id 4PJyyQ3dR3zTgHX;
        Sat, 18 Feb 2023 19:13:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wildgooses.com;
        s=dkim; t=1676747615;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=N2l5zyrZnPwbgSTrfVUHO7eWAPHe6tU1hBGqXdKVlmQ=;
        b=On6pyPKl/YWmiwVs2nQ6RGf1KCNpvwZUPECvWTuek5HguzCK+Cv1xH5COhZFh0fzLOzMaK
        dlNDvN5YLVX+bFaBccbNGm/+gvEzRMUnxHbV/b+rg15XVwBMVdWYhIlZWXVSlnAs+I5yxc
        tbPrC3gdZEEiQJShVxhHGd2lF9Xu5o0=
Message-ID: <48beb1c5-5136-a287-1a74-bdc558bffe3e@wildgooses.com>
Date:   Sat, 18 Feb 2023 19:14:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v4 0/2] Expand APU2 driver to 3/4/5/6 models
Content-Language: en-GB
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Philip Prindeville <philipp@redfish-solutions.com>,
        platform-driver-x86@vger.kernel.org, linux-x86_64@vger.kernel.org,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>
References: <20230113231139.436943-1-philipp@redfish-solutions.com>
 <44e0ef20-d6d3-4c87-1828-f88dbc08e942@redhat.com>
 <7f5644a8-2e6f-b4c6-4db8-2419d1a7f005@metux.net>
From:   Ed W <lists@wildgooses.com>
In-Reply-To: <7f5644a8-2e6f-b4c6-4db8-2419d1a7f005@metux.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 17/02/2023 12:31, Enrico Weigelt, metux IT consult wrote:
> On 17.01.23 11:25, Hans de Goede wrote:
>
>> Enrico, can you take a look at this series please? You can find
>> the 2 actual patches here:
>>
>> https://lore.kernel.org/platform-driver-x86/20230113231139.436956-1-philipp@redfish-solutions.com/
>> https://lore.kernel.org/platform-driver-x86/20230113231140.437040-1-philipp@redfish-solutions.com/
>
> NAK on renaming the RST lines (at least for the older boards), this will
> break existing applications in the field (I know for sure certain ones I
> wrote myself - and they're used in remote places!)
>
> These lines (at least for the older boards) are supposed to be generic
> RST lines on the mpcie ports - not strictly limited to modems - that's
> why I've chosen this naming.


Sure - but the *wiring* of the RST lines *follows* the modems.

Can you give an example of how you are using the RST line, such that it's naming affects you please?
Hans pointed out that generally it's the number order which is used?

Ed W

