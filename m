Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559FDC4338F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 20 Aug 2021 10:05:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E564610D2
	for <platform-driver-x86@archiver.kernel.org>; Fri, 20 Aug 2021 10:05:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237267AbhHTKF6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 20 Aug 2021 06:05:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32436 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232656AbhHTKF5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Aug 2021 06:05:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629453919;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GG+WwY8t9kNcO21SWNktAH0sK+js5lPhS1V+A4xkDog=;
        b=C1mBatXQ25U6MoCKnPb89CHdqm3jk8KYyX6ea0RE0tdHbQa/EH34lV+EcpGqoms8sPZhnM
        z02u8SHBWPJ1j8EfkKI5tW2zzNmfR8hMGbMNjBWEROLXiSDFoVFvINnzai/s+FGpSp9ELs
        D21bVj7OOTAqyZLcx+C4NSvLr3DNuUc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-KOx4sS8_O6-heOKLL9VB6A-1; Fri, 20 Aug 2021 06:05:18 -0400
X-MC-Unique: KOx4sS8_O6-heOKLL9VB6A-1
Received: by mail-ed1-f71.google.com with SMTP id m16-20020a056402511000b003bead176527so4283034edd.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Aug 2021 03:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GG+WwY8t9kNcO21SWNktAH0sK+js5lPhS1V+A4xkDog=;
        b=il/p5HFkVwTmtMNSx3ZEjTtpS1QDsEKk/MKkw8AG2s+pNZG0+QJGHU1uCOYU0K+SpE
         QYsKkmEHP7ywejwA8WITXCU75fqWjfqutTJExPRWcDBT+zLvqzarb6pX9FTdS8CXK7+e
         zvAocp3NVwGdWdgvcmQjBjWqObr02avSEeXwNIJS+1i8jCW2imOHMNpoejV5vcYrGIrS
         XTVYqSF5/gwj1//Oudy3EETiHREvGHaZwsV8JH4NH4oWckc8fAvbzyWeOQbJBdup8u+u
         TfTPS99IyZjDob5Mq6EPnc9CAJ6MlpTJ4ai9Yzj1y6PriewNsFv/UovtlF/US/eauyPo
         42aA==
X-Gm-Message-State: AOAM5328BXJG9MjdQD2uZkN1wfzh0O5npTO7+gqEdYEnmsHwdg+ckhY5
        VYAs03qJ6gXF/8o4tTM/ggdIeBf1LLdZr2AkkArnJhoPfN1GiDAMWCFjNVA7GE9Ty0lJBToi5d5
        MstDVzl0K/cdxqhKzs5DVxCP4JY6CESEBo3X3ChH6zlYHtcT6Cby1Iq/A4bfJo0ICpC0Y6BGExI
        Ld8EKOSaKbFA==
X-Received: by 2002:aa7:c585:: with SMTP id g5mr21297521edq.340.1629453917373;
        Fri, 20 Aug 2021 03:05:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9BVyOnzAFrOSm0z+04j//k8Vozy/wuvc5CtI84RxVhxfVpOShGX+Kus37622YuYsH3O5EWg==
X-Received: by 2002:aa7:c585:: with SMTP id g5mr21297503edq.340.1629453917234;
        Fri, 20 Aug 2021 03:05:17 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id u17sm508662ejt.39.2021.08.20.03.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Aug 2021 03:05:16 -0700 (PDT)
Subject: Re: [PATCH v4 0/1] asus-wmi: Add support for custom fan curves
To:     "Luke D. Jones" <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc:     hadess@hadess.net, platform-driver-x86@vger.kernel.org
References: <20210820095726.14131-1-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b94a452c-696f-d879-d239-701223c8caff@redhat.com>
Date:   Fri, 20 Aug 2021 12:05:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820095726.14131-1-luke@ljones.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Luke,
On 8/20/21 11:57 AM, Luke D. Jones wrote:
> Add support for custom fan curves found on some ASUS ROG laptops.
> 
> The patch has gone through a few revisions as others tested it and
> requested bahaviour changes or reported issues. V4 should be considered
> finalised for now and I won't submit a new version until V4 has been
> reviewed.
> 
> - V1
>   + Initial patch work
> - V2
>   + Don't fail and remove wmi driver if error from
>     asus_wmi_evaluate_method_buf() if error is -ENODEV
> - V3
>   + Store the "default" fan curves
>   + Call throttle_thermal_policy_write() if a curve is erased to ensure
>     that the factory default for a profile is applied again
> - V4
>   + Do not apply default curves by default. Testers have found that the
>     default curves don't quite match actual no-curve behaviours
>   + Add method to enable/disable curves for each profile

You are sending new revisions pretty fast. I don't really have an issue
with that, but can you let me know when you think this has stabilized
a bit ?  Then I can review it when it is not changing so much anymore :)

Regards,

Hans

