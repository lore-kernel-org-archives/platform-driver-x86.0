Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A213C6FD19
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Mar 2023 14:45:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbjCPOpj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Mar 2023 10:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbjCPOph (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2023 10:45:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 824572823C
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 07:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678977885;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HAwPMEYQysCl58lJxbTJ7h0Tb4Bh0JWRO3Nbulmebg0=;
        b=QXKrLtf1e3j3z3UGmBcCk7thQje9HMZPkU7cXa3gjLBEnPAOLK120WuPperkfsBfQ5CDoU
        2Ev0OOIt637FnBx54LbvvcXqE2L3u7hbC3a6VpNGt+fT0FjXaV8bXfDHKRAiEjqcaPy/zE
        y+z+kIBYTdGHnTSiVxNH2NrRXPYRYqU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-efatq2bVPueDY5I4L0ZSug-1; Thu, 16 Mar 2023 10:44:44 -0400
X-MC-Unique: efatq2bVPueDY5I4L0ZSug-1
Received: by mail-ed1-f70.google.com with SMTP id e18-20020a056402191200b004fa702d64b3so3405211edz.23
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 07:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678977883;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HAwPMEYQysCl58lJxbTJ7h0Tb4Bh0JWRO3Nbulmebg0=;
        b=H88b28E1IoH5lgxHjPEAhvfL5y7V/BSFw8yTsxjuUk0dBe3m/QOQe0ECBQh1RdEK0y
         Ld60YAJdbq4ouDpnF0tCxWT9oLaj71ryGKcQvtgvxHxeCVNfSa7J0dYGz6Q/+YQIGjxs
         EZzUxhOkVHvppKBvzzKehHuxm0PwemnRpZQP0LWDMZ09so3cRikp0Cw0+9Sg/l4Lrlp5
         CIFafeoS0SQfwg4xDp3fgjiwTl8Nam0zQs05Rekk603bzZKHYx2ODJUD4ZcrC0TE2UX1
         B7mEBd+QmztxWkWLZmPw3j1Dk6Gf8E+rtcd87DcJmhZpz45U/Lm6h6MduE487XncV0nZ
         petA==
X-Gm-Message-State: AO0yUKXXLTieSMjgATuquY1w05shlzcXNEY6tbJwJxADR32R0xjnQHGO
        W0k5DPeK/5MWhCVFDRtT7sGuF4jzNidqdIsPC+HZYu4FCiFvlh4hmJM1jROc4euZQzaN6N+HD86
        9RaudwMFjzeMJnH0QXvhQ0BvMzMN+j9F4RA==
X-Received: by 2002:aa7:ca47:0:b0:500:2cac:3329 with SMTP id j7-20020aa7ca47000000b005002cac3329mr5372976edt.25.1678977883265;
        Thu, 16 Mar 2023 07:44:43 -0700 (PDT)
X-Google-Smtp-Source: AK7set9qWqVZIY2LYahWkwwMl4JtZC7I5T2bW6D5TNeRz4jsNRLkzUViR/b07ue3qTzMrUjnUx5xKQ==
X-Received: by 2002:aa7:ca47:0:b0:500:2cac:3329 with SMTP id j7-20020aa7ca47000000b005002cac3329mr5372963edt.25.1678977883028;
        Thu, 16 Mar 2023 07:44:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g10-20020a50d0ca000000b004fc1bb4285fsm3914370edf.93.2023.03.16.07.44.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 07:44:42 -0700 (PDT)
Message-ID: <ce7d4c80-a0cb-0f50-f0b4-1dd2a89fe096@redhat.com>
Date:   Thu, 16 Mar 2023 15:44:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: think-lmi: Properly interpret return value
 of tlmi_setting
Content-Language: en-US, nl
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
        Mark Pearson <markpearson@lenovo.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230312-think-lmi-status-v1-1-4e9f36322cc4@weissschuh.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230312-think-lmi-status-v1-1-4e9f36322cc4@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/12/23 04:47, Thomas Weißschuh wrote:
> The return value of tlmi_settings() is an errorcode, not an acpi_status.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

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
> 
> Note: This is only compile-tested.
> ---
>  drivers/platform/x86/think-lmi.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 86b33b74519b..c924e9e4a6a5 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -1353,7 +1353,6 @@ static struct tlmi_pwd_setting *tlmi_create_auth(const char *pwd_type,
>  
>  static int tlmi_analyze(void)
>  {
> -	acpi_status status;
>  	int i, ret;
>  
>  	if (wmi_has_guid(LENOVO_SET_BIOS_SETTINGS_GUID) &&
> @@ -1390,8 +1389,8 @@ static int tlmi_analyze(void)
>  		char *p;
>  
>  		tlmi_priv.setting[i] = NULL;
> -		status = tlmi_setting(i, &item, LENOVO_BIOS_SETTING_GUID);
> -		if (ACPI_FAILURE(status))
> +		ret = tlmi_setting(i, &item, LENOVO_BIOS_SETTING_GUID);
> +		if (ret)
>  			break;
>  		if (!item)
>  			break;
> 
> ---
> base-commit: 81ff855485a366a391dc3aed3942715e676ed132
> change-id: 20230312-think-lmi-status-0d76cbe1b7d9
> 
> Best regards,

