Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70634C433E6
	for <platform-driver-x86@archiver.kernel.org>; Fri, 19 Feb 2021 10:44:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23FE864E43
	for <platform-driver-x86@archiver.kernel.org>; Fri, 19 Feb 2021 10:44:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbhBSKoW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 19 Feb 2021 05:44:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21900 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229985AbhBSKoT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Feb 2021 05:44:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613731372;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fHQcr2/sIGEkNpsTNCW8sWG7GDqb/gPUn+AcpCELTFw=;
        b=TXOjVOUdagxJkMGS4cg5rp1vW4LNpRyGAi+fH4+jG3367Iss5NYSjfodHGUGyqsQ+N4fao
        1d9ubIpOKIkWKHjWFs8vUKYT1mEx7UVQ88YpXrjm+e4fBMnmCnvqdAbf4hDCcO4hQFKy1G
        gAYlbBwZNhYN1Q50r6p7dlFTa+kzL/o=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-HP0EfbZ7PcyfWaM7KXrLCA-1; Fri, 19 Feb 2021 05:42:50 -0500
X-MC-Unique: HP0EfbZ7PcyfWaM7KXrLCA-1
Received: by mail-ed1-f71.google.com with SMTP id j10so2394613edv.5
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Feb 2021 02:42:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fHQcr2/sIGEkNpsTNCW8sWG7GDqb/gPUn+AcpCELTFw=;
        b=oHsN80WNqtBs3QrSCuaEhPjXE4UK0EKzt/bd6sFVSOOtKW7FCr4pAHQ8kCDEJ54cCN
         jFmIauTi0QKTHFCKhStdzOjJ7fOdff3TSJv8eOieQhK0idJP0pEscwA++GZLQizM43c/
         jfajFc51iv2NSS6TMjWlQA62iqLCKDqbStw3ySTJJgZJQaRNWLurHc3IOnhvxikmgsOM
         F+WtRJBTFoho/Wx8IOvMFBW2zdKno0UUyt0mLKSuFzLFqt262IsSQ1SMg9V7qcs/syCG
         QdZ/J0S+j1twyBbhGaeSfb0ZVoWRZtM48s0kpO+gqQO6xWvrjVtHif5Lnu2E72FqfaNi
         t7EA==
X-Gm-Message-State: AOAM531RlWvtbvNfA+Soz/WGjUH3R9GjVELINNgdMIAydTT9hWasqf+/
        VTbg5JApK4VpA5mFp7R6zahKNAamHAhvTWoN2TZPm07NepH8YwCnYjx2/SEZ1t5si59cubXj78h
        uPs76RZyw5lePlrcbUWSaF5UFPXOYWrpXfQ==
X-Received: by 2002:a17:906:c01:: with SMTP id s1mr8252414ejf.412.1613731369402;
        Fri, 19 Feb 2021 02:42:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvJBv5dF7NIC6t+tnVdXePC77S52Aufd8Lr3gzlYGPc4NpMg1STmKjtEtdNsZMpNASZdH6xw==
X-Received: by 2002:a17:906:c01:: with SMTP id s1mr8252407ejf.412.1613731369215;
        Fri, 19 Feb 2021 02:42:49 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q2sm4578676edv.93.2021.02.19.02.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Feb 2021 02:42:48 -0800 (PST)
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: correct an initialization
 failure
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "Bharathi, Divya" <Divya.Bharathi@Dell.com>,
        Alexander Naumann <alexandernaumann@gmx.de>
References: <20210218191723.20030-1-mario.limonciello@dell.com>
 <20210218224848.GB134379@linux.intel.com>
 <SA1PR19MB49261FC8B24465A86A985975FA859@SA1PR19MB4926.namprd19.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <863cffc8-7257-7ee3-ecd7-d7acfbb11475@redhat.com>
