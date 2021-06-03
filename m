Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2177C47082
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Jun 2021 13:31:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 904D8613E9
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Jun 2021 13:31:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbhFCNcz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Jun 2021 09:32:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31763 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230056AbhFCNcz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Jun 2021 09:32:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622727070;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R9mgrHnoQWfz+Lx1pNFS6pLV3bnZrTZwEJXp3OINptk=;
        b=XXkwUSpDq6qJO4FlpQ8dDsEHl/yi7xcG1EPOQzZ8puabXN7H1eRcxFg0p0OwRUFC5e7c83
        pR43p36khg+BfmsslUU7SwMDTpawNwToQ42fYJtK0KuyW5EpH0z1rtA1LRaZcErHvf3H4S
        qNS5dtTmCHd2Z34a+muH/8BHVMHAb5M=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-LFcBsWZ0N9-e4yGE8mIPkw-1; Thu, 03 Jun 2021 09:31:00 -0400
X-MC-Unique: LFcBsWZ0N9-e4yGE8mIPkw-1
Received: by mail-ed1-f70.google.com with SMTP id c12-20020aa7d60c0000b029038fccdf4390so3265662edr.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 Jun 2021 06:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R9mgrHnoQWfz+Lx1pNFS6pLV3bnZrTZwEJXp3OINptk=;
        b=FnqC3M7ILpjayVwyNszWNX6yfm2LMwNCEeu1iAylH8kjtuIDzsp7C5zxaMRJerZEuV
         Y+FgyO71KZnSh9xOIy++J02Mn18mpQFtXC7baoYpUsTAUnauNJ7G724pAkF+CdKZnsuZ
         ngJi+XBv6TyJaDr5dXTrRwl6/gwtpnZhYIhZdNiKZk3/AbkjiQ6xzUEGJwJP4TwCUe8q
         e0j8FVeSsh/NWph9jccLrRZcJxEMO3zVT18S7dDnRza8fd1PsXmTD/Q4BEPcECO2mdLu
         0Go5o8Bj3RINEzmIRjDOPFBTERNyzMPkkE9WP2LHhLZg+Qzkn5BlBUk0pU/4TrCXXHe8
         v9iA==
X-Gm-Message-State: AOAM533eFappFnTm+iC5VPBzTwY+d6AXydQ5HcyiIwppqk58OVglBSsb
        SBmISnLlCL+0Zva5mZySGv8+VONRyyihR8XwgN7Pw1hmNqeB2W0bmhPJ/MoEjk2J/35rXeDLvHq
        1pKwmSC94HVzVPz39lOmaWbkjz/75Hr2NkA==
X-Received: by 2002:aa7:cd83:: with SMTP id x3mr43493332edv.373.1622727059023;
        Thu, 03 Jun 2021 06:30:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcYm2Vl3CGK3EAqO80FbfNrfOBMTF95+4L8PCP+46TP2GrF0hA3TK57YH+K5jlODCWPqYHww==
X-Received: by 2002:aa7:cd83:: with SMTP id x3mr43493318edv.373.1622727058896;
        Thu, 03 Jun 2021 06:30:58 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id d17sm1511635ejp.90.2021.06.03.06.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jun 2021 06:30:58 -0700 (PDT)
Subject: Re: [PATCH platform] platform/mellanox: mlxreg-hotplug: remove
 IRQF_NO_AUTOEN flag from request_irq
To:     Mykola Kostenok <c_mykolak@nvidia.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
References: <20210601111744.2247071-1-c_mykolak@nvidia.com>
 <3986919a-45b0-7cde-acbe-26877c7525ab@redhat.com>
 <DM6PR12MB4155CB9B89EE94338D2BFC8BE23E9@DM6PR12MB4155.namprd12.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ca063c1a-1a23-eeaa-ecbb-f4f37ff885ae@redhat.com>
Date:   Thu, 3 Jun 2021 15:30:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <DM6PR12MB4155CB9B89EE94338D2BFC8BE23E9@DM6PR12MB4155.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/1/21 4:47 PM, Mykola Kostenok wrote:
> Hi,
> We must have IRQF_SHARED flag. This is for system interrupts (FAN, PS, cable power, ASIC health) and now it's used for new line card driver, which should be released soon (this is for new modular system).
> Actually "mlxreg-hotplug" driver is responsible to instantiate any other driver, which Will share this IRQ line.
> So, at the moment "mlxreg-hotplug" is probed, no other users shared this line are exist.
> 
> It means that " disable_irq(priv->irq);" in this driver will not impact anyone who is supposed to use this IRQ line. 
> 
> It was initial intension to revert commit, added IRQF_NO_AUTOEN flag.
> However, it seems safe remove "disable_irq(priv->irq);" line.
> 
> But maybe it more logical to just move disable_irq() to mlxreg_hotplug_set_irq().
> Until mlxreg_hotplug_set_irq() doesn't open top aggregation mask, interrupts can not get to CPU.
> So, maybe I modify patch in this way.

