Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F34BC0015E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Aug 2023 08:17:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232742AbjHOIQo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Aug 2023 04:16:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235563AbjHOIQV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Aug 2023 04:16:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A87810C0
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Aug 2023 01:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692087334;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R+PBPOf4tqE68ba7HID7h6MpKmEPxK26mSQxYISYOG8=;
        b=BmST21sRpV8gOofNO/nwaRSrtq01qDuSLoWvAzK70K8fIpGf4KR45P9kcCHzFwNFq7WYfb
        fosWvvE1gzOX/0sLH5mSIbcCnu661q0c9XdqD6zO9jvtrKWRDF+6zjdq2QXOhNFkTJR0r1
        xdP/YkwEEHfolbuUrZyqQhEsq/XerGU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-FCrkGo_KPqewvdVTaWPAEg-1; Tue, 15 Aug 2023 04:15:33 -0400
X-MC-Unique: FCrkGo_KPqewvdVTaWPAEg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-99bca0b9234so305658566b.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Aug 2023 01:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692087332; x=1692692132;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R+PBPOf4tqE68ba7HID7h6MpKmEPxK26mSQxYISYOG8=;
        b=NTNNoT0ZAoqPzqpin7xfopVE03BR7OYJu113/YS/BqnZihkrJc7OgkmhYsvmCH2thh
         cHH+u7+VpU9lThRY75QlEpnKA9cZI889oMXwNM5rlU6jC6CFCjTax9cuTEEX9w3uSmrJ
         kQOFZNQB7/m1ArBq31N//VnDW3DYPXyeLeFQgzllmbad7fZynP6RXZ0XxOTJAslPtyPr
         sjXN5a+USd5BobUIzUaXfyBxuREI3HD7UKbOLYOpETQSkqMz7VDj2ZPc+ZMChn+dqbw8
         xBEvtngwQGZ/MRh5lkW96LfAKsa33Cp3ssX2SqsbGGLl1KNngq9a/35KbQdoM774+7Yl
         5urQ==
X-Gm-Message-State: AOJu0YxSoinnjpZsOVl4W0n5Qz/bspPq/Sa98tlwQ+YKsEz6USa9k31G
        B1G7iR5pGgho+xLwEsToUlHOoeEHPOj4QQ7cBItoGZm71L1ARXDXdeaEYt/DWK2TuQ5IrfqhB7C
        AXD1c8QsNV7GSCvM5wsd36Of25AagDH5TeQ==
X-Received: by 2002:a17:906:32d6:b0:997:870d:e8fa with SMTP id k22-20020a17090632d600b00997870de8famr9348207ejk.1.1692087332441;
        Tue, 15 Aug 2023 01:15:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZ88tr0bQrM/P/m3jZBT7DdqTqpLmw+FS/FTvvaTmvVwlil3AS7ScU+77cEeszwU6iO4Nw2g==
X-Received: by 2002:a17:906:32d6:b0:997:870d:e8fa with SMTP id k22-20020a17090632d600b00997870de8famr9348202ejk.1.1692087332208;
        Tue, 15 Aug 2023 01:15:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o27-20020a17090637db00b0099bc8db97bcsm6700743ejc.131.2023.08.15.01.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 01:15:31 -0700 (PDT)
Message-ID: <484a6287-d434-95a9-4c9d-af06de5960e6@redhat.com>
Date:   Tue, 15 Aug 2023 10:15:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH platform-next v2 00/16] Add new features and amendments
 for Nvidia systems
Content-Language: en-US, nl
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20230814203406.12399-1-vadimp@nvidia.com>
 <34f2c08b-c07b-b789-487b-615868cde500@redhat.com>
 <BN9PR12MB538136ECEF25054EC6EAE9B1AF14A@BN9PR12MB5381.namprd12.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <BN9PR12MB538136ECEF25054EC6EAE9B1AF14A@BN9PR12MB5381.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/15/23 10:09, Vadim Pasternak wrote:
> Hi Hans,
> 
> I put changelogs inside each patch, which was commented (v0 -> v2).
> Would you like me to put it in cover?

