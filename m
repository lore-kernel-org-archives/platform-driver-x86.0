Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB45C4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Nov 2022 14:32:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232401AbiKGOcy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Nov 2022 09:32:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232402AbiKGOck (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Nov 2022 09:32:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9668B65B9
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Nov 2022 06:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667831314;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=emjjZ/62TZmqIpdi7/t+9Y3brnQXXZB+OTULfLCLMPU=;
        b=bp4C83lt/xo4eq1jDg5r2BF/Q25/eyZc2KPA1oRLIuw70XZGcBYL184ACIgel2L8dgYanc
        cPw31pXWqklRBkcHR8+yA6X8q35xTPHYcx8p7a1c29Qm80o0Bxu7mWm7m5+dgwwNhZe4qp
        GRI2GCUe/DxDylhjYqnk8B8ilR8XUeg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-364-3boUf1b1NDyJBC74r-39Yg-1; Mon, 07 Nov 2022 09:28:33 -0500
X-MC-Unique: 3boUf1b1NDyJBC74r-39Yg-1
Received: by mail-ej1-f72.google.com with SMTP id qb20-20020a1709077e9400b007ae67a9aa7dso1409343ejc.16
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Nov 2022 06:28:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=emjjZ/62TZmqIpdi7/t+9Y3brnQXXZB+OTULfLCLMPU=;
        b=Rf91r8063DqfbsoGrRXXo6c6aPDd0PRr+VbhjuiY5NYuTQzJPDrzlr4m3g9XVzpGEn
         yqm7EqAnusmSWQ+BKmcGQ0PaEOLlTmKZYLjnTqaMZHgwBnU6QTNB7vNKWBnqEoLE2xEd
         aB6v4IIuZt7PziLwLHKxUJDT9aCPMW7e1KzB8hleB7Lw0NgbCpLaRoo0gz0wmM5eOCjC
         BY1lX+SzE8mAF8KFOa0mfjOQ0Ti0UaHamdc82ZFhMjVNoaKGwdhgSEQBpKEkc2x29fv1
         89sv+LlCJ72OjYxOrwl8gjWtREzSjX6YeJsrqfpWiWocB7260RwhcP9STzTREAOC92Vd
         kr9A==
X-Gm-Message-State: ACrzQf01I97ljRXFYaDvgyrjJ4C9WZFMn/mTtCc0Rw7OSAWcvscRFOsZ
        XicebR+wl8e9hjdI4VCM0B8c93aTyodrHDx/nbi8ojog26mnJZBecmtfcS4w4v3xr2nPMuQOQzD
        A6+JvUyJq+MfiZxYKM7NFgP10AZqqrpDGMg==
X-Received: by 2002:a05:6402:448:b0:45c:8de5:4fc with SMTP id p8-20020a056402044800b0045c8de504fcmr50846891edw.133.1667831311957;
        Mon, 07 Nov 2022 06:28:31 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4KpA4huxORpnt8h+W90W+eMxSaQ1KzMnW2roshHlmhvhIOtw6kXglHDrSoSbr8FFILmdz8Mg==
X-Received: by 2002:a05:6402:448:b0:45c:8de5:4fc with SMTP id p8-20020a056402044800b0045c8de504fcmr50846876edw.133.1667831311752;
        Mon, 07 Nov 2022 06:28:31 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ce12-20020a170906b24c00b0078b83968ad4sm3441465ejb.24.2022.11.07.06.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 06:28:31 -0800 (PST)
Message-ID: <7123941b-1e71-f31c-b635-8f8f89f75ee9@redhat.com>
Date:   Mon, 7 Nov 2022 15:28:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] platform/x86: asus-tf103c-dock: fix possible memory leak
 in tf103c_dock_probe()
Content-Language: en-US
To:     Yang Yingliang <yangyingliang@huawei.com>,
        platform-driver-x86@vger.kernel.org,
        acpi4asus-user@lists.sourceforge.net
Cc:     corentin.chary@gmail.com
References: <20221029062759.2581143-1-yangyingliang@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221029062759.2581143-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Yang,

On 10/29/22 08:27, Yang Yingliang wrote:
> If hid_add_device() returns error, it should call hid_destroy_device()
> to free the hid which is allocated in hid_allocate_device().
> 
> Fixes: 0a6509b0926d ("platform/x86: Add Asus TF103C dock driver")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/platform/x86/asus-tf103c-dock.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-tf103c-dock.c b/drivers/platform/x86/asus-tf103c-dock.c
> index 62310e06282b..f81d58dfd322 100644
> --- a/drivers/platform/x86/asus-tf103c-dock.c
> +++ b/drivers/platform/x86/asus-tf103c-dock.c
> @@ -850,8 +850,10 @@ static int tf103c_dock_probe(struct i2c_client *client)
>  	strscpy(dock->hid->phys, dev_name(dev), sizeof(dock->hid->phys));
>  
>  	ret = hid_add_device(dock->hid);
> -	if (ret)
> +	if (ret) {
> +		hid_destroy_device(dock->hid);
>  		return dev_err_probe(dev, ret, "adding hid dev\n");
> +	}

hid_destroy_device() is already called by tf103c_dock_non_devm_cleanup()
which is registered early on as a cleanup handler through
devm_add_action_or_reset().

Regards,

Hans

