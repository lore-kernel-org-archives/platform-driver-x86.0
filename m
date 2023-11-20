Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C654C197A0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Nov 2023 13:06:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232138AbjKTNG2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Nov 2023 08:06:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231961AbjKTNG2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2023 08:06:28 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E5B112
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 05:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1700485583;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1NQ5cLT8IYekGwpisM4dl0LPbfY/xJ50HrjMwWPtrYU=;
        b=WbaRnwLmpb3qhrIn+WhFGlH6wvcocV5QgjMUuva0NXaiBzNvEj1sz6lDRbQ/FREvdRc+Lq
        PqrpOUKfRTPOkGHIBmvA8oXQtz/KFMZheIj65odubdia42NzVIunK9xnkGWS58bzAmGtiU
        pAr3sQ2RIYGNImBwj2KwfdJIF2egLKw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-UnxDiiLmOFOkWSDxgRErjw-1; Mon, 20 Nov 2023 08:06:22 -0500
X-MC-Unique: UnxDiiLmOFOkWSDxgRErjw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9fd0a58549bso158588866b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 05:06:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700485581; x=1701090381;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1NQ5cLT8IYekGwpisM4dl0LPbfY/xJ50HrjMwWPtrYU=;
        b=Z1bQ3vwB+0OtuTtZvKknEEicbZlCTJAq1ohQXdRsuUdI0w2bLY490Fk1g4WeFlTytW
         KqstAMNWk1XU5Z8YnzdOmUhUudvkJKr5Ru84oCGgbec6StnqYD+mecrtyQGQP16kDjKz
         jDNoE8R2vPhplAOKdSGata96RckIU5GsAJTGwqXjf8XicKyj08ulcDyxSvszh18R8kb8
         KBRva46rHyS9vWqZVJ4gGHaW/G3GZVw4qffGR20Rr/Icsf4QIKcRO3P30yHlGZud8YgO
         /u6AHIm4YF9D4MWRMRR/z30SmNrWD7kvvS9LSzZ1pNLRDUyIaGUD5dc4zKyoO4dHang+
         E/SQ==
X-Gm-Message-State: AOJu0YwpKTWc0rStouBPAmXhv6h4CLbd3pD5Wu1Jtj+Kk21KHk7Lg+dD
        J13JjwLCHq7ATdEyGeo5WlCh65xhMI+7nEEy5Eg35M9O08xi626jHBd1U57Z3SAgYkyP/x1QsI2
        CBGZweAcjrtC4Zn4oOgwu5w28tdC7+UPD3H4olr4kOQ==
X-Received: by 2002:a17:906:108d:b0:9ad:8a9e:23ee with SMTP id u13-20020a170906108d00b009ad8a9e23eemr1789481eju.13.1700485580962;
        Mon, 20 Nov 2023 05:06:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELvwN8Lt65+G4ZeqKhE8MZ0SNLIYY1WF/08aEqSUqx+9JN7mTwCSurwBgUSjhY2I4Zm3RUzA==
X-Received: by 2002:a17:906:108d:b0:9ad:8a9e:23ee with SMTP id u13-20020a170906108d00b009ad8a9e23eemr1789469eju.13.1700485580708;
        Mon, 20 Nov 2023 05:06:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h5-20020a170906718500b009bf7a4d591csm3920594ejk.11.2023.11.20.05.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 05:06:20 -0800 (PST)
Message-ID: <9bb5500a-c66f-4625-af07-454f6df5a32a@redhat.com>
Date:   Mon, 20 Nov 2023 14:06:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/dell: alienware-wmi: Use kasprintf()
Content-Language: en-US, nl
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org
References: <f2b2c9e5d80550e480a627c1b2139d5cc9472ffa.1699775015.git.christophe.jaillet@wanadoo.fr>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f2b2c9e5d80550e480a627c1b2139d5cc9472ffa.1699775015.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/12/23 08:44, Christophe JAILLET wrote:
> Use kasprintf() instead of hand writing it.
> This saves the need of an intermediate buffer.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

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
>  drivers/platform/x86/dell/alienware-wmi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> index a9477e5432e4..f5ee62ce1753 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -429,7 +429,6 @@ static DEVICE_ATTR(lighting_control_state, 0644, show_control_state,
>  static int alienware_zone_init(struct platform_device *dev)
>  {
>  	u8 zone;
> -	char buffer[10];
>  	char *name;
>  
>  	if (interface == WMAX) {
> @@ -466,8 +465,7 @@ static int alienware_zone_init(struct platform_device *dev)
>  		return -ENOMEM;
>  
>  	for (zone = 0; zone < quirks->num_zones; zone++) {
> -		sprintf(buffer, "zone%02hhX", zone);
> -		name = kstrdup(buffer, GFP_KERNEL);
> +		name = kasprintf(GFP_KERNEL, "zone%02hhX", zone);
>  		if (name == NULL)
>  			return 1;
>  		sysfs_attr_init(&zone_dev_attrs[zone].attr);

