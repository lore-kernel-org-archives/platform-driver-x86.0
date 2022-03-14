Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89B2C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Mar 2022 15:31:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241785AbiCNPcW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Mar 2022 11:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233435AbiCNPcV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Mar 2022 11:32:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E7D9D36B66
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Mar 2022 08:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647271870;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=P0iSh+7F8co8uEu6ZcaAsAU45dh7setUOfi55pSd15w=;
        b=Jk5XuNqQZG+lDXiKzf8+88E9jR1rJQjSuP0+AMy57R2R615MF6uKcjnUW2QVqAwDqk5ScY
        KNquw40F63jaW5lWwfwDUvjSoWO1Llo7gHlytOCugAJMDyCXHEmY3XUT1GTWz+D+8bn8Z1
        3WoIK64OX08qK3NblpaGuW3lm9IGPms=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-rtC-LmfOOuC0p0p6sBNKhw-1; Mon, 14 Mar 2022 11:31:08 -0400
X-MC-Unique: rtC-LmfOOuC0p0p6sBNKhw-1
Received: by mail-ej1-f71.google.com with SMTP id q22-20020a1709064cd600b006db14922f93so8139891ejt.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Mar 2022 08:31:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=P0iSh+7F8co8uEu6ZcaAsAU45dh7setUOfi55pSd15w=;
        b=3aG5eyYYwefEFz6EqCcv1PTlvpToCZhZX42OWOITX1iwxS9kKI4aOpDNftz8wedOCV
         Vd7uf568SO/Yh7V0L98tSBwH70j9QMOIaM2heU1jKMlLM/cdFVZ1Bp4xPiaQlHsLf6ex
         mW7d2+F86W0HI730L/A+XSfssyDISUGz6Rhiz7Yr/YCviyA+7EHtBpyfRFtSkqsr4IoH
         76vKhLt6pyF4OLBjYDYKkn3BOlDD2CroBzUgpWTrZ8PJE7qVhzCJoztsEtZNqWa2T57w
         w9QCBeGDB/erFuSYCbbiG8x7R/bBWDAtCL3R3LpwcxH666Huqtp81fR/GJ1v+cOb3Xsm
         ioww==
X-Gm-Message-State: AOAM532tjY3DbR2/3V1cvxoH4YAQtIkVOk8dqY1fq9zhuMNmF3Z+wbhf
        EAGhV6dakykl6wiewu+Ol03A5Io6a9iAu0LczTCYuwJEk1gyPIgG8oRMRdZspYbb5KQpQHowUcv
        45DKJonCjjL9IcM295qUC8/4v6Csr8lHBPw==
X-Received: by 2002:aa7:c982:0:b0:416:1dd3:7704 with SMTP id c2-20020aa7c982000000b004161dd37704mr21084015edt.69.1647271867379;
        Mon, 14 Mar 2022 08:31:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuuXh2fuJoEg0AXordz6dDf6YfwG44iKoHRS5P0pPQ036mQwhsvF53wmAoZzSPOkObHFk/cA==
X-Received: by 2002:aa7:c982:0:b0:416:1dd3:7704 with SMTP id c2-20020aa7c982000000b004161dd37704mr21083998edt.69.1647271867204;
        Mon, 14 Mar 2022 08:31:07 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id z17-20020a50f151000000b004162ecc0c9fsm8258742edl.68.2022.03.14.08.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 08:31:06 -0700 (PDT)
