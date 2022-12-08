Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38056C3A5A7
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Dec 2022 15:55:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbiLHPz5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Dec 2022 10:55:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbiLHPzr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Dec 2022 10:55:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 485C878682
        for <platform-driver-x86@vger.kernel.org>; Thu,  8 Dec 2022 07:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670514882;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HSwQIAXLEgbSONcjNq/ffInSzmU0ybWtoXdJxeVOOUE=;
        b=QBcJ24RjvKrPo9w2qgNtbAYyGOt8R8pMtkyw7eeD9rC/1tYuwTZQKvg1wopFXIgtc69fZG
        jTfXqs0Aqr68QfGPpa3GCTFRYwbNy8ks4jcc2ig9/GAjrT8cSQLIK0VlR0PzGU2dEWen5H
        a9Hy8tHbea3DbRRXdUoTDhpvSyV19PM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-100-5rDzq3s5MeipWsrwoL0w3A-1; Thu, 08 Dec 2022 10:54:41 -0500
X-MC-Unique: 5rDzq3s5MeipWsrwoL0w3A-1
Received: by mail-ej1-f69.google.com with SMTP id hq42-20020a1709073f2a00b007c100387d64so1420151ejc.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Dec 2022 07:54:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HSwQIAXLEgbSONcjNq/ffInSzmU0ybWtoXdJxeVOOUE=;
        b=wE+0yCGAGlm+SC6PsA0QwUh5ykPZD6o36aBtZk0cQ+x4nKzwuIsH5jOp5QMeDCXKzd
         X/7w9WkfYYYzehAjDtpIXnLKsV4M6HZJA6/FPl/y9Chp453unfD7w+4Z/UL9I89Aif/T
         rV9T4YsIolFM8cdROG0RQdX6G23SSBzBRn3i4//Ny9VUBCtmnsGfsSTEiNFb5EZQl9V4
         rNeInMVMLuvgBkbxLIDGdRYlG7svWlbLIfjCdkHftv8GhKUKaviPfuiN+S8bKFgvtN2f
         FscKLF7mkX6GdQHdfMviUrW+TQINV8dKu2bAdKz/ZImBxvfOjoOPFKX+LPn+f4cfCuLx
         Y7kA==
X-Gm-Message-State: ANoB5pksIPaXdPFgx8G1T9wCzM2W3MfanZE8XkXb2CWHAaqE+iynxqe0
        sSx/JoNzarna4N8O7m/ib8AUCG+UmYj6jqfqpvIETssiMVS5g8cFwuspU8WTFj+DDr4X2g1Xdxl
        /ip1sTpaF6fJuR1GAhjRCkdjeo4D+QooNGg==
X-Received: by 2002:a17:906:8d08:b0:7c1:700:1e2d with SMTP id rv8-20020a1709068d0800b007c107001e2dmr3868528ejc.20.1670514879827;
        Thu, 08 Dec 2022 07:54:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7uyODccxwLAE5cE71HeJzAASQ7LjigkQuWhvT5lurqfTHE9bYPSHxRpQ+7nhoSVBNL6mhyqA==
X-Received: by 2002:a17:906:8d08:b0:7c1:700:1e2d with SMTP id rv8-20020a1709068d0800b007c107001e2dmr3868512ejc.20.1670514879579;
        Thu, 08 Dec 2022 07:54:39 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id f19-20020a17090631d300b007c0a90663d5sm9127485ejf.162.2022.12.08.07.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 07:54:39 -0800 (PST)
