Return-Path: <SRS0=1Jx7=C6=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4482EC43463
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Sep 2020 09:38:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE1282158C
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Sep 2020 09:38:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HNoywDUI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgIUJiW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Sep 2020 05:38:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33069 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726475AbgIUJiV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Sep 2020 05:38:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600681099;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YMueE7TUp93oQ7tBGEmbtQUpxk5L9SeW1/QycLtgmXo=;
        b=HNoywDUIGn15Z7LCuXfvpkc9Kx/m3POdRp67EOqgvuLDbo8uvXvKvEie9llr48xLv3CB58
        JaMHiyWjDug6WdDNznQS8gb0WXPwx+O7iOQ/+YUlfQb8FR06VsQFJEDPTKPLx6Bez9v6uT
        vICunHI5nGt6Zvb5ojqxRttiUUCu5FI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-E28Bak2GPounbSHuUfG5rQ-1; Mon, 21 Sep 2020 05:38:14 -0400
X-MC-Unique: E28Bak2GPounbSHuUfG5rQ-1
Received: by mail-ej1-f71.google.com with SMTP id f17so4647711ejq.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2020 02:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YMueE7TUp93oQ7tBGEmbtQUpxk5L9SeW1/QycLtgmXo=;
        b=LVsQ1YzOICWAAhl5s0YMqkO1ZxjrJG2TiMF/Xh543BA6/2HBUq7JRxor8Pjn6pGjBc
         fUNFmiN41q9N3QGabm5zVxlylimoc9UmtD8JtesWI6nAYX7tw9ujwI3LW0YlmOEGlavE
         BoXoRjNrHmd6bxxJk93Rtp/iieZaoJeTDecQCtbFCBHyIGbU/ABlOSpMo0M4trLehBYW
         DIh9zX6mlPb60Ly20YV7Mgge4ebHOxh728tTqe6uBrecheykVFw3pfvaFsyd9cXdsmbR
         po0L+RNkBSxzFpmx59TW/5b4BSiVp014smrgprk16ty/l0MpX9FKVS97+r+P4H/+i8EM
         f3Jw==
X-Gm-Message-State: AOAM533fO0kQWxQ1pidrPiscXbBsbtfRPDIKqms6P1b/fIa/vKercE5e
        ihH2I382RPj+FoQC6Fwu39V5CUctfvtw0GXfRWEkWTzJlp9Zm3CaqsZ9bToeJo7MJmwXthneQNR
        wPEwZ9NpCxroPkNF5arKT4diD2MXOfzKiTg==
X-Received: by 2002:a17:906:4e54:: with SMTP id g20mr50585144ejw.252.1600681092949;
        Mon, 21 Sep 2020 02:38:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJSZTXdBVWGqB2un9eeUK9ZWv92rLjbjiVwFl5amHpnBMSabLAay1iXxSoBq76KE4eSf8Hvw==
X-Received: by 2002:a17:906:4e54:: with SMTP id g20mr50585133ejw.252.1600681092754;
        Mon, 21 Sep 2020 02:38:12 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id j15sm8509972ejs.5.2020.09.21.02.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2020 02:38:12 -0700 (PDT)
Subject: Re: [PATCH v2] Introduce support for Systems Management Driver over
 WMI for Dell Systems
To:     "Bharathi, Divya" <Divya.Bharathi@Dell.com>,
        "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        Divya Bharathi <divya27392@gmail.com>,
        "dvhart@infradead.org" <dvhart@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Ksr, Prasanth" <Prasanth.Ksr@dell.com>
References: <20200904142846.5356-1-divya_bharathi@dell.com>
 <aaf3b072-a109-4f69-67dd-bea3dc5fb023@redhat.com>
 <DM6PR19MB2636829402BC67EC1048E15FFA230@DM6PR19MB2636.namprd19.prod.outlook.com>
 <CY4PR19MB12544CE6AFD16E89E688ACCD85200@CY4PR19MB1254.namprd19.prod.outlook.com>
 <CY4PR19MB1254A26A233052B71ACC5ACA853E0@CY4PR19MB1254.namprd19.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a6dbd512-760a-bd01-28ab-7e82d18d03d8@redhat.com>
Date:   Mon, 21 Sep 2020 11:38:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CY4PR19MB1254A26A233052B71ACC5ACA853E0@CY4PR19MB1254.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/17/20 7:22 AM, Bharathi, Divya wrote:

<snip>

>>>>> +
>>>>> +/**
>>>>> + * exit_enum_attributes() - Clear all attribute data
>>>>> + * @kset: The kset to free
>>>>> + *
>>>>> + * Clears all data allocated for this group of attributes  **/ void
>>>>> +exit_enum_attributes(struct kset *kset) {
>>>>> +	struct kobject *pos, *next;
>>>>> +
>>>>> +	mutex_lock(&kset_mutex);
>>>>> +	list_for_each_entry_safe(pos, next, &kset->list, entry) {
>>>>> +		sysfs_remove_group(pos, &enumeration_attr_group);
>>>>> +	}
>>>>> +	mutex_unlock(&kset_mutex);
>>>>> +	mutex_lock(&enum_mutex);
>>>>> +	kfree(enumeration_data);
>>>>> +	mutex_unlock(&enum_mutex);
>>>>> +}
>>>>
>>>> Since there is now only 1 kset for the main dir, you are now calling
>>>> sysfs_remove_group 4 times (for all the different times) on each entry
>>>> in the attributes dir. I guess this may fail silently, but it still is
>>>> not good. So this needs to be fixed.
>>>>
>>>> The remarks to this file also apply to the:
>>>>
>>>> drivers/platform/x86/dell-wmi-int-attributes.c
>>>> drivers/platform/x86/dell-wmi-string-attributes.c
>>>>
>>>> files.
>>>>
> 
> Since we maintained 4 different attribute groups under 1 kset, each time
> respective attribute group will be removed. And once all groups are
> removed, kset is deleted.

sysfs_remove_group() just does a kernfs_remove_by_name() for each
attribute in the group.

Since the integer_, enumeration_ and string_ attr_group-s all
have e.g. a current_value attribute that means that current_value
will be removed 3 times and for the 2nd and 3th call
kernfs_remove_by_name() will fail with -ENOENT.

Currently neither kernfs_remove_by_name() nor sysfs_remove_group() print
an error message for this, but still it is not very clean.

Instead why not do this:

int populate_enum_data(union acpi_object *enumeration_obj, int instance_id,
                         struct kobject *attr_name_kobj)
{
         int retval = sysfs_create_group(attr_name_kobj, &enumeration_attr_group);
         int i, next_obj;

         if (retval)
                 goto out;

         mutex_lock(&wmi_priv.mutex);
	enumeration_data[instance_id].attr_name_kobj = attr_name_kobj;
	/* ^^^^^^^^^^^^^^^^ This line is new ^^^^^^^^^^^^^^^^^^^^^^^^*/
	...


void exit_enum_attributes(void)
{
         int i;

         for (i = 0; i < enumeration_instances_count; i++) {
		if (enumeration_data[instance_id].attr_name_kobj)
                         sysfs_remove_group(enumeration_data[instance_id].attr_name_kobj, &enumeration_attr_group);
	}

         kfree(enumeration_data);
}


That makes the teardown mirror the setup much more closely and as such is
a cleaner solution IMHO.

Regards,

Hans

