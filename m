Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D99AC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Nov 2021 12:53:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235989AbhKVM4d (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 22 Nov 2021 07:56:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23098 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229983AbhKVM4d (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Nov 2021 07:56:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637585606;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TQDXAf7wWqCXZw8jtSz2TxvB8a6NHJxTzed5censXaI=;
        b=GQ05OAP+XvaBWEfF/BZxG9b2fMVBIAqygqLJso+1oD5XLRIfgJtafj4vxksYaWkl9u9lzL
        vLdyhi/knoz2elFmLxsYxiYOZwIaN72rreWJyO6B7VypI1VtI+3b7l4pW6JFDJomhiBMuV
        oy59dejIrzSaYc0+2KY+13LyEVRCoAI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-jSXWjDdANC6WO-3nm9mV3Q-1; Mon, 22 Nov 2021 07:53:24 -0500
X-MC-Unique: jSXWjDdANC6WO-3nm9mV3Q-1
Received: by mail-ed1-f71.google.com with SMTP id w4-20020aa7cb44000000b003e7c0f7cfffso14713938edt.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Nov 2021 04:53:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TQDXAf7wWqCXZw8jtSz2TxvB8a6NHJxTzed5censXaI=;
        b=mblJsRD3GCFmethJmyNDt2YcCIIt+uZ6vz3FLpoMDw1fim/gOyIwNoBqFH/qL6mgP0
         Ja54af4eQoGb3hYkfLwwkS5kXAV702RRaeL1QRJFpM7fHugPYJS4LJ/L7kYcKIyblRRn
         XbvMd2fqc2UWTh1mgvTB14tlpH6uqTjcdrI4T2RYvI16gitFNeptxQd+NFYMaOYwkIMS
         4QLCQO6NyOhgxy/IDrpTKY7xeHJzze66/EaleFgsNzAFdsIm63/W64qDBglsBctp7OSw
         OMY9ICyw/qN6jqLb+QZvqOPMRfz+WXHzq/Pz+PFOO6ZXGPJpKJV/NiKvptJdHEUMU8ED
         myTw==
X-Gm-Message-State: AOAM532nUzeCh2Mkm+0AWqbUY30AGjiLtxlkjBLPQczsZNsuRzkYfODA
        ozVPoyPHZKuOG+xQLevtmxYYIk+cVgTA0HIOiRoRfLaIR14y+B1AXmXcp1Mq/t09xhenpWig7HZ
        NWuc+kTC/Qf7vs0hLPJ5bnWYXt/yZr85qWA==
X-Received: by 2002:a17:907:6e9e:: with SMTP id sh30mr40175893ejc.156.1637585603548;
        Mon, 22 Nov 2021 04:53:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFD+jyStXcs29XMx3IFFjzYnEvoBH1Es63iMNmPfjeP4c4XnYcF4S//a2nB5XEV6lxkT73dg==
X-Received: by 2002:a17:907:6e9e:: with SMTP id sh30mr40175870ejc.156.1637585603405;
        Mon, 22 Nov 2021 04:53:23 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id nb4sm3829130ejc.21.2021.11.22.04.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Nov 2021 04:53:23 -0800 (PST)
Message-ID: <8315bf13-f1c4-3d12-0ca4-ae2451601fbc@redhat.com>
Date:   Mon, 22 Nov 2021 13:53:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [External] [PATCH 2/2] platform/x86: think-lmi: Simplify
 tlmi_analyze() error handling a bit
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20211118114150.271274-1-hdegoede@redhat.com>
 <20211118114150.271274-2-hdegoede@redhat.com>
 <edcabc67-c1b4-6931-5e40-f64660a5280a@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <edcabc67-c1b4-6931-5e40-f64660a5280a@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/18/21 16:46, Mark Pearson wrote:
> Thanks Hans,
> 
> On 2021-11-18 06:41, Hans de Goede wrote:
>> Creating the tlmi_pwd_setting structs can only fail with -ENOMEM, set
>> ret to this once and simplify the error handling a bit.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/think-lmi.c | 26 +++++++++++---------------
>>  1 file changed, 11 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
>> index 6eba69334fa6..27ab8e4e5b83 100644
>> --- a/drivers/platform/x86/think-lmi.c
>> +++ b/drivers/platform/x86/think-lmi.c
>> @@ -1141,42 +1141,38 @@ static int tlmi_analyze(void)
>>  	if (ret)
>>  		goto fail_clear_attr;
>>  
>> +	/* All failures below boil down to kmalloc failures */
>> +	ret = -ENOMEM;
>> +
>>  	tlmi_priv.pwd_admin = tlmi_create_auth("pap", "bios-admin");
>> -	if (!tlmi_priv.pwd_admin) {
>> -		ret = -ENOMEM;
>> +	if (!tlmi_priv.pwd_admin)
>>  		goto fail_clear_attr;
>> -	}
>> +
>>  	if (tlmi_priv.pwdcfg.core.password_state & TLMI_PAP_PWD)
>>  		tlmi_priv.pwd_admin->valid = true;
>>  
>>  	tlmi_priv.pwd_power = tlmi_create_auth("pop", "power-on");
>> -	if (!tlmi_priv.pwd_power) {
>> -		ret = -ENOMEM;
>> +	if (!tlmi_priv.pwd_power)
>>  		goto fail_clear_attr;
>> -	}
>> +
>>  	if (tlmi_priv.pwdcfg.core.password_state & TLMI_POP_PWD)
>>  		tlmi_priv.pwd_power->valid = true;
>>  
>>  	if (tlmi_priv.opcode_support) {
>>  		tlmi_priv.pwd_system = tlmi_create_auth("sys", "system");
>> -		if (!tlmi_priv.pwd_system) {
>> -			ret = -ENOMEM;
>> +		if (!tlmi_priv.pwd_system)
>>  			goto fail_clear_attr;
>> -		}
>> +
>>  		if (tlmi_priv.pwdcfg.core.password_state & TLMI_SYS_PWD)
>>  			tlmi_priv.pwd_system->valid = true;
>>  
>>  		tlmi_priv.pwd_hdd = tlmi_create_auth("hdd", "hdd");
>> -		if (!tlmi_priv.pwd_hdd) {
>> -			ret = -ENOMEM;
>> +		if (!tlmi_priv.pwd_hdd)
>>  			goto fail_clear_attr;
>> -		}
>>  
>>  		tlmi_priv.pwd_nvme = tlmi_create_auth("nvm", "nvme");
>> -		if (!tlmi_priv.pwd_nvme) {
>> -			ret = -ENOMEM;
>> +		if (!tlmi_priv.pwd_nvme)
>>  			goto fail_clear_attr;
>> -		}
>>  
>>  		if (tlmi_priv.pwdcfg.core.password_state & TLMI_HDD_PWD) {
>>  			/* Check if PWD is configured and set index to first drive found */
>>
> Looks good, and works well. Verified with modifying NVMe and Admin
> password on M90n
> 
> Tested-by: Mark Pearson <markpearson@lenovo.com>

Thank you, I've pushed both patches to my for-next branch now,
with your Tested-by tag added.

Regards,

Hans

