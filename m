Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37466C7EE2C
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Jun 2023 09:35:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbjFFJfd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 6 Jun 2023 05:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237539AbjFFJer (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Jun 2023 05:34:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3D45E5A
        for <platform-driver-x86@vger.kernel.org>; Tue,  6 Jun 2023 02:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686044002;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LyNfCyF+F3Zw1MWVQkKg+TAa5A8aDRRjK+8ILi+iQOc=;
        b=cHG+yXdbysKQo4g4KXteP+5e5ia5GLZm6RI4bgDLRozv9vAneGIGaJ+GZs0Q4gTWmMCON+
        i+cGoNSG56GHkAaoniQczm6UmlMIxf8oZIDVdoWVdjpQYzw4F/H/beoMLGmVx+xoZw9xBx
        YKTNRjLms0TTCJucFuCa5wFNDycxmsQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-ImAdgFiCPdK4WfT94tq55Q-1; Tue, 06 Jun 2023 05:33:21 -0400
X-MC-Unique: ImAdgFiCPdK4WfT94tq55Q-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-94f7a2b21fdso504499366b.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Jun 2023 02:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686044000; x=1688636000;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LyNfCyF+F3Zw1MWVQkKg+TAa5A8aDRRjK+8ILi+iQOc=;
        b=RpG7iP/h66SpVMrTgaUw2OC7FlM0eJ3W5CekxXo+2bPlTawUtonexGmSzeXvrI2suJ
         4WWfE4LBSpYKq3rRsccyugBzIn/z4QnbYKkcbO0DncIUPAg2CPj7WdTuy+q5RS0BPWAo
         mRZQeEUQjE962N87xvW8hat7dUrtE7Wl9D+AATiMP+8w3zwJ7awHItIi0TrDAmAv3ais
         wO0SxE89n+Qu1RdfLcNErpfsBgoMA9ivX+KxdJse2jphQYhJblDKF5Co0MgyISECHxBb
         lIMbN7mzYP8nQhZBAEjotw9u8jMbYNFHzVsJBncO07zEJVLAs0h0TfFiwgN+zeOOclpd
         ccUg==
X-Gm-Message-State: AC+VfDx5yQiCn+vPoRGinTL4l6huUyg9dbgYXeSdTSc0b+w7BG+uvcV9
        avXw6MJ2XQswsMbj1f09I9EzOLpN7MWTtf5bqlHdMWxysv1ZQzUDgImkfktjD04d+loHeF8Q1NW
        xoq24Zm0EiaDElA77t2WrfwfKkNUJpoK5MQ==
X-Received: by 2002:a17:907:2d94:b0:974:326b:f9b2 with SMTP id gt20-20020a1709072d9400b00974326bf9b2mr1822959ejc.66.1686044000699;
        Tue, 06 Jun 2023 02:33:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ76alfvCiErl1w9MgdyYpRU6Y25tp7rroTmzTF7l3MteMTAdRZecT/+VppSS2C72Ft/ZkmYpA==
X-Received: by 2002:a17:907:2d94:b0:974:326b:f9b2 with SMTP id gt20-20020a1709072d9400b00974326bf9b2mr1822949ejc.66.1686044000408;
        Tue, 06 Jun 2023 02:33:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gr24-20020a170906e2d800b0096f5b48fe43sm5360223ejb.47.2023.06.06.02.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 02:33:19 -0700 (PDT)
Message-ID: <e884358d-a621-5dd3-7ae6-6338c77be586@redhat.com>
Date:   Tue, 6 Jun 2023 11:33:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/8] platform/x86: think-lmi: mutex protection around
 multiple WMI calls
Content-Language: en-US, nl
To:     Mark Pearson <mpearson-lenovo@squebb.ca>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, ilpo.jarvinen@linux.intel.com
References: <mpearson-lenovo@squebb.ca>
 <20230601200552.4396-1-mpearson-lenovo@squebb.ca>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230601200552.4396-1-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/1/23 22:05, Mark Pearson wrote:
> When an attribute is being changed if the Admin account is enabled, or if a password
> is being updated then multiple WMI calls are needed.
> Add mutex protection to ensure no race conditions are introduced.
> 
> Fixes: b49f72e7f96d ("platform/x86: think-lmi: Certificate authentication support")
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Thank you for your patch-series, I've applied the series to my
review-hans branch:
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
> Changes in v2:
>  - New commit added after review of other patches in series.
> Changes in v3:
>  - Simplified mutex handling as recommended.
> Changes in v4:
>  - This was the 5th patch in the series but moved to be first.
>  - Added Fixes tag.
>  - Improved commit information to be clearer.
> 
>  drivers/platform/x86/think-lmi.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 1138f770149d..6cf77bc26b05 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -14,6 +14,7 @@
>  #include <linux/acpi.h>
>  #include <linux/errno.h>
>  #include <linux/fs.h>
> +#include <linux/mutex.h>
>  #include <linux/string.h>
>  #include <linux/types.h>
>  #include <linux/dmi.h>
> @@ -195,6 +196,7 @@ static const char * const level_options[] = {
>  };
>  static struct think_lmi tlmi_priv;
>  static struct class *fw_attr_class;
> +static DEFINE_MUTEX(tlmi_mutex);
>  
>  /* ------ Utility functions ------------*/
>  /* Strip out CR if one is present */
> @@ -437,6 +439,9 @@ static ssize_t new_password_store(struct kobject *kobj,
>  	/* Strip out CR if one is present, setting password won't work if it is present */
>  	strip_cr(new_pwd);
>  
> +	/* Use lock in case multiple WMI operations needed */
> +	mutex_lock(&tlmi_mutex);
> +
>  	pwdlen = strlen(new_pwd);
>  	/* pwdlen == 0 is allowed to clear the password */
>  	if (pwdlen && ((pwdlen < setting->minlen) || (pwdlen > setting->maxlen))) {
> @@ -493,6 +498,7 @@ static ssize_t new_password_store(struct kobject *kobj,
>  		kfree(auth_str);
>  	}
>  out:
> +	mutex_unlock(&tlmi_mutex);
>  	kfree(new_pwd);
>  	return ret ?: count;
>  }
> @@ -981,6 +987,9 @@ static ssize_t current_value_store(struct kobject *kobj,
>  	/* Strip out CR if one is present */
>  	strip_cr(new_setting);
>  
> +	/* Use lock in case multiple WMI operations needed */
> +	mutex_lock(&tlmi_mutex);
> +
>  	/* Check if certificate authentication is enabled and active */
>  	if (tlmi_priv.certificate_support && tlmi_priv.pwd_admin->cert_installed) {
>  		if (!tlmi_priv.pwd_admin->signature || !tlmi_priv.pwd_admin->save_signature) {
> @@ -1039,6 +1048,7 @@ static ssize_t current_value_store(struct kobject *kobj,
>  		kobject_uevent(&tlmi_priv.class_dev->kobj, KOBJ_CHANGE);
>  	}
>  out:
> +	mutex_unlock(&tlmi_mutex);
>  	kfree(auth_str);
>  	kfree(set_str);
>  	kfree(new_setting);

