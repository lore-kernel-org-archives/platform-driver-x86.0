Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B82D9C6FA82
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Sep 2022 14:42:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbiIUOmx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Sep 2022 10:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbiIUOmw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Sep 2022 10:42:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA7DD43302
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Sep 2022 07:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663771370;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FY3xJJXB5uy7/5kKWLU6Ad+0u8TAow2PmXSZORKqUJg=;
        b=EQ+wnY7aFbisrk146YrkQxJZM8HnVYnowBgK1nYXUE0+93iEiRXzKXDWUvFBREUczIeQvy
        h2jQAaJi5+AJ+PkDKdQ+2m+p8qBhEnJLetaoWYYfaU7xWO5yXzxyIQ1t5kFTTUPTMuN1Yy
        tZ2G/dcfhIf0zVO/RdHugG/mwyZSxHo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-588-M6n8y_GON1SyLSws8qgFjw-1; Wed, 21 Sep 2022 10:42:49 -0400
X-MC-Unique: M6n8y_GON1SyLSws8qgFjw-1
Received: by mail-wm1-f69.google.com with SMTP id 14-20020a05600c228e00b003b4d065282dso1707302wmf.8
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Sep 2022 07:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FY3xJJXB5uy7/5kKWLU6Ad+0u8TAow2PmXSZORKqUJg=;
        b=GtEF68Xq4j0Lutl6bc6RmYHxJn1JXaKUv/7BWSUkkKFJB+aBH90GsB/v7BcDxwNLGE
         uEouhyJK6amARiranhD1mhxX/6Nr2Kg4a6MxEhokjMJPssjv8ph5lONi/HBjbGy37tdd
         osAi7nXzCPcpFbmYMgKL1ijc4abYcaTNkauni0tMMFtv8Pq+w4YEkFZ1lRQ6erGYHzlQ
         NHvJmyHL1Wz3TvKd/I1plKDlE9YhnaHXNORT03x59ZIoQEfE+DLkBH3BectIHh6htWCQ
         4nvXlCNYu5y56E1ntPX7xkD6lgMyZRkQzZpNPceW/k6yhBYbR1NZMgb/kuJDGlDNyCVY
         XXmA==
X-Gm-Message-State: ACrzQf1ZXQ1Ezv/dZsB9bx8KVjFRsoJrRSsBQgnRNmr7Z3fTtbAcJTh5
        G5XFOnGUC99LmHRD2DCeJq0baaF/OTLkEcNVRwP1/Opia8xSr8RNm9+ZOC48d4nUlS42e/v9y2f
        Pi+/JtcMctzwBNOjR2VumVBOGMcGOQt5//Q==
X-Received: by 2002:a5d:5a9d:0:b0:225:2783:d6f1 with SMTP id bp29-20020a5d5a9d000000b002252783d6f1mr18024703wrb.385.1663771367089;
        Wed, 21 Sep 2022 07:42:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6rsUJWLEN/39CiAgtet9x5JD16UUGRc8NGZc+RDC4iyK6Od6BvkWNKcVt6Qhk3KHRNM9p7xw==
X-Received: by 2002:a17:906:6a14:b0:774:a998:d9a2 with SMTP id qw20-20020a1709066a1400b00774a998d9a2mr20632790ejc.496.1663771356483;
        Wed, 21 Sep 2022 07:42:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id y9-20020a056402440900b0045391f7d877sm2022474eda.53.2022.09.21.07.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 07:42:35 -0700 (PDT)
Message-ID: <694508ec-6091-39c9-5748-29a6da6e1556@redhat.com>
Date:   Wed, 21 Sep 2022 16:42:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 3/3] Documentation/ABI/testing/sysfs-amd-pmf: Add ABI
 doc for AMD PMF
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
        mario.limonciello@amd.com
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        bnocera@redhat.com
References: <20220921102455.1792336-1-Shyam-sundar.S-k@amd.com>
 <20220921102455.1792336-4-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220921102455.1792336-4-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/21/22 12:24, Shyam Sundar S K wrote:
> AMD PMF driver provides the flexibility to turn "on" or "off"
> CnQF feature (introduced in the earlier patch).
> 
> Add corresponding ABI documentation for the new sysfs node and
> also update MAINTAINERS file with this new information
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  Documentation/ABI/testing/sysfs-amd-pmf | 12 ++++++++++++
>  MAINTAINERS                             |  1 +
>  2 files changed, 13 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-amd-pmf
> 
> diff --git a/Documentation/ABI/testing/sysfs-amd-pmf b/Documentation/ABI/testing/sysfs-amd-pmf
> new file mode 100644
> index 000000000000..fec2be7178e2
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-amd-pmf
> @@ -0,0 +1,12 @@
> +What:		/sys/devices/platform/*/cnqf_enable
> +Date:		September 2022
> +Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> +Description:	Reading this file tells if the AMD Platform Management(PMF)
> +		Cool n Quiet Framework(CnQF) feature is enabled or not.
> +
> +		This feature is not enabled by default and gets only turned on
> +		if OEM BIOS passes a "flag" to PMF ACPI function (index 11 or 12)
> +		or in case the user writes "on".
> +
> +		To turn off CnQF user can write "off" to the sysfs node.
> +		Note: Systems that support auto mode will not have this sysfs file 		   available

I guess this "available" with a bunch of whitespace in front of it was 
intended to be on the next line?

With this fixed:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> diff --git a/MAINTAINERS b/MAINTAINERS
> index d74bf90f5056..255527be7e24 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1026,6 +1026,7 @@ AMD PMF DRIVER
>  M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/ABI/testing/sysfs-amd-pmf
>  F:	drivers/platform/x86/amd/pmf/
>  
>  AMD HSMP DRIVER

