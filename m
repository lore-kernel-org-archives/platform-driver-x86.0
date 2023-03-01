Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CFBC64EC7
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 10:25:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbjCAKZ6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 05:25:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbjCAKZx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 05:25:53 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1C102CFFC
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 02:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677666306;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6ZLYUXZqwonI8v+FQI4XpW8OdBcNJFxtIhSdARtdUH0=;
        b=Ezv46y8GpvOWniEfiZ/UQFjPsdklv9hmkZcfyHZzqSlxGJg+/TNHzg+b6RvZ4biQrVRGj8
        feu76rjSAgWcfYDI2Fwn2HnU3mU1+TcSGWfymgdbqEaTYcO+MeEePmQ0bQ/DqfVEQ1JZ8z
        sBST4Hc42lXN+uX/qIsvUAtfu5nPjYI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-618-k6rpNjzLPJaIM_VriSbt9w-1; Wed, 01 Mar 2023 05:25:04 -0500
X-MC-Unique: k6rpNjzLPJaIM_VriSbt9w-1
Received: by mail-ed1-f70.google.com with SMTP id b1-20020aa7dc01000000b004ad062fee5eso18306810edu.17
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 02:25:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZLYUXZqwonI8v+FQI4XpW8OdBcNJFxtIhSdARtdUH0=;
        b=agiTYslLzBcX3IiNDO1UUbDe4RNHD9J3KkAnzAXGVob3gkuODtPoUSXtiUFVYvBO4O
         JEdBZY04eIYvGOGCytnJOgyblWQkfZswk0uDP6K9SRD1u3NEY1I538iNWImmmhkuMV6S
         BqMysn0aHNHC/qK2IHeSHJHEHvri932Ukx8EDklhz4gtA0JcdpZO7LjFaUjemVZTgo7G
         CT/McO5Dt25SyA6dbXrMfEntJSGYRRQZ/j5yeNbgoSdvybSUhHGvXfxm1CDB2faGPLF6
         T+eYN9E++ME7sYGcmpJveNlL6myEnF1nOk9AwYFH8BTGCMj0PmMBo2Rn8dFvcLW+G/hP
         B6KQ==
X-Gm-Message-State: AO0yUKXXG1o0r4N8H01Ey/wq/4c+FOu4Y2Wealy3EOkIJz++DAh7QhWM
        rhnMofykERDT9GkQCfl7XLzGD6bGKccdH5AeUZX5OHgCikkFG66FNYJMJwcxm2KV5r0by7jUctG
        5fTOK2lfZpbC7J74ww9/9U36n2qerK54Ctw==
X-Received: by 2002:a17:906:195b:b0:8b1:7ab0:369c with SMTP id b27-20020a170906195b00b008b17ab0369cmr6416277eje.31.1677666303865;
        Wed, 01 Mar 2023 02:25:03 -0800 (PST)
X-Google-Smtp-Source: AK7set+YPK97rfliKW+P1cc+w9cExVjSLu9NcvnHejP3iWcJPUiPUAMiosTxGBz/nFTItyAzuj7X3Q==
X-Received: by 2002:a17:906:195b:b0:8b1:7ab0:369c with SMTP id b27-20020a170906195b00b008b17ab0369cmr6416264eje.31.1677666303647;
        Wed, 01 Mar 2023 02:25:03 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id c21-20020a170906341500b008ecda4510c9sm5716095ejb.146.2023.03.01.02.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 02:25:03 -0800 (PST)
Message-ID: <345ced66-f4ad-58ba-5c55-12e9217e20e3@redhat.com>
Date:   Wed, 1 Mar 2023 11:25:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 04/14] platform/x86: x86-android-tablets: Move DMI
 match table into its own dmi.c file
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20230301092331.7038-1-hdegoede@redhat.com>
 <20230301092331.7038-5-hdegoede@redhat.com>
 <CAHp75VeGF7M76qGpkjcZrWFd-yGmBMaxcvbftUtE6wU9ywFMgQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VeGF7M76qGpkjcZrWFd-yGmBMaxcvbftUtE6wU9ywFMgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/1/23 11:21, Andy Shevchenko wrote:
> On Wed, Mar 1, 2023 at 11:23 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> In order to have a single MODULE_DEVICE_TABLE(dmi, ...), while allowing
>> splitting the board descriptions into multiple files, add a new separate
>> file for the DMI match table.
> 
> ...
> 
>> +#include <linux/dmi.h>
>> +#include <linux/mod_devicetable.h>
> 
> + init.h for __initconst
> 
> + module.h for MODULE_DEVICE_TABLE()

Ack I'll amend this before merging this series.

Weird that MODULE_DEVICE_TABLE() is inside module.h though
and not actually in mod_devicetable.h as the name of both
would suggest.

Regards,

Hans





