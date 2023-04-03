Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF9D2C76188
	for <platform-driver-x86@archiver.kernel.org>; Mon,  3 Apr 2023 15:15:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231571AbjDCPPT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 3 Apr 2023 11:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbjDCPPS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Apr 2023 11:15:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC10826AD
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Apr 2023 08:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680534875;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WnHDxISHyvOvLnit3NOC6bnRr0EdN+jVapdWjnaO6Jc=;
        b=HgXQmhKFlazW48QdVrKUfqsK7F7N+5FHkRwk4tBjJTiSMpxXGrjeo/YEl8kurDlpekthmS
        KlILFlnKRIKMrbI+HdQ3rXb4C1LWYxbkmhpvC3LB+606qxOkP1+xWRFcFJZjSn0RwS/hON
        AVT8xVafjErNUVg96m4kotRdarevh6I=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-bZZCnIcSNVqhMgKfPjdDcA-1; Mon, 03 Apr 2023 11:14:34 -0400
X-MC-Unique: bZZCnIcSNVqhMgKfPjdDcA-1
Received: by mail-ed1-f70.google.com with SMTP id s30-20020a508d1e000000b005005cf48a93so41402977eds.8
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Apr 2023 08:14:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680534873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WnHDxISHyvOvLnit3NOC6bnRr0EdN+jVapdWjnaO6Jc=;
        b=edAwfrFORvLEZWk4AsA/6WKvPbDIl3FS4zqJYPmAbcjtc8Zixb2lR4lV0tx5myK7lY
         FmyKigMgKJGceYNL8EEhZ5jEbsM2dFiizLXHjFKpoi1LoJcVtFvbhsfo9uncOnrVYVhN
         mBWyyEe+V1Sb1pEmAL3+hacVkB545vCaoq/8aOQaDehFIP0DTL0p0rs2cvRIPdW6xYPO
         MJa+Q0wyXMkt3YiKli0fay/ghosYiKXtS8N84Hd78hHfIXzjgegnSiGj0+qfK2AUR3+0
         jZrji/x9z+zbR2H9cVLzFDfizZwIwAuyamcjM11ws07x6UpCVcMDy4rJrCxWvd1b2UjX
         9uiQ==
X-Gm-Message-State: AAQBX9fxrYaPL0Fa37xbNh1yDcWcHlS1QyuqdqA1gHRJ/wtSPc/S6bI0
        a2feGq8uMhhr7b8FWBdhWuedblqW36PCMX1XhRrwYdyJSGhfUw9LilyJO1ZWAaKqmL2SREtk0nd
        m8jpNAs1NGTdBjTBiZmcn6aeaUVm0MYaoVA==
X-Received: by 2002:a17:906:5293:b0:92c:6fbf:28 with SMTP id c19-20020a170906529300b0092c6fbf0028mr37791198ejm.64.1680534873653;
        Mon, 03 Apr 2023 08:14:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350bGTc3zkapkoFnbodSzud0IWW7XUyEvjJxinyYjLv1oQXElVnMiYJv/BBp0aCfTuaUytLtuvg==
X-Received: by 2002:a17:906:5293:b0:92c:6fbf:28 with SMTP id c19-20020a170906529300b0092c6fbf0028mr37791179ejm.64.1680534873388;
        Mon, 03 Apr 2023 08:14:33 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h23-20020a170906261700b008e0bb004976sm4648943ejc.134.2023.04.03.08.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 08:14:32 -0700 (PDT)
Message-ID: <bee18e30-90e8-8e22-8192-c89dc73719f1@redhat.com>
Date:   Mon, 3 Apr 2023 17:14:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add missing T14s Gen1 type
 to s2idle quirk list
To:     Mark Pearson <mpearson-lenovo@squebb.ca>,
        Benjamin Asbach <asbachb.kernel@impl.it>
Cc:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        Mark Pearson <markpearson@lenvo.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        "markgross@kernel.org" <markgross@kernel.org>,
        ibm-acpi-devel@lists.sourceforge.net,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org
References: <20230331232447.37204-1-asbachb.kernel@impl.it>
 <a192e386-5385-d18a-9816-273e433eb833@redhat.com>
 <ca667f1a-6e65-4d00-8015-bdd4c9f8de51@app.fastmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ca667f1a-6e65-4d00-8015-bdd4c9f8de51@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark,

On 4/3/23 16:41, Mark Pearson wrote:
> Hi Hans
> 
> On Mon, Apr 3, 2023, at 6:03 AM, Hans de Goede wrote:
>> Hi,
>>
>> On 4/1/23 01:24, Benjamin Asbach wrote:
>>>> Lenovo laptops that contain NVME SSDs across a variety of generations have
>>>> trouble resuming from suspend to idle when the IOMMU translation layer is
>>>> active for the NVME storage device.
>>>>
>>>> This generally manifests as a large resume delay or page faults. These
>>>> delays and page faults occur as a result of a Lenovo BIOS specific SMI
>>>> that runs during the D3->D0 transition on NVME devices.
>>>
>>> Link: https://lore.kernel.org/all/20220503183420.348-1-mario.limonciello@amd.com/
>>>
>>> As Lenovo distributes T14s Gen1 laptops with different product names
>>> a missing one is added by this patch.
>>>
>>> Note: Based on lenovo support page there might be some more variants which
>>> are not represented in s2idle quirk list.
>>
>> Can you provide some more in info on this? Then Mark can maybe check
>> if we need to add more models ?
>>
>> Mark, generally speaking it may help to do a DMI_EXACT_MATCH on
>> DMI_PRODUCT_VERSION with ThinkPads ? That contains the human
>> readable model string instead of things like "20UJ", and I guess
>> that we want to e.g. apply the s2idle quirk to all "T14s Gen1 AMD"
>> ThinkPads.
> 
> Sadly that won't work :(
>  - The same ID is used for multiple platform names and those can change by geography (for instance China often calls things differently) or if WWAN supported, etc. 
>  - They use the same platform name for Intel and AMD in a few cases (not all). And this match should only be done for the AMD platforms.
> 
> For every platform there are two IDs. In this case the T14s G1 has 20UH and 20UJ. I need to figure out when each is used - I thought only the first one was in released platforms but it seems that's not the case from this patch. I need to understand how/why.
> 
> For models impacted - there are a couple missing from the list that I would expect to see there as they're the same generation: X13 G1 and L15 G2 (and a possible ? against L14/L15 G1). I'm also a bit cautious as the E-series might need to show up here - but I don't know those platforms as well..
> And depending on the two IDs...some of the platforms may need doubling up. Urgh.

Ok.

Stating the obvious here: Please send a patch adding
the necessary extra IDs once you know which ids to add.

Regards,

Hans




