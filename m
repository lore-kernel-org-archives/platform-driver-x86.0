Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA946C77B7A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 May 2023 09:53:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240061AbjEYJxY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 May 2023 05:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjEYJxV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 05:53:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81CD81A8
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 02:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685008352;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T483GshQ1etV4/B80hSTyHnl4OtRX6eMmZK03OF9d2k=;
        b=ehyk8Sp1/uG/TGtsGbMfvc3IEZHO6/Hk9LgW+drL7lPwS3jhs9nRpx9iYow/CyL1QMY9Mh
        ufuvtQlWqh81vNekqi7SelyqZCR1Kq1Lry+lwDCRgMBW0+ENFqYXxPTqjqzN5QKGV/lrb8
        awJHfgqtLVV2JD8Jq0pdXDWDuc7bjd0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-1YsvS9u5NbiWKeWPh6k9RQ-1; Thu, 25 May 2023 05:52:30 -0400
X-MC-Unique: 1YsvS9u5NbiWKeWPh6k9RQ-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-513e0246f5fso2560676a12.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 02:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685008349; x=1687600349;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T483GshQ1etV4/B80hSTyHnl4OtRX6eMmZK03OF9d2k=;
        b=Rq9JpvA/obwN7f7jkoIkudW7n4TZ5jAJQwboRUzrOx42dRixANt7HRDuA5NnBzBGDC
         tjZUExQivzp3a10cLpNhk0ebKj2BMrCHQsnYZaUzWuuFXKoO2zPiZyOe2DAmpBkccTLk
         xNyNam6HDeAHuiSNCIA5chbQLeFCloZZTyZj9G1eE5jO3VMUxGNdAEf/OkJ/dAaL3rw9
         hnoKgA1Tr1tFljcfebmJZjgp5H7O0pih5NpVYcQrg6Xbp9dfLYm2KcNBlaEgKocR0u7N
         wbKOgrwOh1DrE9WPtawg+gydf3idK6sTtpGsbdWhTYVHlGrkyofd6AOBABB1nHfmos6A
         jDVw==
X-Gm-Message-State: AC+VfDwh9/Q7zMsyIedm68toGaQya/xKSF573a0AHLsCvQqmin98RUj8
        tTHs36pRbwVG8EkfwhUC47o6vj2kGsRrvxJm9Ia5/fCCIrp4KAO0XH5srUhmw1QUoaNdn42NZGR
        hAwn9ET7CJDjPzh5nkMJMoL4ZnKZXcR7w7A==
X-Received: by 2002:aa7:d316:0:b0:50b:c72a:2b26 with SMTP id p22-20020aa7d316000000b0050bc72a2b26mr4278276edq.9.1685008349619;
        Thu, 25 May 2023 02:52:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4+iNh5Y5HpqElML4Mwp3cdCIoRI8ossZKCcSedVvPSiCi6hlR84Y6A/1kXAzHKM61nWvZOug==
X-Received: by 2002:aa7:d316:0:b0:50b:c72a:2b26 with SMTP id p22-20020aa7d316000000b0050bc72a2b26mr4278270edq.9.1685008349312;
        Thu, 25 May 2023 02:52:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d27-20020a056402517b00b0050c0d651fb1sm377005ede.75.2023.05.25.02.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 02:52:28 -0700 (PDT)
Message-ID: <a27660bd-fa7c-20c5-b7f2-f2ff20fe6cb8@redhat.com>
Date:   Thu, 25 May 2023 11:52:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/4] platform/x86: think-lmi: Enable opcode support on
 BIOS settings
Content-Language: en-US, nl
To:     Mark Pearson <mpearson-lenovo@squebb.ca>
Cc:     "markgross@kernel.org" <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20230517181945.3725-1-mpearson-lenovo@squebb.ca>
 <b79fa66c-b8bc-125c-ccfa-9dae727022e9@redhat.com>
 <04415f83-64fa-4d70-91fa-4425e163b350@app.fastmail.com>
 <71d0ddfa-ccca-43ee-aaac-6daf6b876824@app.fastmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <71d0ddfa-ccca-43ee-aaac-6daf6b876824@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark,

