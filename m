Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A49EC6FA9D
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 14:26:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbjCAO0g (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 09:26:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbjCAO0e (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 09:26:34 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B4C8C667
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 06:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677680738;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=p1xxA/g3d/XLIXQnPY6ZiljHHG+9A/r9H/glUwgfKBk=;
        b=Cq951oZ49mHXnIrkiUAckERcQJEL1ajw//6D82ih22R9u2iLvRNrk/EuHYav1qmUtgXiEM
        oTXhU7yEljdQnIfdLVQttdGMFZ+9IVhFftCV2ZoD8mBpKJyo4IeDH3H0Secp/byEqcypVC
        zgpzRDJZUX4vKE2y3zKRPYvD5Mj+g1c=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-367-ZRj9KHVgMIOvD-_htP5cyg-1; Wed, 01 Mar 2023 09:25:33 -0500
X-MC-Unique: ZRj9KHVgMIOvD-_htP5cyg-1
Received: by mail-ed1-f70.google.com with SMTP id q13-20020a5085cd000000b004af50de0bcfso19699890edh.15
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 06:25:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p1xxA/g3d/XLIXQnPY6ZiljHHG+9A/r9H/glUwgfKBk=;
        b=Iu+PytpKHHx9r9smeobvqh0BA5qdHtO+eEh+KNUfZ6nTSvruWAzwP6JvMVBe2nOexd
         39XRk71d6vAxTcHFLqdtJWNBJq/uRYLqbGTpXNOYp4jWSXEhdI/RMX1gT3RQNYtzP9B/
         VqgeNG/pgA5T6n6YYxdKi20tExYZRo2yej9U6TL8F0MVjSzKM8g1d5ldOl0tn5vNfh/A
         bGcSDir1M+aGvV8okkFBQoE/eDeRDdphA0JIeo5AvJE0mHTMeh2KZc2/LtHBskx9XnDv
         OUZpJkC6pB7xJoVqGYWFzoscs/7GC4N62ysncGnA0iU9qRUwVvxXbIzgsxfSG6ggbW5v
         ajXA==
X-Gm-Message-State: AO0yUKXgQa1PLC9eI3Gzro4ZMidEnKTB+tCRI93cAdYhwNvr3t1Nvw9p
        QyCpFmaJtAtvGbzfu9X+rxbfg5krJ3FLxkOA7UJwxmq/SPrcmxhrWqRRpG1e95OwYJkNBlfBh4c
        5QS3qHCWz8FZRsDSATcUFwRs1Y0oAr0C0Dg==
X-Received: by 2002:a17:907:c608:b0:905:a46b:a725 with SMTP id ud8-20020a170907c60800b00905a46ba725mr2774091ejc.16.1677680730733;
        Wed, 01 Mar 2023 06:25:30 -0800 (PST)
X-Google-Smtp-Source: AK7set9O9aIsAVHbHJ0KNun3k2X/WekzbOYA7pyJYE471Sn/lRHGrI+BPd/P2LWqrh/xnInfa0huMQ==
X-Received: by 2002:a17:907:c608:b0:905:a46b:a725 with SMTP id ud8-20020a170907c60800b00905a46ba725mr2774079ejc.16.1677680730423;
        Wed, 01 Mar 2023 06:25:30 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n27-20020a170906089b00b008be5b97ca49sm5861092eje.150.2023.03.01.06.25.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 06:25:29 -0800 (PST)
Message-ID: <b82fa9d1-fcd6-b214-f0f3-532e7f7d8a00@redhat.com>
Date:   Wed, 1 Mar 2023 15:25:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 02/12] platform/x86: ISST: Add TPMI target
Content-Language: en-US, nl
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230211063257.311746-1-srinivas.pandruvada@linux.intel.com>
 <20230211063257.311746-3-srinivas.pandruvada@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230211063257.311746-3-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/11/23 07:32, Srinivas Pandruvada wrote:
> Add TPMI as one of the device type which can be registered with ISST
> common driver.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Thank I've applied this patches 2-4 to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

These patches are intended for the next rc1. This branch will get
rebased to the next rc1 when it is out and after the rebasing the
contents of review-hans will be pushed to
the platform-drivers-x86/for-next branch.

Please base the next version of this series (minus patches 1-4)
on pdx86/review-hans or if patches 1-4 have landed there on
platform-drivers-x86/for-next .

Regards,

Hans



> ---
>  drivers/platform/x86/intel/speed_select_if/isst_if_common.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_common.h b/drivers/platform/x86/intel/speed_select_if/isst_if_common.h
> index 35ff506b402e..967c338e83c5 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.h
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.h
> @@ -30,7 +30,8 @@
>  
>  #define ISST_IF_DEV_MBOX	0
>  #define ISST_IF_DEV_MMIO	1
> -#define ISST_IF_DEV_MAX		2
> +#define ISST_IF_DEV_TPMI	2
> +#define ISST_IF_DEV_MAX		3
>  
>  /**
>   * struct isst_if_cmd_cb - Used to register a IOCTL handler

