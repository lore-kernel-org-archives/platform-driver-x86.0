Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB5DCC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 30 Nov 2021 15:47:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbhK3Pu0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 30 Nov 2021 10:50:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47748 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231895AbhK3PuZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 Nov 2021 10:50:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638287225;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Zeg85kJk6eO5w3vGDidSxXvB5mIjDVAN198BNAtcBZc=;
        b=dYcocrIAtfePKfYc96Cle8diWRySnboHOOmCJc4+w39l5ArH9tnQNIbm13iWKUPAmFgHDn
        w3YNbpbySb3GANWh3RFPPrGaj8BAxvVPOtmhbKpBGzxHAu7vfT1upim6M4DC7KXAtV7h1e
        7rmoDEmYCTRNqmCJuLm1NIRMCijb+qE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-oYQPglHzOYiqjDRkObof2A-1; Tue, 30 Nov 2021 10:47:04 -0500
X-MC-Unique: oYQPglHzOYiqjDRkObof2A-1
Received: by mail-ed1-f72.google.com with SMTP id s12-20020a50ab0c000000b003efdf5a226fso11155737edc.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Nov 2021 07:47:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Zeg85kJk6eO5w3vGDidSxXvB5mIjDVAN198BNAtcBZc=;
        b=Sy7MmHv45uMzieSeMORLphfwNXDUPIlb1XTZWMCSnmpHq+iB3zSniZdCPBun6bJRvF
         rUZeJGsNNJg6RLSCOZNqG1Lx0YqyW1jA07HSTWY9fTllVTP+EM7BduNrqqJakWb0NtzZ
         vbtMNXOON+gIOGj9RLGGvq7fbzlPQJg3n/ZcCiPI/8ik69OoJjmSRmT6z31ZNZRxeaZz
         +OxduWj4QyjpdcVRUbAmkmFOC1dTgI34K18TefMsqNnibhfMKKCm5yPZPZVpQWZvy4F0
         ygO40twQ13Y3xNd3zCwiVAq1NsT30it+XZ/20k/HhWqWJZWP4pL/4RyKiFo8W2utIs2j
         zzyQ==
X-Gm-Message-State: AOAM5317VWkPV0P5CAeKYzIRPJqmAcDDjxtfs2wSS8tHGIJaqebpDArP
        4ghdkEfTlm7Cz+QWe2ERryxBZ9jS9wO1NNCKb29CBMyhHTd/bX5ad150Gve/Uqo03R9rH8R8gRL
        g+nT30Y4AaxpvW1F3dp6ED/2o+P3jXpyGOw==
X-Received: by 2002:a17:906:7955:: with SMTP id l21mr72150564ejo.6.1638287223227;
        Tue, 30 Nov 2021 07:47:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbL4vmDGb/q8fhNL8tYC4m3HY+wUNdr2qwE6wDDPcX1KT9Yzvu8NnyWXJoCORme/8owKcvXw==
X-Received: by 2002:a17:906:7955:: with SMTP id l21mr72150541ejo.6.1638287223068;
        Tue, 30 Nov 2021 07:47:03 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gn16sm9486916ejc.67.2021.11.30.07.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Nov 2021 07:47:02 -0800 (PST)
Message-ID: <68132e35-db47-0a7c-415d-7bf9e586eb30@redhat.com>
Date:   Tue, 30 Nov 2021 16:47:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/1] amd-pmu: fix s2idle failures on certain AMD laptops
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        Fabrizio Bertocci <fabriziobertocci@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Sanket Goswami <Sanket.Goswami@amd.com>
References: <CADtzkx7TdfbwtaVEXUdD6YXPey52E-nZVQNs+Z41DTx7gqMqtw@mail.gmail.com>
 <4a3d55d0-c53d-d0dc-8023-c059ddffc84c@redhat.com>
 <d594dad8-9bd2-dc38-c96d-9fd8699f286b@amd.com>
 <a8e11149-36dc-fe7e-3a08-d6f33a107741@amd.com>
 <2e85722e-e43c-b039-793b-473711a80bcc@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2e85722e-e43c-b039-793b-473711a80bcc@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/30/21 16:42, Shyam Sundar S K wrote:
> 
> 
> On 11/30/2021 7:34 PM, Limonciello, Mario wrote:
>> On 11/30/2021 06:29, Shyam Sundar S K wrote:
>>>
>>>
>>> On 11/30/2021 4:57 PM, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 11/30/21 05:15, Fabrizio Bertocci wrote:
>>>>> On some AMD hardware laptops, the system fails communicating with the
>>>>> PMU when entering s2idle and the machine is battery powered.
>>>>>
>>>>> Hardware description: HP Pavilion Aero Laptop 13-be0097nr
>>>>> CPU: AMD Ryzen 7 5800U with Radeon Graphics
>>>>> GPU: 03:00.0 VGA compatible controller [0300]: Advanced Micro Devices,
>>>>> Inc. [AMD/ATI] Device [1002:1638] (rev c1)
>>>>>
>>>>> Detailed description of the problem (and investigation) here:
>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1799&amp;data=04%7C01%7Cshyam-sundar.s-k%40amd.com%7Ce8ed4219951f4df1dbe708d9b3f4761c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637738684806355205%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=EwYxPgELsgQ2YpNQROFyptvt2Z0jQ0Yso8wptp6Dz4g%3D&amp;reserved=0
>>>>>
>>>>>
>>>>> Patch is a single line: reduce the polling delay in half, from 100uSec
>>>>> to 50uSec when waiting for a change in state from the PMC after a
>>>>> write command operation.
>>>>>
>>>>> Tested on kernel tree detached at tag 5.14
>>>>> (7d2a07b769330c34b4deabeed939325c77a7ec2f)
>>>>> After changing the delay, I did not see a single failure on this
>>>>> machine (I have this fix for now more than one week and s2idle worked
>>>>> every single time on battery power).
>>>>>
>>>>> Signed-off-by: Fabrizio Bertocci <fabriziobertocci@gmail.com>
>>>>
>>>> Thank you for your patch. I've added a couple of AMD developers who
>>>> work on this driver to the Cc.
>>>>
>>>> AMD folks, can you review/ack this patch please?
>>>
>>> Looks good to me.
>>>
>>> Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>
>>> Thanks,
>>> Shyam
>>>
>>
>> Fabrizio,
>>
>> Thanks!
>>
>> Hans,
>>
>> Can you please add Cc: stable@vger.kernel.org when you commit this?
> 
> Also, please help on the subject-line correction, from
> amd-pmu to amd-pmc.

Good point, I've added the Cc: stable and also fixed the Subject.

I will also include this patch in my next fixes pull-req for 5.16.

Regards,

Hans

