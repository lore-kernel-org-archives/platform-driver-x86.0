Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B10C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Apr 2022 13:22:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238093AbiDDNYq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Apr 2022 09:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241154AbiDDNYq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Apr 2022 09:24:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E70D33DA67
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Apr 2022 06:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649078569;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GfWZvOiS7FWyoZEC2WbiqUdKb22CjLkbPxZvkmOz8h4=;
        b=SD3m0OgmBXCyan7WZn7voMfKAKGElPe/S40I8hIF6rT8h9+N/IyhS+o+rj/qwjyKtkxf3f
        /NnjNi8x5Iv4XWAASw5fZD3sASar9T6MrOIROOysZSBjJ4Hfm/uYyi6JiOHxzN3tYJ9jFO
        A7Vike9EbexZwSAz6UsDXDt9LdkSVes=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-MFjECoN5OoaguCcRBwTqfw-1; Mon, 04 Apr 2022 09:22:47 -0400
X-MC-Unique: MFjECoN5OoaguCcRBwTqfw-1
Received: by mail-ed1-f70.google.com with SMTP id j39-20020a05640223a700b0041992453601so5513559eda.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Apr 2022 06:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GfWZvOiS7FWyoZEC2WbiqUdKb22CjLkbPxZvkmOz8h4=;
        b=1BmdryPpSkEdz/shqAD09QHBVAeWYMV60gMac83mOLuvTLPWCuoWwxlXRwmbxDcflP
         PUIdE+eBjHmQ0k7VgO5bJ5uGGEdOiOJXj84TOchDA/+m+BIgVTHNJ9IPQDzB/GTtzizZ
         UwViT86sGAKc2fXneQJCB9WIhuzAy3nFzZcn9JmUc7lR/QxeeUA7s794/+fV4tzoVf9n
         fUQzOWWnvsHulY/6AXKiGELXoTv8kXSJulhQnZ6WRyUEvDCR4DVMNY2EJz2vdiAi0WvS
         LVc315oib3YwsJKNurMNKXtxDvtsEsIzoa4RZ0qKOxD8tV/iNrh56y8ovH+qsewjjzMF
         G1Kw==
X-Gm-Message-State: AOAM532NX+jE/lFaZ4fIN41z9D+7ZuG2pG1EBixUOkwFAiDy/86Q96cN
        lr4ymAxcmBUwib4LLPcsJPcjUFDNKnkUBCky6Djon0ndqum/h7wys/xhe+Pwriy22h0Vadvllro
        hY+bcoGs3NpomBUq6K8rx4AIvbGBasxLIpw==
X-Received: by 2002:a17:907:160b:b0:6e1:116e:7a59 with SMTP id hb11-20020a170907160b00b006e1116e7a59mr10611729ejc.579.1649078566415;
        Mon, 04 Apr 2022 06:22:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlHoYXNWZN1g7q9rCXOZFQ1blN5j3Vm6ou9TsKxTCi/KD60fyjPJs11/EiaOSU0GbhMlCd8A==
X-Received: by 2002:a17:907:160b:b0:6e1:116e:7a59 with SMTP id hb11-20020a170907160b00b006e1116e7a59mr10611710ejc.579.1649078566147;
        Mon, 04 Apr 2022 06:22:46 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id fx3-20020a170906b74300b006daecedee44sm4378767ejb.220.2022.04.04.06.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 06:22:45 -0700 (PDT)
