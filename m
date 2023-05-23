Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C7BC7EE23
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 May 2023 13:28:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236689AbjEWN2A (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 May 2023 09:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236737AbjEWN17 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 May 2023 09:27:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73CF9109
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 May 2023 06:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684848430;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=y+Ng03pQv033GOEBEUyS5y9xHsRR3GmnSImMF86xUBo=;
        b=YOh5CHmNBhPWA26Vh2L90QzhxZ05ulpMnw8TlzD0cPFnlfCKAObgta9OSrpBtl2JR2Avkb
        dLPq9hRGCaS+Z20j7NKnXkwpYx3CPiAARh9QB8wpHuXgpRmiZWuKeBbOj10ncAOPXiILHD
        1H+mgAytgQHfiRuEngV7dbyJ07pcvF0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-jYKb5dV2PXmiqKfBYbTkfQ-1; Tue, 23 May 2023 09:27:09 -0400
X-MC-Unique: jYKb5dV2PXmiqKfBYbTkfQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-510ecda1ecfso1087911a12.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 May 2023 06:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684848427; x=1687440427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+Ng03pQv033GOEBEUyS5y9xHsRR3GmnSImMF86xUBo=;
        b=JKNMdSBYjJiD/lMNd1qWc0cxlW05Bo0vlozSQ8FiLyehUO2g3pvV7kA0Ed1kvTzVuK
         NuIFmMDgq9jrVAgoJMv17a6ejhUYzaejovn+oZDkiGmeLazwwTX+HG0fEFuJL4/4k3AE
         N/Cg8s89N4wlkYkQxgqCru0tilybBAuRjXP6EuUDGk50Py+dgFQ51ouTyHtMyyMxu38T
         /XsM4JJPhP5DSvmSduE80bhVLzIpVTNniCWllhJTsEvFj1T5SjHyMeUExQ1kowtkDOwF
         pFMkBXIQbqDoGnxVACPvEtqnM3qAXu4T7uxSAiJEtfI9j4W5t7DrqQqAiqvRmrnYVCNI
         AvgA==
X-Gm-Message-State: AC+VfDy4QCsUaVfIUE1pn5+IDakwaL4YiB+G9xz3X/jJ/sno+j7UkhfF
        i7CTMzLrYdpPgxexVrPwFDI/llL277pvvifYlVOVm9wzdQQmabHsPmPLoQIrfSBziUI/K0HfNk+
        ia2eWu9nOThE0eIYRmJrAq+a2cfAQrUyttSCTgJrQ0w==
X-Received: by 2002:aa7:d0c7:0:b0:50b:caae:784 with SMTP id u7-20020aa7d0c7000000b0050bcaae0784mr11184922edo.20.1684848427485;
        Tue, 23 May 2023 06:27:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ562t9wp+VndpXmyOIsBwiflsGBGFclxJTtedofobzHI4ZpsZw0dyt+DBkUtmyuaiDZ4dmMhw==
X-Received: by 2002:aa7:d0c7:0:b0:50b:caae:784 with SMTP id u7-20020aa7d0c7000000b0050bcaae0784mr11184908edo.20.1684848427235;
        Tue, 23 May 2023 06:27:07 -0700 (PDT)
Received: from [192.168.43.127] ([109.38.141.57])
        by smtp.gmail.com with ESMTPSA id m19-20020a056402051300b00506a09795e6sm3981836edv.26.2023.05.23.06.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 06:27:06 -0700 (PDT)
Message-ID: <1cf8ac78-e036-69ef-3d1d-74b0a0825bb2@redhat.com>
Date:   Tue, 23 May 2023 15:27:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/4] platform/x86: think-lmi: Correct System password
 interface
To:     Mark Pearson <mpearson-lenovo@squebb.ca>
Cc:     "markgross@kernel.org" <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20230517181945.3725-1-mpearson-lenovo@squebb.ca>
 <20230517181945.3725-2-mpearson-lenovo@squebb.ca>
 <ce7d7bef-c342-fb1a-8a7a-463ffcfd2896@redhat.com>
 <9e748368-1af6-45a4-8e33-34f056e3b473@app.fastmail.com>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <9e748368-1af6-45a4-8e33-34f056e3b473@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/23/23 14:43, Mark Pearson wrote:
> Thanks Hans
> 
> On Tue, May 23, 2023, at 6:46 AM, Hans de Goede wrote:
>> Hi Mark,
>>
>> On 5/17/23 20:19, Mark Pearson wrote:
>>> The system password identification was incorrect. This means that if
>>> the password was enabled it wouldn't be detected correctly; and setting
>>> it would not work.
>>>
>>> Correct these mistakes.
>>>
>>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>>> ---
>>>  drivers/platform/x86/think-lmi.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
>>> index d9341305eba9..b8431d3b137f 100644
>>> --- a/drivers/platform/x86/think-lmi.c
>>> +++ b/drivers/platform/x86/think-lmi.c
>>> @@ -171,7 +171,7 @@ MODULE_PARM_DESC(debug_support, "Enable debug command support");
>>>  #define TLMI_POP_PWD (1 << 0)
>>>  #define TLMI_PAP_PWD (1 << 1)
>>>  #define TLMI_HDD_PWD (1 << 2)
>>> -#define TLMI_SYS_PWD (1 << 3)
>>> +#define TLMI_SYS_PWD (1 << 6)
>>>  #define TLMI_CERT    (1 << 7)
>>>  
>>>  #define to_tlmi_pwd_setting(kobj)  container_of(kobj, struct tlmi_pwd_setting, kobj)
>>> @@ -1504,7 +1504,7 @@ static int tlmi_analyze(void)
>>>  		tlmi_priv.pwd_power->valid = true;
>>>  
>>>  	if (tlmi_priv.opcode_support) {
>>> -		tlmi_priv.pwd_system = tlmi_create_auth("sys", "system");
>>> +		tlmi_priv.pwd_system = tlmi_create_auth("smp", "system");
>>
>> "smp" ?
> 
> Yes - that is what is common across all the platforms.
> https://docs.lenovocdrt.com/#/bios/wmi/wmi_guide?id=change-a-bios-password

Ok, so smp stands for System Management Password I guess ? Might be good to spell
that out somehwere, e.g. in a comment.

Regards,

Hans



> 
> I never quite got a straight answer on the origins of the 'sys' account - I think it may have been originally intended but never used? Or maybe it's always been wrong.
> 
> I should change the define to be TLMI_SMP_PWD instead actually for clarity. I'll fix that.
> 
>>
>> Also this is not explained in the commit message.
>>
> 
> Ack - will update the commit message to include this.
> 
> Thanks
> Mark
> 

