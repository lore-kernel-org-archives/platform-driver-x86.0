Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0918C61DB3
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Jan 2023 19:05:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234748AbjALTFQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Jan 2023 14:05:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232764AbjALTEZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Jan 2023 14:04:25 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B06919295
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 10:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673549037;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S2aFXYUUXHkge7W8/MGCCgS8I5Wxqc/SFMDSZCJN888=;
        b=ZYnU2/SJiKj9/7UV2fsLg3YaxS/DQXPYOZXYrARlWnKCvJ70yPPj+1Ledc7D1RpphZzOIP
        p1oPY0kzOS8Yj/+nVhlzGrzYI8wSeo5nc1hOHY3KX9AhcdZ9ctH6ccb9hYeHErvyqrJgvp
        SnLLSaUUCnFvbqiIwUR9Lgt73E9DtWY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-108-PIPiKJ-8M-uGSr5hHNRxrA-1; Thu, 12 Jan 2023 13:43:55 -0500
X-MC-Unique: PIPiKJ-8M-uGSr5hHNRxrA-1
Received: by mail-ed1-f72.google.com with SMTP id e6-20020a056402190600b0048ee2e45daaso12771019edz.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 10:43:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S2aFXYUUXHkge7W8/MGCCgS8I5Wxqc/SFMDSZCJN888=;
        b=L5w397VVc+k4maPo3TRHz2ZFiA7MyFit98LZShjUCTxFTOoZyiRNKE7XPuXZ+es7PE
         UA7qRSISrXIu9e70R4zgjQWQzuYMck7BkRtowc7g/RFdBVrJ+K15GxZcPxmkzJvVU2sX
         XPlglr4IlVjpmW/5WnhDg9rIWA6OtOLN1tZdSimr+BuSrqDAoBr/RUkQWwCj+0zb0X/l
         qTE6sRlfkJ7KQf+EULnCxMUMhB+o5crKI6W3OSBFezM46Ut9PLXOUJaA5TRvH+uTS9AX
         JjK57Cv+oeuS+JT20ztz1+0nJzYRQlUTCyv1ip0Jcxo2Qme5YeNDyEC60NV70/rMVL5t
         +RWQ==
X-Gm-Message-State: AFqh2kqGcncZ2rM62oV/LLKZYVo47/Z5Rou5EjGqEviqFk+IEVhAk96L
        cY1ope2uvVMdBrKsUrOSpnvDpAFQM82doIQUCNlkOSqH7P9Z67hJYKoiqeBy2T/WAsJ/y4gf/GY
        FFoOsqXwgKaWPbFhk6mmZaM60Hm3BGgxB6A==
X-Received: by 2002:a17:906:a290:b0:7ee:1596:4b6 with SMTP id i16-20020a170906a29000b007ee159604b6mr393336ejz.59.1673549034451;
        Thu, 12 Jan 2023 10:43:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsRlj7neXrGXw6dCYS6B4d2fCmsk9AoOi2yIWAldI7LP7ysnCa+1pA5KqHh1T2kqcpHUONGGw==
X-Received: by 2002:a17:906:a290:b0:7ee:1596:4b6 with SMTP id i16-20020a170906a29000b007ee159604b6mr393324ejz.59.1673549034323;
        Thu, 12 Jan 2023 10:43:54 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id b9-20020a1709063ca900b007c073be0127sm7699073ejh.202.2023.01.12.10.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 10:43:53 -0800 (PST)
Message-ID: <4ad4fcf9-06b5-857c-f5a4-3db72b6f0e1a@redhat.com>
Date:   Thu, 12 Jan 2023 19:43:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/2] simatic-ipc: enable one more board
Content-Language: en-US, nl
To:     Henning Schild <henning.schild@siemens.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20221222103720.8546-1-henning.schild@siemens.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221222103720.8546-1-henning.schild@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/22/22 11:37, Henning Schild wrote:
> This series is rather trivial. It renames a few variables to use the
> product names as known by end users and enables the current driver
> to pick up on a board they also work for.

Thank you for your patch series, I've applied this series
to my fixes branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this series in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans


> 
> Henning Schild (2):
>   platform/x86: simatic-ipc: correct name of a model
>   platform/x86: simatic-ipc: add another model
> 
>  drivers/platform/x86/simatic-ipc.c            | 3 ++-
>  include/linux/platform_data/x86/simatic-ipc.h | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 

