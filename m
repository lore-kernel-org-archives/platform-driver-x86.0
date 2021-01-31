Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792A6C433DB
	for <platform-driver-x86@archiver.kernel.org>; Sun, 31 Jan 2021 21:06:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B07061481
	for <platform-driver-x86@archiver.kernel.org>; Sun, 31 Jan 2021 21:06:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231607AbhAaVFq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 31 Jan 2021 16:05:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32953 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231448AbhAaVAb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 31 Jan 2021 16:00:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612126744;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BTdfeZUlmDAGnUPUg1Sx+tWBlHdEKi++bIDvsDvVpgY=;
        b=e5YO6tu+ZMXcxGRX9YIJFzm4fTXyA83hzjQDp2BhAXWidYoO0Hck1jDQ+xAtU9jbaxpSdr
        YUtdt+lzLoZ8a/CgXYHV4x+eOgO3j6hlgDQJO+R468xMS/dzfVxkLCN2M8s1tBQxirRL23
        FsH9BWoDU21GygCzH3dOZVGy2kor1Vw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-HOTzNY-IM-mMxel2sRpc9Q-1; Sun, 31 Jan 2021 15:59:03 -0500
X-MC-Unique: HOTzNY-IM-mMxel2sRpc9Q-1
Received: by mail-ed1-f69.google.com with SMTP id x13so6946319edi.7
        for <platform-driver-x86@vger.kernel.org>; Sun, 31 Jan 2021 12:59:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BTdfeZUlmDAGnUPUg1Sx+tWBlHdEKi++bIDvsDvVpgY=;
        b=F0fslzeRK5AgMkLX5ZAeOpn2fBgWrLrorDfE0d+gNy/h+GdLiZOZTO6vMqnk27kCtb
         CZESoga/YyIdnT6VJ3IN3SlQxWi9aL/7svW4JsynrbM+1AkyRSk5OiCOOysrXNrXoEmH
         b6KX5sYaKZi5Y4HWoHEij5cmwa0XJNoLN8uIwcTZTZPq6JndQJejU5+dH0Ar3dBRW3ew
         Gj9aqAHNsA43xpHi+Ffo6V73Dqq8qWZjp+7l3ijPtNUPUAdlwwB8xH4mmAoRInpKo8re
         KItq6ZeGv3qewdY19+aObkgfEMKWSG987kTtMAUemjug47mIMz6Hg+Z9IiGdHxQ0vnPv
         NnNg==
X-Gm-Message-State: AOAM530oEeJ4Slc+YP6XCzkuUSo8SoOWcZgqbIaoOMoNR/VG9jJOsL7A
        7w0UikCR+Cop/B0+r3D4qIAAZbHjtUw/zUY9sP6JpBEKrUQAqiVDVdWxqYLBKhEW1O710l6wbMq
        s3T4w4MdlgELoxh7q2J6xrvQmTTK9KVlX1VV2VrrUOq3TUp7J1YYxPuA9FUxvCJOoj3xEBKlMvI
        WVdFEgrUw1Xg==
X-Received: by 2002:a17:906:69c2:: with SMTP id g2mr14105195ejs.249.1612126741692;
        Sun, 31 Jan 2021 12:59:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjz533QMFNl6H/Ne8MsDH5LPiFLL/aCHyz1ZQYHciPk1o13+N380W5/ysDpK+OT6xjT3K8Gw==
X-Received: by 2002:a17:906:69c2:: with SMTP id g2mr14105189ejs.249.1612126741520;
        Sun, 31 Jan 2021 12:59:01 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id cw21sm7601846edb.85.2021.01.31.12.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Jan 2021 12:59:00 -0800 (PST)
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: fix a NULL pointer
 dereference
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20210129172654.2326751-1-mario.limonciello@dell.com>
 <0da9ca30-53b1-8d34-4fc7-62edb6423b26@redhat.com>
 <SA1PR19MB49263EE7ECF0D06962BE00ECFAB79@SA1PR19MB4926.namprd19.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a371c1c9-d803-f2e6-dfca-607a0650345f@redhat.com>
Date:   Sun, 31 Jan 2021 21:59:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <SA1PR19MB49263EE7ECF0D06962BE00ECFAB79@SA1PR19MB4926.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/31/21 3:04 PM, Limonciello, Mario wrote:
> 
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Saturday, January 30, 2021 15:44
>> To: Limonciello, Mario; Mark Gross
>> Cc: LKML; platform-driver-x86@vger.kernel.org
>> Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: fix a NULL pointer
>> dereference
>>
>>
>> [EXTERNAL EMAIL]
>>
>> Hi,
>>
>> On 1/29/21 6:26 PM, Mario Limonciello wrote:
>>> An upcoming Dell platform is causing a NULL pointer dereference
>>> in dell-wmi-sysman initialization.  Validate that the input from
>>> BIOS matches correct ACPI types and abort module initialization
>>> if it fails.
>>>
>>> This leads to a memory leak that needs to be cleaned up properly.
>>>
>>> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
>>> ---
>>>  drivers/platform/x86/dell-wmi-sysman/sysman.c | 8 +++++++-
>>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/platform/x86/dell-wmi-sysman/sysman.c
>> b/drivers/platform/x86/dell-wmi-sysman/sysman.c
>>> index dc6dd531c996..38b497991071 100644
>>> --- a/drivers/platform/x86/dell-wmi-sysman/sysman.c
>>> +++ b/drivers/platform/x86/dell-wmi-sysman/sysman.c
>>> @@ -419,13 +419,19 @@ static int init_bios_attributes(int attr_type, const
>> char *guid)
>>>  		return retval;
>>>  	/* need to use specific instance_id and guid combination to get right
>> data */
>>>  	obj = get_wmiobj_pointer(instance_id, guid);
>>> -	if (!obj)
>>> +	if (!obj || obj->type != ACPI_TYPE_PACKAGE) {
>>> +		release_attributes_data();
>>
>> All calls of  init_bios_attributes() have the following error handling:
>>
>>         ret = init_bios_attributes(INT, DELL_WMI_BIOS_INTEGER_ATTRIBUTE_GUID);
>>         if (ret) {
>>                 pr_debug("failed to populate integer type attributes\n");
>>                 goto fail_create_group;
>>         }
>>
>> 	...
>>
>> fail_create_group:
>>         release_attributes_data();
>>
>> So that added release_attributes_data() call is not necessary. If you can
>> respin
>> this patch Monday with the release_attributes_data(); addition dropped, then
>> I will try to get this to Linus in time for 5.11 .
>>
>> Or I can fix this up locally if you agree with dropping the unnecessary
>> release_attributes_data() call.
>>
> 
> Yes, please go ahead and drop the unnecessary call locally.

Ok, I've merged this into my review-hans branch and I will push this out
to for-next as soon as a local build has finished. I'll also include
this in my last fixes pull-req for Linus later this week.

While working on this I did notice that the function in question still
has a bunch of further issues. But since this patch fixes a crash and has
been tested I've decided to move forward with it as is (with the duplicate
release_attributes_data() call dropped). The further issues can be fixed
with follow-up patches.

So the other issues which I noticed are:

1. Calling release_attributes_data() in the error-path here:

	obj = get_wmiobj_pointer(instance_id, guid);
	if (!obj || obj->type != ACPI_TYPE_PACKAGE) {
		return -ENODEV;
	}

Is not necessary as discussed, but the added obj->type != ACPI_TYPE_PACKAGE
which I assume triggers to fix the reported crash, means that obj is not
NULL in which case we should free it. So this should become:

	obj = get_wmiobj_pointer(instance_id, guid);
	if (!obj || obj->type != ACPI_TYPE_PACKAGE) {
		kfree(obj);
		return -ENODEV;
	}

Note that the kfree() will be a no-op when obj == NULL. This means that
with just the current fix merged there is a small memleak on machines
where we hit the error-path. I've decided that we can live with that,
since the alternative is the crash or me pushing something untested.


2. There is a while below this if, which gets a new obj pointer:

	obj = get_wmiobj_pointer(instance_id, guid);
	if (!obj || obj->type != ACPI_TYPE_PACKAGE) {
		kfree(obj);
		return -ENODEV;
	}
	elements = obj->package.elements;

	mutex_lock(&wmi_priv.mutex);
	while (elements) {
		...

nextobj:
		kfree(obj);
		instance_id++;
		obj = get_wmiobj_pointer(instance_id, guid);
		elements = obj ? obj->package.elements : NULL;
	}

This is missing a check for the obj->type for the new obj when
going into a second (or higher) iteration of the loop.

This check can be added by moving the original check to inside
the loop like this:

	obj = get_wmiobj_pointer(instance_id, guid);

	mutex_lock(&wmi_priv.mutex);	
	while (obj) {
		if (obj->type != ACPI_TYPE_PACKAGE) {
			err = ENODEV;
			goto err_attr_init;
		}
		elements = obj->package.elements;

		...

nextobj:
		kfree(obj);
		instance_id++;
		obj = get_wmiobj_pointer(instance_id, guid);
	}


3. Functions like populate_enum_data() (and the others) index the
elements array with an index > 0 without checking the package length
and also make assumptions about the types embedded in the package
without checking them.


4. The err_attr_init exit path of init_bios_attributes() calls
release_attributes_data() but that call does not just cleanup
the results of that single init_bios_attributes() call but also
of all previous init_bios_attributes() calls as such it makes more
sense to leave the calling of release_attributes_data() to the caller.

Either way calling it twice once from the err_attr_init exit path
and then again in sysman_init() feels wrong, even though I think it
does no harm.

Regards,

Hans














> 
> Thank you
> 
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>>  		return -ENODEV;
>>> +	}
>>>  	elements = obj->package.elements;
>>>
>>>  	mutex_lock(&wmi_priv.mutex);
>>>  	while (elements) {
>>>  		/* sanity checking */
>>> +		if (elements[ATTR_NAME].type != ACPI_TYPE_STRING) {
>>> +			pr_debug("incorrect element type\n");
>>> +			goto nextobj;
>>> +		}
>>>  		if (strlen(elements[ATTR_NAME].string.pointer) == 0) {
>>>  			pr_debug("empty attribute found\n");
>>>  			goto nextobj;
>>>
> 

