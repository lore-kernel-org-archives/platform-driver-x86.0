Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12EBAECAAA1
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Oct 2022 09:25:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbiJXJZ4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Oct 2022 05:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbiJXJZx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Oct 2022 05:25:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54927638EF
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 02:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666603547;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kRn8fy5I737hSEosk3aTr/nOUOWweY+HZTiEMeXXvFA=;
        b=QR+rXol5eyz1XcguZTcTXElfViv3MV97p3OT5VVou1aBp4vDgqamcCnQRwjLIz8wB6YkEg
        NhgWhC/M+yAyDhIXKOBrgTJW1Y44S2eGdgkYed32UqUJJIpuGJAJf+86Be3IoDDP3qvIXC
        93qpwBtCaUE+3bk8o3yRiD9voEWDp5s=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-19-EJ9yLjl9P3GrVR8302Mpgg-1; Mon, 24 Oct 2022 05:25:45 -0400
X-MC-Unique: EJ9yLjl9P3GrVR8302Mpgg-1
Received: by mail-ed1-f70.google.com with SMTP id z11-20020a056402274b00b00461dba91468so1472361edd.6
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 02:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kRn8fy5I737hSEosk3aTr/nOUOWweY+HZTiEMeXXvFA=;
        b=cfoRe0y01MNuAKZhF4Q7+US7afSQDLwwaOM0paNQ1HzUsaOGWYMtSi4e0dYsxguYyd
         6HWFK6sfU9Nb6/f6265oQrJgp5Ng67CaFScwPXbzk+H1Rpz/hME5utOlARicaZDGILwe
         QUuOwjYmnB2FOn9rTJLxw2q4NNZi/XXxoETg2eIp+9cRBpF8cUy16+H5SBg7UPCaK5A8
         //FMgCUuMMz5TdFAodPDipr81vx71YIrY4bnbRP8CYYC6bdw+Vbzl37G7eTEpJcsEGtb
         e5d/7efXfdS6ZXae7CxPA5roqEpHWRY7ETxiN1Xo55aLDyUo30B+QpzVPNCHs/Q8LC9B
         2MRQ==
X-Gm-Message-State: ACrzQf381X8ehUbPln4gDT7IophcvsELTKBe6Pq354hYoqSp+NkZG1SP
        pCxMUgU47GNSKSa3Mv2ChO7Vog2OfbF739MuNL1JCebgN6Tg4fcOcPW+i1g6Iyh+nhBRP+IlEA7
        OXiW6/csKOHi+AM4cZe1DtimcZkRxLM9WZQ==
X-Received: by 2002:a17:907:3da2:b0:78d:51c4:5b80 with SMTP id he34-20020a1709073da200b0078d51c45b80mr26290999ejc.716.1666603544272;
        Mon, 24 Oct 2022 02:25:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6nYvaIuNznIdIT9duZ2kvszLAGTi76JklYBHoHfAsZZTczGb36WqaFkuqe0Gr4A0L2UhAUgA==
X-Received: by 2002:a17:907:3da2:b0:78d:51c4:5b80 with SMTP id he34-20020a1709073da200b0078d51c45b80mr26290994ejc.716.1666603544081;
        Mon, 24 Oct 2022 02:25:44 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id n26-20020a056402061a00b0045c010d0584sm17993940edv.47.2022.10.24.02.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 02:25:43 -0700 (PDT)
Message-ID: <e577cd80-ec2a-964b-9a98-db9ae5f6abd6@redhat.com>
Date:   Mon, 24 Oct 2022 11:25:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: skip invalid fan speed
Content-Language: en-US
To:     Jelle van der Waa <jvanderwaa@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>
References: <20221014211709.6322-2-jvanderwaa@redhat.com>
 <20221019194751.5392-1-jvanderwaa@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221019194751.5392-1-jvanderwaa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/19/22 21:47, Jelle van der Waa wrote:
> 65535 is most likely an invalid read.
> 
> Signed-off-by: Jelle van der Waa <jvanderwaa@redhat.com>

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


> 
> ---
> 
> Cc: Mark Pearson <markpearson@lenovo.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 6a823b850a77..20e5c043a8e8 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -263,6 +263,8 @@ enum tpacpi_hkey_event_t {
>  #define TPACPI_DBG_BRGHT	0x0020
>  #define TPACPI_DBG_MIXER	0x0040
>  
> +#define FAN_NOT_PRESENT		65535
> +
>  #define strlencmp(a, b) (strncmp((a), (b), strlen(b)))
>  
>  
> @@ -8876,7 +8878,7 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>  			/* Try and probe the 2nd fan */
>  			tp_features.second_fan = 1; /* needed for get_speed to work */
>  			res = fan2_get_speed(&speed);
> -			if (res >= 0) {
> +			if (res >= 0 && speed != FAN_NOT_PRESENT) {
>  				/* It responded - so let's assume it's there */
>  				tp_features.second_fan = 1;
>  				tp_features.second_fan_ctl = 1;

