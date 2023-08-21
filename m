Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3981AEE49A6
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Aug 2023 17:06:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236697AbjHURGT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Aug 2023 13:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236686AbjHURGS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Aug 2023 13:06:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 670B9100
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 10:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692637534;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=s0Z35ehUAvp83Yw86fLyG+yecdvgWizyH4v9qT/R+54=;
        b=W1Z0mDS361JFPLk72xdNg62ydE78QV7FJorwU+LybrtFwPD+Qe+x1WCJqCiK+QCidKJlB3
        ZlwClx2VTKvDQvT1fUd2wsu7h6jRBpCuYwoVOiefr9KsyHEz/fxvKaSaNz1JWP2c4vVMs2
        OSAEeL5wf+EtbtoYrUdkV9qjLib/Xqs=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-wORyLvkJNeWTgP6lqDE1UA-1; Mon, 21 Aug 2023 13:05:33 -0400
X-MC-Unique: wORyLvkJNeWTgP6lqDE1UA-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2bcc5098038so6400771fa.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 10:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692637531; x=1693242331;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s0Z35ehUAvp83Yw86fLyG+yecdvgWizyH4v9qT/R+54=;
        b=XkfqlRF6ejIpxhF/GQJUIGQNjOgcxaUsfkJeRhy4GzwEnGzsI5V27p08CvTwCRnPyd
         C2IVgJY3jRrWSbru1XV+aXrcJ/nAiUK4gWWnaQMx6pLu+gan4W5UrCDysJkv6v02EUAi
         X03AmpO3xRbc2v0knt+9atl8CDk8wbIxhwP5T6NfhW25Be5Y5pgaJFIJNowsq9rW6MmF
         aogGcH9XQ3BfsqOJBuraArBDiEhfVsS0A7gDuXlmdbsinRjt1BeejtlmSbPq24IjGkvD
         iOadtlYwDaJNVDkXGK+/IYSYV0yWzlEnFia2xkAGLe6sWnhXwdPt7DdDV4bKwdaKDr5S
         wL/A==
X-Gm-Message-State: AOJu0Yxu5ORZne6VrSvdeMmche0U3aBW7p9AqcaRhDR5g6Ywy+b5ZWrj
        V7Ee9k2FkC/Z6kPGSvI3M6oMmSvkVQ5/6NURK8uY8wYzDHCnDFhK/2k4gQiDOB9i5miugji/cAq
        hXIbhDUwheCOQQjN8sKMBHx0041pVcTvi2A==
X-Received: by 2002:a2e:91d8:0:b0:2bc:c3c0:a997 with SMTP id u24-20020a2e91d8000000b002bcc3c0a997mr1888865ljg.38.1692637531567;
        Mon, 21 Aug 2023 10:05:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv3vm0BRVGyDW/ZqSCtFJRa3RpJQTLAlc2e84C5GY+RC7ThX0J7wi9u3ZRB1QrbFWZ6ylhvg==
X-Received: by 2002:a2e:91d8:0:b0:2bc:c3c0:a997 with SMTP id u24-20020a2e91d8000000b002bcc3c0a997mr1888847ljg.38.1692637531255;
        Mon, 21 Aug 2023 10:05:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v18-20020a170906b01200b0098e78ff1a87sm6838614ejy.120.2023.08.21.10.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 10:05:30 -0700 (PDT)
Message-ID: <c2e171fc-3570-3c33-bb22-ae3560d24adb@redhat.com>
Date:   Mon, 21 Aug 2023 19:05:29 +0200
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
 <6cb1e07a-5896-fd49-cbfb-99499969092b@redhat.com>
 <BN9PR12MB53815DE71C2FC4C0CCF13948AF1EA@BN9PR12MB5381.namprd12.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <BN9PR12MB53815DE71C2FC4C0CCF13948AF1EA@BN9PR12MB5381.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Vadim,

On 8/21/23 18:29, Vadim Pasternak wrote:
> Hi Hans,
> 
> Thank you very much for review.
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Monday, 21 August 2023 16:20
>> To: Vadim Pasternak <vadimp@nvidia.com>
>> Cc: ilpo.jarvinen@linux.intel.com; platform-driver-x86@vger.kernel.org
>> Subject: Re: [PATCH platform-next v2 00/16] Add new features and
>> amendments for Nvidia systems
>>
>> Hi,
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
>>
>> Thanks.
>>
>> 1 remark about Patch #16: Documents new attributes, this does not document
>> the new reset_swb_dc_dc_pwr_fail attribute, please add this.
>>
>> With that fixed the entire looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> for the series.
>>
>> I tried applying this, but it is based on a tree which does not have the recent:
>> dd635e33b5c9a ("platform: mellanox: Introduce support ofnew Nvidia L1
>> switch") commit causing patch 2/16 to not apply.
>>
>> Please rebase on top of the latest pdx86/for-next:
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-
>> x86.git/log/?h=for-next
> 
> I think the problem that branches:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=for-next
> and
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
> 
> don't include series:
> [PATCH platform 0/4] platform/x86: mlx-platform: Provide fixes for several issues
> 
> This patch set has been applied only to:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes
> 
> Can you, please cherry-pick this set to for-next or review-hans branch and I'll produce v3
> on top of any of these two?

Ok. I've merged (1) pdx86/fixes into my review-hans branch now and pushed out the result. Please base v3 on top of the latest review-hans state.

1) It is prefered to avoid a single patch getting 2 commit ids which cherry-picking does, that is why I chose to do a back-merge here.

Regards,

Hans



