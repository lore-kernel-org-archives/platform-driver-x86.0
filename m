Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA242C47082
	for <platform-driver-x86@archiver.kernel.org>; Mon, 31 May 2021 13:49:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD06561C34
	for <platform-driver-x86@archiver.kernel.org>; Mon, 31 May 2021 13:49:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbhEaNud (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 31 May 2021 09:50:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22412 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230454AbhEaNq5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 May 2021 09:46:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622468715;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UITNUt5ZmZEDO3e0WLoQny0/vMV9bsuhwmIZlIKhPMU=;
        b=ESS2HN/gtXBl1nT/Fs0ZyjV1Ylp+IgVu8t56U/Y+b0dMOjviFFq2cBPKXinrsJSJ2CJxLy
        g8fw5mc2Wpx6yXkRc5t0ifB2nBgJCCW6V0+/BsiHLDCNSTcVI/UgLtjxCPFwKvq9cL7HVM
        uqUSq93aHuD9qI94x7KvS45HJlzq5ig=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-7BcBaw7hOPC7aJuWia3Dwg-1; Mon, 31 May 2021 09:45:14 -0400
X-MC-Unique: 7BcBaw7hOPC7aJuWia3Dwg-1
Received: by mail-ed1-f70.google.com with SMTP id j13-20020aa7de8d0000b029038fc8e57037so4822462edv.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 May 2021 06:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UITNUt5ZmZEDO3e0WLoQny0/vMV9bsuhwmIZlIKhPMU=;
        b=n8gJXZolhGvkwIA9pN9AoC8Wfsx9mA/DmeWOw1TwQVpM6LIMyKuSbok9D+BJ4s4f80
         Bpo4ps7gIT1ogdd0xAYLKCOc/R4z45rk2q5fboF8/ohQBGerjmFBeYPFF0w1Ziv0n9DR
         jCJOagCqfxzpTDpvilJYS+PXAkcP790+2C5gOCtv1Udnc4twhZxg9uyHe+tOLv0qH0TQ
         +c/XShI6X7i+Icjl2iWsFH+iv1FaHH3BxjiZ1KCDmod1NwM6ah38/zdyPFsgIDrfGvkr
         sPvXOWEwC+lvxTfiIQbP5cvKHkZzozhfFj0JvXdSA03IzIXhENz/p9OawEJeIZZZSZjr
         rVCw==
X-Gm-Message-State: AOAM532MzrkybCHwvayPnNhvJf21mbQ1evYc4pvMd/gtmp/GpVSMRg/V
        8gcTuuFdieEMcVRrrKEAShgpirmol7SImaxV9zU/mYhAC18BAP8/ZwPSqBMNLKZfNlTqh4pfRAV
        gdR64tuzwgYTF5AwOu+U41EO0T7YZXyTVRw==
X-Received: by 2002:a17:906:5949:: with SMTP id g9mr6220899ejr.296.1622468712830;
        Mon, 31 May 2021 06:45:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIlKc5cUaeS3FkVx7yUbhYD5Ys/fuqUauyR567JXtEx/Bo1Hs5GrEneiuC7HyGHLj6iLjk1w==
X-Received: by 2002:a17:906:5949:: with SMTP id g9mr6220877ejr.296.1622468712651;
        Mon, 31 May 2021 06:45:12 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id bh3sm5947830ejb.19.2021.05.31.06.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 May 2021 06:45:12 -0700 (PDT)
Subject: Re: [PATCH -next] x86/platform/uv: functions should not be declared
 extern
To:     Qiheng Lin <linqiheng@huawei.com>, mike.travis@hpe.com,
        dimitri.sivanich@hpe.com, russ.anderson@hpe.com,
        dvhart@infradead.org, andy@infradead.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com
Cc:     steve.wahl@hpe.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210531060747.21934-1-linqiheng@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <56198fed-ce73-f7e8-3d90-50089e243799@redhat.com>
Date:   Mon, 31 May 2021 15:45:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210531060747.21934-1-linqiheng@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/31/21 8:07 AM, Qiheng Lin wrote:
> These function declarations in 'bios.h' are already marked extern, thus
> their definition should not have the keyword.
> 
> This quiets the following sparse warnings:
>  function 'uv_bios_get_master_nasid' with external linkage has definition
>  function 'uv_bios_get_heapsize' with external linkage has definition
>  function 'uv_bios_install_heap' with external linkage has definition
>  function 'uv_bios_obj_count' with external linkage has definition
>  function 'uv_bios_enum_objs' with external linkage has definition
>  function 'uv_bios_enum_ports' with external linkage has definition
>  function 'uv_bios_get_geoinfo' with external linkage has definition
>  function 'uv_bios_get_pci_topology' with external linkage has definition
> 
> Signed-off-by: Qiheng Lin <linqiheng@huawei.com>

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
>  arch/x86/platform/uv/bios_uv.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/platform/uv/bios_uv.c b/arch/x86/platform/uv/bios_uv.c
> index bf31af3d32d6..7e7634c8be62 100644
> --- a/arch/x86/platform/uv/bios_uv.c
> +++ b/arch/x86/platform/uv/bios_uv.c
> @@ -172,55 +172,55 @@ int uv_bios_set_legacy_vga_target(bool decode, int domain, int bus)
>  				(u64)decode, (u64)domain, (u64)bus, 0, 0);
>  }
>  
> -extern s64 uv_bios_get_master_nasid(u64 size, u64 *master_nasid)
> +s64 uv_bios_get_master_nasid(u64 size, u64 *master_nasid)
>  {
>  	return uv_bios_call(UV_BIOS_EXTRA, 0, UV_BIOS_EXTRA_MASTER_NASID, 0,
>  				size, (u64)master_nasid);
>  }
>  EXPORT_SYMBOL_GPL(uv_bios_get_master_nasid);
>  
> -extern s64 uv_bios_get_heapsize(u64 nasid, u64 size, u64 *heap_size)
> +s64 uv_bios_get_heapsize(u64 nasid, u64 size, u64 *heap_size)
>  {
>  	return uv_bios_call(UV_BIOS_EXTRA, nasid, UV_BIOS_EXTRA_GET_HEAPSIZE,
>  				0, size, (u64)heap_size);
>  }
>  EXPORT_SYMBOL_GPL(uv_bios_get_heapsize);
>  
> -extern s64 uv_bios_install_heap(u64 nasid, u64 heap_size, u64 *bios_heap)
> +s64 uv_bios_install_heap(u64 nasid, u64 heap_size, u64 *bios_heap)
>  {
>  	return uv_bios_call(UV_BIOS_EXTRA, nasid, UV_BIOS_EXTRA_INSTALL_HEAP,
>  				0, heap_size, (u64)bios_heap);
>  }
>  EXPORT_SYMBOL_GPL(uv_bios_install_heap);
>  
> -extern s64 uv_bios_obj_count(u64 nasid, u64 size, u64 *objcnt)
> +s64 uv_bios_obj_count(u64 nasid, u64 size, u64 *objcnt)
>  {
>  	return uv_bios_call(UV_BIOS_EXTRA, nasid, UV_BIOS_EXTRA_OBJECT_COUNT,
>  				0, size, (u64)objcnt);
>  }
>  EXPORT_SYMBOL_GPL(uv_bios_obj_count);
>  
> -extern s64 uv_bios_enum_objs(u64 nasid, u64 size, u64 *objbuf)
> +s64 uv_bios_enum_objs(u64 nasid, u64 size, u64 *objbuf)
>  {
>  	return uv_bios_call(UV_BIOS_EXTRA, nasid, UV_BIOS_EXTRA_ENUM_OBJECTS,
>  				0, size, (u64)objbuf);
>  }
>  EXPORT_SYMBOL_GPL(uv_bios_enum_objs);
>  
> -extern s64 uv_bios_enum_ports(u64 nasid, u64 obj_id, u64 size, u64 *portbuf)
> +s64 uv_bios_enum_ports(u64 nasid, u64 obj_id, u64 size, u64 *portbuf)
>  {
>  	return uv_bios_call(UV_BIOS_EXTRA, nasid, UV_BIOS_EXTRA_ENUM_PORTS,
>  				obj_id, size, (u64)portbuf);
>  }
>  EXPORT_SYMBOL_GPL(uv_bios_enum_ports);
>  
> -extern s64 uv_bios_get_geoinfo(u64 nasid, u64 size, u64 *buf)
> +s64 uv_bios_get_geoinfo(u64 nasid, u64 size, u64 *buf)
>  {
>  	return uv_bios_call(UV_BIOS_GET_GEOINFO, nasid, (u64)buf, size, 0, 0);
>  }
>  EXPORT_SYMBOL_GPL(uv_bios_get_geoinfo);
>  
> -extern s64 uv_bios_get_pci_topology(u64 size, u64 *buf)
> +s64 uv_bios_get_pci_topology(u64 size, u64 *buf)
>  {
>  	return uv_bios_call(UV_BIOS_GET_PCI_TOPOLOGY, (u64)buf, size, 0, 0, 0);
>  }
> 

