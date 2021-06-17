Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42290C2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Jun 2021 14:36:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 252E161406
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Jun 2021 14:36:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232816AbhFQOib (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Jun 2021 10:38:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38324 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230028AbhFQOia (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Jun 2021 10:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623940582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D/YudL2gSKuzCFd6USsftSWmakJCAD/q+Yp1igOqUis=;
        b=I3yKwzuYY04V2ZQ02BDIANrOcdXvCUDRpbzY1sMT8IFO+/z3j6zxlk5lvHLkTiTwdr6aJA
        VotOGZCz3SODx4Ht92JC0FPUNuEIDBJYen+PVc49DdJRdkWXVWRbWvzsGlrR3EoxjBnI3r
        XH+2R/16DanV+bKF8VKvBnNtzhrhlIw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-ESq6Aa_ZN1yHKlfzLcLadQ-1; Thu, 17 Jun 2021 10:36:21 -0400
X-MC-Unique: ESq6Aa_ZN1yHKlfzLcLadQ-1
Received: by mail-ej1-f72.google.com with SMTP id k1-20020a17090666c1b029041c273a883dso2341245ejp.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Jun 2021 07:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D/YudL2gSKuzCFd6USsftSWmakJCAD/q+Yp1igOqUis=;
        b=rI6pzHnlNOZ4lryl2M28bHQJQDGnX9Me6TK0kUVifDAjHvqlGS8H+uGzXafR8ZKdBW
         mrz6TW5aR+fBHJfv3Npku4lqJ4nmyU1MhdPBWNOhO7YncSI/avpKgYEJnNh2EQ2mYpi3
         d88sUIoC1jbboULccJN3xiBy4OeNke0BTGgCssp5wFbuQsHTYu6MGjLSymLRkTlvRzHY
         kv24Nsyjmjkzjr8G+HJ/1rNvoGynyBvjAiIDfRMYaRleoC0qw7QuKrOymHUryhIlkYuA
         QG9uu2n8H3v9JCd6gTFA9Z1tfZFgBIksSyyA4EwE1u4NFOieQB18TxRT24ZJ05/q6D9+
         d4sw==
X-Gm-Message-State: AOAM532kJpPzGKabKVWP9BwV6DQ6FduAEB2h7c8l38q7ZvHP3xd+CZ2Z
        gmqTyfpK39ZgjT+o69dgRs56KurDrd2Ya+PQxPhm8qx/UnMWo4c3NAwDRDzSRDXE+Rh4kdEbtB7
        Z+gC4XD/OjFUrmtHeKDWTKFKmm5mGyj2zcQ==
X-Received: by 2002:a05:6402:1e8b:: with SMTP id f11mr7064899edf.86.1623940579920;
        Thu, 17 Jun 2021 07:36:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIPs/LP612+GOiKMVk/H/XmZwlFQulJpgWKcc6KNRdfd2wW7ZnOc0spcFDJ8sNY8XxBhKovA==
X-Received: by 2002:a05:6402:1e8b:: with SMTP id f11mr7064874edf.86.1623940579749;
        Thu, 17 Jun 2021 07:36:19 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id kf3sm4126882ejc.8.2021.06.17.07.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jun 2021 07:36:19 -0700 (PDT)
Subject: Re: [PATCH 0/1] [x86] BIOS SAR Driver for M.2 Intel Modems
From:   Hans de Goede <hdegoede@redhat.com>
To:     Shravan S <s.shravan@intel.com>, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org
Cc:     sudhakar.an@intel.com
References: <20210428032224.8299-1-s.shravan@intel.com>
 <ab991a6d-e973-9e16-8e8c-382c27f41368@redhat.com>
Message-ID: <375f3643-de21-3c71-3041-86d9b54f5d3c@redhat.com>
Date:   Thu, 17 Jun 2021 16:36:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ab991a6d-e973-9e16-8e8c-382c27f41368@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/17/21 4:28 PM, Hans de Goede wrote:
> Hi Shravan,
> 
> On 4/28/21 5:22 AM, Shravan S wrote:
>> SAR (Specific Absorption Rate) driver is a host driver implemented for Linux
>> or chrome platform to limit the exposure of human body to RF frequency by informing
>> the Intel M.2 modem to regulate the RF power based on SAR data obtained from the sensors
>> captured in the BIOS. ACPI interface exposes this data from the BIOS to SAR driver. The
>> front end application in userspace ( eg: Modem Manager) will interact with SAR driver 
>> to obtain information like the device mode (Example: tablets, laptops, etx), Antenna index,
>> baseband index, SAR table index and use available communication like MBIM interface to enable
>> data communication to modem for RF power regulation.
>>
>> The BIOS gets notified about device mode changes through Sensor Driver. This information is 
>> given to a (newly created) WWAN ACPI function driver when there is a device mode change. 
>> The driver then uses a _DSM method to retrieve the required information from BIOS. 
>> This information is then forwarded/multicast to the User-space using the NETLINK interface.
>> A lookup table is maintained inside the BIOS which suggests the SAR Table index and Antenna 
>> Tuner Table Index values for individual device modes.
>>
>> The SAR parameters to be used on the Modem differs for each Regulatory Mode like FCC, CE and ISED.
>> Hence, the SAR parameters are stored separately in the SMBIOS table in the OEM BIOS, 
>> for each of the Regulatory mode. Regulatory modes will be different based on the region and network
>> available in that region.
> 
> If I'm reading the above correct then this code is really doing 2
> things in 1 driver:
> 
> 1. Listening to some sensors, which readings may impact the maximum amount
> of tx power which the modem may use. What kind of sensors are these ?
> Currently chrome-os based devices are using iio for proximity sensors,
> with specific labels added to each sensor to tell userspace that they
> indicate a human is close to one of the antennas:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/Documentation/ABI/testing/sysfs-bus-iio?id=6505dfab33c519368e54ae7f3ea1bf4d9916fdc5
> 
> Would it be possible to use this standardized userspace interface for
> your use case ?
> 
> 2. Exporting a table with various information from the BIOS tables
> to userspace. We do probably need a new userspace API for this,
> but I'm not sure netlink is the right answer here.
> 
> Maybe just use a binary sysfs attribute under
> /sys/bus/platform/devices/INTC1092:00 ?
> That will make the interface non-generic, but I assume that the
> table contents are going to be Intel specific anyways so that
> should be fine. This will also allow simply exporting the table
> without the kernel needing to parse it.
> 
> Using netlink is highly unusual for a driver living under
> platform/drivers/x86; and if you really want to use netlink for
> this then you should first define a generic protocol which is
> also going to work for other vendors' modems, which is
> impossible ATM because we don't know yet what other vendor's
> modems will need...

Some more remarks from a quick look at the code, I see that
besides a netlink interface you are also creating a chardev
and doing ioctls on that.

That is really not good, it seems that the userspace API for
this needs to be completely redesigned. Using both netlink
and ioctls at the same time not acceptable.

Also you seem to create the chardev and netlink and
module-load time, rather then from the sar_add() probe
function. Which means that they will also be created on
laptops which don't have an INTC1092 ACPI device at all,
again not good.

Please drop the sar_init() and sar_exit() functions and
use module_platform_driver to have module_init / exit
register / unregister the driver and have them only do that,
everything else should be done from the platform_driver
probe function.

Also you use "sar" for a lot of identifiers in the driver,
but that is very generic where as this is a highly Intel
specific driver; and likely in the future even newer Intel
modems may use a different driver, so please replace the
sar prefix with something more specific, e.g. "intc1092"

Regards,

Hans


