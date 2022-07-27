Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E352C04A68
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jul 2022 13:24:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232453AbiG0NYq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Jul 2022 09:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232246AbiG0NYn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Jul 2022 09:24:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E812D2E6B2
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 06:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658928280;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nHDoEnomjvtwTSpnmbx6/NyLBgAE9XEEagT+s9E03T8=;
        b=S9o6HHMGrC4eZ1PgKsex9x4VR79xSFNIiWqzdDZkeBXO1OSYElXn4e54wroipX9uLPUQ30
        5Ao7UWSZxax75xiOYYfkWauX0Fxooz8qt/v8oWe9fAseXwDN5YQyGDtdH7oavvGG6hfpgX
        hwXc1OCjcHUyxOaZByI3RXmA9xPoD8A=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-Ubn8RvipNvC4qV6mqRuY_Q-1; Wed, 27 Jul 2022 09:24:39 -0400
X-MC-Unique: Ubn8RvipNvC4qV6mqRuY_Q-1
Received: by mail-ed1-f70.google.com with SMTP id g15-20020a056402424f00b0043bff7a68dbso5405272edb.10
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 06:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nHDoEnomjvtwTSpnmbx6/NyLBgAE9XEEagT+s9E03T8=;
        b=TjtDCflHWyDKizYIWdISynmGXd2sbLX/u6VYH6dwYeZRdRUbXjqTA2L17gSMMK7SpE
         9jD7k88mBTLyhFhbgbSI2bBwCyu8wN+1DDiDB4Z/6YnpZf1xdPgCAwnoTZD+m2fmQLny
         sUs8ob7IcLKia+VJEEG2YpR6qVm3e2ziqJzxmmv7ODqa1ZNwCLBV3Su89DvHmlbnymu+
         4McCwljgVdNnItnHsDSR2CRqDVpTdDuvTNf8VsQ59+OZ1lRKofRkr2MUmAIfuYCIgy+B
         NKJgWnr6fCKY8xcK7TTkY68h1S0vcNQo8yeG/srWskfQtGMKsh5JwvT8dl+nIsLPtnv2
         lZfQ==
X-Gm-Message-State: AJIora+SBSSuKGUAGO7HEnGN4jkZ5bysLKwh7PoZmEIl4v6HKhTM+TFf
        PFwbMvlvD4lE4oMoilOOPO0vLnRn9RgTnla2kICd513VAL72/y5guLfYc1eZAFD8h4XvewIgHZJ
        Gh5pWrEkzIke47rSO5+eXV2B2gQnc2Ka9hg==
X-Received: by 2002:a17:906:9be4:b0:72b:cf9:99d8 with SMTP id de36-20020a1709069be400b0072b0cf999d8mr17585722ejc.747.1658928277971;
        Wed, 27 Jul 2022 06:24:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1si9EV+JumHF+pMBoiVoeJcgUiFENBLgqNEkV2oW6Y6nx6t8IVNlr5sMnFaa2+acVPgAWsDDQ==
X-Received: by 2002:a17:906:9be4:b0:72b:cf9:99d8 with SMTP id de36-20020a1709069be400b0072b0cf999d8mr17585694ejc.747.1658928277506;
        Wed, 27 Jul 2022 06:24:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id b3-20020aa7d483000000b0043ad162b5e3sm10114987edr.18.2022.07.27.06.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 06:24:36 -0700 (PDT)
Message-ID: <58b9a042-a7de-a64c-ca8b-f3f187c22c83@redhat.com>
Date:   Wed, 27 Jul 2022 15:24:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 01/15] ACPI: platform_profile: Add support for
 notification chains
Content-Language: en-US
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "markgross@kernel.org" <markgross@kernel.org>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Patil Rajesh <Patil.Reddy@amd.com>
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-2-Shyam-sundar.S-k@amd.com>
 <MN0PR12MB61018FA44A015793FCF62322E2869@MN0PR12MB6101.namprd12.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <MN0PR12MB61018FA44A015793FCF62322E2869@MN0PR12MB6101.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/12/22 17:03, Limonciello, Mario wrote:
> [Public]
> 
>> -----Original Message-----
>> From: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>
>> Sent: Tuesday, July 12, 2022 09:59
>> To: hdegoede@redhat.com; markgross@kernel.org
>> Cc: platform-driver-x86@vger.kernel.org; Patil Rajesh
>> <Patil.Reddy@amd.com>; Limonciello, Mario
>> <Mario.Limonciello@amd.com>; S-k, Shyam-sundar <Shyam-sundar.S-
>> k@amd.com>
>> Subject: [PATCH v1 01/15] ACPI: platform_profile: Add support for
>> notification chains
>>
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> Allow other drivers to react to determine current active profile
>> and react to platform profile changes.
>>
> 
> The original patch this came from had notification chains, but as this was
> pared down to just export the get method, this commit message and title
> should be updated.
> 
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/acpi/platform_profile.c  | 26 ++++++++++++++++++++++++++
>>  include/linux/platform_profile.h |  1 +
>>  2 files changed, 27 insertions(+)
>>
>> diff --git a/drivers/acpi/platform_profile.c b/drivers/acpi/platform_profile.c
>> index d418462ab791..7e12a1f30f06 100644
>> --- a/drivers/acpi/platform_profile.c
>> +++ b/drivers/acpi/platform_profile.c
>> @@ -49,6 +49,32 @@ static ssize_t platform_profile_choices_show(struct
>> device *dev,
>>  	return len;
>>  }
>>
>> +int platform_profile_get(enum platform_profile_option *profile)
>> +{
>> +	int err;
>> +
>> +	err = mutex_lock_interruptible(&profile_lock);

Besides Mario'r remark about the commit message, this must be
mutex_lock() not mutex_lock_interruptible() since this function
is intended to be called by other kernel code, rather then from
userspace.

Regards,

Hans


>> +	if (err)
>> +		return err;
>> +
>> +	if (!cur_profile) {
>> +		mutex_unlock(&profile_lock);
>> +		return -ENODEV;
>> +	}
>> +
>> +	err = cur_profile->profile_get(cur_profile, profile);
>> +	mutex_unlock(&profile_lock);
>> +	if (err)
>> +		return err;
>> +
>> +	/* Check that profile is valid index */
>> +	if (WARN_ON((*profile < 0) || (*profile >=
>> ARRAY_SIZE(profile_names))))
>> +		return -EIO;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(platform_profile_get);
>> +
>>  static ssize_t platform_profile_show(struct device *dev,
>>  					struct device_attribute *attr,
>>  					char *buf)
>> diff --git a/include/linux/platform_profile.h
>> b/include/linux/platform_profile.h
>> index e5cbb6841f3a..2395be670dfd 100644
>> --- a/include/linux/platform_profile.h
>> +++ b/include/linux/platform_profile.h
>> @@ -37,5 +37,6 @@ struct platform_profile_handler {
>>  int platform_profile_register(struct platform_profile_handler *pprof);
>>  int platform_profile_remove(void);
>>  void platform_profile_notify(void);
>> +int platform_profile_get(enum platform_profile_option *profile);
>>
>>  #endif  /*_PLATFORM_PROFILE_H_*/
>> --
>> 2.25.1
> 

