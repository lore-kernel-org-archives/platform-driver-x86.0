Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4238BC4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 14:01:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BEEB61051
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 14:01:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238011AbhHROCP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Aug 2021 10:02:15 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.3]:26483 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235675AbhHROCP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Aug 2021 10:02:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1629295300; i=@lenovo.com;
        bh=GOTyKw8GihAdFMkzWu+GqwgjjoKuMk2P0q94YCF7uRA=;
        h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=gXqGI7BaCiLwykLVp9naKCllKtwWYPdGnAz0R++14U0tk/45P7y8lwu+gYTY6gmka
         fByvDOvAtCiVaL2yltLDjCLmodT7kbmeeoL8yvC0rMcTM/2EWXMzWvvg5TRBCscqQI
         6/lBfgnh1J3Ut5YGN9pn4iWiSh2hsFtIU/FwlkQz0ILLJuIsX4WNRLTPgo9O4CFN5b
         VGgqxPmZgRK2/5xZfz22C4uQ3SgQZqFo+ZXqGjHUCegxI28hmQ3fT8RjTwZlM2qyCm
         QLzYu1ydTGTXXotDHIQK/GBuVMNgw59RGDdG6N6ijN6vPgX8JGHF/f2SKETqFFikO2
         zGK4I7yXPlrPQ==
Received: from [100.112.131.176] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-a.us-west-2.aws.symcld.net id 4D/81-13933-4C21D116; Wed, 18 Aug 2021 14:01:40 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAIsWRWlGSWpSXmKPExsWSLveKXfewkGy
  iQd9JC4s3x6czWXzumMxisXrPC2YHZo95JwM93u+7yubxeZNcAHMUa2ZeUn5FAmvG5aVLWQpe
  CVV8XPaWvYHxHn8XIxeHkMB/Ron3m6+zdDFyAjmvGCWOPYsHsYUFfCQ2HJ3DCmKLCKhLTO3oY
  QOxmQWcJSa1TGCDqO9klJjxwRvEZhPQltiy5RdYnFfAVqKz9T3YTBYBVYlZ6z6C2aICERIPd2
  5hhKgRlDg58wlYnFPATqJ/2k0WiPkWEjPnn2eEsMUlbj2ZzwRhy0tsfzuHGcSWEFCUOLxuGTu
  EnSDR8+8R2wRGwVlIxs5CMmoWklGzkIxawMiyitE8qSgzPaMkNzEzR9fQwEDX0NBI19DIUtfY
  WC+xSjdRr7RYtzy1uETXSC+xvFivuDI3OSdFLy+1ZBMjMCJSChoVdzBeeP1B7xCjJAeTkijvo
  jcyiUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkePv4ZROFBItS01Mr0jJzgNEJk5bg4FES4a0DSf
  MWFyTmFmemQ6ROMSpKifPeFARKCIAkMkrz4NpgCeESo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5
  GJWHeXwJAU3gy80rgpgMjG+hmEV4fA0mQxSWJCCmpBqZuQ/E/G6bkP0yKd3+yJ9T0jHR8oeTJ
  G29lwrzPvJIT4d6qf8Ly9dHG3Q/WTa26cjM44PGLIzP2tzBZRJowa89fezlxXtmyLYcvfrBc9
  PrQ2+SdUzqm6ed0KS+O2zxBLH6F/5+NKkrfGjZIlPWXL+vSe7vV/dmJX4bFzl+vHcyyuBj62E
  c08vTOrmubbNT/mHw52KPA5MQ955jdDKXCOe6evi7MumEe0a0PLm7aPf+b+O6Aa2/E1y36zpv
  9V/5QvvPJVS8Zs+vs3CvqtLZoC9R/+bW6e4ZqgSv3hUSO+VMvFqXvMNGdLLzMPkXFU9swS+XV
  n/OVofu3+SyXij204fssN6blbzNcY5gXln9Wu6KhxFKckWioxVxUnAgAPf4pqYMDAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-17.tower-336.messagelabs.com!1629295298!8077!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23571 invoked from network); 18 Aug 2021 14:01:39 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-17.tower-336.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Aug 2021 14:01:39 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 2AD26C702657AD0F4A2F;
        Wed, 18 Aug 2021 22:01:36 +0800 (CST)
Received: from localhost.localdomain (10.38.107.141) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2242.12; Wed, 18 Aug
 2021 10:01:34 -0400
Subject: Re: [External]Re: [PATCH v2] platform/x86: think-lmi: add debug_cmd
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <mgross@linux.intel.com>, <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20210817001501.293501-1-markpearson@lenovo.com>
 <07f7c7d6-176a-9328-ffd2-2ca5cb8040c8@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <735e8e9a-426b-6004-af43-69ff4fcab00c@lenovo.com>
Date:   Wed, 18 Aug 2021 10:01:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <07f7c7d6-176a-9328-ffd2-2ca5cb8040c8@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.107.141]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans

On 2021-08-18 3:44 a.m., Hans de Goede wrote:
> Hi,
> 
> On 8/17/21 2:15 AM, Mark Pearson wrote:
>> Many Lenovo BIOS's support the ability to send a debug command which
>> is useful for debugging and testing unreleased or early features.
>>
>> Adding support for this feature as a module parameter.
>>
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>> ---
>> Changes in v2:
>>   - Updated to use debug_support parameter to enable feature
>>   - remove changes to pending_reboot as that was integrated separately
>>
>>   .../testing/sysfs-class-firmware-attributes   | 11 +++
>>   drivers/platform/x86/think-lmi.c              | 80 +++++++++++++++++++
>>   drivers/platform/x86/think-lmi.h              |  1 +
>>   3 files changed, 92 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
>> index 0b43997b76e3..90fdf935aa5e 100644
>> --- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
>> +++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
>> @@ -272,3 +272,14 @@ Description:
>>   
>>   		Note that any changes to this attribute requires a reboot
>>   		for changes to take effect.
>> +
>> +What:		/sys/class/firmware-attributes/*/attributes/debug_cmd
>> +Date:		July 2021
>> +KernelVersion:	5.14
>> +Contact:	Mark Pearson <markpearson@lenovo.com>
>> +Description:
>> +		This write only attribute can be used to send debug commands to the BIOS.
>> +		This should only be used when recommended by the BIOS vendor. Vendors may
>> +		use it to enable extra debug attributes or BIOS features for testing purposes.
>> +
>> +		Note that any changes to this attribute requires a reboot for changes to take effect.
>> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
>> index 6cfed4427fb0..4d246bfe4907 100644
>> --- a/drivers/platform/x86/think-lmi.c
>> +++ b/drivers/platform/x86/think-lmi.c
>> @@ -20,6 +20,10 @@
>>   #include "firmware_attributes_class.h"
>>   #include "think-lmi.h"
>>   
>> +static bool debug_support;
>> +module_param(debug_support, bool, 0644);
> 
> 0644 implies the setting can be changed at runtime, but it is checked
> only at driver bind + unbind time, so this should be 0444.
Good catch - thanks!
> 
> Since the rest of the patch looks good, I've fixed this up while merging
> the patch.
Awesome - thank you!

Mark
