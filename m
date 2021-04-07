Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC118C433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 11:23:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 956A56113D
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 11:23:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234639AbhDGLXe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 07:23:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50478 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234598AbhDGLXe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 07:23:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617794604;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9mMEfb+eLgqZtFD+vRzkan+G1SRHN3etXppSoEtsmn8=;
        b=IMUduTVreBTDtuEytfr1JMnMJsmwtM/BIUeH6zSskIz0fr1fiSRQwJcWIPcAbuKzDS71E4
        3uRHq+JHEWrhMcXiiWqQ0kLJf8nR9rlId4LlHr+eS4cA9WmObINVvtHpzxftVp6GxS1KXv
        SpF8uCE2ZhrpfYm85upfIkwL/Gd1b4M=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-e-XTSkyzM16-NJ21dNCRGg-1; Wed, 07 Apr 2021 07:23:23 -0400
X-MC-Unique: e-XTSkyzM16-NJ21dNCRGg-1
Received: by mail-ed1-f72.google.com with SMTP id c6so5778990edf.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Apr 2021 04:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9mMEfb+eLgqZtFD+vRzkan+G1SRHN3etXppSoEtsmn8=;
        b=Ow5SnG0qqWFD3+srrym7qrZn7wFCQLsf77IBF9sL10vVGDZQogNvcf9VqcPKZkFHkp
         m6h5wMzOcRFFNWwnsp/tpF9sUUEPffFE+UM3NRZ+m8aAk0c9xb/qhRZCzsvnQq8KYtJu
         wFU/0mMcGPq0SLNKyJ6v99v5KUwNIrJiIrEeArXSDBafZaBmnmnZVy9ewpv12HG2/yRW
         G4fkVf+kSI/cNPtr5XGVPvmQNU32ciLASjuolq7AK6lfgb5HkLgh3q+KmG4XBuKldnuV
         pR/56xpY0k0K1KSCJQTDouP44T22WiUpEmTcViHxGX9dMb8KbuGvb48iY2+MeHR9HJPy
         n8QA==
X-Gm-Message-State: AOAM5339vGjIbpS77XjOm7/C6NYbrMVMojIgvgPpOEsTBljLm4pxWOT1
        yj2NTVqrgsgit3BKWu6LHDw82frtBqlGnaaf2Ze7mHJp3B4+ENwMdfuCMEISipjMIabNbS98I0H
        eSg0ysvcvm8eR/P96RG/LOWSr83onNTp9qBDFPesAth/Rbatb0uUkdejZ/3gauHyW9w9LYC6lkO
        +1YZzIdKqfFA==
X-Received: by 2002:a17:906:a0d4:: with SMTP id bh20mr3145499ejb.348.1617794601773;
        Wed, 07 Apr 2021 04:23:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxO10/lwPZewQ6M3PNk+YkbMznn2Ugi+GOXUW3XlXuWCQK5K0bzKzuifRciFMS3oY1Fz2tLmg==
X-Received: by 2002:a17:906:a0d4:: with SMTP id bh20mr3145485ejb.348.1617794601619;
        Wed, 07 Apr 2021 04:23:21 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id w18sm3152022ejq.58.2021.04.07.04.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 04:23:21 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: intel-vbtn: Remove unused KEYMAP_LEN define
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20210325123255.73103-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4f0f8ff4-94bc-5b3a-406a-d49464681a4b@redhat.com>
Date:   Wed, 7 Apr 2021 13:23:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210325123255.73103-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/25/21 1:32 PM, Hans de Goede wrote:
> Now that we have 2 separate input_dev-s for the buttons and thw switches,
> this is no longer used, remove it.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied to my review-hans branch. Andy, thank you for the review.

Regards,

Hans


> ---
>  drivers/platform/x86/intel-vbtn.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
> index 3fdf4cbec9ad..888a764efad1 100644
> --- a/drivers/platform/x86/intel-vbtn.c
> +++ b/drivers/platform/x86/intel-vbtn.c
> @@ -63,9 +63,6 @@ static const struct key_entry intel_vbtn_switchmap[] = {
>  	{ KE_END }
>  };
>  
> -#define KEYMAP_LEN \
> -	(ARRAY_SIZE(intel_vbtn_keymap) + ARRAY_SIZE(intel_vbtn_switchmap) + 1)
> -
>  struct intel_vbtn_priv {
>  	struct input_dev *buttons_dev;
>  	struct input_dev *switches_dev;
> 

