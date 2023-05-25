Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11AF7C77B7E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 May 2023 19:48:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241464AbjEYTsr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 May 2023 15:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242034AbjEYTsm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 15:48:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C77A8189
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 12:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685044032;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oE4/So5LeNg3LFo5KgJMJSE76TRPYlYOShUwOH/4MCk=;
        b=XzdWHdq2fOEdJjQFv2hHYFe2ZYJLrvvHI1cJqB9u4NPNrqs4cmupG42Kd3tjC5GklPuebS
        ZXVYkZgv48JsEBl0YqxieiJz40GzzZhy8qzPnEd4KywSFuUMWWY0Bwe70pKNVeNj0Q146J
        btp+9SPKzaN0AR0BptxEQ83E37FiRJA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-yOUW_xTrOa-xKSoJ_Lb08Q-1; Thu, 25 May 2023 15:44:01 -0400
X-MC-Unique: yOUW_xTrOa-xKSoJ_Lb08Q-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94a34d3e5ebso96227766b.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 12:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685043840; x=1687635840;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oE4/So5LeNg3LFo5KgJMJSE76TRPYlYOShUwOH/4MCk=;
        b=ePqYgJ0hx+vAIQSeGZ/mwPb5odlHy0sjVYsBEa4kExFL3PM+5JlRBQ3AgStUPo8dKm
         5M2Ty1cXWhjW8sEmvxK9zQ2H1qeePxg8Sn4QJSyFNK3IL9bViuVzJpNecqQa5YgZvllc
         d2G5Ocj+hnZa2XqArZvJNL7CbeLc+blOrwboHrs9tIbQw0dCfX56agKwLZV6Bhcq/QNX
         Hu2uaOA8uZ0SFVr/bW9xMl2MpUSwzpSnmFUEbZT8exEHdoAEdl7ztZb7mMlawlIFhLuY
         jS6/5/ThISlACUHuB/H6T2p67iUSM/Y0XcwdwAj2OPlFnAS+HqXFbNpX9uZQpQez9eUH
         Q3WA==
X-Gm-Message-State: AC+VfDyNei+pgk4ZkrC6NwYZadQkMNHEShIXUVOqS2h6MznjCFYrCiSc
        s8PD3roRmNLzDqvFFUs8UYvctTmFN44f4gYPU2MjbRuQAULAQEZXLBLxKkSA8CIPmJd+EJwJCnf
        T+XR7iXVkRaJG9e+IB1m51KHi9PVNV57HXg==
X-Received: by 2002:a17:907:9289:b0:933:868:413a with SMTP id bw9-20020a170907928900b009330868413amr2461153ejc.15.1685043840710;
        Thu, 25 May 2023 12:44:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Rrchj/ujtT0nSHQHC4MQvvsLCt6BwBsjFRmag2kyIMmu0HHwRHzCGf5cOvPhHT/1adDWBfA==
X-Received: by 2002:a17:907:9289:b0:933:868:413a with SMTP id bw9-20020a170907928900b009330868413amr2461147ejc.15.1685043840436;
        Thu, 25 May 2023 12:44:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gs8-20020a170906f18800b0096f4389714csm1219835ejb.55.2023.05.25.12.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 12:44:00 -0700 (PDT)
Message-ID: <e5c4c61c-a3a3-97d0-ad50-8c5b345dc334@redhat.com>
Date:   Thu, 25 May 2023 21:43:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/5] platform/x86: think-lmi: Correct NVME password
 handling
Content-Language: en-US, nl
To:     Mark Pearson <mpearson-lenovo@squebb.ca>
Cc:     "markgross@kernel.org" <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20230525193132.3727-1-mpearson-lenovo@squebb.ca>
 <20230525193132.3727-3-mpearson-lenovo@squebb.ca>
 <17963a3d-996f-4bb8-918e-aadba15be9bc@app.fastmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <17963a3d-996f-4bb8-918e-aadba15be9bc@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/25/23 21:39, Mark Pearson wrote:
> Hi Hans,
> 
> My apologies - I completely forgot to add the v2 tag on this patch series...had a complete brain fart.

No worries I did not even notice the v2 was missing,
my brain automatically added it :)
 
> I assume I should resend them all - correctly named.

Well I have some review remarks on patch 5/5, it would be good if you can address those (if you agree with them) and then lets jump straight to v3 to avoid confusion ?

> I also have no idea why they showed up out of order...I'm blaming that one on the email server.

The out of order thing is normal, this sometimes happens with email.

> Sorry :(

Again no worries / no problem ...

Regards,

Hans




> On Thu, May 25, 2023, at 3:31 PM, Mark Pearson wrote:
>> NVME passwords identifier have been standardised across the Lenovo
>> systems and now use udrp and adrp (user and admin level) instead of
>> unvp and mnvp.
>>
>> This should apparently be backwards compatible.
>>
>> Also cleaned up so the index is set to a default of 1 rather than 0
>> as this just makes more sense (there is no device 0).
>>
>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> ---
>> Changes in V2: None. Version bumped in series
>>
>>  drivers/platform/x86/think-lmi.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
>> index c7e98fbe7c3d..1c02958035ad 100644
>> --- a/drivers/platform/x86/think-lmi.c
>> +++ b/drivers/platform/x86/think-lmi.c
>> @@ -456,9 +456,9 @@ static ssize_t new_password_store(struct kobject *kobj,
>>  				sprintf(pwd_type, "mhdp%d", setting->index);
>>  		} else if (setting == tlmi_priv.pwd_nvme) {
>>  			if (setting->level == TLMI_LEVEL_USER)
>> -				sprintf(pwd_type, "unvp%d", setting->index);
>> +				sprintf(pwd_type, "udrp%d", setting->index);
>>  			else
>> -				sprintf(pwd_type, "mnvp%d", setting->index);
>> +				sprintf(pwd_type, "adrp%d", setting->index);
>>  		} else {
>>  			sprintf(pwd_type, "%s", setting->pwd_type);
>>  		}
>> @@ -1524,6 +1524,10 @@ static int tlmi_analyze(void)
>>  		if (!tlmi_priv.pwd_nvme)
>>  			goto fail_clear_attr;
>>
>> +		/* Set default hdd/nvme index to 1 as there is no device 0 */
>> +		tlmi_priv.pwd_hdd->index = 1;
>> +		tlmi_priv.pwd_nvme->index = 1;
>> +
>>  		if (tlmi_priv.pwdcfg.core.password_state & TLMI_HDD_PWD) {
>>  			/* Check if PWD is configured and set index to first drive found */
>>  			if (tlmi_priv.pwdcfg.ext.hdd_user_password ||
>> -- 
>> 2.40.1
> 

