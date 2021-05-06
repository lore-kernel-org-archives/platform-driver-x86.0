Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 841CAC433B4
	for <platform-driver-x86@archiver.kernel.org>; Thu,  6 May 2021 09:38:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C93A6112F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  6 May 2021 09:38:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233296AbhEFJjt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 6 May 2021 05:39:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45194 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232982AbhEFJjs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 May 2021 05:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620293930;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=p52RRVDShx6NwBL9aQkjgj+5ixdcF28Fa0Bi2oa7Re8=;
        b=Y74+q95l+avRgtjVgovZ1GVmy81xk7ftI5l543OAkCFY+3V4hjzyaj0TIz72oKI85dajGt
        7DVYSuuDVEHy/i8RuoLt+Z2mW5GG+7izqlmcmexvxsLZz51lQmIN1NTHJGlKmQj+4gxWWk
        T9FsI5lcv+nAXQSRLIObGNtdsfk7bCM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-pFbsybx8N0S9Cjbi7mUC6Q-1; Thu, 06 May 2021 05:38:49 -0400
X-MC-Unique: pFbsybx8N0S9Cjbi7mUC6Q-1
Received: by mail-ed1-f70.google.com with SMTP id d8-20020a0564020008b0290387d38e3ce0so2342812edu.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 May 2021 02:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p52RRVDShx6NwBL9aQkjgj+5ixdcF28Fa0Bi2oa7Re8=;
        b=Qmho2Nvuefs1eU0sJrL+g3wu6iAXUEcOM8i0DWR01GJq11pbBq4p8LemY48UGQvUCy
         w9QAeUMLO3dSBWN3iClmN3IHeUMLsSjfLJ6KkVFLhl9JbfjIQJbeplUcSvEl8wvhUgxk
         0+o41f9+TURhTTntc2Nxii0xfQsGNzKHOEhPqVrFYbg9qivAZyY+5xmbZcSePQyxid5q
         U/sTYUjGNYIRwYCtH8u0Ld/sOWt3OpZSimG0fJf7+3V4cIKE/S1zMLrZKwAYmdVxZ+g/
         hqulgPufdG/tq/LHjjEKJaqkzybYIrRR8cjDydzfNgP3n8Ie5VvygFheyz8gfVhPi0Wm
         43Nw==
X-Gm-Message-State: AOAM532RIE4IqsOo9ERQ541/Sa9To+HbMXxOAzJswVas60iZXLBETDZG
        c9Z8Al7Z4M6ODvoK/N8VLuMwvGxHqfXFqo5IS5DVd3rIRsMoJ3lLSsXkNg3jOTNrNQLnhCgICge
        u7MB19BeXQ2HmKZxnpuGgp+kHjoa20ac4KA==
X-Received: by 2002:aa7:d84e:: with SMTP id f14mr4064232eds.220.1620293927880;
        Thu, 06 May 2021 02:38:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+4qyVOHI06BR7s1AYqjMSV9ZbPDO6ac3yUuTtnTY2Clx45ALcLve0fnR6T0PF02cdmOccWQ==
X-Received: by 2002:aa7:d84e:: with SMTP id f14mr4064221eds.220.1620293927722;
        Thu, 06 May 2021 02:38:47 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e4sm1015832ejh.98.2021.05.06.02.38.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 May 2021 02:38:47 -0700 (PDT)
Subject: Re: [PATCH v7 1/7] MAINTAINERS: Add Advantech AHC1EC0 embedded
 controller entry
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Campion Kang <campion.kang@advantech.com.tw>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        AceLan Kao <chia-lin.kao@canonical.com>
References: <20210506081619.2443-1-campion.kang@advantech.com.tw>
 <6b86bd36-b934-c204-9e56-079ab8cd4b54@redhat.com>
 <CAHp75VdPmkKTf_fbjAjrD3GC1ZZLuYsTJa0QtA3tuYtWwCgPMQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <cf181436-152c-7cd8-76cf-350705cd2bcb@redhat.com>
Date:   Thu, 6 May 2021 11:38:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VdPmkKTf_fbjAjrD3GC1ZZLuYsTJa0QtA3tuYtWwCgPMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/6/21 11:23 AM, Andy Shevchenko wrote:
> On Thu, May 6, 2021 at 11:48 AM Hans de Goede <hdegoede@redhat.com> wrote:
>> I'm replying here since this series has no cover-letter, for
>> the next version for a series touching so many different
>> sub-systems it would be good to start with a cover-letter
>> providing some background info on the series.
>>
>> I see this is binding to an ACPI device, yet it is also using
>> devicetree bindings and properties.
>>
>> So I take it this means that your ACPI tables are using the
>> optional capability of embedded device-tree blobs inside the
>> ACPI tables ?
>>
>> That is an unusual combination on a x86 device, note it is
>> not wrong
> 
> It's actually not okay. We have agreed at some point with DT people,
> that ACPI should not use non-native variants of natively supported
> things. For example, it shouldn't use "interrupt" property for IOxAPIC
> (or xIC) provided interrupts, rather Interrupt() has to be used and so
> on.

Right, but that is not the case here, they are using 2 device-tree
properties (1), from patch 3/7:

+properties:
+  compatible:
+    const: advantech,ahc1ec0
+
+  advantech,hwmon-profile:
+    description:
+      The number of sub-devices specified in the platform. Defines for the
+      hwmon profiles can found in dt-bindings/mfd/ahc1ec0-dt.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+
+  advantech,has-watchdog:
+    description:
+      Some implementations of the EC include a watchdog used to monitor the
+      system. This boolean flag is used to specify whether this watchdog is
+      present or not. Default is true, otherwise set to false.
+    type: boolean


>> but AFAIK you are the first to do this on x86.
> 
> No, not the first. Once Intel tried to invent the pin control
> configuration and muxing properties in ACPI, it was luckily rejected
> (ACPI 6.x OTOH provides a set of special resources for that).
> 
> So, NAK from me, *if* it's really the case. ACPI tables must be revisited.

AFAIK Advantech are not defining things for which an ACPI standard exists,
although these 2 properties might just as well may be 2 simple ACPI integer
methods, which would actually make things a bit simpler (.e.g it would
allow dropping patch 2/7 and 3/7 from the set).

Campion, any reason why you went this route; and can the ACPI tables
still be changed? 

Regards,

Hans

