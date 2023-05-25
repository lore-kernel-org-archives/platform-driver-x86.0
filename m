Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39661C7EE2C
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 May 2023 19:44:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242063AbjEYToI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 May 2023 15:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242073AbjEYToB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 15:44:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B3D9B
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 12:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685043712;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hG6a8dxjoLrvuutaPxgY7/ShfZWOWo5mAvJlZJg9eDk=;
        b=C207tCjeuZ8yKGDHPk8RAgGoLLb+zbybRntdwz09mbamya8SeUr6N43dfBuWaS+LYt/Z51
        rL5LWpGNRnqcwQJC2xw5OkVwzgXf+njhSnlE+qbsVcpV+J7uCbhi/QfCdtVOAUMAIqtfhI
        qAeqfC5m7sRBRWN8O0aBm0+KX7uC4pY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-NSqwDxKBOYiLHEG0RJjzmg-1; Thu, 25 May 2023 15:41:50 -0400
X-MC-Unique: NSqwDxKBOYiLHEG0RJjzmg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-96feeddb1f8so120190966b.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 12:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685043709; x=1687635709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hG6a8dxjoLrvuutaPxgY7/ShfZWOWo5mAvJlZJg9eDk=;
        b=YLTKSnbYhswqFF2VVcSTJNWcmnyLCs7AMjwlA4CVa/IIi7aLJdIBoQvndCK0x+KhEV
         OZej2H2j6OaKmEdz/w7l5BSxFkjzVrqGrGoxrbZC880YdBfMB/uYtD+3XfVDl3uIxXTR
         nGwcghUwsxuwII4qcnMHY9J3+trvO+941qu78R9meiv6c5CYeaqxE4VMXJKHd/bla6qp
         p2XU05kTD9oLyu2G43UFMjp/rFdIKWDnx4HJCAnQJIRcQJkPEB6vwkjsFCaBdOLRjxST
         /8oNQKuT3LHa1p7X2VtpBL5RmYJT1g3mEABCEKyQparzCqR/VOl8NZ2GMPqpfaOt+N4Y
         6YRQ==
X-Gm-Message-State: AC+VfDwIsjK8l03yDoSDTwtCUO96MimFxyjOeGYZBmgzVJN5KIMnjT3e
        LCEjCtcQxdxIYhBubfmx3pKSIlISyxkPL//3HJ6g/jl0gKyFdXOHr3WbXR+TEADRb8MIMujEXOb
        M1890pZfkn7hNZ0exPOjxsL4y88r6fjJE1Q==
X-Received: by 2002:a17:907:3689:b0:967:b02c:b06a with SMTP id bi9-20020a170907368900b00967b02cb06amr2104445ejc.27.1685043709757;
        Thu, 25 May 2023 12:41:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6FoBpNxiIWHwkQP7q3np75MJ/V7j8tkvrrWNzruQCldfoKD4g/CrrrJi7Yuyxu44nh7+U0fw==
X-Received: by 2002:a17:907:3689:b0:967:b02c:b06a with SMTP id bi9-20020a170907368900b00967b02cb06amr2104434ejc.27.1685043709422;
        Thu, 25 May 2023 12:41:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id b16-20020a170906151000b0096b15e4ffcesm1200378ejd.85.2023.05.25.12.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 12:41:48 -0700 (PDT)
Message-ID: <6e05df16-7125-a634-6b99-3cf3079d3d5d@redhat.com>
Date:   Thu, 25 May 2023 21:41:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 5/5] platform/x86: think-lmi: mutex protection around
 multiple WMI calls
To:     Mark Pearson <mpearson-lenovo@squebb.ca>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20230525193132.3727-1-mpearson-lenovo@squebb.ca>
 <20230525193132.3727-5-mpearson-lenovo@squebb.ca>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230525193132.3727-5-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark,

