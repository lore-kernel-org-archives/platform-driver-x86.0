Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A45EB64DC
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Jul 2023 17:11:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235576AbjGNRL0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Jul 2023 13:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235826AbjGNRLL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Jul 2023 13:11:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53A61BF3
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 10:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689354627;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SyLSGGC+816M+VLFk1igcplrBYXyKDsETSW77wgraTU=;
        b=aNJBQxnl84Y3vufhUJA+BbiBYEcn4q2wHRhWjTSUHIkdNuWVS2rMLKeUeSl5NkhH5KxGD8
        3HhCE+Spwkov0iR98YzTEOk25+DNaNIxf+MKOZwyYpM1CRLLOdI06tIbvp01NxGxYlJ5Vn
        8ZOitvCCUG7SuTT4NVL3DTHrp6L6Rlw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-OiS5d0h9N5e1Sbp6Bvd8cw-1; Fri, 14 Jul 2023 13:10:24 -0400
X-MC-Unique: OiS5d0h9N5e1Sbp6Bvd8cw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-978a991c3f5so128963766b.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 10:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689354623; x=1691946623;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SyLSGGC+816M+VLFk1igcplrBYXyKDsETSW77wgraTU=;
        b=gfRlHkP9Vw4VncMt6//L9zqD+XTbtQkplFSKXSPJYAWx2S5lAoEUIbubqYS+XdHrqk
         ti3lGjLE4HnSds4d53uonsByIG+GHxsLvvOJISJC1J0JCGezVJdM9IDzPhNx+LkB8g/W
         kZ3cwwjut5WKZahUb8vOOxlqSX5at5KwXLROnoKYqy4UNLs9m7l6CkH9PHOkzKgsu1nJ
         hMoqZeyCblLSLl719VIexKr9MPLi7ce8RDcbi2oQEheUuQyETXXTLl4zTHRZ4WFVkvtp
         e/e0/7l19LOI6LM80RSM8vMFd9XTr7X3crRKbQDOZ080nhjdde+pN48lVuIsuktBG31P
         1oog==
X-Gm-Message-State: ABy/qLYaQyHMH0p7g2Kw/cH7M+839VFskNwbuDeV62auUYh9jIXChPsA
        3dQJ5lo8sMEQU5Wdb3SuqlFvVA/tPLTKNxNzAuBIHxjUQ5tjXb7LfysT1q9N89j7Q8ShwEmgNE1
        74W/yWioF2Kvmr2vSM5HXnnI8WpB7mC6xZA==
X-Received: by 2002:a17:906:5195:b0:973:daa0:2f6 with SMTP id y21-20020a170906519500b00973daa002f6mr4574926ejk.3.1689354623296;
        Fri, 14 Jul 2023 10:10:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFQHoKH96CLEC5VutmQUuapjxIDq+I62t3tJcRUeaqNhvPBG36gDFZtInnGk3MI5pONAqV7wA==
X-Received: by 2002:a17:906:5195:b0:973:daa0:2f6 with SMTP id y21-20020a170906519500b00973daa002f6mr4574912ejk.3.1689354622986;
        Fri, 14 Jul 2023 10:10:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id c26-20020a170906d19a00b0098e16f8c198sm5753308ejz.18.2023.07.14.10.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 10:10:22 -0700 (PDT)
Message-ID: <b9f81a5b-0511-9950-5a20-9e6cbd92d085@redhat.com>
Date:   Fri, 14 Jul 2023 19:10:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] platform/x86: serial-multi-instantiate: Auto detect IRQ
 resource for CSC3551
Content-Language: en-US, nl
To:     David Xu <xuwd1@hotmail.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <SY4P282MB18350CD8288687B87FFD2243E037A@SY4P282MB1835.AUSP282.PROD.OUTLOOK.COM>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <SY4P282MB18350CD8288687B87FFD2243E037A@SY4P282MB1835.AUSP282.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/13/23 15:35, David Xu wrote:
> The current code assumes that the CSC3551(multiple cs35l41) always have
> its interrupt pin connected to GPIO thus the IRQ can be acquired with
> acpi_dev_gpio_irq_get. However on some newer laptop models this is no
> longer the case as they have the CSC3551's interrupt pin connected to
> APIC. This causes smi_i2c_probe to fail on these machines.
> 
> To support these machines, a new macro IRQ_RESOURCE_AUTO was introduced
> for cs35l41 smi_node, and smi_get_irq function was modified so it tries
> to get GPIO irq resource first and if failed, tries to get
> APIC irq resource for cs35l41.
> 
> This patch affects only the cs35l41's probing and brings no negative
> influence on machines that indeed have the cs35l41's interrupt pin
> connected to GPIO.
> 
> Signed-off-by: David Xu <xuwd1@hotmail.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans





> ---
>  .../platform/x86/serial-multi-instantiate.c   | 21 +++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
> index f3dcbdd72fec..2c2abf69f049 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -21,6 +21,7 @@
>  #define IRQ_RESOURCE_NONE	0
>  #define IRQ_RESOURCE_GPIO	1
>  #define IRQ_RESOURCE_APIC	2
> +#define IRQ_RESOURCE_AUTO   3
>  
>  enum smi_bus_type {
>  	SMI_I2C,
> @@ -52,6 +53,18 @@ static int smi_get_irq(struct platform_device *pdev, struct acpi_device *adev,
>  	int ret;
>  
>  	switch (inst->flags & IRQ_RESOURCE_TYPE) {
> +	case IRQ_RESOURCE_AUTO:
> +		ret = acpi_dev_gpio_irq_get(adev, inst->irq_idx);
> +		if (ret > 0) {
> +			dev_dbg(&pdev->dev, "Using gpio irq\n");
> +			break;
> +		}
> +		ret = platform_get_irq(pdev, inst->irq_idx);
> +		if (ret > 0) {
> +			dev_dbg(&pdev->dev, "Using platform irq\n");
> +			break;
> +		}
> +		break;
>  	case IRQ_RESOURCE_GPIO:
>  		ret = acpi_dev_gpio_irq_get(adev, inst->irq_idx);
>  		break;
> @@ -307,10 +320,10 @@ static const struct smi_node int3515_data = {
>  
>  static const struct smi_node cs35l41_hda = {
>  	.instances = {
> -		{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> -		{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> -		{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> -		{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> +		{ "cs35l41-hda", IRQ_RESOURCE_AUTO, 0 },
> +		{ "cs35l41-hda", IRQ_RESOURCE_AUTO, 0 },
> +		{ "cs35l41-hda", IRQ_RESOURCE_AUTO, 0 },
> +		{ "cs35l41-hda", IRQ_RESOURCE_AUTO, 0 },
>  		{}
>  	},
>  	.bus_type = SMI_AUTO_DETECT,