Message-ID: <5428fc7d-4f03-8643-58c0-431963693133@redhat.com>
Date:   Thu, 8 Dec 2022 16:54:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] platform/x86: use sysfs_emit() to instead of scnprintf()
Content-Language: en-US, nl
To:     ye.xingchen@zte.com.cn
Cc:     justin.ernst@hpe.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <202212021705128095546@zte.com.cn>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202212021705128095546@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/2/22 10:05, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Follow the advice of the Documentation/filesystems/sysfs.rst and show()
> should only use sysfs_emit() or sysfs_emit_at() when formatting the
> value to be returned to user space.
> 
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

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
>  drivers/platform/x86/uv_sysfs.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/uv_sysfs.c b/drivers/platform/x86/uv_sysfs.c
> index 625b0b79d185..73fc38ee7430 100644
> --- a/drivers/platform/x86/uv_sysfs.c
> +++ b/drivers/platform/x86/uv_sysfs.c
> @@ -119,12 +119,12 @@ struct uv_hub {
> 
>  static ssize_t hub_name_show(struct uv_bios_hub_info *hub_info, char *buf)
>  {
> -	return scnprintf(buf, PAGE_SIZE, "%s\n", hub_info->name);
> +	return sysfs_emit(buf, "%s\n", hub_info->name);
>  }
> 
>  static ssize_t hub_location_show(struct uv_bios_hub_info *hub_info, char *buf)
>  {
> -	return scnprintf(buf, PAGE_SIZE, "%s\n", hub_info->location);
> +	return sysfs_emit(buf, "%s\n", hub_info->location);
>  }
> 
>  static ssize_t hub_partition_show(struct uv_bios_hub_info *hub_info, char *buf)
> @@ -460,12 +460,12 @@ struct uv_pci_top_obj {
> 
>  static ssize_t uv_pci_type_show(struct uv_pci_top_obj *top_obj, char *buf)
>  {
> -	return scnprintf(buf, PAGE_SIZE, "%s\n", top_obj->type);
> +	return sysfs_emit(buf, "%s\n", top_obj->type);
>  }
> 
>  static ssize_t uv_pci_location_show(struct uv_pci_top_obj *top_obj, char *buf)
>  {
> -	return scnprintf(buf, PAGE_SIZE, "%s\n", top_obj->location);
> +	return sysfs_emit(buf, "%s\n", top_obj->location);
>  }
> 
>  static ssize_t uv_pci_iio_stack_show(struct uv_pci_top_obj *top_obj, char *buf)
> @@ -475,7 +475,7 @@ static ssize_t uv_pci_iio_stack_show(struct uv_pci_top_obj *top_obj, char *buf)
> 
>  static ssize_t uv_pci_ppb_addr_show(struct uv_pci_top_obj *top_obj, char *buf)
>  {
> -	return scnprintf(buf, PAGE_SIZE, "%s\n", top_obj->ppb_addr);
> +	return sysfs_emit(buf, "%s\n", top_obj->ppb_addr);
>  }
> 
>  static ssize_t uv_pci_slot_show(struct uv_pci_top_obj *top_obj, char *buf)
> @@ -737,7 +737,7 @@ static ssize_t coherence_id_show(struct kobject *kobj,
>  static ssize_t uv_type_show(struct kobject *kobj,
>  			struct kobj_attribute *attr, char *buf)
>  {
> -	return scnprintf(buf, PAGE_SIZE, "%s\n", uv_type_string());
> +	return sysfs_emit(buf, "%s\n", uv_type_string());
>  }
> 
>  static ssize_t uv_archtype_show(struct kobject *kobj,
> @@ -749,13 +749,13 @@ static ssize_t uv_archtype_show(struct kobject *kobj,
>  static ssize_t uv_hub_type_show(struct kobject *kobj,
>  			struct kobj_attribute *attr, char *buf)
>  {
> -	return scnprintf(buf, PAGE_SIZE, "0x%x\n", uv_hub_type());
> +	return sysfs_emit(buf, "0x%x\n", uv_hub_type());
>  }
> 
>  static ssize_t uv_hubless_show(struct kobject *kobj,
>  			struct kobj_attribute *attr, char *buf)
>  {
> -	return scnprintf(buf, PAGE_SIZE, "0x%x\n", uv_get_hubless_system());
> +	return sysfs_emit(buf, "0x%x\n", uv_get_hubless_system());
>  }
> 
>  static struct kobj_attribute partition_id_attr =

