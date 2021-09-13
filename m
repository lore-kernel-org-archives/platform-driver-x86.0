Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15826C4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 12:42:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3D3460FDA
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 12:42:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239963AbhIMMnd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Sep 2021 08:43:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59749 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239992AbhIMMnd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Sep 2021 08:43:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631536937;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Mg/EmCtPWeyOh4wdOoeHZdVY6H6bCUhV1DBL93BFrgI=;
        b=Guz4z9dPiAFRHS8FAqM38iJfhhZhRq/fu22xoznbpDDjzWW3JFkELih493K7xWoZw2+SvF
        ATvJvw3eYtp94QjIwzpyNNb9Xx7N3c4gHSvBCAu+TPe4KRYs0Ybgze0Nbz9Z+Y0It54OOL
        MbFzDN5OLywiKFqrkJCanUNuQi3ZS50=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-SwiIP_dBNsiE0kSyLX4Q3w-1; Mon, 13 Sep 2021 08:42:16 -0400
X-MC-Unique: SwiIP_dBNsiE0kSyLX4Q3w-1
Received: by mail-ej1-f71.google.com with SMTP id c25-20020a170906341900b005eea9bf6f4aso2132240ejb.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Sep 2021 05:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Mg/EmCtPWeyOh4wdOoeHZdVY6H6bCUhV1DBL93BFrgI=;
        b=I6qdjfXUv22cBy4ZlpKsrO+XcmV9Q08twb7t7Ntfq92ArNCJtSLh1anOsKBrnH+lKt
         7d42VJgEJNC+yRTZY7ZXHvKW/QH+3Nwa2zAqBvyfO2TEGzVTsbOfM6lNhtmJoJlzRKKZ
         SitHvvDyXqgvHsdXicczeGVk6w8d18XsREidvcRzHO/9LcDyPUUi94SOMuHTmixJ3Z6/
         nMl6QHMU4xZ6FiwgL449rcIrsHm95+lTv7m8TmKEwmRuxFpuTzBgZWi4Ayyd77Yidr+l
         pMMRkJXF7HWpzzGPM3+vAfTkqrsVhuHGOjNPcI6GhAH7ZPs1dilnA5HwmRqOknyVwRZ/
         AOHg==
X-Gm-Message-State: AOAM53154RFWJeMko1kQld/kMZUCM3Ub71dIon4jb03mdGeTOap3IGq6
        wG+G/NtjEAZGfTI02DngJZ+IlHUHQzCAcdUfMXwzdBOZGqGy3M56N/YXNZbqZrU9cgKApfx2y7g
        T/4Czdy4msPiES4TnozOzYL7yUKylV9d2t+txc7MlJ3k2eHQayGTMBZej4r2v11Mg1R/6UXUisq
        oDHuCYb4ypCg==
X-Received: by 2002:a17:906:796:: with SMTP id l22mr12564123ejc.343.1631536935202;
        Mon, 13 Sep 2021 05:42:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVY4/5s9f23C33cwH/wXhURVm7K7WIVsfjEZWc7x5JP1JswWu+5a3aX8rBTWsSyN8n6q7IBA==
X-Received: by 2002:a17:906:796:: with SMTP id l22mr12564094ejc.343.1631536935022;
        Mon, 13 Sep 2021 05:42:15 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id di4sm3884485edb.34.2021.09.13.05.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 05:42:14 -0700 (PDT)
Subject: Re: [PATCH v1] platform/x86: wmi: initialize method name directly
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
References: <20210913110805.12387-1-pobrn@protonmail.com>
 <14e14dd2-a51e-87ae-5776-5f0a585e4936@redhat.com>
 <iEeEte3wo5BG2NCmh5maeSDY6lUKyxcNdSTRMDXkKsClHCr1LkfBFv0OLwpuIr6EHnl2_6QvRmTy9XTAtgTT5vpLWYe1dy6GisNb7-1UjUw=@protonmail.com>
 <f8c3b70a-74ec-15e9-4ee1-dae35e4c803b@redhat.com>
 <hzBz08bOjTWZu618gVKAzEKaxvFF0ng70vA3ddZ9f8sr9_zrK7yZpTgPZ7mzHOVxO6Mj8YCp6E_uMlXIeHRYqE5xrLDKYTcVLG8qwsJZBO0=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <33a381e5-376e-f75d-9e84-201a0aca31ff@redhat.com>
Date:   Mon, 13 Sep 2021 14:42:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <hzBz08bOjTWZu618gVKAzEKaxvFF0ng70vA3ddZ9f8sr9_zrK7yZpTgPZ7mzHOVxO6Mj8YCp6E_uMlXIeHRYqE5xrLDKYTcVLG8qwsJZBO0=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/13/21 2:39 PM, Barnabás Pőcze wrote:
> Hi
> 
> 
> 2021. szeptember 13., hétfő 14:20 keltezéssel, Hans de Goede írta:
>> Hi,
>>
>> On 9/13/21 2:15 PM, Barnabás Pőcze wrote:
>>> Hi
>>>
>>>
>>> 2021. szeptember 13., hétfő 13:53 keltezéssel, Hans de Goede írta:
>>>> In "platform/x86: wmi: introduce helper to generate method names"
>>>> you added a get_acpi_method_name() helper for generating WMI
>>>> method-names and you are using that everywhere else.
>>>>
>>>> IMHO it would be better to also use that here. Is there any
>>>> specific reason why you are not using this here ?
>>>
>>> Yes, indeed, but `get_acpi_method_name()` uses the `object_id` of the GUID block,
>>> this one uses the `notify_id`. And it seemed problematic to find a simple
>>> way to reconcile the differences, so I haven't really given it much thought.
>>> I'm open to suggestions.
>>
>> Ah I see, TBH I liked your original patch just adding sizeof() better
>> then the new one. Or maybe replace the 2 "5"-s used in the snprintf
>> version with WMI_ACPI_METHOD_NAME_SIZE ?
>> [...]
> 
> I will not resend it, but please feel free to apply the older patch if think it is better.
> Personally, I don't like it, but oh well...

In that case I'm just going to leave this as is, thank you for all the
(other) nice cleanups!

Regards,

Hans

