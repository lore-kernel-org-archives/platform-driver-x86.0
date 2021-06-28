Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52231C2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 09:30:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 661C461C5F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 09:30:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbhF1Jcd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 05:32:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43570 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232565AbhF1Jcb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 05:32:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624872605;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Gl9ZhOuHXpnDBUGpWJMkF1nOG6+GrTQHJxNnLTXVmws=;
        b=hyDRFdLH0ylKe8mO8z6GK/ius3ONK7aNz1lwVidmcjBROD3IPZ5+V8JXXNJI3EoJRlrvO7
        LT0sW91LIZIyu/rfiMXb/cPdmCHFSR6qHIW7fol+1qon1xVQT+f9XSED0eiYeQ93elG5cc
        dVqlP6ijvgHbn8mgoUTnM4mPOtY2gaU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-RjzzHFy2O3uPFb6SQQwUHQ-1; Mon, 28 Jun 2021 05:30:03 -0400
X-MC-Unique: RjzzHFy2O3uPFb6SQQwUHQ-1
Received: by mail-ej1-f70.google.com with SMTP id p5-20020a17090653c5b02903db1cfa514dso4107067ejo.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Jun 2021 02:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Gl9ZhOuHXpnDBUGpWJMkF1nOG6+GrTQHJxNnLTXVmws=;
        b=QRajkIlb3YyoMbM4K3y/6HOErjSOUkAxGGiTUwBl76+XacEgnX+dHExdYtsOh5dYRF
         OF3oasP6zMjq2cmHF5+eklJ12eMF61N31mZIt3sPCc85HVxCm2tly76fue1mRdJw6kyo
         jzX9hLxHQn0gH/46JDWMrHEE31fWBcryyE0y0gEA+4hGZM0rZpsIM0hHJJZ4Gvu85+Oz
         ltC0SSURZq9EYI76Iy4ct3bIKky0Q3pf/U1oLhvao94RpuldSRW/VpdXUnLHChy6UgBd
         t/kRkMBR7UapTuqwHiGrGcy6hTZfpWyU/neLL8ykgzFjRIN/iGvcjaPXnaw4rPP/lM6x
         q+lA==
X-Gm-Message-State: AOAM5316QYfO+QiAkHdJEgQWhG1E3UxK8tZ/NxgP0xFWWXG3w9vsZQ39
        NZxnUtbz9L2PbXeugGDGzVT2pYfpm9LCnY5L8En1MCYYElfDVe5bDkgSC80MdQIZsrcKcLBz6bA
        UhEEmxGgQyAMFEgdRFEZ2AzNIReZ6Cr0c2g==
X-Received: by 2002:a17:906:4e44:: with SMTP id g4mr23547498ejw.216.1624872602589;
        Mon, 28 Jun 2021 02:30:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkhBT22tEJn5nmP/jXYVM71L7EU1iRdnB7+3jgKn3FgK10tK246EfATU6e9+gVdJMwjgjRIg==
X-Received: by 2002:a17:906:4e44:: with SMTP id g4mr23547486ejw.216.1624872602378;
        Mon, 28 Jun 2021 02:30:02 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id s20sm9329919edr.50.2021.06.28.02.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 02:30:02 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] platform/x86: think-lmi: Fix issues with duplicate
 attributes
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>, markpearson@lenovo.com
References: <20210622200755.12379-1-mario.limonciello@amd.com>
 <20210622200755.12379-2-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <21e896f7-69d8-e6fe-cc4e-55d3ecd44be1@redhat.com>
Date:   Mon, 28 Jun 2021 11:30:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210622200755.12379-2-mario.limonciello@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/22/21 10:07 PM, Mario Limonciello wrote:
> On an AMD based Lenovo T14, I find that the module doesn't work at
> all, and instead has a traceback with messages like:
> 
> ```
> sysfs: cannot create duplicate filename '/devices/virtual/firmware-attributes/thinklmi/attributes/Reserved'
> ```
> 
> Duplicate and reserved values showing up appear to be a firmware bug,
> but they shouldn't make the driver explode.  So catch them and skip
> them.
> 
> Fixes: a40cd7ef22fb ("platform/x86: think-lmi: Add WMI interface support on Lenovo platforms")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thank you.

> ---
>  drivers/platform/x86/think-lmi.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> V1->V2 changes:
>  * Don't show reserved objects either
>  * Clear the object so it doesn't explode on module unload
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index d2644230b91f..4d8b5c185f8e 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -691,6 +691,16 @@ static int tlmi_sysfs_init(void)
>  		if (!tlmi_priv.setting[i])
>  			continue;
>  
> +		/* check for duplicate or reserved values */
> +		if (kset_find_obj(tlmi_priv.attribute_kset, tlmi_priv.setting[i]->display_name) ||
> +		    !strcmp(tlmi_priv.setting[i]->display_name, "Reserved")) {
> +			pr_debug("duplicate or reserved attribute name found - %s\n",
> +				tlmi_priv.setting[i]->display_name);
> +			kfree(tlmi_priv.setting[i]->possible_values);

You are missing a:

			kfree(tlmi_priv.setting[i]);

here, this is done through the kobj_put in tlmi_release_attr(), but since we will
now never register the kobj we should just free this directly to avoid a memleak.

Since I want to include this important fix in my first pull-req for 5.14 I've fixed
this up locally and merged this into my review-hans branch, so there is no need to
send out a new version.

I've a non AMD ThinkPad (X1C8) which does have a single "Reserved" entry, so I'll
make sure to test the modified patch myself before sending out the 5.14 pdx86
pull-req.

Regards,

Hans




> +			tlmi_priv.setting[i] = NULL;
> +			continue;
> +		}
> +
>  		/* Build attribute */
>  		tlmi_priv.setting[i]->kobj.kset = tlmi_priv.attribute_kset;
>  		ret = kobject_init_and_add(&tlmi_priv.setting[i]->kobj, &tlmi_attr_setting_ktype,
> 

