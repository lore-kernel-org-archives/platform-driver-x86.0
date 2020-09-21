Return-Path: <SRS0=1Jx7=C6=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD6FC43464
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Sep 2020 09:08:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E701E20773
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Sep 2020 09:08:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="benbJNWk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgIUJIj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Sep 2020 05:08:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58275 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726384AbgIUJIj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Sep 2020 05:08:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600679317;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XXgGkXf1ns6wj3iCmrCbcIG5/mx3epd2YbhN5mp9GGs=;
        b=benbJNWkIa5fvOmzioYPUCiKNjId6KwVWT479Tl/McN77DaJIrskfSU918LZpUZr2iIrqK
        EFm2UU9gkCKb1OkFoTVvdvw9J1rD19s+h2MFgIFNWFh8AOW2Qd5fC/7KARwVNikxTexY/k
        jRHTY6UJtPUYUU0/CWCxemE3Qwd7e8Q=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-oa_WwnLoNo24OEeGE5R7VA-1; Mon, 21 Sep 2020 05:08:35 -0400
X-MC-Unique: oa_WwnLoNo24OEeGE5R7VA-1
Received: by mail-ej1-f69.google.com with SMTP id i14so4643821ejc.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2020 02:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XXgGkXf1ns6wj3iCmrCbcIG5/mx3epd2YbhN5mp9GGs=;
        b=IF7/ZSPn3zuTc8CAFi7HeWBFObNtzN/dmXon1wI1jXd0Xs+zLv7IQkHhAGYdt1vWEH
         UapZ8/5WoyXDzTTVD94xmrosrIhzlXnXLlI/UUhe2dzAuLhj1FGhqsGJHF9i00v57ePY
         /zMCDkc9AddKxtz7W7407rhtt0ub227WOTXwYV8KQ3aXqL67zYNSkeoKc17tw1P8xTfQ
         9kA9yGRmI4IVII78j3gSAWa9VRnzNxId2cW5n9mXr25PTh4CvMPAwt0+kwAwaiCeHKkP
         gxv4XHu61U9JaRrXlPj/55IwwqqSDM5UlmcBcaG/N6oAQKrJAgMQchM04Rj6RTzYqk+s
         bxVw==
X-Gm-Message-State: AOAM533JMIWl0+sOa/gtogHooK3RwE0qDjORrWTnzxK4/qSYpFYGscfJ
        wdE8i1+RzJ9CZq1Qoo3mRavK1yUA9UNc5vJiGXzucalt/q887WxRMgsPsB37o8zxcB7y4KKSGCe
        xKe7hOMZrGVQYiZJJDoncLnq9+TPD8mOqXA==
X-Received: by 2002:aa7:d7ca:: with SMTP id e10mr49749939eds.191.1600679313912;
        Mon, 21 Sep 2020 02:08:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQMwpVU6q7jmrxdGnqjACR03MWiJpQ5UuG7Wb+IYnEnF0x1N/HMomAc7DmL2N5piR0Nu43uA==
X-Received: by 2002:aa7:d7ca:: with SMTP id e10mr49749927eds.191.1600679313689;
        Mon, 21 Sep 2020 02:08:33 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id k6sm8434681ejr.104.2020.09.21.02.08.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2020 02:08:33 -0700 (PDT)
Subject: Re: [PATCH v2] Introduce support for Systems Management Driver over
 WMI for Dell Systems
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        Divya Bharathi <divya27392@gmail.com>,
        "dvhart@infradead.org" <dvhart@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "Bharathi, Divya" <Divya.Bharathi@Dell.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Ksr, Prasanth" <Prasanth.Ksr@dell.com>
References: <20200904142846.5356-1-divya_bharathi@dell.com>
 <aaf3b072-a109-4f69-67dd-bea3dc5fb023@redhat.com>
 <DM6PR19MB2636829402BC67EC1048E15FFA230@DM6PR19MB2636.namprd19.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4d8f9ab8-ec5e-d8ec-65fe-afcd32f4e9d0@redhat.com>
Date:   Mon, 21 Sep 2020 11:08:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB2636829402BC67EC1048E15FFA230@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/14/20 7:12 PM, Limonciello, Mario wrote:

<snip>

