Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22528C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Feb 2022 16:44:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231150AbiBQQoM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Feb 2022 11:44:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiBQQoM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Feb 2022 11:44:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0F052AC
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 08:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645116237;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lkVlv1+WmV4oLPUJhVy8IbqFfd9bmyqHD0S3PYdIfRY=;
        b=QYOSTlmongpMII9lH1xTmORpHo9NGcdyFokAQ7p0wWvKJzU6zRP7d0rUcYT/a+dn1USIl+
        K+uboEPoL8dI0j5Ou+0WjvxXt/rGSu/6PT+VNMfEMaXyDvpENOpPsOtWqmWDNIxZ7m0RXm
        +YE/+pYwZJZobcYAhLughZT3Jxb7HWc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-8mb-mmFKOgSEaTruqrZo_w-1; Thu, 17 Feb 2022 11:43:56 -0500
X-MC-Unique: 8mb-mmFKOgSEaTruqrZo_w-1
Received: by mail-ej1-f69.google.com with SMTP id ky6-20020a170907778600b0068e4bd99fd1so1770579ejc.15
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 08:43:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lkVlv1+WmV4oLPUJhVy8IbqFfd9bmyqHD0S3PYdIfRY=;
        b=iG6G5RgM69WD0UGaunDMAyVka4deF22qEVheSS0j3KV8tvWPi8NTW5thdnn1Lsvv7+
         uWepUce1hb3nxZquMQrmQF1RNK1OqfklC9C7cG3jCsaZGueGc5KpPDsNDs4zUsMZ9ciG
         Xqsf6+2WMR+1JW/PBBHzjJkDuow96GEgZRBZ7lHRi8ZsmddlRtyCIJGkm5PbQJEIhqSG
         wKF+JEtSO3skkGDHiVGU6bFGkBfOmsOTfqm2stGwemHf4D2QcHaQFEoHI2eeqzEVU1wT
         MPPHxVJ1/ATAeYLag+KKwU5uj5kl5VmciW6VgtyRUpmxlLsSU77QtcVKJE8TMVvttmOM
         Ij6A==
X-Gm-Message-State: AOAM5301LO8PdDB18rwU6yEBF7S3SLjjewjnjksG6RT3ZJzA/c5RgYiK
        Q+9wL9MdGvDmhQsKfcE9g328G+OgldmHVfI8cw1QA3mauEPFSQKYXMtGhh2yOIRENCSLZ8aiNt2
        Qx1Vx0ZcWvAF7/Lg38u8FSkz7VYqZmc0mbQ==
X-Received: by 2002:a05:6402:4409:b0:412:aac5:4e48 with SMTP id y9-20020a056402440900b00412aac54e48mr2482533eda.75.1645116234641;
        Thu, 17 Feb 2022 08:43:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7J+iHi+B4vJJz+zclWEIFMQtkntNGI57L4aGQNNolTcsyXCvXzJwrxiuHfCuQveL+KifiRg==
X-Received: by 2002:a05:6402:4409:b0:412:aac5:4e48 with SMTP id y9-20020a056402440900b00412aac54e48mr2482521eda.75.1645116234496;
        Thu, 17 Feb 2022 08:43:54 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id a11sm3341458edu.61.2022.02.17.08.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 08:43:54 -0800 (PST)
Message-ID: <5ce192a8-ced8-0bf1-6825-d65cacfc8b3e@redhat.com>
Date:   Thu, 17 Feb 2022 17:43:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 5.18-rc1
Content-Language: en-US
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "prarit@redhat.com" <prarit@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <cbd2f7727419301acc17c4479b81637829db4c9f.camel@intel.com>
 <3d178ca8-2fa9-1886-a04c-f3722db131eb@redhat.com>
 <CAJZ5v0hdA8YDgHyjV3tXbPwyETRi=EJG_8R6=QX3S9ZtaEV8cg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0hdA8YDgHyjV3tXbPwyETRi=EJG_8R6=QX3S9ZtaEV8cg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Rafael,

On 2/17/22 17:41, Rafael J. Wysocki wrote:
> On Thu, Feb 17, 2022 at 5:39 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> <added the thermal maintainers to the To: list>
>>
>> On 2/15/22 20:21, Pandruvada, Srinivas wrote:
>>> Hi Hans,
>>>
>>> Please check the pull request for intel-speed-select tool.
>>>
>>> To build the tool, we have dependency on linux-next commit
>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/thermal?h=next-20220215&id=e4b1eb24ce5a696ef7229f9926ff34d7502f0582
>>
>> Hmm, that means that if I merge this into pdx86/for-next which
>> is based on 5.17-rc1 then this won't build, which is bad.
>>
>> So I'm going to either need some immutable branch from the
>> thermal maintainers to merge into pdx86/for-next,
>> or we can just merge the intel-speed-select changes through
>> the thermal tree for the 5.18-rc1 merge window.
> 
> That can be done.
> 
>> Either way is fine with me.
> 
> OK

Thanks for the quick reply.

If you don't have any preference I think it makes sense to merge
the intel-speed-select changes through the thermal tree for
the 5.18-rc1 merge window, as the changes tot he tool build on
kernel work done there.

Regards,

Hans

