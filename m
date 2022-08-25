Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FC4C32774
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 Aug 2022 15:31:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242838AbiHYPbe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 Aug 2022 11:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243193AbiHYPa6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Aug 2022 11:30:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B231A2AC6A
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Aug 2022 08:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661441430;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gVqNU9nbAhYoofJ8D6CEouXOZWbpliHhuWlKT+GWGVo=;
        b=G6nVuLuVpEtEU5whgIHUUP82tfDb9NCVpV5jBih8Q7THEN5fmxOdf3kbFQ5iyiB3r1ln3T
        yt+vdh9wbHeFJcY5RCG+fE83D14wfjd9wMao421w+bg8/86KJAPmfK64NBNfnKmVLyUyWI
        kLZ6FshTYqxzChiUiFlSgx9MpFN+EcA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-669-gDTMZJbJOsK8_3TYMylTaQ-1; Thu, 25 Aug 2022 11:30:28 -0400
X-MC-Unique: gDTMZJbJOsK8_3TYMylTaQ-1
Received: by mail-ej1-f69.google.com with SMTP id qf15-20020a1709077f0f00b0073d6dfb7556so4288107ejc.12
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Aug 2022 08:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=gVqNU9nbAhYoofJ8D6CEouXOZWbpliHhuWlKT+GWGVo=;
        b=n0JloMMVbHQFPGQrTL47bFz6GrJgWchDdE/SFSYh0SfLejnZlxjPbcdTDhYUaUIXY3
         u70SixcaWvBvU7Oo9e7U0QjWMUhg10cxmkDqh7+aZRtk4uJb6+jhB0zFQMPay32sX0si
         Jg+M4QWDNfzAPChkqxWr4lhtfmBTmF3rlV0SkTkwaifwRMpZj3U+v2tv8y6ibA6Ew8M/
         6ld0viMpTP+raHFjBEnsoZeIa9x5yA35xTyNrqyJfyY//0GKSDh38Z4Kh/cCqaNl9Ni8
         8OH5BYmpi6VJR4WmisVWxRSvrK0lLB0rFwLuwq7PuQQK6D9bnnHWlNZwO158N7bpGrsD
         DRXw==
X-Gm-Message-State: ACgBeo0K2eI+buHMSb+PlSsVOiWV5aUJsMMbpELXhhy9Enn6UY5kRHNA
        2aGXGXsRUsfnR7VSpwqu1cmPWF60iSLfAqWUkxpmZjvPI92Y3J8Mw/Y0/j9e5X//snH8Ydbx3ZK
        OOsAc9WEl28QcpVooJLJ4QPQ5zy9zDKhkFQ==
X-Received: by 2002:aa7:d4d8:0:b0:447:a745:4b18 with SMTP id t24-20020aa7d4d8000000b00447a7454b18mr3797546edr.174.1661441427437;
        Thu, 25 Aug 2022 08:30:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7ZVCg7LiK9gvITeSDthwihuVJqrUTMoGalVi5iKXU9iZEj4JgqUHeXLU+ifSVBOc2CAUx9vw==
X-Received: by 2002:aa7:d4d8:0:b0:447:a745:4b18 with SMTP id t24-20020aa7d4d8000000b00447a7454b18mr3797536edr.174.1661441427254;
        Thu, 25 Aug 2022 08:30:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id i12-20020a170906698c00b0073c23616cb1sm2686669ejr.12.2022.08.25.08.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 08:30:26 -0700 (PDT)
Message-ID: <02f25f0b-05e5-a0cd-2c85-489516641946@redhat.com>
Date:   Thu, 25 Aug 2022 17:30:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/3] platform/x86: msi-laptop: Simplify ec_delay handling
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20220825141336.208597-1-hdegoede@redhat.com>
 <20220825141336.208597-2-hdegoede@redhat.com>
 <YwePnFm3YpjcjthT@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YwePnFm3YpjcjthT@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/25/22 17:05, Andy Shevchenko wrote:
> On Thu, Aug 25, 2022 at 04:13:35PM +0200, Hans de Goede wrote:
>> There is no reason to have both non-delayed and delayed work structs
>> for the rfkill and touchpad work.
>>
>> Instead simply call schedule_delayed_work() with a delay of 0 for
>> the quirks->ec_delay == fase case.
> 
> fase ?!

That should be "false", my bad.

Regards,

Hans

