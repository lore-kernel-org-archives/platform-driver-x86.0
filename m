Return-Path: <SRS0=isCl=DO=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA55BC41604
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 16:00:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C38821707
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 16:00:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P+B0A6Sa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728889AbgJGQAt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Oct 2020 12:00:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55150 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727927AbgJGQAt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Oct 2020 12:00:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602086447;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UD/4d7BZqoAeB+xhEcnvNd/rlvEuZxga7YzE6WqSuGs=;
        b=P+B0A6Sap9OqR56EzsOh2NOL3bso56OB/A3O8EcKpPvLDhNFlvXAbRAVg7cc/I4l7WVMBi
        bHBvV+3H6+flWpGuyiHBhBUQ1BCo4o3jp6PfgvMvjrqtVBQcrgKV4SixBFAF9laNiiaK8X
        PwuvV8h8IVcy5v2cQQxSTv4+IuhK17k=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-GyUHGT8INKWJ9h2gWrvIKg-1; Wed, 07 Oct 2020 12:00:44 -0400
X-MC-Unique: GyUHGT8INKWJ9h2gWrvIKg-1
Received: by mail-ed1-f70.google.com with SMTP id i22so1095866edu.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2020 09:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UD/4d7BZqoAeB+xhEcnvNd/rlvEuZxga7YzE6WqSuGs=;
        b=P0HsD/osRrl3/Ax81vhXJ8PeCVm9GoBot0aw5tPTrx9To4u6EQobjUzGlitkoA/zom
         dKJiZVc6tTJlEdqPscVHWYigljj3dAAKievZ/Why1tgOCAvH464s/9A7mmTObiuBQijd
         +gB1mBhNu3zlqfavrdZRiVCN7xRs+4m9kbyhFqa6AkSzbKMAAbxQFNgzZjWfaW1VCDzn
         vEy9n3W2OA3OrOI1SJUCPtdv8vsGYmjiHDtMI9+/ceGQKB0Q58gH3DZNqr21YHxsXNId
         xr1FhbAoKIZhODjNNn45HMF5Vzx/aGLgI3vujKrlHhsyuUNVpofgxSUrPlCa+LLDiz1+
         ckVw==
X-Gm-Message-State: AOAM531wT+E2iS1Yn40rGvdH+oWMN1x96+OvasgNnPlmr7mBPQ9DXAyx
        XhtKnEvyrPR39FNKTenUouKK9fA/QEmSyeloK8WasBS/aFs18zC8zN2DlMxOYoxj5KgQhWEjDLm
        +GRFlR8PD+lEnte2uIjLvxi+KXAMB9U+l1A==
X-Received: by 2002:a17:906:3e17:: with SMTP id k23mr4215098eji.414.1602086442252;
        Wed, 07 Oct 2020 09:00:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVNSmS3K5l59qte+pCiVdRX+18PDDpXOdjYiV1M0Vk0Egnx6fY0kb3UjCO8BrHq58Mw9tDjg==
X-Received: by 2002:a17:906:3e17:: with SMTP id k23mr4215066eji.414.1602086441899;
        Wed, 07 Oct 2020 09:00:41 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id i15sm1769211edf.82.2020.10.07.09.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 09:00:41 -0700 (PDT)
Subject: Re: [ PATCH v2 1/1] dell smbios driver : Consider Alienware a valid
 OEM String
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Gerardo Esteban Malazdrewicz <gerardo@malazdrewicz.com.ar>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <d17b7266b3bcc433477cf4f3b89e0b5cbf0126cb.camel@malazdrewicz.com.ar>
 <de108a8c-672f-4136-dc80-9ad7f14cea32@redhat.com>
 <DM6PR19MB26362F0581FA78C7E777BF56FA0C0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <b415a7bf2e98e734cc78579159e5c88fd5cd30df.camel@malazdrewicz.com.ar>
 <768985a8-7e6e-c91a-705b-2537047d0bdf@redhat.com>
 <20201007143317.bp5lsaa75ls5lhm3@pali>
 <DM6PR19MB2636BAADCEAD0840771BF424FA0A0@DM6PR19MB2636.namprd19.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5c60629a-c67b-e3dd-021b-0aa59f51b992@redhat.com>