Date:   Fri, 19 Feb 2021 11:42:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <SA1PR19MB49261FC8B24465A86A985975FA859@SA1PR19MB4926.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/19/21 12:26 AM, Limonciello, Mario wrote:
> 
> 
>> -----Original Message-----
>> From: mark gross <mgross@linux.intel.com>
>> Sent: Thursday, February 18, 2021 16:49
>> To: Limonciello, Mario
>> Cc: Hans De Goede; Mark Gross; LKML; platform-driver-x86@vger.kernel.org;
>> Bharathi, Divya; Alexander Naumann
>> Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: correct an initialization
>> failure
>>
>>
>> [EXTERNAL EMAIL]
>>
>> On Thu, Feb 18, 2021 at 01:17:23PM -0600, Mario Limonciello wrote:
>>> On Dell systems that don't support this interface the module is
>>> mistakingly returning error code "0", when it should be returning
>>> -ENODEV.  Correct a logic error to guarantee the correct return code.
>>>
>>> Cc: Divya Bharathi <Divya_Bharathi@Dell.com>
>>> Reported-by: Alexander Naumann <alexandernaumann@gmx.de>
>>> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
>>> ---
>>>  drivers/platform/x86/dell-wmi-sysman/biosattr-interface.c     | 4 +++-
>>>  drivers/platform/x86/dell-wmi-sysman/passwordattr-interface.c | 4 +++-
>>>  drivers/platform/x86/dell-wmi-sysman/sysman.c                 | 4 ++--
>>>  3 files changed, 8 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/dell-wmi-sysman/biosattr-interface.c
>> b/drivers/platform/x86/dell-wmi-sysman/biosattr-interface.c
>>> index f95d8ddace5a..8d59f81f9db4 100644
>>> --- a/drivers/platform/x86/dell-wmi-sysman/biosattr-interface.c
>>> +++ b/drivers/platform/x86/dell-wmi-sysman/biosattr-interface.c
>>> @@ -175,7 +175,9 @@ static struct wmi_driver bios_attr_set_interface_driver
>> = {
>>>
>>>  int init_bios_attr_set_interface(void)
>>>  {
>>> -	return wmi_driver_register(&bios_attr_set_interface_driver);
>>> +	int ret = wmi_driver_register(&bios_attr_set_interface_driver);
>> I have to ask if the propper fix should be in wmi_driver_register
> 
> Do you mean something like this?
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index c669676ea8e8..89d04c5e3ab9 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -1415,6 +1415,11 @@ static int acpi_wmi_probe(struct platform_device *device)
>  int __must_check __wmi_driver_register(struct wmi_driver *driver,
>                                        struct module *owner)
>  {
> +       const struct wmi_device_id *id = driver->id_table;
> +
> +       if (!wmi_has_guid(id->guid_string))
> +               return -ENODEV;
> +
>         driver->driver.owner = owner;
>         driver->driver.bus = &wmi_bus_type;
> 

No, drivers should be able to register before the GUID shows up. I know that
the GUID showing up later will likely never happen with WMI, but having a match
check like this in the driver_register function is highly unusual and would
be different from what all other busses do.

But your initial fix here is wrong too, because it does call wmi_driver_register,
which succeeds and then makes sysman_init() exit with -ENODEV.

Returning -ENODEV from sysman_init() is what we want, this causes the entire
insmod to be aborted, without logging an error (because of -ENODEV) so the
code will not be taking up memory.

This means that the memory into which the module was loaded before the kernel
calls sysman_init() will be free-ed and now the *still* registered WMI driver
entry will point to that free-ed memory, which is not good (TM).

So instead init_bios_attr_set_interface() should become something like this:

int init_bios_attr_set_interface(void)
{
	int ret;

	ret = wmi_driver_register(&bios_attr_set_interface_driver);
	if (ret)
		return ret;

	if (!wmi_priv.bios_attr_wdev) {
		wmi_driver_unregister(&bios_attr_set_interface_driver);
		return -ENODEV;
	}

	return 0;
}

And the same for the init_bios_attr_pass_interface() function.

This follows the standard kernel pattern that a function should always
undo any things / resource-allocations it has done on error before
exiting with an error.

Regards,

Hans