>>> +static int call_biosattributes_interface(struct wmi_device *wdev, char
>> *in_args, size_t size,
>>> +					int method_id)
>>> +{
>>> +	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
>>> +	struct acpi_buffer input;
>>> +	union acpi_object *obj;
>>> +	acpi_status status;
>>> +	int ret = -EIO;
>>> +
>>> +	input.length =  (acpi_size) size;
>>> +	input.pointer = in_args;
>>> +	status = wmidev_evaluate_method(wdev, 0, method_id, &input, &output);
>>> +	if (ACPI_FAILURE(status))
>>> +		return -EIO;
>>> +	obj = (union acpi_object *)output.pointer;
>>> +	if (obj->type == ACPI_TYPE_INTEGER)
>>> +		ret = obj->integer.value;
>>> +
>>> +	kfree(output.pointer);
>>> +	kobject_uevent(&wdev->dev.kobj, KOBJ_CHANGE);
>>
>> Why are you generating an uevent here? I think this needs a comment (or it
>> should be removed).
> 
> It's there so that userspace can know that a setting has been changed and doesn't
> need to poll the attribute indicating a reboot is pending.
> 
> We can certainly add a comment to this effect.

uevents are somewhat expensive they get processed by udevd, causing it
to evaluate all loaded udev rules and send out events to any userspace
processes listening for udev events.

The generic sysfs ABI allows polling using the poll() system-call
(so event driven) on sysfs attributes. IMHO it would be much better to
use this mechanism. Userspace can then poll() (watching for POLL_PRI)
on the pending_reboot sysfs attribute.

This could then be combined with a little helper for setting the
pending_changes bool, which checks if it is actually transitioning
from false to true and in that case does something like this:

kn = sysfs_get_dirent(..., "pending_reboot");
if (kn) {
	sysfs_notify_dirent(kn);
	sysfs_put(kn);
}

Note something like this really ought to be part of the sysfs ABI
documentation.


>>> +	return map_wmi_error(ret);
>>> +}
>>> +
>>> +/**
>>> + * set_attribute() - Update an attribute value
>>> + * @a_name: The attribute name
>>> + * @a_value: The attribute value
>>> + *
>>> + * Sets an attribute to new value
>>> + **/
>>> +int set_attribute(const char *a_name, const char *a_value)
>>> +{
>>> +	size_t security_area_size, string_area_size, buffer_size;
>>> +	char *attribute_name, *attribute_value;
>>> +	u8 *name_len, *value_len;
>>> +	char *buffer;
>>> +	int ret;
>>> +
>>> +	/* build/calculate buffer */
>>> +	security_area_size = calculate_security_buffer();
>>> +	string_area_size = (strlen(a_name) + strlen(a_value))*2;
>>> +	buffer_size = security_area_size + string_area_size + sizeof(u16) * 2;
>>> +	buffer = kzalloc(buffer_size, GFP_KERNEL);
>>> +	if (!buffer)
>>> +		return -ENOMEM;
>>> +
>>> +	/* build security area */
>>> +	if (strlen(wmi_priv.current_admin_password) > 0)
>>> +		populate_security_buffer(buffer, wmi_priv.current_admin_password);
>>> +
>>> +	/* build variables to set */
>>> +	name_len = buffer + security_area_size;
>>> +	attribute_name = name_len + sizeof(u16);
>>> +	*name_len = utf8s_to_utf16s(a_name, strlen(a_name), UTF16_HOST_ENDIAN,
>>> +				    (wchar_t *) attribute_name, MAX_BUFF) * 2;
>>> +	if (*name_len < 0) {
>>> +		ret = -EINVAL;
>>> +		pr_err("UTF16 conversion failed");
>>> +		goto out_set_attribute;
>>> +	}
>>> +
>>> +	value_len = (u8 *) attribute_name + *name_len;
>>> +	attribute_value = value_len + sizeof(u16);
>>> +	*value_len = utf8s_to_utf16s(a_value, strlen(a_value),
>> UTF16_HOST_ENDIAN,
>>> +				    (wchar_t *) attribute_value, MAX_BUFF) * 2;
>>> +	if (*value_len < 0) {
>>> +		ret = -EINVAL;
>>> +		pr_err("UTF16 conversion failed");
>>> +		goto out_set_attribute;
>>> +	}
>>> +
>>> +	mutex_lock(&call_mutex);
>>> +	if (!wmi_priv.bios_attr_wdev) {
>>> +		ret = -ENODEV;
>>> +		pr_err("no WMI backend bound");
>>> +		goto out_set_attribute;
>>> +	}
>>
>> It is probably better to move this to the top, as I mentioned in my reply
>> to Mario, you could add something like this to the top of each function,
>> even before allocating the buffer and filling it.
> 
> The placement was intentional to avoid taking the mutex until data was validated.
> Is it preferable to make it specifically on entry into functions then?

See below.

>>
>>       mutex_lock(&wmi_priv.mutex);
>>
>>       if (!wmi_priv.bios_attr_wdev || !wmi_priv.password_attr_wdev) {
>>           ret = -ENODEV;
>>           goto out_set_attribute;
>>       }
>>
>> Note this requires that you initialize the buf pointer to NULL
>> when declaring it.
>>
>> Having this at the top of each function establishes a pattern where
>> it easy for a reader of the code to:
>>
>> a) See that the check is present when checking that the driver being
>> unbound is checked everywhere
>>
>> b) Ignore the check as "boilerplate" when looking at other parts of
>> the code
> 
> I guess this argument makes sense - setting up a pattern is a good way
> to spot the function that stands out when a coding mistake occurs.

Right.

Regards,

Hans

