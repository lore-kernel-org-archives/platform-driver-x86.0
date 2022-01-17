Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9EFC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Jan 2022 11:35:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239135AbiAQLfM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Jan 2022 06:35:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35901 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239124AbiAQLfM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Jan 2022 06:35:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642419311;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rre6qO/xZQUg4WDvVWTDdxWpP1exj+h25VPJHW82X3Q=;
        b=fvhsGhO2gJxy8xZwzUyqaqgpr+MDxazwtv3CKjcYavfHtkT8zYi+G6Yt6Z+4rZGGgv3hvL
        D7BUIGf9wolWm7wnPS84cvEDjERXPbSpryfq3jse7vRqK7/qoX0dxJg9Ta65UJmVh0LOyA
        ZvLUXoTE+4+eWQSVKozh7wvcCcrgClI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-G8tyqsHmOEGVKsV-oZF28A-1; Mon, 17 Jan 2022 06:35:10 -0500
X-MC-Unique: G8tyqsHmOEGVKsV-oZF28A-1
Received: by mail-ed1-f69.google.com with SMTP id h1-20020aa7cdc1000000b0040042dd2fe4so12688726edw.17
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Jan 2022 03:35:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rre6qO/xZQUg4WDvVWTDdxWpP1exj+h25VPJHW82X3Q=;
        b=fVvIRWj+l5aLL7VG+3jRb7p27++rgXNNagq1T2xLtsgyPlK4SHf6PCtWmm+MJgDmqN
         IzpXL4swTqI6+YKh9JCCY7VTT1kgEEfy5fAyaX30FU4ursxVxi4g7Zy4//7CzDsU4ul7
         hENUjIWna7W3T011tZPvoedymk11542/KxvR7VHwclsEkSI2YtsXWerjLKTVyTQx8NTP
         gZgCSKrZRQZfSPB25Qqm/J+WJ/FFLq7k5hp5Sslj66sn1i3gG0ZiNzw/xCHBBOru8iwK
         hWDnw0WGffTExwFdMX8uc7kHkJAnZOPlA5zQf5OuK9UB6NQOj7MsgObdGjSuz/5VuVOc
         QGiA==
X-Gm-Message-State: AOAM5303SBRzUla4l6iL+xR3wcXoti0IKcqxVP6ImhlkmrXPubbGgWd2
        TU3xGf4zSRKNZ64Sr+BMANsPYOSQwNotjSBrc61o8URZXJziHp64TAR4bYYyNc9mCOQWUvwVaCW
        Ub9T3AfB2Dt8kGZdl6iaO8PqWBPwt4p3/Wg==
X-Received: by 2002:a17:907:2bce:: with SMTP id gv14mr6673040ejc.228.1642419308910;
        Mon, 17 Jan 2022 03:35:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+IHmwdYapjrtLyNmwYwDj0C5c8oZ20eJeNO813KfQ6Vr8i1aq38YG+uKb3eXRFlkUPyQPKA==
X-Received: by 2002:a17:907:2bce:: with SMTP id gv14mr6673029ejc.228.1642419308768;
        Mon, 17 Jan 2022 03:35:08 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id lm24sm4329249ejb.2.2022.01.17.03.35.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jan 2022 03:35:08 -0800 (PST)
Message-ID: <31bbf88d-a3ba-9e7e-644e-fce0933745f9@redhat.com>
Date:   Mon, 17 Jan 2022 12:35:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/2] platform/x86: amd-pmc: Make amd_pmc_stb_debugfs_fops
 static
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Sanket Goswami <Sanket.Goswami@amd.com>,
        kernel test robot <lkp@intel.com>
References: <20220117112644.260168-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220117112644.260168-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/17/22 12:26, Hans de Goede wrote:
> amd_pmc_stb_debugfs_fops is not used outside of amd-pmc.c, make it
> static.
> 
> Cc: Sanket Goswami <Sanket.Goswami@amd.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added both patches to my review-hans (soon to be for-next) branch now.

Regards,

Hans



> ---
>  drivers/platform/x86/amd-pmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index f794343d6aaa..85b680297934 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -226,7 +226,7 @@ static int amd_pmc_stb_debugfs_release(struct inode *inode, struct file *filp)
>  	return 0;
>  }
>  
> -const struct file_operations amd_pmc_stb_debugfs_fops = {
> +static const struct file_operations amd_pmc_stb_debugfs_fops = {
>  	.owner = THIS_MODULE,
>  	.open = amd_pmc_stb_debugfs_open,
>  	.read = amd_pmc_stb_debugfs_read,
> 

