Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEEF7ECAAD2
	for <platform-driver-x86@archiver.kernel.org>; Fri, 26 Aug 2022 09:36:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343866AbiHZJgp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 26 Aug 2022 05:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343844AbiHZJgj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Aug 2022 05:36:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A9D8B991
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Aug 2022 02:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661506594;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=d4/Ci/khIJqvY1ZTEwT9xKh84mAJli5YDL8Ohl8+57g=;
        b=dcA1BUE2uESzx6z0tQZLZWE8sPXBWHaKChpfKnVYqK/tDCmKl0wwFK/00zsWaxe13Wt97H
        RNJRByvjQ0Z8/uM5Nk7oRQRKUunfXzKnWBDt8TWhhoHWYLAIZGc3F2qSPfbRIUV0COj8B6
        UTDhyKQZCTXVOrfWmgF3aDnkljZFud4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-y_qpMUJEP2KLRv6GgPG-DQ-1; Fri, 26 Aug 2022 05:36:33 -0400
X-MC-Unique: y_qpMUJEP2KLRv6GgPG-DQ-1
Received: by mail-ed1-f70.google.com with SMTP id w20-20020a05640234d400b00447e6ffefccso839319edc.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Aug 2022 02:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=d4/Ci/khIJqvY1ZTEwT9xKh84mAJli5YDL8Ohl8+57g=;
        b=Rob1HXXOPDXpbdhDOy0L8syWCJcIAmsKKE+bEiA8LtM6AKzUrX/YBRBdAlY4NAzVYX
         mX0t3k05EBd+Jgrv0OLQuzHXEbdhAntPt++J2jVisg2q77TUSZYZgCkkHZ6Afn0TmLjZ
         +OL8JtZYxgAl9pNlKI2SniEiaec5vNktd7u6kLNf02NxY0clFY5MOe/FbZzuf6KSLW8X
         CMuF2EjnZIjGN0rB8LD7deTLRSGuA6c2M2au/11VLR9uhIQJcB5W2uJfoFyXHyXhCj9s
         32tDj2YDhimVWeqtKhl9tHhEMYJaQMuULiRjPBl7qGJH6YG0Xa4mRF8lN1+gxWUDaAnr
         jPPA==
X-Gm-Message-State: ACgBeo1EQb4ZIO96J3hLGtvOZtkjusO1io26k5bmvMtOaEKnruAbjE2h
        3g4rzCmXzIC220MQT29r9XaWgJZr3l26ZGjWIIeGHRHHZu1j6QR7v1w0y00gz+M9Eq4FMAmSqoJ
        I8uId8lAV3zxe6DoKpKRLkVghVZAvZRB9Gg==
X-Received: by 2002:a17:907:c0d:b0:730:a85d:8300 with SMTP id ga13-20020a1709070c0d00b00730a85d8300mr4971733ejc.558.1661506591615;
        Fri, 26 Aug 2022 02:36:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5kxGZb3ZhrTbQ0gfMwjXjGnkLWP/526iVnTkZAjGN/4PMhWRlwvzmS6Ghf8S7K237BNvp91Q==
X-Received: by 2002:a17:907:c0d:b0:730:a85d:8300 with SMTP id ga13-20020a1709070c0d00b00730a85d8300mr4971719ejc.558.1661506591396;
        Fri, 26 Aug 2022 02:36:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id b7-20020aa7c907000000b004478e9ab2c5sm984570edt.69.2022.08.26.02.36.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 02:36:30 -0700 (PDT)
Message-ID: <9ad59946-a061-92ca-8f9d-af2068abc1f6@redhat.com>
Date:   Fri, 26 Aug 2022 11:36:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 0/2] asus-wmi: Modify fn+f5 and support GPU fan
Content-Language: en-US
To:     "Luke D. Jones" <luke@ljones.dev>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220826004210.356534-1-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220826004210.356534-1-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/26/22 02:42, Luke D. Jones wrote:
> Some TUF laptops have both fan_boost and thermal_throttle, and some in that
> group may not actually have an effect on one or the other - this patch series
> adjusts behaviour to try both. There doesn't appear to be any consistency
> to check for so far.
> 
> Some laptops can also control the GPU fan between auto and boost.
> 
> Changelog:
> - V2
> + Rebase on review-hans
> 
> Luke D. Jones (2):
>   asus-wmi: Modify behaviour of Fn+F5 fan key
>   asus-wmi: Support the GPU fan on TUF laptops

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

