Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A01C64ED6
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 10:43:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjCAKnz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 05:43:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjCAKny (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 05:43:54 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C85912048
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 02:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677667386;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qdW0FTle9rXqOJD2r0nBOTrRRGbhrb3zKJVXvfnmtxU=;
        b=SjC3QXZDRMGgejmHSpiXlFMyID21/Nd6iJywmnzJ/chEKkbkPGYF6+5wn0CjQlgKrtmXv4
        zczfuyFxo/0u7JZwU0km7OObcnB5lfeyO65z6u5A79EgWwJQ1IUPMDtrgs8YzVezZR9/Gc
        2M3sgsIMSuOnvJF1a8bbdskDrAL8jLo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-154-J_q7_mxyP3-zbo9NtbGOhg-1; Wed, 01 Mar 2023 05:43:05 -0500
X-MC-Unique: J_q7_mxyP3-zbo9NtbGOhg-1
Received: by mail-ed1-f71.google.com with SMTP id w11-20020a05640234cb00b004b3247589b3so15963724edc.23
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 02:43:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qdW0FTle9rXqOJD2r0nBOTrRRGbhrb3zKJVXvfnmtxU=;
        b=1engtzIysLqXRAuuQ5SLZdFf36xiCAvFU3wvLxO/2SW++c4kIk9nm2JQEt4CIcbuHi
         M3vaRBc8zJMQ6AK1t8UE7E5EyWuNTHLfkBDt04/etO7ZS8jbzbOg8KRFnOjIuWO6PEy1
         CadHeQMQz2KV9jPEUnNFbvP6TJt7T8lEd0y4w6Jti6U2ebXpu5FW9Sc3d+m/yOPqEVGV
         YGsrLxQZyKtnPYgLCpiZStMaChFAZLBtK6F4pMyaxi99HZSxm/xScNt6rq1xiMMFZHcI
         ePYGybBtzk2Z/d/Bej+Ajx+2fYOgYEjmjVhFGElo+sZtbezKj/LI4g2MH8RyXF6lVMGY
         aG8w==
X-Gm-Message-State: AO0yUKX5un8bZS1wVaCV7eeUyGEGWUqkZMiEpDgyOl6ifpndwdhyn2xB
        pW47SupBH7GeS9yXOVvG2+ebFma1g1bdEti9uyC6hnpdmcVOyrVkpkNTZ1723rbN6r3zUZkbB5k
        uNXFA6rDY80XQnHUrdSoDklaglK10oeXJZw==
X-Received: by 2002:a17:906:6589:b0:8f2:bd2f:e321 with SMTP id x9-20020a170906658900b008f2bd2fe321mr7094575ejn.45.1677667383952;
        Wed, 01 Mar 2023 02:43:03 -0800 (PST)
X-Google-Smtp-Source: AK7set9WYypnISZnMo/MQ7iG3qcPyI8w3L7/v7/rlIEzNga6h6DrZghuUQuqY3RSUHYlDhmvMWzNCg==
X-Received: by 2002:a17:906:6589:b0:8f2:bd2f:e321 with SMTP id x9-20020a170906658900b008f2bd2fe321mr7094564ejn.45.1677667383730;
        Wed, 01 Mar 2023 02:43:03 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gk22-20020a17090790d600b009063799cc7bsm552903ejb.16.2023.03.01.02.43.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 02:43:03 -0800 (PST)
Message-ID: <b3a17140-7681-341e-9d5a-625b60b2776b@redhat.com>
Date:   Wed, 1 Mar 2023 11:43:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 05/14] platform/x86: x86-android-tablets: Move shared
 power-supply fw-nodes to a separate file
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20230301092331.7038-1-hdegoede@redhat.com>
 <20230301092331.7038-6-hdegoede@redhat.com>
 <CAHp75Vf2b0M2orKaixe-G1KA98ec67GQnhLb-01_U2Lj4yzyzQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vf2b0M2orKaixe-G1KA98ec67GQnhLb-01_U2Lj4yzyzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/1/23 11:31, Andy Shevchenko wrote:
> On Wed, Mar 1, 2023 at 11:23 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Move the shared power-supply fw-nodes and related files to
>> a new separate shared-psy-info.c file.
> 
> ...
> 
>> +#include <linux/kernel.h>
> 
> Hmm... What's for?

I think I added this for ARRAY_SIZE, but I see that is not used
in this file, I'll drop it before merging this series.

Regards,

Hans

