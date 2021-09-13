Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF3AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 12:20:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 700ED60FC1
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 12:20:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239955AbhIMMV5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Sep 2021 08:21:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47956 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239953AbhIMMV4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Sep 2021 08:21:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631535640;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y8/3J7pFrTJpyuP8qq3dKglI8dHdJRdkHfWngEdXxOI=;
        b=TVS6dwFJBbMEXOHrJ1iK530GUsWzSbWWwCl4Z1IGI/PG2k2Yw/8zS3PaRRpwXiCCLuVoWx
        Bkw23d0DNDWztLL+di5KMBv0kyTvojAy85yr6FtVn4WqIK8H8MAMqcMH4VIUU5q1gKzdXV
        bTm8qhznUJxZZIjH3SM6Bo/7yCPDt6E=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-Z55hgJv_OYSde4y_Pxkq8g-1; Mon, 13 Sep 2021 08:20:39 -0400
X-MC-Unique: Z55hgJv_OYSde4y_Pxkq8g-1
Received: by mail-ej1-f72.google.com with SMTP id s11-20020a170906060b00b005be824f15daso3592479ejb.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Sep 2021 05:20:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y8/3J7pFrTJpyuP8qq3dKglI8dHdJRdkHfWngEdXxOI=;
        b=zdOkaAcsVC8/4GDdUmRAl+QtnoHvLfmetcq07QbCTNWZHpRewghHqj5ZxfQlQysg8O
         ft+lZrZk6ZfaVMVTVfXo3K8Ebn5bICXfapssWzTMBmcKv1GYoa6+kmmhKrJY0o6agY6B
         JUC1kSQTY3FJ9rYannQrSZhh4KkG3RoZlzhXn7lf8uLdNXcdSfC8EA14+t53J9JfYAPP
         I1agVcBgFyXe2Bh7XA4jsOB58supMq45Bo1W37h477FAHTy90uzeLM0rn5EgfYa0tY0J
         Aiv+lgxZ0UYHOlYfyzCvRsXOI7xrxEAbzMYnAmKU+YE6YgD40slJbuml+ghrn1E3C/WP
         /HUw==
X-Gm-Message-State: AOAM531uYfGiVdllxnlBUUT2SmwWJcOyggYjKWAV8QQUjmSWgyRWXpi4
        wtUihMkbxoCmONmJ3tZlUWAhhB5BOV6nhwZ9WeB8XjcH3bmj4UkqopvsbJTkmc6ZGeDbpUh3Jpy
        htHx61dzPCLnwgPXALt1k9fkU6XSSqdv3srPKIBxGtKpFMP8pc5izqsh4DB5MBfjKyweax3l6IQ
        d/SQ17Py0CKQ==
X-Received: by 2002:a17:906:4994:: with SMTP id p20mr12392195eju.38.1631535638031;
        Mon, 13 Sep 2021 05:20:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6soRYWJxA6L75CtB1h396sxvICVUNYkWWuB6+s4QuUa50IoGTvOhVOIQA0c5v7/TAfPmRrg==
X-Received: by 2002:a17:906:4994:: with SMTP id p20mr12392163eju.38.1631535637760;
        Mon, 13 Sep 2021 05:20:37 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id b2sm3425559ejj.124.2021.09.13.05.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 05:20:37 -0700 (PDT)
Subject: Re: [PATCH v1] platform/x86: wmi: initialize method name directly
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
References: <20210913110805.12387-1-pobrn@protonmail.com>
 <14e14dd2-a51e-87ae-5776-5f0a585e4936@redhat.com>
 <iEeEte3wo5BG2NCmh5maeSDY6lUKyxcNdSTRMDXkKsClHCr1LkfBFv0OLwpuIr6EHnl2_6QvRmTy9XTAtgTT5vpLWYe1dy6GisNb7-1UjUw=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f8c3b70a-74ec-15e9-4ee1-dae35e4c803b@redhat.com>
Date:   Mon, 13 Sep 2021 14:20:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <iEeEte3wo5BG2NCmh5maeSDY6lUKyxcNdSTRMDXkKsClHCr1LkfBFv0OLwpuIr6EHnl2_6QvRmTy9XTAtgTT5vpLWYe1dy6GisNb7-1UjUw=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/13/21 2:15 PM, Barnabás Pőcze wrote:
> Hi
> 
> 
> 2021. szeptember 13., hétfő 13:53 keltezéssel, Hans de Goede írta:
>> In "platform/x86: wmi: introduce helper to generate method names"
>> you added a get_acpi_method_name() helper for generating WMI
>> method-names and you are using that everywhere else.
>>
>> IMHO it would be better to also use that here. Is there any
>> specific reason why you are not using this here ?
> 
> Yes, indeed, but `get_acpi_method_name()` uses the `object_id` of the GUID block,
> this one uses the `notify_id`. And it seemed problematic to find a simple
> way to reconcile the differences, so I haven't really given it much thought.
> I'm open to suggestions.

Ah I see, TBH I liked your original patch just adding sizeof() better
then the new one. Or maybe replace the 2 "5"-s used in the snprintf
version with WMI_ACPI_METHOD_NAME_SIZE ?

Regards,

Hans

