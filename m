Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B4A5C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Feb 2023 09:09:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbjBPJJx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Feb 2023 04:09:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjBPJJv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Feb 2023 04:09:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11CEB5FF0
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Feb 2023 01:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676538544;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=p9DR4bexRQFf0JKakT4CJ/f6SMGR4R/DpDE+VxVG9k8=;
        b=VDAvuHxWHxvj23KUVasYjWLtJ4JW3rdp12d2YF3akEmwnCwyMZggP5dIbWAXEc75H/ALXV
        ls9f+Hz7Ph+oTBDcoFIGTPK4Wnmysq5kUoHMN6X0JZrUUUI3LUq3XzmM5o0jX63i8u70S1
        u/TegIh0T9Ejz1fe+eqTFcal4hVScGw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-76-xUjYuTvtNsWFncVnvNlc7w-1; Thu, 16 Feb 2023 04:08:30 -0500
X-MC-Unique: xUjYuTvtNsWFncVnvNlc7w-1
Received: by mail-ed1-f71.google.com with SMTP id v8-20020a056402348800b004ad062fee5eso1038448edc.17
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Feb 2023 01:08:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p9DR4bexRQFf0JKakT4CJ/f6SMGR4R/DpDE+VxVG9k8=;
        b=beYsdbVPTnj8CMLIj04JW5iVu10+TGwdrEfvGgdtHIrXntX19Riif1SsFlU+tT4ws/
         pxlCGKLJPQmztQdIuOOk3uiZyVEHW2FyJKkAGzIDtmf7JolCdt9ASASzh4RzYYCR7Zt9
         pu22VD8jpXcSuKRJEtdasTT1i0SSn5jA8E3Vbnrk/GYVk0e8RYWLx0MMMJrVunGm5Hee
         M6LMW6/48HNqQAvvVpgrEE6ntgFgn+gxVQMzKzCf/XKP5s4dIoFaVkwL6eUdXnljmApw
         1aooKmc1HlYTiYOTUK54+skjz4yn2qJAcTXAvGTRSzmpMad0fDsbcNueddgAbccWE2Zg
         VDQQ==
X-Gm-Message-State: AO0yUKWeqgo0JwaUHYHThKGHuzi9WiOJxqUzajnStvGENYlu1ImFl0mD
        C6UjD9427KA49ibwZ/zOy+SP5cVlF1MJk9ZHLnqOd+nw1QkvYSqt4uLgnssGLWScaO82imvTPSy
        pAXgZaJOOfCtksc1nsnUV1r00VsKaNhc9Mx+zt8M=
X-Received: by 2002:a17:907:3e26:b0:8af:6c2:1e83 with SMTP id hp38-20020a1709073e2600b008af06c21e83mr1668373ejc.35.1676538508634;
        Thu, 16 Feb 2023 01:08:28 -0800 (PST)
X-Google-Smtp-Source: AK7set9glAHeXQEa1LdyseT31XtIv9qx0xoqBWaGSEihfUQBC5cyn23LFZYvUWGYQBo9RtExYIplzA==
X-Received: by 2002:a17:907:3e26:b0:8af:6c2:1e83 with SMTP id hp38-20020a1709073e2600b008af06c21e83mr1668359ejc.35.1676538508339;
        Thu, 16 Feb 2023 01:08:28 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i1-20020a17090671c100b0087bdae9a1ebsm543503ejk.94.2023.02.16.01.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 01:08:27 -0800 (PST)
Message-ID: <ee826228-3fbb-bf66-b2a1-8e8be2776175@redhat.com>
Date:   Thu, 16 Feb 2023 10:08:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: acerhdf thermal question
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Peter Kaestle <peter@piie.net>,
        Mark Gross <markgross@kernel.org>,
        Paul Gortmaker <paul.gortmaker@windriver.com>
Cc:     "open list:ACER ASPIRE ONE TEMPERATURE AND FAN DRIVER" 
        <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <59c24c3d-eb1e-cdee-3d2e-aa1dda5a96fe@linaro.org>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <59c24c3d-eb1e-cdee-3d2e-aa1dda5a96fe@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Daniel,

On 2/16/23 09:57, Daniel Lezcano wrote:
> 
> Hi,
> 
> the polling interval is specified and modified via a kernel module parameter [1]
> 
> The value is used to change the polling interval of the thermal zone, implying that is accessing the thermal zone device structure internals directly [2]
> 
> In real use case, is the interval changed at runtime? Or just when the module is loaded? If the latter, the interval can be passed to the thermal zone at init time without doing a polling change rate after the thermal zone started. In this case, we can remove the polling_delay_jiffies change in the code and fix the structure leakage in this driver.

I believe this very likely only is used at module load-time.
So the changes you suggest are fine with me.

I have added Paul Gortmaker to the Cc, Paul is the last person
to have done any real (*) work on acerhfd AFAICT.

Paul any objections against making the acerhdf.interval parameter
something which only works when set at boot / module load time
and removing the ability to change it at runtime ?

Regards,

Hans


*) Real as in not related to keeping it aligned with the thermal
framework/core


