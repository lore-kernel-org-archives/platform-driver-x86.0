Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 219F0C76196
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Apr 2023 08:43:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjDKInc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Apr 2023 04:43:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjDKInb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Apr 2023 04:43:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF75A30EC
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Apr 2023 01:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681202565;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vskGsFdxAgcEWe5MVv9C7GBdQqDCkKDihBqK9QlBwJ0=;
        b=g7ttkhEJ3I8hX+YpvCBgVvhtJBVYPBCkXF/IeH5CFLHWAIlLhLHYjh35ekb9G4VYTpjtDA
        AXe8ENiTuyZOj2JJo8mFjQpAFNBN8Gjoa+7a5Rr/JvyZoH29xlT1+irOhKkmnB+EaCifps
        JpAelzubuOt7YtMrxWTdE8RikcsFR5s=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-n_Qvqu9KM4qhPEO7sNypAw-1; Tue, 11 Apr 2023 04:42:43 -0400
X-MC-Unique: n_Qvqu9KM4qhPEO7sNypAw-1
Received: by mail-ej1-f70.google.com with SMTP id vo2-20020a170907a80200b00949175b0b70so4242087ejc.9
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Apr 2023 01:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681202562; x=1683794562;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vskGsFdxAgcEWe5MVv9C7GBdQqDCkKDihBqK9QlBwJ0=;
        b=f6HTEpJjL3nq7gcUq8HoVxnBHI4O49LxR9MtiK9R0cuizVy33W3Vjwsx+zHg1JFBOj
         k9bvRNf5DAh0QDC3KEnAtDFx7qWqG0PEnQ3W7h6z2VHePZYk8XgaxAlfeTt1mECyKxIA
         nBW4e8D/gPFqvDtFnXinU0aHVTV2amAgzFWDiBuSgEjDpYEKzzaKRQWZqJkuDrHZbfB3
         wWXzUtOPv+vofQqKiR87X3E26F/Yx7b+P7shieS/cQ+Wzik4PEQ6KvdAk33tga+nu1nn
         7EqYjngcPmBnqZnae1ZVJjn7vd1+6V/5gw+nniC6H3GqpGsWIThSm25dCwx0AKXKNMyZ
         lpcw==
X-Gm-Message-State: AAQBX9cxBVk2GZpczZHl65A7CW7kKtCYSCcnBY7VYTtuF/0sm8D+lO3t
        36OT2ynQGPPG8SuVECRzBaJIPdKI4SgQRm+yZIVR60k+o8iEXR6BZXmek4etd+AtQaH8NiRW6dY
        ubeFrG3DCxV7S8yLg8hrO82y/Sq+5YdVqiA==
X-Received: by 2002:a17:906:6b8d:b0:94a:75d6:64b6 with SMTP id l13-20020a1709066b8d00b0094a75d664b6mr6484440ejr.17.1681202562825;
        Tue, 11 Apr 2023 01:42:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350bmX40bnIRAwwpjxIYJeKbHLMk7r/inbeybu33pYd/zL7A5yvgLr+flDYO9lnvciy048dszog==
X-Received: by 2002:a17:906:6b8d:b0:94a:75d6:64b6 with SMTP id l13-20020a1709066b8d00b0094a75d664b6mr6484431ejr.17.1681202562633;
        Tue, 11 Apr 2023 01:42:42 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id vc15-20020a170907d08f00b0094a7adda73bsm2119181ejc.207.2023.04.11.01.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 01:42:42 -0700 (PDT)
Message-ID: <49cab5f9-591e-4d10-c4db-9d1e22a21618@redhat.com>
Date:   Tue, 11 Apr 2023 10:42:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: amd: pmc: Remove __maybe_unused from
 amd_pmc_suspend_handler()
Content-Language: en-US, nl
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20230410193512.64232-1-hdegoede@redhat.com>
 <MN0PR12MB61017289753C3AB5336A040AE2959@MN0PR12MB6101.namprd12.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <MN0PR12MB61017289753C3AB5336A040AE2959@MN0PR12MB6101.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/10/23 22:26, Limonciello, Mario wrote:
> [Public]
> 
>> Now that the pmc code has switched to DEFINE_SIMPLE_DEV_PM_OPS()
>> the __maybe_unused is no longer necessary, drop it.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/amd/pmc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc.c
>> b/drivers/platform/x86/amd/pmc.c
>> index 2761e9b76e95..2e2b99b93df7 100644
>> --- a/drivers/platform/x86/amd/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc.c
>> @@ -840,7 +840,7 @@ static struct acpi_s2idle_dev_ops
>> amd_pmc_s2idle_dev_ops = {
>>  	.restore = amd_pmc_s2idle_restore,
>>  };
>>
>> -static int __maybe_unused amd_pmc_suspend_handler(struct device
>> *dev)
>> +static int amd_pmc_suspend_handler(struct device *dev)
>>  {
>>  	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
>>
>> --
>> 2.39.1
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

Thanks.

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans



