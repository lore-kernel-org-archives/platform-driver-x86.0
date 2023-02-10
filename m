Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5647C05027
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Feb 2023 16:27:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232598AbjBJQ1E (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Feb 2023 11:27:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232227AbjBJQ1D (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Feb 2023 11:27:03 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC9F1CF6B
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 08:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676046380;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XMyWSiBRS0vHXlOWzGHad9uq2iQmgPdEGhe+CLq72Oo=;
        b=Eke+XbAdPirjTQ4sztQkV3Rqz8Hu43adG+lP6ccIyFn7505YPSEnPqqZPdNijrLJ6WkMRL
        y48p78cWC8nQLwAxbB8k2y0jbxzjdaLV/GG8pTE4GtHhgzHDVHhQiG7ZCcxNwZICFYPGxa
        RSi5vghz5PiJp8g5aODXQED4oyo+Xwg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-258-IPUj-_08M8uNsMivh7ZO3Q-1; Fri, 10 Feb 2023 11:26:19 -0500
X-MC-Unique: IPUj-_08M8uNsMivh7ZO3Q-1
Received: by mail-ed1-f70.google.com with SMTP id s11-20020a056402520b00b004aada311135so3809168edd.9
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 08:26:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XMyWSiBRS0vHXlOWzGHad9uq2iQmgPdEGhe+CLq72Oo=;
        b=JSbZLB+cs3UnkjwmvdDtgA9q2il1BUXPHVtNHDi3wKbseUZPoA3txFPlBHEpNTKlDJ
         gUybknIurVhSl1kFSWZTJyLvmnclIut1mrniMz1NcS4bQPwKe6PUG+8eEHRwpO97pUxp
         fM2ZMpcGHxrGg3wxR8GCrxYVAv1evXM8aORJTp+UxZ0KhHxjn+0PAnO4NnaKI7kGoOWe
         67q0s0gZGMfNJi/JcwZmdOGrzD/ufeUaOx0shBnnIxFFvARqcS01BGcsz8NJHU5cBH0i
         Gm+E/CDmIvvWSCf8/qu7J8M2fUjVhT3rJ7fsUv/ZS5V8vhRyPY3tMl2fXs/jTapbEKE1
         btUQ==
X-Gm-Message-State: AO0yUKUxBeQ6jsT/AF75wzcBXHtWSkP6UidYZqCXKxJf+XCxzRkwgzm7
        WwcmZxoyiOXhkSQOhgCbSxngqzCvfcYa1tcGuTC6OTbT50tj0altcxCYQLtQi2yAjkEhIx7AQAd
        yMZk5hAJVoPTPjbiYkdI9qhQCt77c1Gk55xHzxB0=
X-Received: by 2002:a17:907:6e90:b0:8af:91a6:de6b with SMTP id sh16-20020a1709076e9000b008af91a6de6bmr1407109ejc.50.1676046378241;
        Fri, 10 Feb 2023 08:26:18 -0800 (PST)
X-Google-Smtp-Source: AK7set9ilo535lQiADsLvDdkpzMsP0IMScu0e/tEllxGX4Ta/jL9ITP1JT7l9tVc1IlMqybnr41UJg==
X-Received: by 2002:a17:907:6e90:b0:8af:91a6:de6b with SMTP id sh16-20020a1709076e9000b008af91a6de6bmr1407095ejc.50.1676046378049;
        Fri, 10 Feb 2023 08:26:18 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f26-20020a170906825a00b0084c4b87aa18sm2573294ejx.37.2023.02.10.08.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 08:26:17 -0800 (PST)
Message-ID: <d5851a70-dcbb-8455-b022-49fad58be7ff@redhat.com>
Date:   Fri, 10 Feb 2023 17:26:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH RFC] MAINTAINERS: dell-wmi-sysman: drop Divya Bharathi
Content-Language: en-US, nl
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
        Prasanth Ksr <prasanth.ksr@dell.com>,
        Divya Bharathi <divya.bharathi@dell.com>
Cc:     Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230207-maintainers-dell-wmi-sysman-v1-1-6594fea12f6c@weissschuh.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230207-maintainers-dell-wmi-sysman-v1-1-6594fea12f6c@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/7/23 17:51, Thomas Weißschuh wrote:
> According to the bounce sent by Dell's mailserver this user does not
> exist (anymore).
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

I just got the same bounce, so lets move ahead with this:

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fb1471cb5ed3..396bb00d98a1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5930,7 +5930,6 @@ F:	Documentation/ABI/testing/sysfs-platform-dell-wmi-ddv
>  F:	drivers/platform/x86/dell/dell-wmi-ddv.c
>  
>  DELL WMI SYSMAN DRIVER
> -M:	Divya Bharathi <divya.bharathi@dell.com>
>  M:	Prasanth Ksr <prasanth.ksr@dell.com>
>  L:	Dell.Client.Kernel@dell.com
>  L:	platform-driver-x86@vger.kernel.org
> 
> ---
> base-commit: d2d11f342b179f1894a901f143ec7c008caba43e
> change-id: 20230207-maintainers-dell-wmi-sysman-40d6cd1ceddf
> 
> Best regards,

