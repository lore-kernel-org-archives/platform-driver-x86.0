Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E603C3DA78
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Jan 2023 10:26:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235285AbjAQK0Z (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 17 Jan 2023 05:26:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236700AbjAQK0Q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Jan 2023 05:26:16 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A828C2BEEB
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jan 2023 02:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673951128;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=d7O8iV4RJXE6HUTbCo+Z6vEPLMU5nWMxJUZepVTKJoo=;
        b=JXjLOKPj/d/ZL5Cfd5HS4SWA9ZJZA7niR2twymonAZ9xus0YJXbIAVCP3/gCpTxfkvsMjQ
        sbNZjAGQ88Gg0vI2tnyvoyIzOIgN0deghBAVVqB2iGgMidZZpXVs2+6jpkB5djwYEXuwAQ
        edqoQF2diBmaupqCjl/+m9fC37gPUdw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-120-28NDERYLPGy2hhvuIjYKaw-1; Tue, 17 Jan 2023 05:25:27 -0500
X-MC-Unique: 28NDERYLPGy2hhvuIjYKaw-1
Received: by mail-ed1-f69.google.com with SMTP id c12-20020a05640227cc00b0049e2c079aabso1857230ede.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jan 2023 02:25:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d7O8iV4RJXE6HUTbCo+Z6vEPLMU5nWMxJUZepVTKJoo=;
        b=3gvKQAE/Th0hM5FiGpmIjhsXbSIU+HzJ52g3Wj+EGzdLUv2krN5rM2tOym2LbFfgOX
         PxlkP215ec5dE4QffYHFuNh7bAk/pCQXtZxXCZzSywLZQ7IYAhum+2+BHzVQ9D7w1XdZ
         6+JGt/u8sQ1ONAo9L9eIq+s9dzr9+fwwNximE+m20PV66i2+nhadsfaqcZBJlt6jH0ng
         Tp56IHZ9POfjSO4jJUsQUR2B5CWOC6ptuRtM7pZb5CELQvSpPM5IpK4mc0sGmDvTzG1Y
         ox2y7KekT+wunyQiv/DxhF5SKvgM3YWuBzMPGfzEbA7U/b6kC574ArIWUwX5C2PBuodC
         I+iA==
X-Gm-Message-State: AFqh2kqViucyo9l6RAX0H/v1A9obbG6lGKBPvznPK28kclZ4TOcydMZK
        ogXyKUkWCericiSZFQ5HrXF7ZwMVYoJtHkWBeeg9avYzbwewcDsZoXnrFd86Okbfwmv926bGypE
        EfGXVP2WO29duUuzwyhkULkaUgoQ4uaLC7g==
X-Received: by 2002:a17:906:a051:b0:870:baa6:6762 with SMTP id bg17-20020a170906a05100b00870baa66762mr2455165ejb.14.1673951126463;
        Tue, 17 Jan 2023 02:25:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv9DbhBbgsy7HTg3cZqZQ1rCRvJRoFdIeXbL/+1bTfHGdPLQE+HclzYls5EyJ3GQ6l+3Md5SA==
X-Received: by 2002:a17:906:a051:b0:870:baa6:6762 with SMTP id bg17-20020a170906a05100b00870baa66762mr2455152ejb.14.1673951126223;
        Tue, 17 Jan 2023 02:25:26 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l18-20020a1709060cd200b0084c723a626csm12844321ejh.209.2023.01.17.02.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 02:25:25 -0800 (PST)
Message-ID: <44e0ef20-d6d3-4c87-1828-f88dbc08e942@redhat.com>
Date:   Tue, 17 Jan 2023 11:25:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 0/2] Expand APU2 driver to 3/4/5/6 models
To:     Philip Prindeville <philipp@redfish-solutions.com>,
        platform-driver-x86@vger.kernel.org, linux-x86_64@vger.kernel.org,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Ed Wildgoose <lists@wildgooses.com>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>
References: <20230113231139.436943-1-philipp@redfish-solutions.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230113231139.436943-1-philipp@redfish-solutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Philip,

On 1/14/23 00:11, Philip Prindeville wrote:
> From: Philip Prindeville <philipp@redfish-solutions.com>
> 
> Extend PCEngines APU2 driver to derivative models APU3, 4, 5
> and 6.
> 
> Of the five, the APU5 is the most dissimilar.  The APU2 is not
> derivative of the APU1, and we call that out in the leds-apu
> driver.  We also clarify the expanded compatibility of the
> pcengines-apuv2 driver in the Kconfig menu.
> 
> We correct some line labeling for GPIO lines 4-6, and we add
> appropriate definitions to the GPIO lines for the APU5 which
> is mapped out differently.
> 
> The majority of the work was done by Ed Wildgoose.  Philip
> Prindeville took over the effort to upstream the fixes and
> made some minor cleanup.

Thank you both for your work on this.

In would really like to hear back from Enrico what he thinks
about these patches. FWIW I'm fine with merging these as is.

Also note that Enrico is listed as maintainer for the 
pcengines-apuv2.c file in MAINTAINERS, so you really should
have Cc-ed him on this.

Enrico, can you take a look at this series please? You can find
the 2 actual patches here:

https://lore.kernel.org/platform-driver-x86/20230113231139.436956-1-philipp@redfish-solutions.com/
https://lore.kernel.org/platform-driver-x86/20230113231140.437040-1-philipp@redfish-solutions.com/

Regards,

Hans


> 
> Philip Prindeville (2):
>   x86: Support APU5 & APU6 in PCEngines platform driver
>   x86: Further PCEngines APU4/5/6 cleanup
> 
>  drivers/leds/leds-apu.c                |   2 +-
>  drivers/platform/x86/Kconfig           |   4 +-
>  drivers/platform/x86/pcengines-apuv2.c | 118 ++++++++++++++++++++++---
>  3 files changed, 107 insertions(+), 17 deletions(-)
> 

