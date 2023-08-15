Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EBEEC04A6A
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Aug 2023 08:17:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235568AbjHOIQn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Aug 2023 04:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232742AbjHOIQO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Aug 2023 04:16:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52E38E72
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Aug 2023 01:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692087325;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R+PBPOf4tqE68ba7HID7h6MpKmEPxK26mSQxYISYOG8=;
        b=bkX1A/zKS3E8ZuLtleADa+eu0MKV0tYZv5K+AwKk35RawvDfbm9m7Tia2iZzUPNtdf1YJ7
        gU9AZDDVIcq3/qLamgLG1GJJ2uV85H40Q6o27M93cf6c7yBtahy36RG0TXExa9JJL/Ewoy
        VUoZBU8MgMU+J06dvBJzRvd+iZx+2U8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-eqrVYBSlP6KhBVwJB4KizA-1; Tue, 15 Aug 2023 04:15:24 -0400
X-MC-Unique: eqrVYBSlP6KhBVwJB4KizA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-52567064f8fso1167536a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Aug 2023 01:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692087322; x=1692692122;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R+PBPOf4tqE68ba7HID7h6MpKmEPxK26mSQxYISYOG8=;
        b=QgevGYUb2TNtbrWfEPgOYGmuaPforcXyLOhD5/0gOztfitBERnwblkzBqs0OMtNK5R
         c8R27xJVuze0yyDMQLrhTKWPamyctKtDfiHs7V9ugKHp14cR1cEo0YwtB1WndIH3jZqs
         rL0cQpzMGf9+CxeL5WQ3j9/6nNU0EqMWF+bUqJjIf0dz0TCejstdVh1v8tKhcfGRQYap
         MVI2np9v7H07/8t6LvLxgHyTG/EKBMtHMcoy5ItnvGcng0SSFtLO48nfLbSTja18Uw60
         0b8/4yvCwRpMUJUsJZtgQyeBlZsGyqw3bGOCPzlO01ayHnE6Fjqlo41bmfuoMEA3mqaM
         pX6Q==
X-Gm-Message-State: AOJu0YwVaqoC8s8N8l0eVGb9Lf65dJ2xaAfrzZ5qO25MHud7R8muZ6Q5
        5gp/2XCZNkEzAJCMMuY11wSZdXMwKPT6d/0yTsjFQ3yJFo/Qz6cxluQUUHkubIwau2MYh273urn
        11Bf6oMOznfUpeFL2+9fdrox+HuDFMHWQqeMJZOF9cQ==
X-Received: by 2002:aa7:d514:0:b0:522:3a28:feca with SMTP id y20-20020aa7d514000000b005223a28fecamr10565992edq.24.1692087322621;
        Tue, 15 Aug 2023 01:15:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEhfsv8P89J7adARM7rCWCC8D8aYqFHQ2NmklyM+Uc66lNwYeRmDP/WdiY7J0dikCPTxW1eQ==
X-Received: by 2002:aa7:d514:0:b0:522:3a28:feca with SMTP id y20-20020aa7d514000000b005223a28fecamr10565981edq.24.1692087322348;
        Tue, 15 Aug 2023 01:15:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y9-20020aa7d509000000b0052540e85390sm4151410edq.43.2023.08.15.01.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 01:15:20 -0700 (PDT)
Message-ID: <4a538e97-7132-444c-0da8-2f4390f23598@redhat.com>
Date:   Tue, 15 Aug 2023 10:15:20 +0200
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

