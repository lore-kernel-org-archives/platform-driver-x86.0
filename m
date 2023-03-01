Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D97C64EC7
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 10:24:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbjCAKYR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 05:24:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbjCAKYO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 05:24:14 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE22F761
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 02:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677666209;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/dFDPWsz6uFqn8apfCSi5D8A/YenrlYIahusDOKIhtI=;
        b=RUSBL0eIKf8hxr9dMrCcKqFbUd1m9yiK+DMVs+5bq2HV4fCxIIvGfJf1G1mh3hHAPDziG0
        HCUfWpMbqrMfUybdlNIYW44v1gYl4PuFUv4AMvOMGMDjE4od5hlfh/3nFYW1QKE0tOQ3vv
        sum+ws5iVDmtOrt6iecOLComyR2Y8wg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-8lF0nSqrMfCRcofViF112Q-1; Wed, 01 Mar 2023 05:23:28 -0500
X-MC-Unique: 8lF0nSqrMfCRcofViF112Q-1
Received: by mail-ed1-f72.google.com with SMTP id d24-20020a056402401800b004b65da6d5e2so12852382eda.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 02:23:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/dFDPWsz6uFqn8apfCSi5D8A/YenrlYIahusDOKIhtI=;
        b=wNRqPpqUDRXG/xZ4HRWP0hnv/yeHRG87qWvsjTT6wgjZ0sgjohfMRadehL7HyFF11h
         PIynarqCDi4JtP9YhGnUTadwzqRxl9Ng4odAvV/HJl6ZYOg5P6OFJ9o5N+B+vHeEbisK
         5PxaM2YWIaGxw2mtfoiX9JRgXRK6r/I4vtFHMPn98HrrnkVqZiblnFg8CvKThpy7K03o
         QORvfqMYd4MelaRIIfG5SkfziryKX/jG6DUu9THQAZQq0X5DzB2gx04qeAqkao4tEw70
         PtCb315ioiavUL8PN5PkkjY8Zh9O+EK9ANkEHwI6DIX2chgzZWUEEJ1IGUXFXLKuWG/t
         Z2hA==
X-Gm-Message-State: AO0yUKUZgOweRAz4bdHNWX0zNcAaeCqlXwUMKibk3C1ycV440Uvgo2Vl
        NVP9gA9Pniwcvy8krMdtxfU69ts8wmdE9LzGYl3phofUrMhS/4RpUelke6k+NPf999j0wfQk+7Q
        xTKE/xpL6TvPTMaM95xLd4KmSG5H8iP4kuw==
X-Received: by 2002:a17:906:782:b0:8c8:bd1:1d7e with SMTP id l2-20020a170906078200b008c80bd11d7emr5810762ejc.18.1677666207183;
        Wed, 01 Mar 2023 02:23:27 -0800 (PST)
X-Google-Smtp-Source: AK7set8k/6AC6vO/IE9ITRoINbHoTsva8imu96wkrrN6TRRSyUUL9P89/QsUBmIhEm0s+BVfHK49lA==
X-Received: by 2002:a17:906:782:b0:8c8:bd1:1d7e with SMTP id l2-20020a170906078200b008c80bd11d7emr5810751ejc.18.1677666206936;
        Wed, 01 Mar 2023 02:23:26 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a23-20020a50c317000000b004bc59951d6fsm477371edb.57.2023.03.01.02.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 02:23:26 -0800 (PST)
Message-ID: <277eb943-9099-51b0-cc89-ed6208d3d5cb@redhat.com>
Date:   Wed, 1 Mar 2023 11:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 03/14] platform/x86: x86-android-tablets: Move core
 code into new core.c file
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20230301092331.7038-1-hdegoede@redhat.com>
 <20230301092331.7038-4-hdegoede@redhat.com>
 <CAHp75Ve0Mc+ZkSQsqZfgWJuFTaAeB2Y9dw0BdSrojFy+_t6C2g@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Ve0Mc+ZkSQsqZfgWJuFTaAeB2Y9dw0BdSrojFy+_t6C2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/1/23 11:17, Andy Shevchenko wrote:
> On Wed, Mar 1, 2023 at 11:23 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Move the helpers to get irqs + gpios as well as the core code for
> 
> IRQs
> GPIOs

Ack I'll amend the commit msg.

> 
>> instantiating all the devices missing from ACPI into a new core.c file.
> 
> ...
> 
>> +       for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
>> +               gpiod_remove_lookup_table(gpiod_lookup_tables[i]);
> 
> Do we have an API to remove a bunch of tables at once?
> 
> ...
> 
>> +       gpiod_lookup_tables = dev_info->gpiod_lookup_tables;
>> +       for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
>> +               gpiod_add_lookup_table(gpiod_lookup_tables[i]);
> 
> This seems like open coded gpiod_add_lookup_tables().

This is just moving code, not refactoring it. The intend is very much
to NOT make any code changes here.

Regards,

Hans

