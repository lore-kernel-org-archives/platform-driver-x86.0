Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968C5C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 14:01:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EBF361BF4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 14:01:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236986AbhKPOEE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 Nov 2021 09:04:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26638 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236984AbhKPOED (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 Nov 2021 09:04:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637071266;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NJg/Cc8L0n0ks1BVrTHZDjQ1/WJk7glQHmAxHcRcoEk=;
        b=FeWjcTc2IX0HU/Dz8I3uh5ZVPR4mk4M+4V6NwAK1RzrjWWvRtwU2pyoWfzCSqwfpaEQ5cA
        GQwuwFAtSgy6pOdQBK1Sq3p4sY3db+bGKHkmXoFMcbYbqNJbNHrwIJfGslsJ8dqJSNiR6E
        K8S9vcGJ08Fs6qanWfURxAkOImDxF/o=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-YM50IrnTOSiB5k6zxROVmw-1; Tue, 16 Nov 2021 09:01:04 -0500
X-MC-Unique: YM50IrnTOSiB5k6zxROVmw-1
Received: by mail-ed1-f69.google.com with SMTP id m17-20020aa7d351000000b003e7c0bc8523so5551901edr.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Nov 2021 06:01:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NJg/Cc8L0n0ks1BVrTHZDjQ1/WJk7glQHmAxHcRcoEk=;
        b=difYM9+OBxFWMhVWtnXtf4rw5H/fW0+uDFDbSsKO4nzSYLglfKMJLBfaCutqhtRBXL
         bBtd/S1UsnxpvcWihdC/JvS5IX5fepmlJN2RP8n1lmJa0YCA6h1+2U6faPWpD5IrwCcR
         EkqSY/mDrH08y8gACfeDFbc/p5N5jsa9gBG3HK8DfDHjoMB7pFxIHT58XANLMBvn0RXa
         ui2b/vTVzxTVuZrr8Jj4/sDs1B9OOqR7csmgtqGdyy74ry7MlVEI0k1kkBWov/b7mFb9
         alz78Cn0xp7oN9pR7aLDcQ1bV6P+mxCkjUVs+XtjveTftBgk7nhm7YRx5OEyfeU8vDvq
         cxww==
X-Gm-Message-State: AOAM532CTOwyzhGIAu15DWKq25rePIUVfEqec4TEl+0Q3SJkqfjn+V9r
        jld6WwSO2sBqu0p/t27N4NrAyLnCVETtEdAi5KRfeuP0D7ZkCn68Ri/jKDgEini+qSK70mTMWWK
        f8Kjbbl7r5+4Yw75wbv6jVVAXZLmGjyeDeg==
X-Received: by 2002:a50:9d48:: with SMTP id j8mr10524655edk.192.1637071262772;
        Tue, 16 Nov 2021 06:01:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/BoFpAQ4EehS1coAp64JEh+/w4NdcYscj5Kmwwlih8M3Z/GBLw3hCA21u/JxbgdPrW4k2BQ==
X-Received: by 2002:a50:9d48:: with SMTP id j8mr10524628edk.192.1637071262532;
        Tue, 16 Nov 2021 06:01:02 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id hb36sm8277301ejc.73.2021.11.16.06.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Nov 2021 06:01:00 -0800 (PST)
Message-ID: <11f38268-098a-c674-c3cd-d020a1719fae@redhat.com>
Date:   Tue, 16 Nov 2021 15:00:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/2] Documentation: syfs-class-firmware-attributes: Lenovo
 Opcode support
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20211108232533.211693-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211108232533.211693-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/9/21 00:25, Mark Pearson wrote:
> Newer Lenovo BIOS's have an opcode GUID support interface which provides
>  - improved password setting control
>  - ability to set System, hard drive and NVMe passwords
> 
> Add the support for these new passwords, and the ability to select
> user/master mode and the drive index.
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> ---
>  .../ABI/testing/sysfs-class-firmware-attributes | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> index 3348bf80a37c..6af4c5cf3d47 100644
> --- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
> +++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> @@ -161,6 +161,12 @@ Description:
>  						power-on:
>  							Representing a password required to use
>  							the system
> +						system-mgmt:
> +							Representing System Management password

What is the difference between the system-mgmt password and the bios-admin one ?

> +						HDD:
> +							Representing HDD password
> +						NVMe:
> +							Representing NVMe password
>  
>  		mechanism:
>  					The means of authentication.  This attribute is mandatory.
> @@ -185,6 +191,17 @@ Description:
>  					A write only value that when used in tandem with
>  					current_password will reset a system or admin password.
>  
> +		level:
> +					Used with HDD and NVMe authentication to set 'user' or 'master'
> +					privilege level
> +					This attribute defaults to 'user' level

What is the difference between user and master levels ?

> +
> +		index:
> +					Used with HDD and NVME authentication to set the drive index
> +					that is being referenced (e.g hdd0, hdd1 etc)
> +					This attribute defaults to device 0.
> +
> +
>  		Note, password management is session specific. If Admin password is set,
>  		same password must be written into current_password file (required for
>  		password-validation) and must be cleared once the session is over.
> 


Also maybe all of this needs to be moved to the Lenovo specific section for now ?

If we then get other firmware APIs to set HDD / NVMe passwords we can try to re-use this
and move it to the generic section (assuming we can make things fit ...) 

Regards,

Hans

