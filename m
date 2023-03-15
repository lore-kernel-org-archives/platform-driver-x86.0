Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F510C6FD1D
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Mar 2023 12:47:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233009AbjCOMq7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 15 Mar 2023 08:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233023AbjCOMqk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Mar 2023 08:46:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C9E5A18BD
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Mar 2023 05:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678884252;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D9lt59761SqrnCsGevt5G+aTQr6qsgpsoDPdyZufYoY=;
        b=RMKxjU+gCZT5hop7sxI4Z9Q6u3Mob9hyy02E+yx6fG/2QF4WqQFSl5cqjvbIQYw/ew8pfK
        Z8tbi4L9+QuU9Yuq8SwAG3A21+OLsAorQQfsrlCK/LnsJKw7otdTbXV323v8oDGG4JNzLj
        4WqZHS2FAfi2QsndjLrtvhZ9bXxKuUo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-Ue0gvtCPOuehveNUQyQdCw-1; Wed, 15 Mar 2023 08:44:08 -0400
X-MC-Unique: Ue0gvtCPOuehveNUQyQdCw-1
Received: by mail-ed1-f71.google.com with SMTP id w7-20020a056402268700b004bbcdf3751bso26427475edd.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Mar 2023 05:44:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678884246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D9lt59761SqrnCsGevt5G+aTQr6qsgpsoDPdyZufYoY=;
        b=CY5/r4nEfI/ooGlxZqFlK/JD+4efkQmMTC4Sgw5was7v1Lfgw+mPkk4aIPyDw0D1qu
         SZIAzEfGbSTNtoT6zYUpnvXsyO0o8N5wBWSLMGo3tv/Fdb87eZBeTYuqlFd9xRhINeF2
         ig1b5bHNXL9q6U8Gl2RkqKaSuk2ehhBz/YXIYAOWoM+PZav6wTeNTFpqHjzAC3QRfhEl
         4whPnP/2qU9p5/Rrg6c/p04E+J/fFF+UnCid1zub0LWNq0o2ECo2kVDvDUVIp/NMgPRT
         EYdD/+++UYlVd5A08m3/j1+2axnmk4++1xJ6u6nedV62qXwxOgw3c5uOcTVGRb+dq9/u
         ahBg==
X-Gm-Message-State: AO0yUKV5oFxjrw9ruwh68fTMi+/q7KPysvmK52HF8AJ/zbfEYyPFNfaS
        bM5Q48Pq5KqLQx5A6MXTnKG14uTwqlhsmBzURsTJETeUgVZozqqfT2R1CRG/fFaRTsKmj9gjOFv
        5lFvISz8KbvN5DlZPyVyuberrw8NO01QFmqz1tmveLQ==
X-Received: by 2002:a17:906:8392:b0:888:a72f:1599 with SMTP id p18-20020a170906839200b00888a72f1599mr5902700ejx.11.1678884246569;
        Wed, 15 Mar 2023 05:44:06 -0700 (PDT)
X-Google-Smtp-Source: AK7set8TuB1opxt6I0QOHynTIn4eLCOXk3ju/NZSkK94uWgl1mmT14oYpO4XaSM0YFyqkDVAzFdZ1Q==
X-Received: by 2002:a17:906:8392:b0:888:a72f:1599 with SMTP id p18-20020a170906839200b00888a72f1599mr5902681ejx.11.1678884246282;
        Wed, 15 Mar 2023 05:44:06 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id b38-20020a509f29000000b004fc9e462743sm2346487edf.91.2023.03.15.05.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 05:44:05 -0700 (PDT)
Message-ID: <8adbcf4b-9b4d-7109-1bde-25a124bd0f8a@redhat.com>
Date:   Wed, 15 Mar 2023 13:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/2] platform/x86: think-lmi: Add possible_values for
 ThinkStation
To:     Mark Pearson <mpearson-lenovo@squebb.ca>,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>
Cc:     "markgross@kernel.org" <markgross@kernel.org>,
        Mark Pearson <markpearson@lenovo.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <mpearson-lenovo@squebb.ca>
 <20230313184541.193733-1-mpearson-lenovo@squebb.ca>
 <20230313184541.193733-2-mpearson-lenovo@squebb.ca>
 <9b2cbb46-6438-462d-b98f-82edfc34df64@t-8ch.de>
 <8db2b810-a4f2-4da9-85b8-9da95f4501a6@app.fastmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <8db2b810-a4f2-4da9-85b8-9da95f4501a6@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/14/23 21:14, Mark Pearson wrote:
> Hi Thomas,
> 
> On Mon, Mar 13, 2023, at 7:58 PM, Thomas Weißschuh wrote:
>> Hi Mark,
>>
>> some more remarks, sorry not seeing this earlier.
> 
> No worries :) I appreciate the reviews.
> 
>>
>> On Mon, Mar 13, 2023 at 02:45:41PM -0400, Mark Pearson wrote:
>>> ThinkStation platforms don't support the API to return possible_values
>>> but instead embed it in the settings string.
>>>
>>> Try and extract this information and set the possible_values attribute
>>> appropriately.
>>>
>>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>>> ---
>>> Changes in V2:
>>>  - Move no value for possible_values handling into show function
>>>  - use kstrndup for allocating string
>>>
>>>  drivers/platform/x86/think-lmi.c | 26 ++++++++++++++++++++++----
>>>  1 file changed, 22 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
>>> index 5fa5451c4802..7dd8f72176f5 100644
>>> --- a/drivers/platform/x86/think-lmi.c
>>> +++ b/drivers/platform/x86/think-lmi.c
>>> @@ -941,10 +941,9 @@ static ssize_t possible_values_show(struct kobject *kobj, struct kobj_attribute
>>>  {
>>>  	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
>>>  
>>> -	if (!tlmi_priv.can_get_bios_selections)
>>> -		return -EOPNOTSUPP;
>>> -
>>> -	return sysfs_emit(buf, "%s\n", setting->possible_values);
>>> +	if (setting->possible_values)
>>> +		return sysfs_emit(buf, "%s\n", setting->possible_values);
>>> +	return sysfs_emit(buf, "not available\n");
>>>  }
>>
>> As the attribute "possible_values" is not mandatory it should be
>> possible to hide it completely with an is_visible callback.
>>
>> This would indicate absence clearer than a magic value.
> 
> Agreed - I like it. I'll look into implementing that. Thank you.
> 
>>
>>>  static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
>>> @@ -1440,6 +1439,25 @@ static int tlmi_analyze(void)
>>>  			if (ret || !setting->possible_values)
>>>  				pr_info("Error retrieving possible values for %d : %s\n",
>>>  						i, setting->display_name);
>>> +		} else {
>>> +			/*
>>> +			 * Older Thinkstations don't support the bios_selections API.
>>> +			 * Instead they store this as a [Optional:Option1,Option2] section of the
>>> +			 * name string.
>>> +			 * Try and pull that out if it's available.
>>> +			 */
>>
>> The values in possible_values are supposed to be separated by
>> semi-colons, not commas.
>> I don't know how this affects the existing parts of this driver but it
>> affects both patches of this series.
> 
> Good point, and I'd missed that.
> The current string is returned directly from the BIOS, so I'll have to manipulate it. I would ask the BIOS team to change it but it will take forever and could impact Windows - so better to tweak it in the driver.
> I'll do this as a third patch I think.

Yes putting this in a separate / third patch seems best.

Regards,

Hans

