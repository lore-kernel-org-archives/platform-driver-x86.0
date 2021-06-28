Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6BCC2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 09:34:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45FE061465
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 09:34:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232200AbhF1Jgm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 05:36:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37145 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231935AbhF1Jgl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 05:36:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624872855;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ht5ClIQqxdbiv7vOYAYOP4IOssRfPO5hbt04F7/U5ds=;
        b=CViW5QJJ6fbIdXDVD5vFEYuufKbIOz+rwx4Rycliv8JYp4Hk6cOw9l2zKaWNg06O81f5gn
        mcBq/u0QVrRZLM/8UpBQP3UskLJVoFNbYbc2Tvj11nbPc7RsEieHaMCNPW3jkVzHlM9Cru
        p4W1Jw7z2a+1xIbqLZ/UIrZUW7WVjJo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-5hmty6iwP5a93Nu9dzkBHA-1; Mon, 28 Jun 2021 05:34:14 -0400
X-MC-Unique: 5hmty6iwP5a93Nu9dzkBHA-1
Received: by mail-ed1-f70.google.com with SMTP id m4-20020a0564024304b0290394d27742e4so9076727edc.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Jun 2021 02:34:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ht5ClIQqxdbiv7vOYAYOP4IOssRfPO5hbt04F7/U5ds=;
        b=X8NmRO8VUvHgEpuRZ3pSsJZgeE4FM3J7ppH0Wz/S9U+4e574PdzLJfVFm1w4W/W/d+
         YqhI9f2lqNhZJ48A2ibpYorSfN7Y5RWgOBDPEeRq0fDEsWkfFekBhHxCD/HnHZDDmz2J
         YJ1ayFkO5kMTfgmEATw9WMH5KvlFkvvjvejbTmpTEkiIdiwYTqusW6Yz40rOjgnV+wmn
         PlFI9tdbA0dOqYn23iHrRDp6h18OLbGezHrS9CsFrgqRPE/i6QufJdbhDO+Zmh843vGw
         n0EyHN5WPQFtqW+KFbGJ5LDSTUB48qL8eIf3UN2KTZIqtrhGN2GoVQ0GfWp9s1yrI2Ph
         zpkQ==
X-Gm-Message-State: AOAM533leE0Db3t0AL+SAwAIuksJ8se77Dn1LHwkL92C0OZc2vUk6HMB
        lRTlV1NO1VTotNWqWTDBm4j9y/fjcdAaQ18ofiisVPMT/k1YcYFQz0Dd0dq3bhdyLBT0u62uz0m
        9m9hXuR5W2hlSBjtT1PtY3NsK7Mp5cAPkWw==
X-Received: by 2002:a17:906:384c:: with SMTP id w12mr5712980ejc.445.1624872853056;
        Mon, 28 Jun 2021 02:34:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxll6mDMZUel20TCwJndGX/4NzwK9GX4A/m/Ld21iX/FQURy0rvma1H0cPMg6YUPHqzszTNcQ==
X-Received: by 2002:a17:906:384c:: with SMTP id w12mr5712970ejc.445.1624872852930;
        Mon, 28 Jun 2021 02:34:12 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id s7sm6817660ejd.88.2021.06.28.02.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 02:34:12 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] platform/x86: think-lmi: Split current_value to
 reflect only the value
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>, markpearson@lenovo.com
References: <20210622200755.12379-1-mario.limonciello@amd.com>
 <20210622200755.12379-3-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b09582ac-2771-29f4-c455-606350500252@redhat.com>
Date:   Mon, 28 Jun 2021 11:34:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210622200755.12379-3-mario.limonciello@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/22/21 10:07 PM, Mario Limonciello wrote:
> Currently attributes will show things like:
> `BootOrderLock,Disable`
> rather than just
> `Disable`.
> 
> Of course this works, but the attribute is intended to be read by
> userspace tools and not require further processing.  That is a userspace
> tool can display a drop down of `possible_values` and `current_value` is
> one of them from the list.
> 
> This also aligns `think-lmi` with how `dell-wmi-sysman` works.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
>  drivers/platform/x86/think-lmi.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> Changes from v1->v2:
>  * Move into the series
>  * Correct a char->char*
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 4d8b5c185f8e..e71b631e6984 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -492,14 +492,19 @@ static ssize_t display_name_show(struct kobject *kobj, struct kobj_attribute *at
>  static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
>  {
>  	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
> -	char *item;
> +	char *item, *value;
>  	int ret;
>  
>  	ret = tlmi_setting(setting->index, &item, LENOVO_BIOS_SETTING_GUID);
>  	if (ret)
>  		return ret;
>  
> -	ret = sysfs_emit(buf, "%s\n", item);
> +	/* validate and split from `item,value` -> `value` */
> +	value = strpbrk(item, ",");
> +	if (!value || value == item || !strlen(value + 1))
> +		return -EINVAL;
> +
> +	ret = sysfs_emit(buf, "%s\n", value + 1);
>  	kfree(item);
>  	return ret;
>  }
> 

