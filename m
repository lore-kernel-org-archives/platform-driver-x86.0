Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D240CE7A89
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Sep 2023 08:58:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232959AbjIYI6y (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Sep 2023 04:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233102AbjIYI6x (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Sep 2023 04:58:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEF29106
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Sep 2023 01:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695632281;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9jYoDjvuIiF2NPGNNFR7POpOKaph301yFE9PJUJP/aA=;
        b=MemK9EdADnGCAN1b67tnx7GPFnfL27xNpEeJ61ctTU+yesSp68QXLRE8AHmv9OrwRIMlFQ
        nuhWB0LbsvKR5ySe06pKwHdjQVhEWlVq3OX/O2ACQnKfhGLHkeiDCWnQpjaijJMeqy4Vyy
        XVWHe7BP2T7++uMxrnKZyWHzKjmy59U=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-srkAMFB3PGup11YB77yIHg-1; Mon, 25 Sep 2023 04:57:59 -0400
X-MC-Unique: srkAMFB3PGup11YB77yIHg-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-532af7e9dc0so4297413a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Sep 2023 01:57:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695632278; x=1696237078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9jYoDjvuIiF2NPGNNFR7POpOKaph301yFE9PJUJP/aA=;
        b=SZ2qfNw8UryM/CESIZCLynN0fTyGzDYOeyO8NZ9kTq3Cm3oSnFebRfFU8NoN3YSQc2
         yu0TecFbp/aOED50LTQgP8ldjS7hX/2okqyxFYYn8bMyMP9pKBSGr5/HAUTfZLYhnHyu
         oeLVaH9kbm7F4qZO6YqbSB7Gt42QpUcCmgtyI7Yp5z+VZ3wrVHHD9woQWmDFjX6HxHpP
         J0GCKzniRR9hHKljN6RImVyv8qpxs0U82rM4R0gNQNAeEkFlVev9HxKOZd8l7rXNH2O1
         dFh3bslz1H4gAqMY+M3sS0fKEE77dOmPsbDIeu7P8z8UC3h8SQ2tAK8lyoXGPg5+EBrA
         y8Yw==
X-Gm-Message-State: AOJu0Yzd5T1JnYHQxoaS3OcbI+an4ynMFsbRqgze8sX0KurRCdeapyvr
        9sn2cZehz+tHHPH05tUpn1iSDSyOKupx3iUl1PkmXInFfDgTJefDTjhzvJ1ZWhDasjdsqpXDS+0
        cf36QhSwBu8nQNgwkNm9ebOJM+hhLrXt5MYljeBVEjd0b
X-Received: by 2002:aa7:d7d4:0:b0:52f:a42a:85a3 with SMTP id e20-20020aa7d7d4000000b0052fa42a85a3mr5145198eds.0.1695632278263;
        Mon, 25 Sep 2023 01:57:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWi9IMy9qmd+fxRBkEfI4zNh3gSWBYXC8dXmPklh/1AUGyK3RZVi4CUBMQfEKDMBdqZ0ZdKg==
X-Received: by 2002:aa7:d7d4:0:b0:52f:a42a:85a3 with SMTP id e20-20020aa7d7d4000000b0052fa42a85a3mr5145189eds.0.1695632277950;
        Mon, 25 Sep 2023 01:57:57 -0700 (PDT)
Received: from [192.168.43.127] ([109.37.149.50])
        by smtp.gmail.com with ESMTPSA id n18-20020a05640206d200b005224d960e66sm5201641edy.96.2023.09.25.01.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 01:57:55 -0700 (PDT)
Message-ID: <74ad10fa-f0f6-f80f-7db3-fb01aae6f2d5@redhat.com>
Date:   Mon, 25 Sep 2023 10:57:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: WARNING at drivers/acpi/platform_profile.c:74 in
 platform_profile_show()
To:     Jiri Slaby <jirislaby@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, hmh@hmh.eng.br,
        Mark Pearson <mpearson-lenovo@squebb.ca>
Cc:     "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Linux kernel mailing list <linux-kernel@vger.kernel.org>
References: <047d3c51-0a9e-4c3e-beef-625a7aa4f3c3@kernel.org>
 <505264f5-cbbb-4ffe-a3e4-93d2397e80da@kernel.org>
 <beeab87b-820a-475a-b0c6-99b1b8e491ea@kernel.org>
 <207922c7-7a56-499b-bbfd-9e8d6a0a06df@kernel.org>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <207922c7-7a56-499b-bbfd-9e8d6a0a06df@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

+Cc Mark Pearson for thinkpad_acpi dytc support

Jiri,

On 9/25/23 09:38, Jiri Slaby wrote:
> On 25. 09. 23, 9:19, Jiri Slaby wrote:
>> But convert_dytc_to_profile() doesn't handle this at all. Do I have a newer DYTC interface? Or a broken one?
> 
>                 Case (0x00)
>                 {
>                     Local1 = 0x0100
>                     Local1 |= 0x80000000
>                     Local1 |= 0x00
>                     Local1 |= 0x01
>                 }
> 
> I.e. version 8.0, it seems.
> 
> Full DSDT for reference:
> https://decibel.fi.muni.cz/~xslaby/n/DSDT.dsl

Mark, can you please take a look at this (it is a thinkpad_acpi dytc issue)?

Jiri, Thank you for all the debugging you have done on this. Can you please file
a bug with the details / summary here:

https://bugzilla.kernel.org/enter_bug.cgi?product=Drivers

Using Platform_x86 as component so that Mark has all the info in one place ?


Regards,

Hans

p.s.

Mark, maybe should add you to the MAINTAINERS section for thinkpad_acpi ?