Ah I see them now, I randomly checked 3 patches for
that and got unlucky.

Next time please put at least a summary of the Changes in
the cover, e.g. for this v2:

Changes in v2:
- Address review comments from Ilpo, see individual patches
  for details.

Regards,

Hans






-
> 
> Thanks,
> Vadim.
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Tuesday, 15 August 2023 11:06
>> To: Vadim Pasternak <vadimp@nvidia.com>
>> Cc: ilpo.jarvinen@linux.intel.com; platform-driver-x86@vger.kernel.org
>> Subject: Re: [PATCH platform-next v2 00/16] Add new features and
>> amendments for Nvidia systems
>>
>> Hi,
>>
>> It would be nice if there was a changelog somewhere in this cover letter
>> explaining what has changed in v2 ?
>>
>> Regards,
>>
>> Hans
>>
>> On 8/14/23 22:33, Vadim Pasternak wrote:
>>> The patch set:
>>> - Provides New system attributes for monitoring.
>>> - Adds system reboot callback to perform system specific operations.
>>> - Adds support for ACPI based initialization flow.
>>> - Adds support for FPGA device connected through PCIe bus.
>>> - Adds additional logic for hotplug events handling.
>>> - Contains some amendments and cosmetic changes.
>>>
>>> The patch set includes:
>>> Patches #1 - #3, #5: add new attributes for monitoring.
>>> Patch #4: sets hotplug event action for health and power signals.
>>> Patch #6: adds CPLD versioning registers for systems equipped with five
>>> 	  CPLD devices.
>>> Patch #7: modifies power off callback.
>>> Patch #8: cosmetic changes - fixes misspelling.
>>> Patch #9: provides system reboot callback through system reboot
>>> 	  notifier.
>>> Patch #10: prepares driver to allow probing through ACPI hooks along
>>> 	   with probing through DMI hooks.
>>> Patch #11: adds ACPI match hook for initialization flow.
>>> Patch #12: adds support for getting system interrupt line from ACPI
>>> 	   table.
>>> Patch #13: adds initial support for programming logic device connected
>>> 	   through PCIe.
>>> Patch #14: Extends condition for notification callback processing.
>>> Patch #15: defines the exact i2c bus of fans on the SN2201 system.
>>> Patch #16: Documents new attributes.
>>>
>>> Michael Shych (1):
>>>   platform: mellanox: nvsw-sn2201: change fans i2c busses.
>>>
>>> Vadim Pasternak (15):
>>>   platform: mellanox: Add new attributes
>>>   platform: mellanox: Add field upgrade capability register
>>>   platform: mellanox: Modify reset causes description
>>>   platform: mellanox: mlx-platform: Modify health and power hotplug
>>>     action
>>>   platform: mellanox: mlx-platform: Add reset cause attribute
>>>   platform: mellanox: mlx-platform: add support for additional CPLD
>>>   platform: mellanox: mlx-platform: Modify power off callback
>>>   platform: mellanox: Cosmetic changes
>>>   platform: mellanox: mlx-platform: Add reset callback
>>>   platform: mellanox: mlx-platform: Prepare driver to allow probing
>>>     through ACPI infrastructure
>>>   platform: mellanox: mlx-platform: Introduce ACPI init flow
>>>   platform: mellanox: mlx-platform: Get interrupt line through ACPI
>>>   platform: mellanox: Add initial support for PCIe based programming
>>>     logic device
>>>   platform/mellanox: mlxreg-hotplug: Extend condition for notification
>>>     callback processing
>>>   Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
>>>
>>>  .../ABI/stable/sysfs-driver-mlxreg-io         |  42 ++
>>>  drivers/platform/mellanox/mlxreg-hotplug.c    |   2 +-
>>>  drivers/platform/mellanox/nvsw-sn2201.c       |  12 +-
>>>  drivers/platform/x86/mlx-platform.c           | 376 ++++++++++++++++--
>>>  4 files changed, 383 insertions(+), 49 deletions(-)
>>>
> 