Message-ID: <78fc0363-2ae6-bd75-ecfb-606ce411c79a@redhat.com>
Date:   Mon, 14 Mar 2022 16:31:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [External] Re: [RFC] ACPI: platform-profile: support for AC vs DC
 modes
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     "rafael@kernel.org" <rafael@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20220301201554.4417-1-markpearson@lenovo.com>
 <65d8cf3b-0eea-0583-fa23-e2c71287fb85@redhat.com>
 <BL1PR12MB5157CDB77675859B7F279578E2099@BL1PR12MB5157.namprd12.prod.outlook.com>
 <7b281a37-5163-6cd7-360e-1c63bde714a8@redhat.com>
 <BL1PR12MB5157125246817A70649C12F7E2099@BL1PR12MB5157.namprd12.prod.outlook.com>
 <1cd4ae24-ae92-302e-ac87-76ef15472a9f@redhat.com>
 <2180533b-c921-5ae4-e6bc-569728a4f990@lenovo.com>
 <c18abb55-6874-6e1e-bdb0-9d96d52987cd@redhat.com>
 <BL1PR12MB5157C14DE5F521D4B5C08366E20F9@BL1PR12MB5157.namprd12.prod.outlook.com>
 <c16ea8ba-5944-0384-4bc3-d5438fe5e1f7@redhat.com>
In-Reply-To: <c16ea8ba-5944-0384-4bc3-d5438fe5e1f7@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/14/22 15:43, Hans de Goede wrote:
> Hi Mario,
> 
> On 3/14/22 14:39, Limonciello, Mario wrote:
>> [Public]
>>
>>>>
>>>> I cycled through a few different implementations but came down on what I
>>>> proposed. I considered 6 values - but I don't think that makes sense and
>>>> makes it overall more complicated than it needs to be and less flexible.
>>>
>>> Ah, so to be clear, my 2 scenarios above were theoretical scenarios,
>>> because I'm wondering how the firmware API here actually looks like,
>>> something which so far is not really clear to me.
>>>
>>> When you say that you considered using 6 values, then I guess that
>>> the firmware API actually offers 6 values which we can write to a single slot:
>>> ac-low-power,dc-lowpower,ac-balanced,dc-balanced,ac-performance,dc-
>>> performance
>>>
>>> ?
>>>
>>> But that is not what the RFC patch that started this thread shows at all,
>>> the API to the driver is totally unchanged and does not get passed
>>> any info on ac/dc selection ?  So it seems to me that the ACPI API Linux
>>> uses for this writes only 1 of 3 values to a single slot and the EC automatically
>>> switches between say ac-balanced and dc-balanced internally.
>>>
>>> IOW there really being 2 differently tuned balance-profiles is not visible to
>>> the OS at all, this is handled internally inside the EC, correct ?
>>>
>>
>> No - on Lenovo's platform there are 6 different profiles that can be selected
>> from the kernel driver.  3 are intended for use on battery, 3 are intended for
>> use on AC.
> 
> Ah, I already got that feeling from the rest of the thread, so I reread
> Mark's RFC again before posting my reply today and the RFC looked like
> the same 3 profiles were being set and the only functionality added
> was auto profile switching when changing between AC/battery.
> 
> Thank you for clarifying this. Having 6 different stories
> indeed is a very different story.
> 
>>> Otherwise I would expect the kernel internal driver API to also change and
>>> to also see a matching thinkpad_acpi patch in the RFC series?
>>
>> The idea I see from Mark's thread was to send out RFC change for the platform profile
>> and based on the direction try to implement the thinkpad-acpi change after that.
>>
>> Because of the confusion @Mark I think you should send out an RFC v2 with thinkpad acpi
>> modeled on top of this the way that you want.
> 
> I fully agree and since you introduce the concept of being on AC/battery to the
> drivers/acpi/platform_profile.c cpde, please change the 
> profile_set and profile_get function prototypes in struct platform_profile_handler
> to also take a "bool on_battery" extra argument and use that in the thinkpad
> driver to select either the ac or the battery tuned low/balanced/performance 
> profile.
> 
> And please also include an update to Documentation/ABI/testing/sysfs-platform_profile
> in the next RFC.
> 
> Also notice how I've tried to consistently use AC/battery in my last reply,
> DC really is not a good term for "on battery". AC also is sort of dubious
> for "connected to an external power-supply" but its use for that is sorta
> common and it is nice and short.

One last request for the v2 RFC, please also Cc Bastien Nocera, so that
he can take a look at the proposed uapi changes from the userspace side
of things.

Regards,

Hans

