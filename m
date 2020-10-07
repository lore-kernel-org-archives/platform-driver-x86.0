Return-Path: <SRS0=isCl=DO=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DADC4363D
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 21:31:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 807B82087D
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 21:31:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JOj2jSUz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbgJGVbB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Oct 2020 17:31:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55568 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726013AbgJGVbB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Oct 2020 17:31:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602106259;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qpQ8V4ta0jNBm50AozLrGCGF/XWbDibGcG/zba5llpo=;
        b=JOj2jSUzBDZStYYRMz4zlUa0BlrvqDkeVUf4QTMNZxLgT07EVbTYrqHphAegjCFGlMk5vz
        7obk/PLToJ0yDKx0BpEyfjp46lu1ZDrcRNPqNLx9yeX3O5cyazhhCNn+fJI3OhJgXtAQRC
        6MId4MxAcz2yeAkxkQW6Yh1RjSQn1pk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-H1WZhCW5N0GBGWb5gkVUFw-1; Wed, 07 Oct 2020 17:30:56 -0400
X-MC-Unique: H1WZhCW5N0GBGWb5gkVUFw-1
Received: by mail-ej1-f70.google.com with SMTP id t1so1297525ejb.21
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2020 14:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qpQ8V4ta0jNBm50AozLrGCGF/XWbDibGcG/zba5llpo=;
        b=K3JwxpAFUzZZ+Pyn4AJ5emfs7Ks+pGNHQaran4WD524dzcf5M3sACrXZpc8GelYOi8
         +NZ10In/Pmwlgk2N5rnEIekIlBuUjdwISulbCAEBWROZguAAzPWlSu5Vfm263i8JZYh/
         MGusu5C80aCRP+Kbl1LjNHRsRxur8aYtQzS83ww89DFTeBy8NDQxo0Jz/OuBqJu+oz4N
         +gtSU1YnDJ3g1RMjuu5vHz4sMBSATOk6qAYaNaXpo0wYCMtJ6XRhVhPeIb3JLzTL7vCE
         uNIeN2HD2cVg3BDc0N2DJ0g2xNPyx3/S8Pb+yne+St/KKDlQDpo+UrVrFmaH+hXojA2P
         BiRw==
X-Gm-Message-State: AOAM532j3aIL2Rmewdn/2DpKS1MuoyYWwi2FklklgHK4x0P983d4Y22O
        fSUPRVliFF76uE7seEmXUNhQO/JfVf7hl2eE3+8F3quXEzWVL3nf38BFDhY27nxbYq6u/5OT6T6
        R/WwxBLPEXoM1O7UrKGzMAJQm6Xt89Vp7tw==
X-Received: by 2002:a17:907:9ef:: with SMTP id ce15mr5500958ejc.430.1602106255343;
        Wed, 07 Oct 2020 14:30:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIowhdA7mpWgtcb+CIhPbokYFpxb5C14Grh0DE6h6dV2vFYFxn/YSBs1Aftc9LYTNdHVODBQ==
X-Received: by 2002:a17:907:9ef:: with SMTP id ce15mr5500945ejc.430.1602106255108;
        Wed, 07 Oct 2020 14:30:55 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id q26sm2276985ejr.97.2020.10.07.14.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 14:30:54 -0700 (PDT)
Subject: Re: [ PATCH v2 1/1] dell smbios driver : Consider Alienware a valid
 OEM String
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        Gerardo Esteban Malazdrewicz <gerardo@malazdrewicz.com.ar>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <d17b7266b3bcc433477cf4f3b89e0b5cbf0126cb.camel@malazdrewicz.com.ar>
 <de108a8c-672f-4136-dc80-9ad7f14cea32@redhat.com>
 <DM6PR19MB26362F0581FA78C7E777BF56FA0C0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <b415a7bf2e98e734cc78579159e5c88fd5cd30df.camel@malazdrewicz.com.ar>
 <768985a8-7e6e-c91a-705b-2537047d0bdf@redhat.com>
 <20201007143317.bp5lsaa75ls5lhm3@pali>
 <DM6PR19MB2636BAADCEAD0840771BF424FA0A0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <45e82b6dabb591de630ac0e91a3ebb7937245fb1.camel@malazdrewicz.com.ar>
 <DM6PR19MB26363563F46E95E50AD28854FA0A0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <db8e8945-065c-ee3b-fd45-1f500982a9f3@redhat.com>
 <DM6PR19MB2636C37CC24CC23D31E36F01FA0A0@DM6PR19MB2636.namprd19.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a655cb84-97ec-5558-8576-452b6ff0e34a@redhat.com>
Date:   Wed, 7 Oct 2020 23:30:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB2636C37CC24CC23D31E36F01FA0A0@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/7/20 11:26 PM, Limonciello, Mario wrote:
>> On 10/7/20 9:58 PM, Limonciello, Mario wrote:
>>>> -----Original Message-----
>>>> From: Gerardo Esteban Malazdrewicz <gerardo@malazdrewicz.com.ar>
>>>> Sent: Wednesday, October 7, 2020 14:55
>>>> To: Limonciello, Mario; Pali Rohár; Hans de Goede
>>>> Subject: Re: [ PATCH v2 1/1] dell smbios driver : Consider Alienware a
>> valid
>>>> OEM String
>>>>
>>>>
>>>> [EXTERNAL EMAIL]
>>>>
>>>> El mié, 07-10-2020 a las 15:53 +0000, Limonciello, Mario escribió:
>>>>>> Hans, there are more drivers which checks for Dell DMI strings.
>>>>>> Probably
>>>>>> it would be needed to update Alienware on more places, not only in
>>>>>> dell-smbios-base.c driver.
>>>>>
>>>>> I would prefer that each of those be checked on a case by case basis
>>>>> and only
>>>>> added if actually necessary.  Gerardo if you can please check any
>>>>> other drivers
>>>>> that should need this string added to their allow list.
>>>>
>>>> I didn't find other instances of that string in this subsystem, but see
>>>> below.
>>>>
>>>> There is one in pci, another in hotplug.
>>>>
>>>> However, this is an extract from kernel logs:
>>>>
>>>> [  138.093686] dell-smbios A80593CE-A997-11DA-B012-B622A1EF5492: WMI
>>>> SMBIOS userspace interface not supported(0), try upgrading to a newer
>>>> BIOS
>>>
>>> Considering that messaging - does the non-WMI interface actually work?
>>> dell-smbios has two backends available.
>>
>> Yes that is a very good question.
>>
>> Gerardo, I guess you started looking into this because of the:
>>
>> 	pr_err("Unable to run on non-Dell system\n");
>>
>> In dell-smbios-base.c triggering on your system?
> 
> If that's the case, I would ask why this driver even auto-loaded?
> The module load table is very prescriptive.
> https://github.com/torvalds/linux/blob/master/drivers/platform/x86/dell-smbios-wmi.c#L277
> https://github.com/torvalds/linux/blob/master/drivers/platform/x86/dell-smbios-smm.c#L56
> Was it because it was compiled into the kernel?

I believe that the laptops ACPI tables do define the WMI GUID
that dell-smbios-wmi.c has in its module-id-table otherwise
the "WMI SMBIOS userspace interface not supported(0)" error
would not trigger.

Regards,

Hans

