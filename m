Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 806CCC4338F
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Aug 2021 13:35:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F8AD610FF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Aug 2021 13:35:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243747AbhHFNfv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 Aug 2021 09:35:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28861 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233838AbhHFNfv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Aug 2021 09:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628256935;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gxfQBOCh+zxKde14Vvce9WGw8+ONsW4RQwN9qCKj1As=;
        b=CAQRkxktWBiG7rBJFXFqVR4cOGZxRqYMEROZHCKv8HekpiF1b+Dl00hCmXc+p06onaHQcy
        e3HsB5UvuIUvjoQ7Q3gMHoeB0OHlE10NPTCvCRmnpOBH28pqOsxPw+asTbhZEecrjXNJ5m
        LLvNSYuZR86oJwlbUhi+TfTrDYTyuuY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-u5OMJh94MT-3s6cWsXp6eQ-1; Fri, 06 Aug 2021 09:35:31 -0400
X-MC-Unique: u5OMJh94MT-3s6cWsXp6eQ-1
Received: by mail-ed1-f71.google.com with SMTP id d12-20020a50fe8c0000b02903a4b519b413so4935747edt.9
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Aug 2021 06:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gxfQBOCh+zxKde14Vvce9WGw8+ONsW4RQwN9qCKj1As=;
        b=pw1VJj0mwoHMuNyryR3WrA6tvzxleu+1aD/6ergNy9mUuxyflomp2vyXZSY9ShjP0r
         u3v1mrVVWJy6tY2kyYyLFqT2X90JM62D5vVgXVVl4y5JbWtq5tRHvhSF+57tFxHs0eM4
         /Bh59fvYttV56KkFnHglcgdrW4e1ZV8IxxcDM172YEmNOP9Ez3Pi7ZGFyQ5rG9lnx77c
         waaSDww3kwuSsFvgxIKKogVDM1Vjb12tny6B8Z0hKvFpeLw9tb+UfP1mnTyLQUhHeXkn
         O0m7IKcqT/wONhdBmRa6dsMYJLdt3OulkkmQLfmnJqJbxNLcOViQj/yXWYgeLmt5m7Ko
         OI2w==
X-Gm-Message-State: AOAM531e2sp7PIwTMRL88XvGciRHnlfikIF5qZlQhHnsBjuzx2O2zksV
        YxadMQVmmDBJiWrP2zuYbzBGuHvS7QcM8IdzqxfxeqYXuyF1/+VRyKOXv+eYpSFMZNkoEAaVZvK
        CrvXcQethV22PV4evG7rW6O53eA6EezPOgg==
X-Received: by 2002:a05:6402:4412:: with SMTP id y18mr12916310eda.1.1628256930799;
        Fri, 06 Aug 2021 06:35:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOiq/klNDVOvOLLQVkEV3rWNS5gP7+6wtiekWBtYfP8l2PKVequ4Pe5Aw8thVuZtBdnBERqg==
X-Received: by 2002:a05:6402:4412:: with SMTP id y18mr12916292eda.1.1628256930683;
        Fri, 06 Aug 2021 06:35:30 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ch5sm2574768edb.61.2021.08.06.06.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 06:35:30 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: dell-smbios: Remove unused dmi_system_id
 table
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Dell.Client.Kernel@dell.com
Cc:     platform-driver-x86@vger.kernel.org,
        Mario Limonciello <mario.limonciello@outlook.com>
References: <20210802120734.36732-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5682af9a-0f44-802f-5d49-bad09127ad57@redhat.com>
Date:   Fri, 6 Aug 2021 15:35:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210802120734.36732-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

On 8/2/21 2:07 PM, Hans de Goede wrote:
> dell-smbios is depended on by dell-laptop and that has this same table +
> some extra entries for chassis-type 30, 31 and 32.
> 
> Since dell-laptop will already auto-load based on the DMI table in there
> (which also is more complete) and since dell-laptop will then bring in
> the dell-smbios module, the only scenario I can think of where this DMI
> table inside dell-smbios-smm.c is useful is if users have the dell-laptop
> module disabled and they want to use the sysfs interface offered by
> dell-smbios-smm.c. But that is such a corner case, even requiring a custom
> kernel build, that it does not weigh up against having this duplicate
> table, which as the current state already shows can only grow stale.
> 
> Users who do hit this corner-case can always explicitly modprobe /
> insmod the module.
> 
> Cc: Mario Limonciello <mario.limonciello@outlook.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've merged this into my review-hans (future pdx86/for-next) branch now.

Regards,

Hans


> ---
>  drivers/platform/x86/dell/dell-smbios-smm.c | 31 ---------------------
>  1 file changed, 31 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-smbios-smm.c b/drivers/platform/x86/dell/dell-smbios-smm.c
> index 97c52a839a3e..320c032418ac 100644
> --- a/drivers/platform/x86/dell/dell-smbios-smm.c
> +++ b/drivers/platform/x86/dell/dell-smbios-smm.c
> @@ -24,37 +24,6 @@ static struct calling_interface_buffer *buffer;
>  static struct platform_device *platform_device;
>  static DEFINE_MUTEX(smm_mutex);
>  
> -static const struct dmi_system_id dell_device_table[] __initconst = {
> -	{
> -		.ident = "Dell laptop",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_CHASSIS_TYPE, "8"),
> -		},
> -	},
> -	{
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_CHASSIS_TYPE, "9"), /*Laptop*/
> -		},
> -	},
> -	{
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_CHASSIS_TYPE, "10"), /*Notebook*/
> -		},
> -	},
> -	{
> -		.ident = "Dell Computer Corporation",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Computer Corporation"),
> -			DMI_MATCH(DMI_CHASSIS_TYPE, "8"),
> -		},
> -	},
> -	{ }
> -};
> -MODULE_DEVICE_TABLE(dmi, dell_device_table);
> -
>  static void parse_da_table(const struct dmi_header *dm)
>  {
>  	struct calling_interface_structure *table =
> 

