Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627B6C636CD
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Feb 2023 16:22:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232904AbjBJQWU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Feb 2023 11:22:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232725AbjBJQWS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Feb 2023 11:22:18 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 935B778D53
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 08:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676046090;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q/OYelhAxbUO/ZarJ72R6o4cW+B/TE8DQz5tj7Qg/eE=;
        b=J/fLh1ZG99qw+97+PvbUpY++560fOiGz3U7MC2URy33IyY87CR5G3L5CWf9zAAxYVrSBLH
        Wgj6Mecy3w40qedFDd2Z32JUUclO88FV9jIAT+ty0Hp8wPwLUyhGQzgqcr8fvIZOutaTD1
        DdeANC+GLA5VluhArlNBXU84rJug1b8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-623-gQxyfXVkOxmyhbnHpeZDwA-1; Fri, 10 Feb 2023 11:21:29 -0500
X-MC-Unique: gQxyfXVkOxmyhbnHpeZDwA-1
Received: by mail-ed1-f72.google.com with SMTP id w3-20020a056402268300b00487e0d9b53fso3856822edd.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 08:21:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/OYelhAxbUO/ZarJ72R6o4cW+B/TE8DQz5tj7Qg/eE=;
        b=ClDz/MX5pce3fHQyUljfOgRTGKcrP/LsPajSnTiHd46sMGG6MX5ku43glArOon2g0i
         fCJrSSVZuM1sVxEiyuGMgnxe8zecS/8Jf8vVti33CObdoGewNSO/xVcBg5vzMdtQdtgc
         zmgnBz+kOtFQPlupg2EzCkqpeA3gYCr//o0P89RkR21/IQiwZut6eYY70TRhHSAtvvA7
         qzJGnXstQlhqTBlx1W+lbxx6PqRolZHPw42Eyhmb1btTMXFaVNU6v6ltNboyXXIBPz8k
         2oc3TokoaaMDR1q50/505O3ECVNDtbgrqoG626Oe+000/98OrbKYMjDWoTj6v+PZG7aW
         sNnw==
X-Gm-Message-State: AO0yUKU+m/O51M51VgIGFb8BtQiJe4q/DaCFD193xV/sqXOu5b+X5tNX
        p+YWCDt5fPhe7UWt9TvrQthwrJX1mCLnc9FWdNf3TMupQusL5rAsLY53pOJY1i1AeCHMgMIeSHT
        8peBOoLLxpkLD2hyXKRfjqpMy+UN3xQLsWw==
X-Received: by 2002:a17:907:2142:b0:888:7d50:33b4 with SMTP id rk2-20020a170907214200b008887d5033b4mr15630136ejb.34.1676046088519;
        Fri, 10 Feb 2023 08:21:28 -0800 (PST)
X-Google-Smtp-Source: AK7set8gLFdqWlVKugyAC/tmezDqjsO71zweOWnYUVrFdsRLIGM+8qt0sJE38MgyssPd0DU6xl5gvg==
X-Received: by 2002:a17:907:2142:b0:888:7d50:33b4 with SMTP id rk2-20020a170907214200b008887d5033b4mr15630128ejb.34.1676046088372;
        Fri, 10 Feb 2023 08:21:28 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a9-20020a17090640c900b008720c458bd4sm2585954ejk.3.2023.02.10.08.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 08:21:27 -0800 (PST)
Message-ID: <916f252b-ef7c-6d22-0c4c-ecd198d49fbf@redhat.com>
Date:   Fri, 10 Feb 2023 17:21:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86/intel/vsec: Use mutex for ida_alloc() and
 ida_free()
Content-Language: en-US, nl
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        markgross@kernel.org, david.e.box@intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230207125821.3837799-1-srinivas.pandruvada@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230207125821.3837799-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/7/23 13:58, Srinivas Pandruvada wrote:
> ID alloc and free functions don't have in built protection for parallel
> invocation of ida_alloc() and ida_free(). With the current flow in the
> vsec driver, there is no such scenario. But add mutex protection for
> potential future changes.
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

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
>  drivers/platform/x86/intel/vsec.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
> index b936fc5776d7..f1680b7e64f5 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -129,11 +129,16 @@ static void intel_vsec_remove_aux(void *data)
>  	auxiliary_device_uninit(data);
>  }
>  
> +static DEFINE_MUTEX(vsec_ida_lock);
> +
>  static void intel_vsec_dev_release(struct device *dev)
>  {
>  	struct intel_vsec_device *intel_vsec_dev = dev_to_ivdev(dev);
>  
> +	mutex_lock(&vsec_ida_lock);
>  	ida_free(intel_vsec_dev->ida, intel_vsec_dev->auxdev.id);
> +	mutex_unlock(&vsec_ida_lock);
> +
>  	kfree(intel_vsec_dev->resource);
>  	kfree(intel_vsec_dev);
>  }
> @@ -145,7 +150,9 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
>  	struct auxiliary_device *auxdev = &intel_vsec_dev->auxdev;
>  	int ret, id;
>  
> +	mutex_lock(&vsec_ida_lock);
>  	ret = ida_alloc(intel_vsec_dev->ida, GFP_KERNEL);
> +	mutex_unlock(&vsec_ida_lock);
>  	if (ret < 0) {
>  		kfree(intel_vsec_dev);
>  		return ret;
> @@ -161,7 +168,9 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
>  
>  	ret = auxiliary_device_init(auxdev);
>  	if (ret < 0) {
> +		mutex_lock(&vsec_ida_lock);
>  		ida_free(intel_vsec_dev->ida, auxdev->id);
> +		mutex_unlock(&vsec_ida_lock);
>  		kfree(intel_vsec_dev->resource);
>  		kfree(intel_vsec_dev);
>  		return ret;

