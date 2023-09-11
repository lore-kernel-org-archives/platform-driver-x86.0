Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E07CCA0EC3
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Sep 2023 22:06:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355557AbjIKWAu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Sep 2023 18:00:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236728AbjIKLP5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Sep 2023 07:15:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 03A8CCDD
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 04:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694430908;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NKHpLK/1F+7Ung4H62+PvTO3aeU4hK38bQgvzhP99xY=;
        b=Tx2/MLjcLW9ozyGOyR9p3DSfk2ce0EjCgHXSy/9e+k8omE9CnGA6gGrSe+efQtcNrfth8j
        m3kifJkurVo5mjJqyqHENkMTlOgJjzJ4+qP964bkjee8AiSx+JPnhlH68/56t97PUevom3
        3u0Da7e6lod43EvJ0F1nOXvxfbWO++Y=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-ukcF4A9VN0OWHYCSZrVJ2Q-1; Mon, 11 Sep 2023 07:15:07 -0400
X-MC-Unique: ukcF4A9VN0OWHYCSZrVJ2Q-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9a65094d873so327664866b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 04:15:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694430906; x=1695035706;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NKHpLK/1F+7Ung4H62+PvTO3aeU4hK38bQgvzhP99xY=;
        b=iP36iulxt6DUyyzK1LauIEZ8LQsX7ZhDNa6XoIEhGz+UhtQ2jqSn+5mE/CyxethFC0
         OtN49N5sUMDxDLxskzlVPwMfGlhswkfRfrnkgKTBKQbgOwgUZLJ49ycyZNO5X2wQq9mU
         i3kgbmupGetHWP3QrNP2bXLNBUMzHu/SuVAB0Q3r7yMVIaeecZiSe4wex7lQbSu9Tr8B
         dPimGRO+QVvjsItWSaCHzx1DNmlTZZTeS/HP53fjdTb8CpWWg3SCtiweThZNrOyXP+dP
         BIR8FNFOW/TjxIBGEeyHw4bflFBalK7xAzHB6Z1EXdMk5lWlkVn5Zq0A8Rc6P6kNHguY
         SVOQ==
X-Gm-Message-State: AOJu0YysQ18E0/3fKndKUigeWVi5SAqL5iD0+0GGfBdX80VG2Zf7lVLz
        8suEi+GJ4Xn0SpLvByX/yoxR82ppHvWXjQZU9MiQWXlR6ZD4ekPeUvH7eWMPFwOKcxSrVZoW3br
        R9GgPfoZ7M6lR63QVKkpqdhoZAmVPYFvbxNXODqMbBg==
X-Received: by 2002:a17:906:5307:b0:9aa:20b2:35e7 with SMTP id h7-20020a170906530700b009aa20b235e7mr3501695ejo.9.1694430906248;
        Mon, 11 Sep 2023 04:15:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzOJs3bCQUw1AJYelMXONDCh7w6Ao2vLa35tCxdoFi2n1i3pBsgz7Xx2aiczwOSGCAUexSTg==
X-Received: by 2002:a17:906:5307:b0:9aa:20b2:35e7 with SMTP id h7-20020a170906530700b009aa20b235e7mr3501682ejo.9.1694430905991;
        Mon, 11 Sep 2023 04:15:05 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id me15-20020a170906aecf00b009a193a5acffsm5127626ejb.121.2023.09.11.04.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 04:15:05 -0700 (PDT)
Message-ID: <646ef8f8-b2a0-09e6-5136-f04e0261f093@redhat.com>
Date:   Mon, 11 Sep 2023 13:15:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1] mlxbf-bootctl: add NET dependency into Kconfig
Content-Language: en-US
To:     David Thompson <davthompson@nvidia.com>, markgross@kernel.org,
        vadimp@nvidia.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20230905133243.31550-1-davthompson@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230905133243.31550-1-davthompson@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/5/23 15:32, David Thompson wrote:
> The latest version of the mlxbf_bootctl driver utilizes
> "sysfs_format_mac", and this API is only available if
> NET is defined in the kernel configuration. This patch
> changes the mlxbf_bootctl Kconfig to depend on NET.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202309031058.JvwNDBKt-lkp@intel.com/
> Signed-off-by: David Thompson <davthompson@nvidia.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans


> ---
>  drivers/platform/mellanox/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
> index 382793e73a60..e52aea996ca5 100644
> --- a/drivers/platform/mellanox/Kconfig
> +++ b/drivers/platform/mellanox/Kconfig
> @@ -60,6 +60,7 @@ config MLXBF_BOOTCTL
>  	tristate "Mellanox BlueField Firmware Boot Control driver"
>  	depends on ARM64
>  	depends on ACPI
> +	depends on NET
>  	help
>  	  The Mellanox BlueField firmware implements functionality to
>  	  request swapping the primary and alternate eMMC boot partition,

