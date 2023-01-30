Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108D1C54EED
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Jan 2023 15:07:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237850AbjA3PHH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 Jan 2023 10:07:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236800AbjA3PHG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2023 10:07:06 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5349C29E37
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 07:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675091181;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5CVJu2EH78w77h5RT2FTQTyWVRR8gsDPBHuNXqm811E=;
        b=SW3UVH6pmxU5qh4wZx4Dz1XiJRYF8yIqAPQx8UsXj1Vvu3Ju/RU6jzI8oPtMAmymoUuZqm
        lL7iaWMW8R2oI47ORVv8Th+ZzllEs1gqHnXDh+nXkkWH+sHmkp7ozERdBiwTgSm6twFm/4
        uwm44o2j2PCONetrMNKNK7GEtDVo3Yg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-474-QIrrU3DcPx2el8H-gdfiww-1; Mon, 30 Jan 2023 10:06:20 -0500
X-MC-Unique: QIrrU3DcPx2el8H-gdfiww-1
Received: by mail-ed1-f71.google.com with SMTP id o21-20020aa7dd55000000b004a245f58006so2182496edw.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 07:06:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5CVJu2EH78w77h5RT2FTQTyWVRR8gsDPBHuNXqm811E=;
        b=5R+khLE86+XogwWoo8dX+ZrRzAgYvxPqwaSrewzmS3e6rIGURT77jMPlQ1hvZXm7Kp
         jel0vN8scn5iFXfR8Y5hUGl/WXeNgak68YwG3WT+VofY203AP4SPHlGH1c5Blov4i8B1
         p6vuEr3ZNH1h3q8fiILwnKs+MNXonewE4skZibJmTynSSNADyMgJSBfN5Zk6jZg1dnXB
         mMSe28aEm77l8ADTUydjStbcYVtsJEZ4fK7giMwNXyp+2ekGW0e1JL8a37yfTE4wW9oM
         o5eAIu/NYlAfowEyLKwCavq2QXCD9aTCybnunxNYwxWw+kYo3EUD+ZcIfOvrAn+uYc3S
         R40A==
X-Gm-Message-State: AO0yUKUQ7CzRZdcvD9vDcj17+8n0P2AKuahowN4in1uiaWhN3P+FcCTt
        7Q30qIuwuolgYbH1ckWCyanAu0TRIXutBVsqNp9MRs5N8iY4iI7MF0OHtLwU93wYN7XCV2RlYjq
        bX0qxuA5DsH8J+01jQCpduuZpg2U8EuUMMQ==
X-Received: by 2002:a17:906:1651:b0:878:45e9:6f96 with SMTP id n17-20020a170906165100b0087845e96f96mr19038795ejd.49.1675091179022;
        Mon, 30 Jan 2023 07:06:19 -0800 (PST)
X-Google-Smtp-Source: AK7set/pWbyTVsCwUzmoscsNJcBsnhDO03WOS2srLwGgUlMlRx89m0LKnN0ZDK8pNpbPFojbf8zgHg==
X-Received: by 2002:a17:906:1651:b0:878:45e9:6f96 with SMTP id n17-20020a170906165100b0087845e96f96mr19038773ejd.49.1675091178843;
        Mon, 30 Jan 2023 07:06:18 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ov9-20020a170906fc0900b0087bdae9a1ebsm5425686ejb.94.2023.01.30.07.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 07:06:18 -0800 (PST)
Message-ID: <c425d613-80d7-221c-20de-f03191cb1b59@redhat.com>
Date:   Mon, 30 Jan 2023 16:06:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/5] platform/x86: dell-ddv: Replace EIO with ENOMSG
Content-Language: en-US
To:     Armin Wolf <W_Armin@gmx.de>, markgross@kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230126194021.381092-1-W_Armin@gmx.de>
 <20230126194021.381092-4-W_Armin@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230126194021.381092-4-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/26/23 20:40, Armin Wolf wrote:
> When the ACPI WMI interface returns a valid ACPI object
> which has the wrong type, then ENOMSG instead of EIO
> should be returned, since the WMI method was still
> successfully evaluated.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

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
>  drivers/platform/x86/dell/dell-wmi-ddv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/x86/dell/dell-wmi-ddv.c
> index f99c4cb686fd..58fadb74e86a 100644
> --- a/drivers/platform/x86/dell/dell-wmi-ddv.c
> +++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
> @@ -87,7 +87,7 @@ static int dell_wmi_ddv_query_type(struct wmi_device *wdev, enum dell_ddv_method
> 
>  	if (obj->type != type) {
>  		kfree(obj);
> -		return -EIO;
> +		return -ENOMSG;
>  	}
> 
>  	*result = obj;
> --
> 2.30.2
> 

