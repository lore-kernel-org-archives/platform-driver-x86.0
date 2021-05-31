Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F2FC47082
	for <platform-driver-x86@archiver.kernel.org>; Mon, 31 May 2021 12:20:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAD636103E
	for <platform-driver-x86@archiver.kernel.org>; Mon, 31 May 2021 12:20:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbhEaMW3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 31 May 2021 08:22:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53580 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231327AbhEaMW2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 May 2021 08:22:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622463648;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PWeKi76mxQmgT8Dm9JLOprgQPomCstB5nWgwpRs0Frc=;
        b=HOU1QO5KbDS7YzGCRwJfSsa7LMV+ptaSsula45MEC5Y/duHS8J/1bgBTSVQMuSXU1Z+8/m
        KwLlnQLBspFNWb5VYSOTooLjtVCdDBcrpG2r3jGk7zAlVxIPhlhpfgY1kULcnrlvnUA1iO
        qixAAkwJswUiPBAh75Jh3vL6L1mpPB4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-yK68EGTmNJKmQ8JcQMy-Pg-1; Mon, 31 May 2021 08:20:47 -0400
X-MC-Unique: yK68EGTmNJKmQ8JcQMy-Pg-1
Received: by mail-ej1-f72.google.com with SMTP id h18-20020a1709063992b02903d59b32b039so2409651eje.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 May 2021 05:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PWeKi76mxQmgT8Dm9JLOprgQPomCstB5nWgwpRs0Frc=;
        b=sRTzUuirxKV4GMaJi9sm+3yYZPrvMZovTYllhx8Zj2qZket5u2QUF2V4VhiwGKCjUv
         1L38Rtx5pljhEbSdKqQabjOG3p3NNWCh/UXt98Gv/p80J9dXz61kNTFDjkiXGeMB91DG
         2W8LBZuG7O7Oe1Ym9tR5DGxYMlI/WcuZAYNSsxPse0b9q1BbgK2dTOImmT9jTCr2K5nu
         g1k48xF9RlfraGa4vxY3JbsuZiuyPW0UxIM2VYjRgoo/8rk96ss9dsc1x29qzgIDlAyM
         usSXQ1IOq/7oMP5HJ1/zYiCvXoEpucHYTiP2FZGDRJMwhuzMOyHrQcr+xXAGTkeJla1i
         uZVA==
X-Gm-Message-State: AOAM532z3872XHMJnsXzljii9UR2GIJS0aHvxG1xXJsZTl6QL9kA8NNT
        a3O270I/PrXsF9/WXwoDw93wVfJu+A9GjwpthTELadOvrXlWpukzSFTjMfW7ZnDZCj6RZYoTTqe
        T6OJagJPJ4WPeLWhUpOivrGEMZI6zxVOwvnuMPXSIDtq22bqOpQ/4pdAs3sUT39JkA3GDl2nFnV
        QlYIoiiKKktw==
X-Received: by 2002:a17:906:3395:: with SMTP id v21mr3192419eja.102.1622463645942;
        Mon, 31 May 2021 05:20:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3RE8C8IA0MZmtqFQrF6X0iRCuBGxsvnJNWdE6LKNZKXlj5tHfVZxvUWYUmdutE33LPQDbqw==
X-Received: by 2002:a17:906:3395:: with SMTP id v21mr3192405eja.102.1622463645740;
        Mon, 31 May 2021 05:20:45 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id t9sm5815532eji.39.2021.05.31.05.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 May 2021 05:20:45 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: touchscreen_dmi: Fix Chuwi Hi10 Pro
 comment
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20210530104744.6720-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3b3bdc26-75b3-b782-541e-e3e881e0db06@redhat.com>
Date:   Mon, 31 May 2021 14:20:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210530104744.6720-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi all,

On 5/30/21 12:47 PM, Hans de Goede wrote:
> Fix the comment on the entry for the Chuwi Hi10 Pro tablet:
> 1. Replace "Prus" type with "Pro".
> 2. Fix the model number, the Chuwi Hi10 Pro is the CWI529, not the CWI597.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to me review-hans branch now.

Regards,

Hans


> ---
> Changes in v2
> - Also fix the wrong model number
> ---
>  drivers/platform/x86/touchscreen_dmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 424cf2a84744..0e1451b1d9c6 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -971,7 +971,7 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  		},
>  	},
>  	{
> -		/* Chuwi Hi10 Prus (CWI597) */
> +		/* Chuwi Hi10 Pro (CWI529) */
>  		.driver_data = (void *)&chuwi_hi10_pro_data,
>  		.matches = {
>  			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
> 

