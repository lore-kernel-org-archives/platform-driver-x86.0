Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8CEC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Apr 2022 12:41:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbiDKMn0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Apr 2022 08:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231975AbiDKMn0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Apr 2022 08:43:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2C05C3A1A8
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 05:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649680869;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5rCUb2yDm5mJpYByGfKW+rR8LpG6P+usFgoGWtpndHY=;
        b=UwO4Om30yOO1QC7ZtIuLN/KGmU2BAyDFu5n3W66qV5z3g19uOGsJCyOiORxGhiaswp7oyt
        uULjYNKZUtwXeH8Sm2L67OGfjEyyLFBWiBaq+6zeNI7onQ7c+4lOz8jxx/cY9omSokykmm
        7j5OijCFxEsup4WUDgzYboVhDc/cnrA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-g-k_9B4bOJSWfCKSrakrgg-1; Mon, 11 Apr 2022 08:41:08 -0400
X-MC-Unique: g-k_9B4bOJSWfCKSrakrgg-1
Received: by mail-ej1-f72.google.com with SMTP id qf10-20020a1709077f0a00b006e83684b9c6so5041374ejc.17
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 05:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5rCUb2yDm5mJpYByGfKW+rR8LpG6P+usFgoGWtpndHY=;
        b=MBtnoatxIjwwiYHX1IWI1H2r/66DQnI59XH72ntE4uWDQAOvPfV+up3bdogdmu+6pF
         O+PKqXpRmhJ+SxyAz4DDBir2FtbLqbWYT4I5qBHbVoijl9i96VFOu6KTkyAGTLLSW9qn
         EHkfidYhOk9Ki8YbvMCG5s+AME8YRHe3PioGFCi/OALjz9sH0Oj1fKuebIEj/9hPMQJP
         ZqTcFb4ZWSxDRPkVHJmRJMQQ8euasSjsqFD/YO3x1Ln6a19ylPNiIb/vNLlEsG8uSBDk
         T0ZBvBSw9kUv5Vgw2XGSMy6Ts/k9TJYnbdrkzfEkePo1bvdToGONjIFuxOdnIkHFi7d9
         7Ltw==
X-Gm-Message-State: AOAM530X58k/fK6RHEMCjaj03MuAbytGANwSM7O4HDo9yTUAiGTTqccw
        wayIOIWmNWcPJN9bZXaOX1mQsokrcV0mlrKPPxk1D2ix8dsRzf4uAwJ+OiveHO6Kdbr7FRuiE9G
        5t0J+VaVW0Z/qy2E8CyXb2+qTFrAkIqE0Gw==
X-Received: by 2002:a50:eb89:0:b0:41d:6fe7:377c with SMTP id y9-20020a50eb89000000b0041d6fe7377cmr10096920edr.75.1649680867394;
        Mon, 11 Apr 2022 05:41:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLLKgqJxMOMGaeuPMwiSBK0/78V3MoT5+FmrTsWQ3F9HuIE208gmgNSJOCf/1wRCP2vTkCaQ==
X-Received: by 2002:a50:eb89:0:b0:41d:6fe7:377c with SMTP id y9-20020a50eb89000000b0041d6fe7377cmr10096900edr.75.1649680867219;
        Mon, 11 Apr 2022 05:41:07 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id r3-20020aa7cb83000000b0041b573e2654sm14938694edt.94.2022.04.11.05.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 05:41:06 -0700 (PDT)
Message-ID: <d280b348-0daa-3cc1-3b31-cffb42a89bf9@redhat.com>
Date:   Mon, 11 Apr 2022 14:41:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] platform/x86: wmi: replace usage of found with dedicated
 list iterator variable
Content-Language: en-US
To:     Jakob Koschel <jakobkoschel@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@kernel.org>,
        Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
        Cristiano Giuffrida <c.giuffrida@vu.nl>,
        "Bos, H.J." <h.j.bos@vu.nl>
References: <20220324072015.62063-1-jakobkoschel@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220324072015.62063-1-jakobkoschel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/24/22 08:20, Jakob Koschel wrote:
> To move the list iterator variable into the list_for_each_entry_*()
> macro in the future it should be avoided to use the list iterator
> variable after the loop body.
> 
> To *never* use the list iterator variable after the loop it was
> concluded to use a separate iterator variable instead of a
> found boolean [1].
> 
> This removes the need to use a found variable and simply checking if
> the variable was set, can determine if the break/goto was hit.
> 
> Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>

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
>  drivers/platform/x86/wmi.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 58a23a9adbef..aed293b5af81 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -1308,21 +1308,20 @@ acpi_wmi_ec_space_handler(u32 function, acpi_physical_address address,
>  static void acpi_wmi_notify_handler(acpi_handle handle, u32 event,
>  				    void *context)
>  {
> -	struct wmi_block *wblock;
> -	bool found_it = false;
> +	struct wmi_block *wblock = NULL, *iter;
>  
> -	list_for_each_entry(wblock, &wmi_block_list, list) {
> -		struct guid_block *block = &wblock->gblock;
> +	list_for_each_entry(iter, &wmi_block_list, list) {
> +		struct guid_block *block = &iter->gblock;
>  
> -		if (wblock->acpi_device->handle == handle &&
> +		if (iter->acpi_device->handle == handle &&
>  		    (block->flags & ACPI_WMI_EVENT) &&
>  		    (block->notify_id == event)) {
> -			found_it = true;
> +			wblock = iter;
>  			break;
>  		}
>  	}
>  
> -	if (!found_it)
> +	if (!wblock)
>  		return;
>  
>  	/* If a driver is bound, then notify the driver. */
> 
> base-commit: f443e374ae131c168a065ea1748feac6b2e76613

