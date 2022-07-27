Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6AFC04A68
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jul 2022 21:41:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbiG0VlW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Jul 2022 17:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiG0VlV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Jul 2022 17:41:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C1B4313E1C
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 14:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658958079;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DZkueYw5W3pncYDJ6AXZXANdBF+rYY64Kx2ltRDc+VU=;
        b=G/BZxpzwsLhhjSvHmTQPRpqGGtSEHsxwJSRopMs5YRB24VUTh/rFQBfH0UH/TehTMeUVX/
        2+xR9lcMv82JRrNl2hiRO1c9KbAwzV7wNMH9o8F2GMqDZKvm2JofK87Aiau9qRcMIkQEdJ
        RZxxHriZqJwY4gG1zw7OzLFzFEfzCtA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-e_SZhZOxMzykq1XDXPhCXA-1; Wed, 27 Jul 2022 17:41:18 -0400
X-MC-Unique: e_SZhZOxMzykq1XDXPhCXA-1
Received: by mail-ed1-f72.google.com with SMTP id v9-20020a056402348900b0043bcd680e50so1624edc.18
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 14:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DZkueYw5W3pncYDJ6AXZXANdBF+rYY64Kx2ltRDc+VU=;
        b=fNYj6inGz98nnhh7FPNnS7Exdx2Hty2YW+4nyQp3yVQYpHHLCyrHnYVVDbjuVIKHiZ
         CV3rSZi+PECDLqPlo2n1RL6r7QPoD2KI2cdZf/vbyq3KyF3Kd64LuZx1oQG/t4RVWJAD
         O4GwO5nGwE5jFbWPGeKWmwfwgWl6n0xDUaaNCp4m5M78pBLfQgzzgrasq2DUOW0cWj2E
         mBMKe0ytnPORhezSSoXiCTKhEeJuXqe8WoofuY5EZ0jwcd/y+qyZ3WfHawNcNapyEbiA
         XeK7pSk9S6Ci2cq8gQfkB+gCl6gNYwb2c7pYKugAeXWfQx7l72swVyGL5vUYoxMNRXaE
         v8mw==
X-Gm-Message-State: AJIora+SytsTU5iIc5ySAHDQJ8s/HKJY1tsA9213KrHUEaRdNbU6W7kY
        Yw8YYFl7bSiBl1xgZA/YpRkC566ob1fsofH5KCZOdXBtIcPOM3nouY5yfrJIsZgC7O/1m6Gb56R
        8s0l2oAbKLelYKU1CjDh2ZHrn0Z2c9jJzxQ==
X-Received: by 2002:a05:6402:518d:b0:43c:32b2:a0a with SMTP id q13-20020a056402518d00b0043c32b20a0amr13470313edd.388.1658958077063;
        Wed, 27 Jul 2022 14:41:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uTt5uXUI6x3wSXiehihSdxDV04PwshFIDDTDymj8qpClCv0KwN+NVmd/Lu1xilFT5peDJVfA==
X-Received: by 2002:a05:6402:518d:b0:43c:32b2:a0a with SMTP id q13-20020a056402518d00b0043c32b20a0amr13470305edd.388.1658958076913;
        Wed, 27 Jul 2022 14:41:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 4-20020a170906308400b0072f9dc2c246sm7621371ejv.133.2022.07.27.14.41.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 14:41:16 -0700 (PDT)
Message-ID: <0d4b3aae-c9ae-fd0d-6beb-aa98fb3fba86@redhat.com>
Date:   Wed, 27 Jul 2022 23:41:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 15/15] MAINTAINERS: Add AMD PMF driver entry
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-16-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220712145847.3438544-16-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/12/22 16:58, Shyam Sundar S K wrote:
> Update the MAINTAINERS file with AMD PMF driver details.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e01478062c56..d3f6cabcaab2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -998,6 +998,13 @@ L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/x86/amd/pmc.c
>  
> +AMD PMF DRIVER
> +M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/ABI/testing/sysfs-amd-pmf
> +F:	drivers/platform/x86/amd/pmf/
> +
>  AMD HSMP DRIVER
>  M:	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>  R:	Carlos Bilbao <carlos.bilbao@amd.com>