This talk about a top aggregation mask and about mlxreg-hotplug instantiating
other devices sounds like this should use MFD (which I think you already do?)
in combination with an irqchip at the MFD driver level which de-multiplexes
the interrupt in per instantiated device interrupts and the per-instantiated-device
drivers then use the child interrupts of this irqchip.  This is how this is normally
done.

Also if you clear the top aggregation mask *before* requesting the IRQ then the
(temporarily) disabling of the IRQ should not be necessary.

For now though, lets just go with a simple revert, including restoring the
disable_irq() call, so that I can queue up this revert as a fix for 5.13.

Regards,

Hans



> 
> Best regards, Mykola Kostenok
> 
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Tuesday, June 1, 2021 3:10 PM
>> To: Mykola Kostenok <c_mykolak@nvidia.com>
>> Cc: platform-driver-x86@vger.kernel.org
>> Subject: Re: [PATCH platform] platform/mellanox: mlxreg-hotplug: remove
>> IRQF_NO_AUTOEN flag from request_irq
>>
>> Hi,
>>
>> On 6/1/21 1:17 PM, Mykola Kostenok wrote:
>>> This flag causes mlxreg-hotplug probing failure after flag
>> "IRQF_NO_AUTOEN"
>>> has been added to:
>>> 	err = devm_request_irq(&pdev->dev, priv->irq,
>>> 			       mlxreg_hotplug_irq_handler,
>> IRQF_TRIGGER_FALLING
>>> 			       | IRQF_SHARED | IRQF_NO_AUTOEN,
>>> 			       "mlxreg-hotplug", priv);
>>
>>
>> Right, but if you look at commit bee3ecfed0fc9 ("platform/mellanox: mlxreg-
>> hotplug:
>> move to use request_irq by IRQF_NO_AUTOEN flag") then that also removes
>> a
>>
>> disable_irq(priv->irq);
>>
>> Immediately after this call, if the IRQF_NO_AUTOEN flag is going to be
>> dropped then that call should be re-added. In cases like this it is usually
>> better to just do a git revert of the offending patch, that would have also re-
>> added the disable_irq() call. Also see below.
>>
>>> This is because request_threaded_irq() returns EINVAL due to true
>>> value of
>>> condition:
>>> ((irqflags & IRQF_SHARED) && (irqflags & IRQF_NO_AUTOEN))
>>
>> Is the IRQF_SHARED flag really necessary though ? IOW is the IRQ actually
>> shared?  If it is really shared then the disable_irq() call will also block the irq
>> for other users of the irq. Drivers which are properly coded to share
>> interrupts should thus avoid using disable_irq().  But often the IRQF_SHARED
>> flag has just been copied from other code without the IRQ actually being
>> shared.
>>
>> Please check if the IRQF_SHARED flag is really necessary and if it is not
>> necessary, please drop that instead.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>> Fixes: bee3ecfed0fc9 ("platform/mellanox: mlxreg-hotplug: move to use
>>> request_irq by IRQF_NO_AUTOEN flag")
>>> Signed-off-by: Mykola Kostenok <c_mykolak@nvidia.com>
>>> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
>>> ---
>>>  drivers/platform/mellanox/mlxreg-hotplug.c | 3 +--
>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c
>>> b/drivers/platform/mellanox/mlxreg-hotplug.c
>>> index a9db2f32658f..07706f0a6d77 100644
>>> --- a/drivers/platform/mellanox/mlxreg-hotplug.c
>>> +++ b/drivers/platform/mellanox/mlxreg-hotplug.c
>>> @@ -683,8 +683,7 @@ static int mlxreg_hotplug_probe(struct
>>> platform_device *pdev)
>>>
>>>  	err = devm_request_irq(&pdev->dev, priv->irq,
>>>  			       mlxreg_hotplug_irq_handler,
>> IRQF_TRIGGER_FALLING
>>> -			       | IRQF_SHARED | IRQF_NO_AUTOEN,
>>> -			       "mlxreg-hotplug", priv);
>>> +			       | IRQF_SHARED, "mlxreg-hotplug", priv);
>>>  	if (err) {
>>>  		dev_err(&pdev->dev, "Failed to request irq: %d\n", err);
>>>  		return err;
>>>
> 

