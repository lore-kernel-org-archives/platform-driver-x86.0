Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DC7EB64D0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Jun 2023 15:37:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240423AbjFMPhW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 13 Jun 2023 11:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239310AbjFMPhV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jun 2023 11:37:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81E841FCD
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jun 2023 08:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686670549;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XrhOZVeec/db2uALYpez63xq92Ih/dtdSBOBzIwOjR8=;
        b=MLx/ARXx9aEFK11R9mqDf+BPyrcbpRTOak93QWFz/hdABs5G6xrwuDR9+sNjlu1i1VlCBu
        aiJOY5kfEOZHt/QqOwPDsuPVFcAknJ/MwJQ1nye70H5XFy58Gkest5O6iFfwI61hqCrnmM
        e+YbBMgHxUjoy5JWB7ZvLUUa/xCXTLI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-2ntyR8OqOE6To2p6oGe9IA-1; Tue, 13 Jun 2023 11:35:47 -0400
X-MC-Unique: 2ntyR8OqOE6To2p6oGe9IA-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-514abe67064so5305292a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jun 2023 08:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686670546; x=1689262546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XrhOZVeec/db2uALYpez63xq92Ih/dtdSBOBzIwOjR8=;
        b=Pp9EZ79sZBfgVmjq/xbLjxytBoMfwg5bI5u5EXyJa7qmmiLV6GJYI4ifvhf8uZnhHK
         lAMugDZH7laop/FO5wDFC4upgG+8jx+q1uNcFD+ar8AtouKug4eNUEHWBbxiyeMiVZxc
         rJloYcYcZh6Dr+5YARHHWonjSgJ3UsmwtqIjZY5FwT0p2GossFT93zO8WbaEKu7ycW6I
         TTKegje4FRW49UHv6DcTFSpb4hVTM6FCvjbsy5TJvw11ct6hVxnDe5UEr1rvG6bBLLAT
         jXPWMumqU+1tmKYhN+dkreQMWkL5fWBWXG5AsRoYyF/o61EBBXX3gXGFjyCUfXEL24SX
         N82Q==
X-Gm-Message-State: AC+VfDzEyUjL8n6c+VQY616ThTAIUfnj3uZSqgjCu4lFwzHbLXRYt9r6
        7/ksgfOZBUYmaO7XeZ2lASRJiVEjuSq0VsuEdX1iSxbLNanFpADcWRqZxehMFruLIPF1C2u6jXG
        scTJ9YrIt9eJLWMKYafY8RrXS0m+qBT7fRShS8Ttf5A==
X-Received: by 2002:aa7:d49a:0:b0:50b:fd52:2f4b with SMTP id b26-20020aa7d49a000000b0050bfd522f4bmr8767192edr.24.1686670546061;
        Tue, 13 Jun 2023 08:35:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7BMFmVyFJ4lCGDdWS54ulpZZa9F099khds3bj+FjvKlYT50eyMdDe0p3lFuCQ0U4uRG/Fslw==
X-Received: by 2002:aa7:d49a:0:b0:50b:fd52:2f4b with SMTP id b26-20020aa7d49a000000b0050bfd522f4bmr8767175edr.24.1686670545829;
        Tue, 13 Jun 2023 08:35:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id j25-20020aa7c0d9000000b005148f0e8568sm6626969edp.39.2023.06.13.08.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 08:35:45 -0700 (PDT)
Message-ID: <5a6e0086-027b-cf6b-6c89-32aba244c1dd@redhat.com>
Date:   Tue, 13 Jun 2023 17:35:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] platform/x86/dell/dell-rbtn: Fix resources leaking on
 error path
To:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Michal Wilczynski <michal.wilczynski@intel.com>
Cc:     linux-acpi@vger.kernel.org, rafael@kernel.org,
        ilpo.jarvinen@linux.intel.com, pali@kernel.org,
        markgross@kernel.org, fengguang.wu@intel.com,
        dvhart@linux.intel.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230613084310.2775896-1-michal.wilczynski@intel.com>
 <ZIiHaEn7nW7yAFK8@smile.fi.intel.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZIiHaEn7nW7yAFK8@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/13/23 17:12, Andy Shevchenko wrote:
> On Tue, Jun 13, 2023 at 11:43:10AM +0300, Michal Wilczynski wrote:
>> Currently rbtn_add() in case of failure is leaking resources. Fix this
>> by adding a proper rollback. Move devm_kzalloc() before rbtn_acquire(),
>> so it doesn't require rollback in case of failure. While at it, remove
>> unnecessary assignment of NULL to device->driver_data and unnecessary
>> whitespace, plus add a break for the default case in a switch.
> 
>> Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> 
> Isn't also suggested by Pali?
> 
>> Fixes: 817a5cdb40c8 ("dell-rbtn: Dell Airplane Mode Switch driver")
>> Signed-off-by: Michal Wilczynski <michal.wilczynski@intel.com>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Acked-by: Rafael J. Wysocki <rafael@kernel.org>
> 
> ...
> 
> Hans, can it (an additional tag) be folded into applied change?

Done and pushed to review-hans.

Regards,

Hans




