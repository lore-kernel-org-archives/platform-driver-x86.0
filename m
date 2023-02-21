Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 680B9C636D7
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Feb 2023 20:09:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbjBUUJY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Feb 2023 15:09:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbjBUUJV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Feb 2023 15:09:21 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E4428855
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Feb 2023 12:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677010114;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=09M2IhNewYa0ZD87pwGV1iriHd9wzWyMm+sZhc4KVgY=;
        b=Yj1AVWy7WspURCOXH8avYBMBxKuzvncOb35D47p+Oq8hoEKpwZ7WJwjLjQuFpTBCXIhx66
        aa6jWN2o2N23Z7jZOjCUz8jBIF9okkvWhwwjSInscgt3cV5PfwUolmsJTZhK1rHMkzm+YH
        8w35aF/cwZRRoA9NhaOp2FjoNnTYKps=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-JeyLUeicOWCQJ49lh1Ft6w-1; Tue, 21 Feb 2023 15:08:10 -0500
X-MC-Unique: JeyLUeicOWCQJ49lh1Ft6w-1
Received: by mail-ed1-f70.google.com with SMTP id cf11-20020a0564020b8b00b0049ec3a108beso7319595edb.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Feb 2023 12:08:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=09M2IhNewYa0ZD87pwGV1iriHd9wzWyMm+sZhc4KVgY=;
        b=Ted99nhJAlydlxiIxNxY6E6Pj4fCc3apmBCGRccrq/EMR1pXChLMaaCUvcW0oVOLbI
         k/jhjVPMpKJSV9Nmar/rs/NmjqOILBjPgbv2BfIkj1io0/do8UrDCVRojiwCHjYmnGKF
         iuToHpUuWOvvta7uSEzjrFNnf8yktEAR9bE5zozNmLOtsNwUbyPF5ESiS89tQ3KdZ4GI
         1wd6gyLJaxhDfdzwnDoHWuTu+go3XzeevO9tNc7tc+fQD4Z56gnpw1Dz7JB2YiyNGrkj
         LyC+ep7hEWTdosKuEhlNgSTfN22HYuP3Z/8z3BtlWKaMReaxiE1WGKUUqKZXhPTGBgwZ
         21gw==
X-Gm-Message-State: AO0yUKVYoQR77kGbYPAFBGQcs8WCYsAJL7/irwxWduARNpTJ86VavejJ
        zqnoz/cCiqHSUKeCSkam4+zR+sxjavSTAcRwuk+kNqs/lOwlAZPesfBwVsL0ptsqX32ZKkvkxjj
        iW6b+PfFkp5bR5B2M6BCo4I/cXhiy3PbOuA==
X-Received: by 2002:a50:ee1a:0:b0:4ad:7c6c:5386 with SMTP id g26-20020a50ee1a000000b004ad7c6c5386mr4666717eds.30.1677010077401;
        Tue, 21 Feb 2023 12:07:57 -0800 (PST)
X-Google-Smtp-Source: AK7set8BGn8xDOhDuov3MkZqm4u3X6uxPdXm6C3Wov/p2iyeV432KODzpfLNtWuyc+AJ4tr0hCdZqg==
X-Received: by 2002:a50:ee1a:0:b0:4ad:7c6c:5386 with SMTP id g26-20020a50ee1a000000b004ad7c6c5386mr4666702eds.30.1677010077206;
        Tue, 21 Feb 2023 12:07:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id e17-20020a50a691000000b004accf3a63cbsm1751767edc.68.2023.02.21.12.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 12:07:56 -0800 (PST)
Message-ID: <e2193efe-c001-a56b-8fd4-4485de6b185d@redhat.com>
Date:   Tue, 21 Feb 2023 21:07:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 15/16] thermal/drivers/acerhdf: Remove pointless
 governor test
Content-Language: en-US
To:     Daniel Lezcano <daniel.lezcano@linaro.org>, rafael@kernel.org
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Kaestle <peter@piie.net>,
        Mark Gross <markgross@kernel.org>,
        "open list:ACER ASPIRE ONE TEMPERATURE AND FAN DRIVER" 
        <platform-driver-x86@vger.kernel.org>
References: <20230221180710.2781027-1-daniel.lezcano@linaro.org>
 <20230221180710.2781027-16-daniel.lezcano@linaro.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230221180710.2781027-16-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/21/23 19:07, Daniel Lezcano wrote:
> The thermal zone parameter specifies the bang-bang governor.
> 
> The Kconfig selects the bang-bang governor. So it is pointless to test
> if the governor was set for the thermal zone assuming it may not have
> been compiled-in.
> 
> Remove the test and prevent another access into the thermal internals.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Acked-by: Peter Kaestle <peter@piie.net>

Thanks, looks good to me, here is my ack for merging this through
the thermal tree.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/x86/acerhdf.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
> index 61f1c3090867..71b9c1f922d9 100644
> --- a/drivers/platform/x86/acerhdf.c
> +++ b/drivers/platform/x86/acerhdf.c
> @@ -697,13 +697,6 @@ static int __init acerhdf_register_thermal(void)
>  	if (ret)
>  		return ret;
>  
> -	if (strcmp(thz_dev->governor->name,
> -				acerhdf_zone_params.governor_name)) {
> -		pr_err("Didn't get thermal governor %s, perhaps not compiled into thermal subsystem.\n",
> -				acerhdf_zone_params.governor_name);
> -		return -EINVAL;
> -	}
> -
>  	return 0;
>  }
>  

