Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50347C433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:29:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3974960E08
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:29:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353724AbhESNbI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 May 2021 09:31:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24451 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353710AbhESNbG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 09:31:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621430986;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1cY32KNsN/xfY+artb5KSmSn+0lmEoeLm7IGieYt2JI=;
        b=ZUrnyhvUdnMxz0IbFg2KCzj+xf9B3H9qZAYbC5feFWMN1LdwtCgNiQhEC/63xNBODKVFcM
        Y1wkStYH4d9hZK8OqtMMV72u1H96EavUB+k5OJTJgUYiQD41x84IeE4o7MY/BAMnTjX4vE
        G3GxlKfLX3YtVuQKLW81Mg3ynzAr9hc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-6gzhZTlSNDSY7TBwsRdB4g-1; Wed, 19 May 2021 09:29:41 -0400
X-MC-Unique: 6gzhZTlSNDSY7TBwsRdB4g-1
Received: by mail-ed1-f70.google.com with SMTP id cy15-20020a0564021c8fb029038d26976787so6253652edb.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 May 2021 06:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1cY32KNsN/xfY+artb5KSmSn+0lmEoeLm7IGieYt2JI=;
        b=sGPRJFpiG8ge8iqvbOSjiCLPWdJZUX81vvUjKzmLkAYm2pkvPj782/yR2RHVjZRkCf
         KBr0jmRGgyt9becrtXIY3L3UU9aEv/6E1VNOwFO7JSS7GvxkxYHErXx0teu4TUZ7T/yX
         D/hXygFRqaNM9vK4wJ30bO52UM6x1tCtY4dVS53UrNSF/rA6ap1qJmCOum1sQaCDcPj6
         gI56m7LyvGjNmECm/RRtjBjaRsNnodvpalmTFUMUa2cGpocz/opOo77TO1FPNv7TGrYi
         w797dEVb+c1OfhIXtJ+TcI/+iS5tZsHaCM12UJfMBQogQ5VZS15th3n2Unu45SP4fyi8
         X0jA==
X-Gm-Message-State: AOAM532p84RcWb0K4R2y3Ob0P+NGeblSt9cWL6+Gm67wwXMxIwLaThyK
        OzxOAz5+ycOfwY05pBE2nCXfJ35/qBHPKpTWbwmE6XVj9Z8Sg8g0wR37WJgfIiSslG8lxPKinWo
        r3fpWlEpCdj3fDnho+Lqed2YRG9+rqrfnNQ==
X-Received: by 2002:aa7:de19:: with SMTP id h25mr14730876edv.84.1621430980522;
        Wed, 19 May 2021 06:29:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQ2KHVvCuhqVeqFctU1b/pNStW7rYBYJiHyIoVFxzqb3cOmp0ZCHlkN0nUNcM7usFVV6nnFA==
X-Received: by 2002:aa7:de19:: with SMTP id h25mr14730859edv.84.1621430980395;
        Wed, 19 May 2021 06:29:40 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b12sm12629598ejg.89.2021.05.19.06.29.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 06:29:40 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: dell-smbios-wmi: Fix oops on rmmod
 dell_smbios
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Dell.Client.Kernel@dell.com
Cc:     platform-driver-x86@vger.kernel.org,
        Mario Limonciello <mario.limonciello@outlook.com>
References: <20210518125027.21824-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c6750e31-1c3b-5a21-5471-36287894794f@redhat.com>
Date:   Wed, 19 May 2021 15:29:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518125027.21824-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi all,

On 5/18/21 2:50 PM, Hans de Goede wrote:
> init_dell_smbios_wmi() only registers the dell_smbios_wmi_driver on systems
> where the Dell WMI interface is support. While exit_dell_smbios_wmi()
> unregisters it unconditionally, this leads to the following oops:
> 
> [  175.722921] ------------[ cut here ]------------
> [  175.722925] Unexpected driver unregister!
> [  175.722939] WARNING: CPU: 1 PID: 3630 at drivers/base/driver.c:194 driver_unregister+0x38/0x40
> ...
> [  175.723089] Call Trace:
> [  175.723094]  cleanup_module+0x5/0xedd [dell_smbios]
> ...
> [  175.723148] ---[ end trace 064c34e1ad49509d ]---
> 
> Make the unregister happen on the same condition the register happens
> to fix this.
> 
> Cc: Mario Limonciello <mario.limonciello@outlook.com>
> Fixes: 1a258e670434 ("platform/x86: dell-smbios-wmi: Add new WMI dispatcher driver")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans branch now and I will also include this
in the next pdx86-fixes pull-req for 5.13.

Regards,

Hans




> ---
>  drivers/platform/x86/dell/dell-smbios-wmi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platform/x86/dell/dell-smbios-wmi.c
> index a1753485159c..33f823772733 100644
> --- a/drivers/platform/x86/dell/dell-smbios-wmi.c
> +++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
> @@ -270,7 +270,8 @@ int init_dell_smbios_wmi(void)
>  
>  void exit_dell_smbios_wmi(void)
>  {
> -	wmi_driver_unregister(&dell_smbios_wmi_driver);
> +	if (wmi_supported)
> +		wmi_driver_unregister(&dell_smbios_wmi_driver);
>  }
>  
>  MODULE_DEVICE_TABLE(wmi, dell_smbios_wmi_id_table);
> 

