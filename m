Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFFEC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Nov 2021 12:09:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6B1861545
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Nov 2021 12:09:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235835AbhKQMMl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 17 Nov 2021 07:12:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24705 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234767AbhKQMMj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 17 Nov 2021 07:12:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637150980;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dxTQv4dgg3XVXnke/9tai2kvQs+MdCAGRU2TaOjQhMY=;
        b=WC1cPeWQ6vQhHMNzV/21JjaH/uexn46XAvFHiXE3zBYEel5GZH682MnFK6bb2cjKREckuu
        +baWAAKD39ADOZnqyUZanlv/3Pp0jB3H8p2/2/DERRhYy4FknGtHe79H2ImHLC0yQ9LcWK
        nAoyQBU8U1Zb8rWN3rDPV4I8P5LwE6A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-N0zU9wy_NkyIXFGzfN0AgQ-1; Wed, 17 Nov 2021 07:09:39 -0500
X-MC-Unique: N0zU9wy_NkyIXFGzfN0AgQ-1
Received: by mail-ed1-f69.google.com with SMTP id i19-20020a05640242d300b003e7d13ebeedso1950825edc.7
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Nov 2021 04:09:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dxTQv4dgg3XVXnke/9tai2kvQs+MdCAGRU2TaOjQhMY=;
        b=M0068J61SklLfuwuJOsOFbv+EHKDAQc+J9HD4QGmHkfhlqftSqovXgUH9HWsqMWDV6
         0ezCkVosV405HBpCeRxxbqbIWHFQt9nuVpEDtnZE1NlvwCNLTeqoqJE+GH7XBiZjhtH6
         YA8OOUpkgN/30l49g0tDWKAscNa3Ol/V+rzZgRhToId/kHEIEkeFKzZcMpPuzdbjp2Ub
         wcz+qvtXyzXQXGEIKVd3MZIM7sOVPI/KofZPOB5r8QFGbC26iXBKqjAycR1jBP5j26Fz
         kipI/idlPx+UwXG32IERN2YbjB+lonlDsqlj9zQF1EjhyvY7hKe6EKA8oZN4rxCQJNic
         1ETg==
X-Gm-Message-State: AOAM533Qrnbbe6Po9YlmFjgzJ5jE50dQ3DFDUFfAAx06R8d/TK54GiWx
        ZzgahF/JxhhkvjG6jEk5jtBfVxzRnwZqji6MWo9uhyKOsG1b576kyztisBZcIgpTOOnj6zDDsQE
        BoLP/QCyzYbaiC8RBANWM1wIK/k8/G0aR/g==
X-Received: by 2002:a17:907:c15:: with SMTP id ga21mr20536085ejc.349.1637150977643;
        Wed, 17 Nov 2021 04:09:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1y69wx9vAvEfMMSwCwD4qyqnKacdP9SgwO85FMzqK+5PE1bgzJJkXtniq/7LxGtR9O3wbMg==
X-Received: by 2002:a17:907:c15:: with SMTP id ga21mr20536052ejc.349.1637150977452;
        Wed, 17 Nov 2021 04:09:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id s16sm10639168edt.30.2021.11.17.04.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 04:09:37 -0800 (PST)
Message-ID: <86e64a29-bb42-c75d-168d-df207adf785e@redhat.com>
Date:   Wed, 17 Nov 2021 13:09:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [External] Re: [PATCH 1/2] Documentation:
 syfs-class-firmware-attributes: Lenovo Opcode support
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20211108232533.211693-1-markpearson@lenovo.com>
 <11f38268-098a-c674-c3cd-d020a1719fae@redhat.com>
 <d995857d-bdfe-2c35-f03b-1cee27139b7e@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <d995857d-bdfe-2c35-f03b-1cee27139b7e@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/16/21 22:05, Mark Pearson wrote:
> 
> Hi Hans,
> 
> Thank you for the review.
> 
> On 2021-11-16 09:00, Hans de Goede wrote:
>> Hi,
>>
>> On 11/9/21 00:25, Mark Pearson wrote:
>>> Newer Lenovo BIOS's have an opcode GUID support interface which provides
>>>  - improved password setting control
>>>  - ability to set System, hard drive and NVMe passwords
>>>
>>> Add the support for these new passwords, and the ability to select
>>> user/master mode and the drive index.
>>>
>>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>>> ---
>>>  .../ABI/testing/sysfs-class-firmware-attributes | 17 +++++++++++++++++
>>>  1 file changed, 17 insertions(+)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
>>> index 3348bf80a37c..6af4c5cf3d47 100644
>>> --- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
>>> +++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
>>> @@ -161,6 +161,12 @@ Description:
>>>  						power-on:
>>>  							Representing a password required to use
>>>  							the system
>>> +						system-mgmt:
>>> +							Representing System Management password
>>
>> What is the difference between the system-mgmt password and the bios-admin one ?
> 
> Taken from the documentation but somewhat reformatted/edited for clarity
> 
> bios-admin - You are prompted to enter a valid password each time you
> try to enter the BIOS menu
> 
> system-mgmt - You can enable the system management password to have the
> same authority as the bios-admin password to control security related
> features. You can customize the authority of the system management
> password through the UEFI BIOS menu (SMP Access Control Policy)

Ok, so if I understand this correctly, then if both a bios-admin and
a system-mgmt password are set then with the bios-admin option
all options accept those on the "security settings" BIOS screen
can be changed, and with the system-mgmt password everything can
be changed, is that correct?

Also can you update the new text here to try and explain this
somewhat ?


>>> +						HDD:
>>> +							Representing HDD password
>>> +						NVMe:
>>> +							Representing NVMe password
>>>  
>>>  		mechanism:
>>>  					The means of authentication.  This attribute is mandatory.
>>> @@ -185,6 +191,17 @@ Description:
>>>  					A write only value that when used in tandem with
>>>  					current_password will reset a system or admin password.
>>>  
>>> +		level:
>>> +					Used with HDD and NVMe authentication to set 'user' or 'master'
>>> +					privilege level
>>> +					This attribute defaults to 'user' level
>>
>> What is the difference between user and master levels ?
> 
> User: If a user hard disk password has been set, but no master hard disk
> password has been, the user must enter the user hard disk password to
> access files and applications on the hard disk drive.
> 
> Master: The master hard disk password also requires a user hard disk
> password. The master hard disk password is usually set and used by a
> system administrator. It enables the administrator to access any hard
> disk drive in a system like a master key. The administrator sets the
> master password; then assigns a user password for each computer in the
> network. The user can then change the user password as desired, but the
> administrator still can get access by using the master password When a
> master hard disk password is set, only the administrator can remove the
> user hard disk password.

I understand, so like a master-key vs a normal key in a big office building.

Can you update the new text here to try and explain this somewhat ?

>>
>>> +
>>> +		index:
>>> +					Used with HDD and NVME authentication to set the drive index
>>> +					that is being referenced (e.g hdd0, hdd1 etc)
>>> +					This attribute defaults to device 0.
>>> +
>>> +
>>>  		Note, password management is session specific. If Admin password is set,
>>>  		same password must be written into current_password file (required for
>>>  		password-validation) and must be cleared once the session is over.
>>>
>>
>>
>> Also maybe all of this needs to be moved to the Lenovo specific section for now ?
>>
>> If we then get other firmware APIs to set HDD / NVMe passwords we can try to re-use this
>> and move it to the generic section (assuming we can make things fit ...) 
>>
> Ah - good point. I will do that

Great.

Regards,

Hans


