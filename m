Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA190C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu,  9 Sep 2021 07:15:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A347060F13
	for <platform-driver-x86@archiver.kernel.org>; Thu,  9 Sep 2021 07:15:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236207AbhIIHRD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 9 Sep 2021 03:17:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39251 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235373AbhIIHRC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Sep 2021 03:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631171752;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D6nEnT1V+fsknTnMK66WQZ/tWninelekVzJqs2z+THs=;
        b=PFb05SX80/FewASbuCKvuFoxkKTDEn8zH5o8ZBzWug4XVZUWqwJxMnRokh29aYdaM6jgXz
        4PQZRXc9WDCcxbBigmgSBFP+aag/I+cigggC+5QJOiD/BqpR1Uqqz5ZphptTBGBvYQdMhH
        TjrO+U18Lp1I3yTxkuOUwajt03A6wNU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-Gu2nj4jsOHW1hGrjiHvyeA-1; Thu, 09 Sep 2021 03:15:51 -0400
X-MC-Unique: Gu2nj4jsOHW1hGrjiHvyeA-1
Received: by mail-ed1-f70.google.com with SMTP id u2-20020aa7d982000000b003cda80fa659so494265eds.14
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Sep 2021 00:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D6nEnT1V+fsknTnMK66WQZ/tWninelekVzJqs2z+THs=;
        b=SC+BwRXnO21mCsHp8l3TPcolOJM82EosHfyAYJZJqCOHJ+SjamdRwgIVnwwNkBY2ZN
         WHeVHhwKVCwDMshEl89J+M6l/6mXZyFZPRuYF7vtq+onEKOQRolgudtK4U+a5u9HQy4h
         vJGkAbtrrNuzWeXGCu//uMWGUJRDwTRXNErAGPCOWUZV8K+8I/h/CAqpDAnkmPCQJhGD
         xd9/j7qV8OFrjf7Yo1zYtzWm/xA5m6IQhSv4VM2ZtJ+7zOsfKQO4O42BQSsr1qTbjHQd
         OQpCOSZJWcSgQR1u1E56Df60aTRRHrMJGz7g2B+cwMK5KcwbdJXC8pmpj8vJe5ADJ9dn
         1CEA==
X-Gm-Message-State: AOAM530GJh6pf+kBFr+pQh6a01FtajZGa3aYrzYDy/XT5AWi9DU8THRd
        4Aws93YFVtz0JINDHVsB+TdMt8HxM6bAp49DfXnVmYVoBIR0sYU1eg0RmlReDnVQHjcY5K3SO9f
        cSB2dyBgml33pHqVH8KSbw1wpdZ6cmFocLA==
X-Received: by 2002:aa7:cd96:: with SMTP id x22mr1303447edv.46.1631171750400;
        Thu, 09 Sep 2021 00:15:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzE1ZrRm+GMGpuLP6Uoq3Acq8e8RsBWEqf/EKTRAFrkH6arNFAF5PtAN7v9vWX26EJwS1030w==
X-Received: by 2002:aa7:cd96:: with SMTP id x22mr1303436edv.46.1631171750248;
        Thu, 09 Sep 2021 00:15:50 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id t19sm411501ejb.115.2021.09.09.00.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Sep 2021 00:15:49 -0700 (PDT)
Subject: Re: [PATCH v3 1/1] ishtp: Add support for Intel ishtp eclite driver
To:     "K Naduvalath, Sumesh" <sumesh.k.naduvalath@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>
Cc:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Chinnu, Ganapathi" <ganapathi.chinnu@intel.com>,
        "Kumar, Nachiketa" <nachiketa.kumar@intel.com>
References: <20210901124307.16886-1-sumesh.k.naduvalath@intel.com>
 <2e82bbb6-59c1-e713-f153-57ddd1e68163@infradead.org>
 <BYAPR11MB3752899FD7FE512F9682E807A9CE9@BYAPR11MB3752.namprd11.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <71e75871-2245-61b8-c18b-c3d21183593c@redhat.com>
Date:   Thu, 9 Sep 2021 09:15:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <BYAPR11MB3752899FD7FE512F9682E807A9CE9@BYAPR11MB3752.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/2/21 2:07 PM, K Naduvalath, Sumesh wrote:
> Thank you Randy for the review. Please find my comments inline -
> 
>> -----Original Message-----
>> From: Randy Dunlap <rdunlap@infradead.org>
>> Sent: Thursday, September 2, 2021 1:02 AM
>> To: K Naduvalath, Sumesh <sumesh.k.naduvalath@intel.com>;
>> hdegoede@redhat.com; mgross@linux.intel.com;
>> srinivas.pandruvada@linux.intel.com
>> Cc: Pandruvada, Srinivas <srinivas.pandruvada@intel.com>; platform-driver-
>> x86@vger.kernel.org; linux-kernel@vger.kernel.org; Chinnu, Ganapathi
>> <ganapathi.chinnu@intel.com>; Kumar, Nachiketa
>> <nachiketa.kumar@intel.com>
>> Subject: Re: [PATCH v3 1/1] ishtp: Add support for Intel ishtp eclite driver
>>
>> On 9/1/21 5:43 AM, sumesh.k.naduvalath@intel.com wrote:
>>> diff --git a/drivers/platform/x86/Kconfig
>>> b/drivers/platform/x86/Kconfig index d12db6c316ea..8a0945ed1182
>> 100644
>>> --- a/drivers/platform/x86/Kconfig
>>> +++ b/drivers/platform/x86/Kconfig
>>> @@ -1176,6 +1176,22 @@ config INTEL_CHTDC_TI_PWRBTN
>>>   	  To compile this driver as a module, choose M here: the module
>>>   	  will be called intel_chtdc_ti_pwrbtn.
>>>
>>> +config INTEL_ISHTP_ECLITE
>>> +	tristate "Intel ISHTP eclite controller"
>>> +	depends on INTEL_ISH_HID
>>> +	depends on ACPI
>>> +	help
>>> +	  This driver is for accessing the PSE (Programmable Service Engine),
>>> +	  an Embedded Controller like IP, using ISHTP (Integrated Sensor Hub
>>
>> Which "IP" is that?  "an Embedded Controller like IP" doesn't make sense
>> IMO.
> 
> This is Intel Elkhartlake's PSE IP. This IP is a dedicated low power real-time ARM
> based microcontroller within the SoC. More information here:
> https://www.intel.in/content/www/in/en/products/platforms/details/elkhart-lake.html
> 
> Do you suggest to reword like below?
> 
> This driver is for accessing the PSE (Programmable Service Engine) - an Embedded 
> Controller like IP - using ISHTP...

That seems fine to me, can send a v4 with this and the other thing Randy
pointed out fixed please ?

Regards,

Hans




> 
> Or reword it with more details?
> 
>>
>>
>>> +	  Transport Protocol) to get battery, thermal and UCSI (USB Type-C
>>> +          Connector System Software Interface) related data from the
>> platform.
>>
>> Indent above line with tab + 2 spaces instead of many spaces.
>>
> Sure. Will fix in V4.
> 
>>> +	  Users who don't want to use discrete Embedded Controller on
>> Intel's
>>> +	  Elkhartlake platform, can leverage this integrated solution of
>>
>> 	Drop this comma       ^
>>
> Sure. I'll fix it.
> 
>>> +	  ECLite which is part of PSE subsystem.
>>> +
>>> +	  To compile this driver as a module, choose M here: the module
>>> +	  will be called intel_ishtp_eclite
>>
>> End the last sentence with a period ('.').
>>
>>
> Sure. I'll fix it, thanks.
>  
>> thanks.
>> --
>> ~Randy
> 