Message-ID: <46d5b4f9-0913-b5d0-c5c8-37c0a6f5c291@redhat.com>
Date:   Mon, 4 Apr 2022 15:22:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] platform/x86: think-lmi: certificate support clean ups
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20220321180624.4761-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220321180624.4761-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/21/22 19:06, Mark Pearson wrote:
> Complete some clean-ups as reqested from the last review as follow-ups
>  - Remove certificate from structure as no need to store it any more
>  - Clean up return code handling
>  - Moved freeing of signature to before admin object released (issue
>    seen in testing when unloading module)
>  - Minor code flow improvements
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>

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
>  drivers/platform/x86/think-lmi.c | 45 +++++++++++---------------------
>  drivers/platform/x86/think-lmi.h |  1 -
>  2 files changed, 15 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 1817dd8d5d95..a01a92769c1a 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -740,16 +740,8 @@ static ssize_t certificate_store(struct kobject *kobj,
>  	if (!tlmi_priv.certificate_support)
>  		return -EOPNOTSUPP;
>  
> -	new_cert = kstrdup(buf, GFP_KERNEL);
> -	if (!new_cert)
> -		return -ENOMEM;
> -	/* Strip out CR if one is present */
> -	strip_cr(new_cert);
> -
>  	/* If empty then clear installed certificate */
> -	if (new_cert[0] == '\0') { /* Clear installed certificate */
> -		kfree(new_cert);
> -
> +	if ((buf[0] == '\0') || (buf[0] == '\n')) { /* Clear installed certificate */
>  		/* Check that signature is set */
>  		if (!setting->signature || !setting->signature[0])
>  			return -EACCES;
> @@ -763,14 +755,16 @@ static ssize_t certificate_store(struct kobject *kobj,
>  
>  		ret = tlmi_simple_call(LENOVO_CLEAR_BIOS_CERT_GUID, auth_str);
>  		kfree(auth_str);
> -		if (ret)
> -			return ret;
>  
> -		kfree(setting->certificate);
> -		setting->certificate = NULL;
> -		return count;
> +		return ret ?: count;
>  	}
>  
> +	new_cert = kstrdup(buf, GFP_KERNEL);
> +	if (!new_cert)
> +		return -ENOMEM;
> +	/* Strip out CR if one is present */
> +	strip_cr(new_cert);
> +
>  	if (setting->cert_installed) {
>  		/* Certificate is installed so this is an update */
>  		if (!setting->signature || !setting->signature[0]) {
> @@ -792,21 +786,14 @@ static ssize_t certificate_store(struct kobject *kobj,
>  		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
>  				new_cert, setting->password);
>  	}
> -	if (!auth_str) {
> -		kfree(new_cert);
> +	kfree(new_cert);
> +	if (!auth_str)
>  		return -ENOMEM;
> -	}
>  
>  	ret = tlmi_simple_call(guid, auth_str);
>  	kfree(auth_str);
> -	if (ret) {
> -		kfree(new_cert);
> -		return ret;
> -	}
>  
> -	kfree(setting->certificate);
> -	setting->certificate = new_cert;
> -	return count;
> +	return ret ?: count;
>  }
>  
>  static struct kobj_attribute auth_certificate = __ATTR_WO(certificate);
> @@ -846,7 +833,6 @@ static ssize_t save_signature_store(struct kobject *kobj,
>  {
>  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>  	char *new_signature;
> -	int ret;
>  
>  	if (!capable(CAP_SYS_ADMIN))
>  		return -EPERM;
> @@ -1195,6 +1181,10 @@ static void tlmi_release_attr(void)
>  
>  	kset_unregister(tlmi_priv.attribute_kset);
>  
> +	/* Free up any saved signatures */
> +	kfree(tlmi_priv.pwd_admin->signature);
> +	kfree(tlmi_priv.pwd_admin->save_signature);
> +
>  	/* Authentication structures */
>  	sysfs_remove_group(&tlmi_priv.pwd_admin->kobj, &auth_attr_group);
>  	kobject_put(&tlmi_priv.pwd_admin->kobj);
> @@ -1211,11 +1201,6 @@ static void tlmi_release_attr(void)
>  	}
>  
>  	kset_unregister(tlmi_priv.authentication_kset);
> -
> -	/* Free up any saved certificates/signatures */
> -	kfree(tlmi_priv.pwd_admin->certificate);
> -	kfree(tlmi_priv.pwd_admin->signature);
> -	kfree(tlmi_priv.pwd_admin->save_signature);
>  }
>  
>  static int tlmi_sysfs_init(void)
> diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/think-lmi.h
> index 4f69df6eed07..4daba6151cd6 100644
> --- a/drivers/platform/x86/think-lmi.h
> +++ b/drivers/platform/x86/think-lmi.h
> @@ -63,7 +63,6 @@ struct tlmi_pwd_setting {
>  	int index; /*Used for HDD and NVME auth */
>  	enum level_option level;
>  	bool cert_installed;
> -	char *certificate;
>  	char *signature;
>  	char *save_signature;
>  };

