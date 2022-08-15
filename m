Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5342EC00140
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Aug 2022 13:20:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242855AbiHONUV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 15 Aug 2022 09:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242856AbiHONUS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Aug 2022 09:20:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6469F1BB
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Aug 2022 06:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660569614;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4rVK1ozz77xi6iL2PkzLoziMUza56btcQ1nNVLrI5o8=;
        b=R2rleXtFMJf7kh8BYiEafO2eFB88WNl4TDr4sMffUeaI8zrgzLk+ok1F/drnT52B0c5uZt
        Efi0phscmnQcV3YJ1OY3ZUYCteweFSoo4dFTxEyfXDveJYr9fAXAzE6Qg1UY8A2jsMvsQD
        z38Vi+59nOnczCIgQQEfTOjggg9LmP0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-452-ORzwQ3_4M5mRQHrrBelUrg-1; Mon, 15 Aug 2022 09:20:13 -0400
X-MC-Unique: ORzwQ3_4M5mRQHrrBelUrg-1
Received: by mail-ej1-f71.google.com with SMTP id hp22-20020a1709073e1600b007309edc4089so1047015ejc.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Aug 2022 06:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=4rVK1ozz77xi6iL2PkzLoziMUza56btcQ1nNVLrI5o8=;
        b=thzZKCuxQ8wHhT/C5WoQ3zu8XKThquxtIA0/vdcWoPVXM1gHK98iBF6QCUHEaNqJBP
         cak40I5Qm2TyVwn/bJgawQe53D2FKktWUpGmy4RalG3uuXQlTaCvbGcAEhT6XWpOlkc+
         LfT5xwDSslo6RA5BelxrOpip/PuSNW+KKDSWonwXsjnn8wAzEp6vSciPDFc4T+N+MAlL
         VRjcZHQgNyM2IFgHK68+DgqtJuNoIbmAxUHZaMxl3iPDOR1pr3fZ93Md4SiJfLRclta0
         hd6iZA4KCwQAC94QIbS7t69MjvAxw5kGpH2mNf90ncjOEyabFeF2RLRrH7bymP6ra3Xq
         jArQ==
X-Gm-Message-State: ACgBeo3PJt/PnLMcu8p+9ykfG5ZhjNkgOTJKQmlkZlJ1WMwvnYrED0rc
        0+AtLaTRaplSy3h5fDPRAt16KRWHOYUOcWNc+fdR2QPavzh4UyKNoZwRKIAjIFRc014tN/YmE46
        VMR2ENcAhA3lt8InPVxrxNpJKPqaysFO9eQ==
X-Received: by 2002:a05:6402:14e:b0:443:f58:17e9 with SMTP id s14-20020a056402014e00b004430f5817e9mr14700023edu.106.1660569612017;
        Mon, 15 Aug 2022 06:20:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5XoVQ0Mp3AJX4T37JptQoNzJiJ8k3q2ZrR61Bs9IRJzVKLQFggiLS79zLf1pPagMjBIlhn8Q==
X-Received: by 2002:a05:6402:14e:b0:443:f58:17e9 with SMTP id s14-20020a056402014e00b004430f5817e9mr14700007edu.106.1660569611869;
        Mon, 15 Aug 2022 06:20:11 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id cw5-20020a056402228500b0043bd192e826sm6621810edb.17.2022.08.15.06.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Aug 2022 06:20:11 -0700 (PDT)
Message-ID: <0b448932-8cfa-a718-ee38-2784d914c66b@redhat.com>
Date:   Mon, 15 Aug 2022 15:20:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH linux-next] platform/x86: asus-wmi:Use the function
 kobj_to_dev()
Content-Language: en-US
To:     cgel.zte@gmail.com
Cc:     corentin.chary@gmail.com, markgross@kernel.org,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
References: <20220811013203.16010-1-ye.xingchen@zte.com.cn>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220811013203.16010-1-ye.xingchen@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/11/22 03:32, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Use kobj_to_dev() instead of open-coding it.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

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
>  drivers/platform/x86/asus-wmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 89b604e04d7f..afb33a084f44 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -2006,7 +2006,7 @@ static struct attribute *hwmon_attributes[] = {
>  static umode_t asus_hwmon_sysfs_is_visible(struct kobject *kobj,
>  					  struct attribute *attr, int idx)
>  {
> -	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct asus_wmi *asus = dev_get_drvdata(dev->parent);
>  	u32 value = ASUS_WMI_UNSUPPORTED_METHOD;
>  
> @@ -3294,7 +3294,7 @@ static struct attribute *platform_attributes[] = {
>  static umode_t asus_sysfs_is_visible(struct kobject *kobj,
>  				    struct attribute *attr, int idx)
>  {
> -	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct asus_wmi *asus = dev_get_drvdata(dev);
>  	bool ok = true;
>  	int devid = -1;

