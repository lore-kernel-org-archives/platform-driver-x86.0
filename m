Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D87EDC433E0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Jan 2021 18:34:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABB8122CAD
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Jan 2021 18:34:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407691AbhARSeC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 18 Jan 2021 13:34:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46965 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2393654AbhARSdq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Jan 2021 13:33:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610994736;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SivGSgJFEQUXCrUtA+xITIvQY2ohK3O6BF+T2Sbt2e0=;
        b=hfe8x9QgyKSvU5EzJcMjTgYQtMYbPAm/P2suUBN0ZghpLaPle5qL8kGozQq6Zi8W8qVDTu
        L+2XNNEO2/8IcJeYBn90+bLoZmLybyfDgLtvhdPwD5SZw+TbxojSqtLZ2u68fXzgam+PmC
        cTbf5ywM/y6Tgd3VANC28HxxehsP/zI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-b4mDrGeyPoSziXbNcpPmHw-1; Mon, 18 Jan 2021 13:32:15 -0500
X-MC-Unique: b4mDrGeyPoSziXbNcpPmHw-1
Received: by mail-ej1-f71.google.com with SMTP id z2so1074162ejf.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Jan 2021 10:32:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SivGSgJFEQUXCrUtA+xITIvQY2ohK3O6BF+T2Sbt2e0=;
        b=kGDQKGjTScqY0Mp8lx+E/fOZrQ07FKUbKvG1+kAwIFfxBeEeViQDgtGUECKwOlgsYg
         GAlaRL4Zg+/vcVOGG+YUVt2WzKl0K8HQUT5N1tJjT2fqHoRA1JViUrhFN+7V0wsMgvq1
         HWZLI3pDgsK5Gdqo7PMn9v35yFLTVcJzeuMAyhS1tQ8VivhDwsdWCw4guWaRToWTq9Kf
         dHgWF7P4wgp/F6BUGKJi4uutvQeaPrvKqOOb4MXONhZ7b8D8XH6bgC34D4Mc+R1+7ldm
         cRvDeu5RxhNyDwmxWbxx39cXDrEMggDF5n5rTjlLyKV+ZMtpyCygKZfOtdOCfXURy28U
         vHiA==
X-Gm-Message-State: AOAM530PJ1DT8jAnENZT0f1cwMFhDLy9qcPudDc6AmVwoNuGXZml/ba/
        ZK6KSivd+S9Dt9T+LbS/wzRQxafdFFLlMc7agQpo4GXRB9E7sHIvt4i3cbFRg3npQfebnCC1/HL
        58aUQQ0TN+KKPsPTChTuSoUHnYmBbbAV61Q==
X-Received: by 2002:a17:907:9863:: with SMTP id ko3mr651612ejc.498.1610994733717;
        Mon, 18 Jan 2021 10:32:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrmz3wr4fzkL2a1SfYT86VljwDLjOa5DlzpcfbRWFvHyHdp+6KXXtHhMF1D7CT++aVPWO7Fg==
X-Received: by 2002:a17:907:9863:: with SMTP id ko3mr651599ejc.498.1610994733515;
        Mon, 18 Jan 2021 10:32:13 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id c16sm9770094ejk.91.2021.01.18.10.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 10:32:13 -0800 (PST)
Subject: Re: [PATCH] sony-laptop: Remove unneeded semicolon
To:     Yue Zou <zouyue3@huawei.com>, malattia@linux.it,
        mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210118010137.214378-1-zouyue3@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9c0fb7d2-4f32-6d1d-4ed5-29207591a0c7@redhat.com>
Date:   Mon, 18 Jan 2021 19:32:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210118010137.214378-1-zouyue3@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/18/21 2:01 AM, Yue Zou wrote:
> Remove a superfluous semicolon after function definition.
> 
> Signed-off-by: Yue Zou <zouyue3@huawei.com>

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
>  include/linux/sony-laptop.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/sony-laptop.h b/include/linux/sony-laptop.h
> index 374d0fdb0743..1e3c92feea6e 100644
> --- a/include/linux/sony-laptop.h
> +++ b/include/linux/sony-laptop.h
> @@ -31,7 +31,7 @@
>  #if IS_ENABLED(CONFIG_SONY_LAPTOP)
>  int sony_pic_camera_command(int command, u8 value);
>  #else
> -static inline int sony_pic_camera_command(int command, u8 value) { return 0; };
> +static inline int sony_pic_camera_command(int command, u8 value) { return 0; }
>  #endif
>  
>  #endif	/* __KERNEL__ */
> 

