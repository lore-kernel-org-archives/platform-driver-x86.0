Return-Path: <SRS0=isCl=DO=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F87FC4363C
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 20:38:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A87E920760
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 20:38:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IGzwFmkC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727863AbgJGUii (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Oct 2020 16:38:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22610 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727776AbgJGUii (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Oct 2020 16:38:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602103116;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0CiKUSaBgLb07UDWXdJHwKjpTwOO11WaFHYUd6OqTl8=;
        b=IGzwFmkC/QXuP2zQO3a3RIDgwk5RknhoJT1fwQaHTARH39h+TEiTZ2iqYwr1DRQcQivtzK
        U9PxyWbttrZ8NTUlHzesN5cm6Cx0tf+W46xzXWqI00fL2sL4dxtWA3qCARIeE8xOhTadUB
        RyQxBjE7YChSRU0oa3bBhjbddwqZank=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-STU5WP1-NTGunVzsfDjQXw-1; Wed, 07 Oct 2020 16:38:34 -0400
X-MC-Unique: STU5WP1-NTGunVzsfDjQXw-1
Received: by mail-ej1-f72.google.com with SMTP id z25so1278123ejd.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2020 13:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0CiKUSaBgLb07UDWXdJHwKjpTwOO11WaFHYUd6OqTl8=;
        b=nErs7ybv4Cc3S43FCRWnACyWfAd26Ec3GeCO1MVH+6L/cExGOY7VXYGvjVF2gWg4sV
         qzJwoZBnU4qyhJgSqsHVpHs4ymgMLiLckaiooJS3UesvHAOvdBJF9k7sMj/DsAD4fXsJ
         U8L2LEq8/gx1+8jLF2Zl/un9GohGvShjZWMdvcuNgoD80uh1aD7r+L4LDUf+6nHH8WG2
         TolTjVb1kxVLxhn9jzTjpBhOrQdntf7SngEbg9fE7jYEf3hh2hqju7XgnuCiDHDLtDZZ
         bcGEGgnXiEJKISNXXAwt37dC0VdjZjUGac0lsQ8LNV4mRZiy7p9vbSdBcqiiCTjYHJfe
         SGjQ==
X-Gm-Message-State: AOAM533s8Zv0pubqPjW4xQOh6VpZsYh9QwWnnpbB1rnNZofc9qHTwmC8
        Jxqg7wPxNLzJY0zp1vi8fjSm42lOW3rx+W923YkniSNOluH2M2fYq+EOcVaL4udCqa5iKeSpHhI
        8ufSrXRTIW/3oezV5zUvTnjFzbUaD/y4HLg==
X-Received: by 2002:a17:906:f205:: with SMTP id gt5mr5121264ejb.48.1602103112754;
        Wed, 07 Oct 2020 13:38:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXF/ih992BtwTMuO2WTti4mlLIdBxquRVmKbC9dbE2qYpvOZgNdOqEmVykLe1BdNaeTHSMww==
X-Received: by 2002:a17:906:f205:: with SMTP id gt5mr5121251ejb.48.1602103112495;
        Wed, 07 Oct 2020 13:38:32 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id k26sm1479796eji.22.2020.10.07.13.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 13:38:31 -0700 (PDT)
Subject: Re: [ PATCH v2 1/1] dell smbios driver : Consider Alienware a valid
 OEM String
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        Gerardo Esteban Malazdrewicz <gerardo@malazdrewicz.com.ar>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
References: <d17b7266b3bcc433477cf4f3b89e0b5cbf0126cb.camel@malazdrewicz.com.ar>
 <de108a8c-672f-4136-dc80-9ad7f14cea32@redhat.com>
 <DM6PR19MB26362F0581FA78C7E777BF56FA0C0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <b415a7bf2e98e734cc78579159e5c88fd5cd30df.camel@malazdrewicz.com.ar>
 <768985a8-7e6e-c91a-705b-2537047d0bdf@redhat.com>
 <20201007143317.bp5lsaa75ls5lhm3@pali>
 <DM6PR19MB2636BAADCEAD0840771BF424FA0A0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <45e82b6dabb591de630ac0e91a3ebb7937245fb1.camel@malazdrewicz.com.ar>
 <DM6PR19MB26363563F46E95E50AD28854FA0A0@DM6PR19MB2636.namprd19.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Message-ID: <db8e8945-065c-ee3b-fd45-1f500982a9f3@redhat.com>
Date:   Wed, 7 Oct 2020 22:38:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB26363563F46E95E50AD28854FA0A0@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/7/20 9:58 PM, Limonciello, Mario wrote:
>> -----Original Message-----
>> From: Gerardo Esteban Malazdrewicz <gerardo@malazdrewicz.com.ar>
>> Sent: Wednesday, October 7, 2020 14:55
>> To: Limonciello, Mario; Pali Rohár; Hans de Goede
>> Subject: Re: [ PATCH v2 1/1] dell smbios driver : Consider Alienware a valid
>> OEM String
>>
>>
>> [EXTERNAL EMAIL]
>>
>> El mié, 07-10-2020 a las 15:53 +0000, Limonciello, Mario escribió:
>>>> Hans, there are more drivers which checks for Dell DMI strings.
>>>> Probably
>>>> it would be needed to update Alienware on more places, not only in
>>>> dell-smbios-base.c driver.
>>>
>>> I would prefer that each of those be checked on a case by case basis
>>> and only
>>> added if actually necessary.  Gerardo if you can please check any
>>> other drivers
>>> that should need this string added to their allow list.
>>
>> I didn't find other instances of that string in this subsystem, but see
>> below.
>>
>> There is one in pci, another in hotplug.
>>
>> However, this is an extract from kernel logs:
>>
>> [  138.093686] dell-smbios A80593CE-A997-11DA-B012-B622A1EF5492: WMI
>> SMBIOS userspace interface not supported(0), try upgrading to a newer
>> BIOS
> 
> Considering that messaging - does the non-WMI interface actually work?
> dell-smbios has two backends available.

Yes that is a very good question.

Gerardo, I guess you started looking into this because of the:

	pr_err("Unable to run on non-Dell system\n");

In dell-smbios-base.c triggering on your system?

As Pali mentioned in another mail, you probably should
be looking at the dell-laptop code, which also has a
has a DMI string check and which uses the dell-smbios code,
another consumer of the dell-smbios code is the dell-wmi
driver.

If neither of those drivers add additional functionality
(e.g. extra hotkey events, being able the control the kbd
backlight), then the right fix might be to silence the
error you see being thrown by dell-smbios-base.c, rather
then allowing it to load.

For now I'll drop your patch from my review-hans branch,
as we first need to clear this up.

> The SMI based backend you can check by using dcdbas.
> 
> I had presumed from your patch that it actually worked.
> 
>> [ 1275.987716] dell_smm_hwmon: not running on a supported Dell system.
>> [ 1275.987734] dell_smm_hwmon: vendor=Alienware, model=Alienware Area-
>> 51m R2, version=1.3.0
>>
>>
>> dell_smm_hwmon ignore_dmi=1
>>
>> /sys/class/hwmon/hwmonX/pwm{1,3} access correctly the left and right
>> fan, respectively

Ok, so that looks good and fixing the DMI check there probably
makes sense. Note that this code is independent from the
dell-smbios code from drivers/platform/x86 so you can
do another patch to fix the DMI check there independent of the
dell-smbios discussion.

Regards,

Hans

