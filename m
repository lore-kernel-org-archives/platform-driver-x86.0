Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6FD0C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Apr 2022 14:25:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234979AbiDDO1X (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Apr 2022 10:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbiDDO1X (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Apr 2022 10:27:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 360F73A1A0
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Apr 2022 07:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649082326;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7sHibVkOaKYcZky1fBvELrAejFdIIbZy2kYf1v6ONMw=;
        b=anxX+ceKCrR9de8GqhFW/EwyKiLAO3adhyMSLLeJY6pTHtbQqhEeou8/DwmkAFvkSacIv6
        FKdvT4sd6J2qgrytPJf053t09BpjY/eGEPKVxl+vz+mnJebgy4P/lQo5xYnHV3x6ZZjchb
        UC54E3fmsxWgky9x5BG1wVa4N0K+Qs0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-2zRxa7ZPOhOd-goVVIEs8w-1; Mon, 04 Apr 2022 10:25:25 -0400
X-MC-Unique: 2zRxa7ZPOhOd-goVVIEs8w-1
Received: by mail-ej1-f72.google.com with SMTP id m12-20020a1709062acc00b006cfc98179e2so4627382eje.6
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Apr 2022 07:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7sHibVkOaKYcZky1fBvELrAejFdIIbZy2kYf1v6ONMw=;
        b=66qPiZ0IyadDP6la9+EAEw84+M1JxnVnTkCKvPlOplIht/8qatuVKab4tgxE20weNC
         iDscMXM2X+SMv1x/IKPL05ueJidT5IbwvNvK9dXhLzx/1+6wgx6L4H9gCN7Md1T8tBIA
         e4JWGkRiSsEbM8OgKl8EngIaTZwj/Ui95D7UEC0Lsaj6HTbY42QE2AV2zRiscdfq+k13
         w1lFXueDx2fVUPi0IRTyz9Cv8eOSqYSWwSi8nNeiyG1ogD34Hm17RvhfNUy3xzqJSsBX
         lpvpLi2Wrm0YYTfz4nGxO6x6M7hEZ4B+shT51u1imRWndpOGGOPuSJB4WQW8/BkD+8Ia
         PJMA==
X-Gm-Message-State: AOAM531C/GbIHkZE3w691EfG4/yr7S/G3anpHY5AMS3dnkNhkhHJi+y6
        5W6DasgqNaheLezbGPXYL7Ms2XQ2jcpVtvYdjtFBzaJYv9hic7WcnPfLTyPoyl2FLE+Yv9U7srn
        aOz+6q5kBmS+69w0i575O19eaHK+O65G57A==
X-Received: by 2002:a17:906:5d12:b0:6e7:eb3a:eae5 with SMTP id g18-20020a1709065d1200b006e7eb3aeae5mr298907ejt.644.1649082323685;
        Mon, 04 Apr 2022 07:25:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLETcDlvTPckmX/v16yKBGxwUPw9/RGG+yVqtYnX0l8y1I39Ld3a73FYCa4KSgwT5Jn++z9Q==
X-Received: by 2002:a17:906:5d12:b0:6e7:eb3a:eae5 with SMTP id g18-20020a1709065d1200b006e7eb3aeae5mr298886ejt.644.1649082323491;
        Mon, 04 Apr 2022 07:25:23 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id dd6-20020a1709069b8600b006df08710d00sm4545618ejc.85.2022.04.04.07.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 07:25:21 -0700 (PDT)
Message-ID: <e8c35673-c8b4-b44c-3ca0-e1f3f22a16af@redhat.com>
Date:   Mon, 4 Apr 2022 16:25:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] platform/x86: acerhdf: Cleanup str_starts_with()
Content-Language: en-US
To:     Wei Li <liwei391@huawei.com>, Peter Kaestle <peter@piie.net>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        rui.xiang@huawei.com
References: <20220326020249.3266561-1-liwei391@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220326020249.3266561-1-liwei391@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/26/22 03:02, Wei Li wrote:
> Since there is already a generic function strstarts() that check if a
> string starts with a given prefix, cleanup str_starts_with().
> 
> Signed-off-by: Wei Li <liwei391@huawei.com>

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
>  drivers/platform/x86/acerhdf.c | 21 +++------------------
>  1 file changed, 3 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
> index 6b8b3ab8db48..3c589437b41e 100644
> --- a/drivers/platform/x86/acerhdf.c
> +++ b/drivers/platform/x86/acerhdf.c
> @@ -584,21 +584,6 @@ static struct platform_driver acerhdf_driver = {
>  	.remove = acerhdf_remove,
>  };
>  
> -/* checks if str begins with start */
> -static int str_starts_with(const char *str, const char *start)
> -{
> -	unsigned long str_len = 0, start_len = 0;
> -
> -	str_len = strlen(str);
> -	start_len = strlen(start);
> -
> -	if (str_len >= start_len &&
> -			!strncmp(str, start, start_len))
> -		return 1;
> -
> -	return 0;
> -}
> -
>  /* check hardware */
>  static int __init acerhdf_check_hardware(void)
>  {
> @@ -651,9 +636,9 @@ static int __init acerhdf_check_hardware(void)
>  		 * check if actual hardware BIOS vendor, product and version
>  		 * IDs start with the strings of BIOS table entry
>  		 */
> -		if (str_starts_with(vendor, bt->vendor) &&
> -				str_starts_with(product, bt->product) &&
> -				str_starts_with(version, bt->version)) {
> +		if (strstarts(vendor, bt->vendor) &&
> +				strstarts(product, bt->product) &&
> +				strstarts(version, bt->version)) {
>  			found = 1;
>  			break;
>  		}