On 5/25/23 21:31, Mark Pearson wrote:
> Add mutex protection around cases where an operation needs multiple
> WMI calls - e.g. setting password.
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
> Changes in V2: New commit added after review of other patches in series.
> 
>  drivers/platform/x86/think-lmi.c | 46 ++++++++++++++++++++++++--------
>  1 file changed, 35 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 64cd453d6e7d..f3e1e4dacba2 100644
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
> @@ -463,23 +465,32 @@ static ssize_t new_password_store(struct kobject *kobj,
>  			sprintf(pwd_type, "%s", setting->pwd_type);
>  		}
>  
> +		mutex_lock(&tlmi_mutex);
>  		ret = tlmi_opcode_setting("WmiOpcodePasswordType", pwd_type);
> -		if (ret)
> +		if (ret) {
> +			mutex_unlock(&tlmi_mutex);
>  			goto out;
> -
> +		}
>  		if (tlmi_priv.pwd_admin->valid) {
>  			ret = tlmi_opcode_setting("WmiOpcodePasswordAdmin",
>  					tlmi_priv.pwd_admin->password);
> -			if (ret)
> +			if (ret) {
> +				mutex_unlock(&tlmi_mutex);
>  				goto out;
> +			}
>  		}
>  		ret = tlmi_opcode_setting("WmiOpcodePasswordCurrent01", setting->password);
> -		if (ret)
> +		if (ret) {
> +			mutex_unlock(&tlmi_mutex);
>  			goto out;
> +		}
>  		ret = tlmi_opcode_setting("WmiOpcodePasswordNew01", new_pwd);
> -		if (ret)
> +		if (ret) {
> +			mutex_unlock(&tlmi_mutex);
>  			goto out;
> +		}
>  		ret = tlmi_simple_call(LENOVO_OPCODE_IF_GUID, "WmiOpcodePasswordSetUpdate;");
> +		mutex_unlock(&tlmi_mutex);
>  	} else {
>  		/* Format: 'PasswordType,CurrentPw,NewPw,Encoding,KbdLang;' */
>  		auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s,%s,%s;",


I haven't take a really close / good look yet. But at a first glance
I think it would be cleaner to just take the mutex at the top
and unlock it after the out label to which all the existing goto-s
already go ?

> @@ -1000,11 +1011,16 @@ static ssize_t current_value_store(struct kobject *kobj,
>  			goto out;
>  		}
>  
> +		mutex_lock(&tlmi_mutex);
>  		ret = tlmi_simple_call(LENOVO_SET_BIOS_SETTING_CERT_GUID, set_str);
> -		if (ret)
> +		if (ret) {
> +			mutex_unlock(&tlmi_mutex);
>  			goto out;
> +		}
>  		ret = tlmi_simple_call(LENOVO_SAVE_BIOS_SETTING_CERT_GUID,
>  				tlmi_priv.pwd_admin->save_signature);
> +
> +		mutex_unlock(&tlmi_mutex);
>  		if (ret)
>  			goto out;
>  	} else if (tlmi_priv.opcode_support) {
> @@ -1021,18 +1037,23 @@ static ssize_t current_value_store(struct kobject *kobj,
>  			goto out;
>  		}
>  
> +		mutex_lock(&tlmi_mutex);
>  		ret = tlmi_simple_call(LENOVO_SET_BIOS_SETTINGS_GUID, set_str);
> -		if (ret)
> +		if (ret) {
> +			mutex_unlock(&tlmi_mutex);
>  			goto out;
> +		}
>  
>  		if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password[0]) {
>  			ret = tlmi_opcode_setting("WmiOpcodePasswordAdmin",
>  					tlmi_priv.pwd_admin->password);
> -			if (ret)
> +			if (ret) {
> +				mutex_unlock(&tlmi_mutex);
>  				goto out;
> +			}
>  		}
> -
>  		ret = tlmi_save_bios_settings("");
> +		mutex_unlock(&tlmi_mutex);
>  	} else { /* old non opcode based authentication method (deprecated)*/
>  		if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password[0]) {
>  			auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
> @@ -1056,14 +1077,17 @@ static ssize_t current_value_store(struct kobject *kobj,
>  			goto out;
>  		}
>  
> +		mutex_lock(&tlmi_mutex);
>  		ret = tlmi_simple_call(LENOVO_SET_BIOS_SETTINGS_GUID, set_str);
> -		if (ret)
> +		if (ret) {
> +			mutex_unlock(&tlmi_mutex);
>  			goto out;
> -
> +		}
>  		if (auth_str)
>  			ret = tlmi_save_bios_settings(auth_str);
>  		else
>  			ret = tlmi_save_bios_settings("");
> +		mutex_unlock(&tlmi_mutex);
>  	}
>  	if (!ret && !tlmi_priv.pending_changes) {
>  		tlmi_priv.pending_changes = true;

And the same here.

Regards,

Hans