On 5/24/23 20:20, Mark Pearson wrote:
> Hi Hans,
> 
> On Tue, May 23, 2023, at 8:36 AM, Mark Pearson wrote:
>> Thanks Hans,
>>
>> On Tue, May 23, 2023, at 6:46 AM, Hans de Goede wrote:
>>> Hi Mark,
>>>
>>> On 5/17/23 20:19, Mark Pearson wrote:
>>>> Whilst reviewing some documentation from the FW team on using WMI on
>>>> Lenovo system I noticed that we weren't using Opcode support when
>>>> changing BIOS settings in the thinkLMI driver.
>>>>
>>>> We should be doing this to ensure we're future proof as the old
>>>> non-opcode mechanism has been deprecated.
>>>>
>>>> Tested on X1 Carbon G10 and G11.
>>>>
>>>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>>>> ---
>>>>  drivers/platform/x86/think-lmi.c | 23 ++++++++++++++++++++++-
>>>>  1 file changed, 22 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
>>>> index 1138f770149d..d9341305eba9 100644
>>>> --- a/drivers/platform/x86/think-lmi.c
>>>> +++ b/drivers/platform/x86/think-lmi.c
>>>> @@ -1001,7 +1001,28 @@ static ssize_t current_value_store(struct kobject *kobj,
>>>>  				tlmi_priv.pwd_admin->save_signature);
>>>>  		if (ret)
>>>>  			goto out;
>>>
>>>> -	} else { /* Non certiifcate based authentication */
>>>> +	} else if (tlmi_priv.opcode_support) {
>>>> +		/* If opcode support is present use that interface */
>>>> +		set_str = kasprintf(GFP_KERNEL, "%s,%s;", setting->display_name,
>>>> +					new_setting);
>>>> +		if (!set_str) {
>>>> +			ret = -ENOMEM;
>>>> +			goto out;
>>>> +		}
>>>> +
>>>> +		ret = tlmi_simple_call(LENOVO_SET_BIOS_SETTINGS_GUID, set_str);
>>>> +		if (ret)
>>>> +			goto out;
>>>> +
>>>> +		if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password[0]) {
>>>> +			ret = tlmi_opcode_setting("WmiOpcodePasswordAdmin",
>>>> +					tlmi_priv.pwd_admin->password);
>>>> +			if (ret)
>>>> +				goto out;
>>>> +		}
>>>> +
>>>> +		ret = tlmi_save_bios_settings("");
>>>
>>> I'm a bit confused about how this works. You are calling the same
>>> LENOVO_SET_BIOS_SETTINGS_GUID as the old non opcode based authentication method
>>> without any auth string.
>>>
>>> And then afterwards you are calling LENOVO_OPCODE_IF_GUID with
>>> "WmiOpcodePasswordAdmin:<passwd>"
>>>
>>> Won't the initial LENOVO_SET_BIOS_SETTINGS_GUID get rejected since
>>> it does not include an auth-string and you have not authenticated
>>> yet using the opcode mechanism either. IOW shouldn't the opcode
>>> auth call go first ?
>>>
>>> And how does this work timing wise, vs races with userspace doing
>>> multiple sysfs writes at once.
>>>
>>> If the authentication done afterwards really acks the last
>>> LENOVO_SET_BIOS_SETTINGS_GUID call then a userspace based
>>> attacker could try to race and overwrite the last
>>> LENOVO_SET_BIOS_SETTINGS_GUID call before the ack happens... ?
>>>
>>> If this code really is correct I think we need to introduce
>>> a mutex to avoid this race.
>>>
>>> And this also needs some comments to explain what is going on.
>>
>> Agreed - and looking at it now....I'm questioning it myself. This was 
>> tested so it works...but I wonder if that was more luck than judgement.
>> Let me do some checking - I think I may have messed up here.
>>
> 
> Looked at this and the code is correct - even if it is a bit weird :)
> https://docs.lenovocdrt.com/#/bios/wmi/wmi_guide?id=set-and-save-a-bios-setting-on-newer-models
> 
> The save_bios_settings would fail if a password was not set (if it's required).

Ok, can you add some comments to the next revision explaining this ?
(no need to write a novel, just some short comments)

> With regards to race conditions - that does seem somewhat unlikely in real life but I can add a mutex around this to catch that condition. I think I should probably do the same in a couple of other places (e.g. certificate_store and new_password_store) where multiple WMI calls are needed to complete an operation. 

Ack for also adding the mutex in other places where there is more
then 1 WMI call involved.

> Is it OK if I do that as a separate commit on the end of the series or would you rather it was included in this commit? As the scope is, I think, more than just this function I'm leaning towards a separate commit but let me know what best practice is.

Adding this in a separate commit is fine with me.

Regards,

Hans