Date:   Wed, 7 Oct 2020 18:00:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB2636BAADCEAD0840771BF424FA0A0@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/7/20 5:53 PM, Limonciello, Mario wrote:
>>
>> Hans, there are more drivers which checks for Dell DMI strings. Probably
>> it would be needed to update Alienware on more places, not only in
>> dell-smbios-base.c driver.
> 
> I would prefer that each of those be checked on a case by case basis and only
> added if actually necessary.  Gerardo if you can please check any other drivers
> that should need this string added to their allow list.

Ack, that is my take on this to (check on a case by case basis
if we need any of those other drivers on Alienware models too).

Regards,

Hans



>>>> Alienware has been a subsidiary of Dell since 2006.
>>>>
>>>> 2020 Alienware laptop:
>>>> $ sudo dmidecode | head -3
>>>> # dmidecode 3.2
>>>> Getting SMBIOS data from sysfs.
>>>> SMBIOS 3.2.0 present.
>>>> $ sudo dmidecode | grep -A 29 "OEM Strings"
>>>> OEM Strings
>>>> 	String 1: Alienware
>>>> 	String 2: 1[099B]
>>>> 	String 3: 3[1.0]
>>>> 	String 4: 4[0001]
>>>> 	String 5: 5[0000]
>>>> 	String 6: 6[D0, D4, D8, DA, DE]
>>>> 	String 7: 7[]
>>>> 	String 8: 8[]
>>>> 	String 9: 9[]
>>>> 	String 10: 10[1.3.0]
>>>> 	String 11: 11[]
>>>> 	String 12: 12[]
>>>> 	String 13: 13[P38E002]
>>>> 	String 14: 14[0]
>>>> 	String 15: 15[0]
>>>> 	String 16: 16[0]
>>>> 	String 17: 17[0000000000000000]
>>>> 	String 18: 18[0]
>>>> 	String 19: 19[1]
>>>> 	String 20: 20[]
>>>> 	String 21: 21[]
>>>> 	String 22: <BAD INDEX>
>>>> 	String 23: <BAD INDEX>
>>>> 	String 24: <BAD INDEX>
>>>> 	String 25: <BAD INDEX>
>>>> 	String 26: <BAD INDEX>
>>>> 	String 27: <BAD INDEX>
>>>> 	String 28: <BAD INDEX>
>>>>
>>>> 2013 Alienware laptop:
>>>> OEM Strings
>>>>           String 1: Dell System
>>>>           String 2: 1[05AA]
>>>>           String 3: 14[2]
>>>>           String 4: 15[0]
>>>>           String 5: String5 for Original Equipment Manufacturer
>>>>
>>>> Don't know when the OEM String changed.
>>>> Change tested in the 2020 laptop, loads dell_smbios without further
>>>> issues.
>>>>
>>>> Signed-off-by: Gerardo E. Malazdrewicz <gerardo@malazdrewicz.com.ar>
>>>> Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>
>>>> ---
>>>>    drivers/platform/x86/dell-smbios-base.c | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/platform/x86/dell-smbios-base.c
>>>> b/drivers/platform/x86/dell-smbios-base.c
>>>> index 2e2cd565926aa..5ad6f7c105cf3 100644
>>>> --- a/drivers/platform/x86/dell-smbios-base.c
>>>> +++ b/drivers/platform/x86/dell-smbios-base.c
>>>> @@ -564,7 +564,8 @@ static int __init dell_smbios_init(void)
>>>>    	int ret, wmi, smm;
>>>>    	if (!dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "Dell System",
>>>> NULL) &&
>>>> -	    !dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "www.dell.com",
>>>> NULL)) {
>>>> +	    !dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "www.dell.com",
>>>> NULL) &&
>>>> +	    !dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "Alienware",
>>>> NULL)) {
>>>>    		pr_err("Unable to run on non-Dell system\n");
>>>>    		return -ENODEV;
>>>>    	}
>>>>
>>>>
>>>>
>>>
> 

