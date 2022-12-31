Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59EECC3DA7A
	for <platform-driver-x86@archiver.kernel.org>; Sat, 31 Dec 2022 11:12:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231994AbiLaLMq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 31 Dec 2022 06:12:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231753AbiLaLMp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 31 Dec 2022 06:12:45 -0500
X-Greylist: delayed 240 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 31 Dec 2022 03:12:42 PST
Received: from mail1.nippynetworks.com (mail1.nippynetworks.com [91.220.24.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2AFA63F9;
        Sat, 31 Dec 2022 03:12:42 -0800 (PST)
Received: from [192.168.105.188] (unknown [212.69.38.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature ECDSA (P-256))
        (No client certificate requested)
        (Authenticated sender: ed@wildgooses.com)
        by mail1.nippynetworks.com (Postfix) with ESMTPSA id 4NkfSp5xWgzTgSw;
        Sat, 31 Dec 2022 11:06:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wildgooses.com;
        s=dkim; t=1672484779;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fZGP1Qhx2XTQSsCAPal35j8VmjXDjZ7oNn4sCXYNdv0=;
        b=kimrguRRAfHkjXMAX9EBoPeyG7PzQwqkz51MtmQJagbvf5HvpqP+bIwdSHY2gMpcy+lrrJ
        yCoo7VeOJpbq6OZZGe0odNDpYStrFZcMfyYZsZM6MP4ZjVaCSu/EoYLmiLbBMnXcwIWA1K
        OUoZAOmBypkJZgxQsC2r1Z1X6n2wntE=
Message-ID: <40bada03-8798-7139-4c43-9e24995f974b@wildgooses.com>
Date:   Sat, 31 Dec 2022 11:06:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/1] apu6: add apu6 variation to apu2 driver family
Content-Language: en-GB
To:     Philip Prindeville <philipp@redfish-solutions.com>,
        platform-driver-x86@vger.kernel.org, linux-x86_64@vger.kernel.org
Cc:     Ed Wildgoose <kernel@wildgooses.com>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>
References: <20221230180715.2785959-1-philipp@redfish-solutions.com>
From:   Ed Wildgoose <ed@wildgooses.com>
In-Reply-To: <20221230180715.2785959-1-philipp@redfish-solutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 30/12/2022 18:07, Philip Prindeville wrote:
> From: Philip Prindeville <philipp@redfish-solutions.com>
>
> Add detection of PC Engines "apu6" platform via DMI.
>
> Also, revise leds-apu.c to call out additional platforms
> which aren't supported.


Any chance of also adding the APU5? Details in my previous patches

Ed W

