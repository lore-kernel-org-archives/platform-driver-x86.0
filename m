Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88336CD37B0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Sep 2023 16:40:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbjIRQk3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 18 Sep 2023 12:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjIRQkD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Sep 2023 12:40:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C22BF30E7
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Sep 2023 09:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695053439;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SFTEO1gVuB0o9VqnZ24xUYBL6UVXB1fvcQlZJoLMNtg=;
        b=IFnqmY6L3KdaAAdNajO4b8LzNpggMAS4J+cK7oi8dQ2fVkAzx5QQKLttZ34NqJxETZQLeh
        Rx0GnnfGSwpeSL2YSbjVCk7JVjogB7YyUubbJJeClHsvoEJAozduUjJsSbpSWmXyt2/NZT
        kfSUhuR4Nfr0RaK/gXYCykcYgNOhswg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-Qg8zyj5uP4CQD-ZYDN0pIQ-1; Mon, 18 Sep 2023 10:09:43 -0400
X-MC-Unique: Qg8zyj5uP4CQD-ZYDN0pIQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-99bca0b9234so293758366b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Sep 2023 07:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695046182; x=1695650982;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SFTEO1gVuB0o9VqnZ24xUYBL6UVXB1fvcQlZJoLMNtg=;
        b=UaN1Rf3jsJMmZzMCpdP9jR9sWMuZZJtdIeTMTZKMQNimDrKH6WS7PAwRIqjoVfNek4
         Rnq4GTndxsC45ObQghx0PDc1adt419IxsagaQ7RtLCrNiLcatSafpmLAR2pYmMQqo1EO
         V5GrRNqaq085OZkYLjTLkvnwNuay7ZEjtBB5WqpiNk+QovWvZ/iWESTBphta1aLQIIrE
         uUF86Yr3ZtZ0GmwB0eCdAkfVCoMuoYcn6M7oSRvXrqdWQncnPwAsxfxKc+x7dNB199+X
         HUyD/uUdjpV629MlPseC5D7D1jUOTs4BiuWJRTn1PesHUr1Mo9SjRV/OBFeAjXGk6ndd
         9oqg==
X-Gm-Message-State: AOJu0Yy8bVLiQ0Ujtq56lwN1lErgaqbqjHyxXhLLHmAg+sAo/krfWAoq
        9ZxC3tGsAUVR+6Zez6uTruXme4Ts4qMSi2C0ac7f7HwJHOuTdf5YLZE9ta9eAu4bUT2OiDhOYuc
        /83TwcjHjJjBmuRA9/2hIjMrm1gHxgg/ICQ==
X-Received: by 2002:a17:907:2cec:b0:9a5:ca17:b586 with SMTP id hz12-20020a1709072cec00b009a5ca17b586mr7679576ejc.34.1695046182278;
        Mon, 18 Sep 2023 07:09:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEk2UU+H1pB6MTYOAIhW4d4zvDo2AClUlNFYv8EPrbCC3z3wLzm3/tF45dRt8f4wjf036qW5A==
X-Received: by 2002:a17:907:2cec:b0:9a5:ca17:b586 with SMTP id hz12-20020a1709072cec00b009a5ca17b586mr7679560ejc.34.1695046181993;
        Mon, 18 Sep 2023 07:09:41 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id dv7-20020a170906b80700b0099b8234a9fesm6553239ejb.1.2023.09.18.07.09.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 07:09:40 -0700 (PDT)
Message-ID: <f780bdfc-8a0d-ca80-8cb1-71c6ec32f77b@redhat.com>
Date:   Mon, 18 Sep 2023 16:09:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] platform/x86: think-lmi: Replace kstrdup() +
 strreplace() with kstrdup_and_replace()
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mark Pearson <markpearson@lenovo.com>,
        Mark Gross <markgross@kernel.org>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20230918135116.1248560-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230918135116.1248560-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andy,

On 9/18/23 15:51, Andy Shevchenko wrote:
> Replace open coded functionalify of kstrdup_and_replace() with a call.
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: rebased on top of review-hans (Hans), added tag (Ilpo)
>  drivers/platform/x86/think-lmi.c | 43 +++++++++++---------------------
>  1 file changed, 15 insertions(+), 28 deletions(-)

Thank you for the new version.

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


> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index f69003c30fa2..4e0d52dc3944 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -15,7 +15,7 @@
>  #include <linux/errno.h>
>  #include <linux/fs.h>
>  #include <linux/mutex.h>
> -#include <linux/string.h>
> +#include <linux/string_helpers.h>
>  #include <linux/types.h>
>  #include <linux/dmi.h>
>  #include <linux/wmi.h>
> @@ -432,13 +432,11 @@ static ssize_t new_password_store(struct kobject *kobj,
>  	if (!tlmi_priv.can_set_bios_password)
>  		return -EOPNOTSUPP;
>  
> -	new_pwd = kstrdup(buf, GFP_KERNEL);
> +	/* Strip out CR if one is present, setting password won't work if it is present */
> +	new_pwd = kstrdup_and_replace(buf, '\n', '\0', GFP_KERNEL);
>  	if (!new_pwd)
>  		return -ENOMEM;
>  
> -	/* Strip out CR if one is present, setting password won't work if it is present */
> -	strip_cr(new_pwd);
> -
>  	/* Use lock in case multiple WMI operations needed */
>  	mutex_lock(&tlmi_mutex);
>  
> @@ -709,13 +707,11 @@ static ssize_t cert_to_password_store(struct kobject *kobj,
>  	if (!setting->signature || !setting->signature[0])
>  		return -EACCES;
>  
> -	passwd = kstrdup(buf, GFP_KERNEL);
> +	/* Strip out CR if one is present */
> +	passwd = kstrdup_and_replace(buf, '\n', '\0', GFP_KERNEL);
>  	if (!passwd)
>  		return -ENOMEM;
>  
> -	/* Strip out CR if one is present */
> -	strip_cr(passwd);
> -
>  	/* Format: 'Password,Signature' */
>  	auth_str = kasprintf(GFP_KERNEL, "%s,%s", passwd, setting->signature);
>  	if (!auth_str) {
> @@ -765,11 +761,10 @@ static ssize_t certificate_store(struct kobject *kobj,
>  		return ret ?: count;
>  	}
>  
> -	new_cert = kstrdup(buf, GFP_KERNEL);
> +	/* Strip out CR if one is present */
> +	new_cert = kstrdup_and_replace(buf, '\n', '\0', GFP_KERNEL);
>  	if (!new_cert)
>  		return -ENOMEM;
> -	/* Strip out CR if one is present */
> -	strip_cr(new_cert);
>  
>  	if (setting->cert_installed) {
>  		/* Certificate is installed so this is an update */
> @@ -817,13 +812,11 @@ static ssize_t signature_store(struct kobject *kobj,
>  	if (!tlmi_priv.certificate_support)
>  		return -EOPNOTSUPP;
>  
> -	new_signature = kstrdup(buf, GFP_KERNEL);
> +	/* Strip out CR if one is present */
> +	new_signature = kstrdup_and_replace(buf, '\n', '\0', GFP_KERNEL);
>  	if (!new_signature)
>  		return -ENOMEM;
>  
> -	/* Strip out CR if one is present */
> -	strip_cr(new_signature);
> -
>  	/* Free any previous signature */
>  	kfree(setting->signature);
>  	setting->signature = new_signature;
> @@ -846,13 +839,11 @@ static ssize_t save_signature_store(struct kobject *kobj,
>  	if (!tlmi_priv.certificate_support)
>  		return -EOPNOTSUPP;
>  
> -	new_signature = kstrdup(buf, GFP_KERNEL);
> +	/* Strip out CR if one is present */
> +	new_signature = kstrdup_and_replace(buf, '\n', '\0', GFP_KERNEL);
>  	if (!new_signature)
>  		return -ENOMEM;
>  
> -	/* Strip out CR if one is present */
> -	strip_cr(new_signature);
> -
>  	/* Free any previous signature */
>  	kfree(setting->save_signature);
>  	setting->save_signature = new_signature;
> @@ -992,13 +983,11 @@ static ssize_t current_value_store(struct kobject *kobj,
>  	if (tlmi_priv.save_mode == TLMI_SAVE_BULK && tlmi_priv.reboot_required)
>  		return -EPERM;
>  
> -	new_setting = kstrdup(buf, GFP_KERNEL);
> +	/* Strip out CR if one is present */
> +	new_setting = kstrdup_and_replace(buf, '\n', '\0', GFP_KERNEL);
>  	if (!new_setting)
>  		return -ENOMEM;
>  
> -	/* Strip out CR if one is present */
> -	strip_cr(new_setting);
> -
>  	/* Use lock in case multiple WMI operations needed */
>  	mutex_lock(&tlmi_mutex);
>  
> @@ -1279,13 +1268,11 @@ static ssize_t debug_cmd_store(struct kobject *kobj, struct kobj_attribute *attr
>  	if (!tlmi_priv.can_debug_cmd)
>  		return -EOPNOTSUPP;
>  
> -	new_setting = kstrdup(buf, GFP_KERNEL);
> +	/* Strip out CR if one is present */
> +	new_setting = kstrdup_and_replace(buf, '\n', '\0', GFP_KERNEL);
>  	if (!new_setting)
>  		return -ENOMEM;
>  
> -	/* Strip out CR if one is present */
> -	strip_cr(new_setting);
> -
>  	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password[0]) {
>  		auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
>  				tlmi_priv.pwd_admin->password,

