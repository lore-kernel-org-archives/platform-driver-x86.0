Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0E5E92702
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Oct 2023 14:38:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235256AbjJEOiQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Oct 2023 10:38:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235097AbjJEOfi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2023 10:35:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D484220
        for <platform-driver-x86@vger.kernel.org>; Thu,  5 Oct 2023 06:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696514067;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Pgp6WR1yFlcO4MvYY27B/NMYWOb3Mza2LiDt/h+kyJo=;
        b=TtK4Yh60tuK1VkAaPFy/ppLfsnh1i85YtVVCqCRagOmHflFx9dLZVEv9rQrvihhuB3QO7I
        jZ1nFueRt7QrgHdmm3pIxlm/+r3Q1HghgZcnXZVTZtX7x8vjZKHPrql08mL9XzKRL1Jhy2
        eH9mAe8edb50ySjzQpqZk62JqSp8g28=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-r-eDDi5aM4GZcsem0N5QBQ-1; Thu, 05 Oct 2023 06:51:08 -0400
X-MC-Unique: r-eDDi5aM4GZcsem0N5QBQ-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-536294c9526so662896a12.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Oct 2023 03:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696503067; x=1697107867;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pgp6WR1yFlcO4MvYY27B/NMYWOb3Mza2LiDt/h+kyJo=;
        b=jCwFkdUcfz1x/q8f859W3hMAj8FRqUhaJLNyhkI7Ab4mdFugVHwtzxmJZtLJoo4xUp
         d317WKE9VVtHVx3f3mnqEqo3LlGdchx1pVOGFXwhqGxUxVwaLoOzkvCcp2pgJ5FQ2Itv
         c1asJy+eSEjoez0y2uOVVPyklqsZpHIvF/eOuczOJEzS0SmUYSrnVKwrkKL1x+ibC4Ec
         0BUbv0lJ3ppLHlEw6yIt4XSHEz6R8bPSlVrlDmsjsZtNutFYTn0Qoik6b6iNKWs6mHqb
         TXUAMt4AtD/rtQmrgg5XPeOPRoJEf/eiD9vLAsuyrWtMMDM+lU2egaRR4zY1ambIzbYJ
         /VEA==
X-Gm-Message-State: AOJu0YwVI6nvCUYIn2Fl1u4nVzRpPUSrmifXtVr4/7XVa9MKujnJIHqT
        gFswror4peNhnU6ECsi861wDY0ECtW8AdPFVLFs6tFZInCUETtfjAi9qV0blSRBexoLHRiQ2hEu
        Dr/rj+MF+bRDSNyJ5fkIt5v4LHsjVWx8xQQ==
X-Received: by 2002:aa7:d1d7:0:b0:52f:a42a:85a3 with SMTP id g23-20020aa7d1d7000000b0052fa42a85a3mr4245232edp.0.1696503067695;
        Thu, 05 Oct 2023 03:51:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfPVYbBdS6FHFdHM0IpPIq3zJz5FY/sIL2cxBDLDQGIS1XqkljQDUwnHCokOjeHsZZ/Yq0QQ==
X-Received: by 2002:aa7:d1d7:0:b0:52f:a42a:85a3 with SMTP id g23-20020aa7d1d7000000b0052fa42a85a3mr4245216edp.0.1696503067490;
        Thu, 05 Oct 2023 03:51:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f13-20020a05640214cd00b0053821dbd4dasm881238edx.22.2023.10.05.03.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 03:51:06 -0700 (PDT)
Message-ID: <5f8ce053-cc9e-e6b2-c2ba-f62df30cb3ab@redhat.com>
Date:   Thu, 5 Oct 2023 12:51:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/2] platform/x86/amd/pmc: Add dump_custom_stb module
 parameter
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     markgross@kernel.org, Sanket.Goswami@amd.com,
        mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org,
        Harsh Jain <Harsh.Jain@amd.com>
References: <20230910142034.2967110-1-Shyam-sundar.S-k@amd.com>
 <20230910142034.2967110-2-Shyam-sundar.S-k@amd.com>
 <b3e4acdc-c031-cf00-b972-bc11e3933799@redhat.com>
 <ac5a328e-48ab-4e21-ad8a-72518d0952cb@amd.com>
 <5c6625ba-c2f0-6510-c1ea-3005a9c16e14@redhat.com>
 <844d0ef1-a09c-4c8a-aa14-d3487e3289f9@amd.com>
 <47babe3e-052f-d816-9789-5c8ae4728e78@redhat.com>
 <6d9a33d-3c92-3e24-3843-1084af1f516b@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <6d9a33d-3c92-3e24-3843-1084af1f516b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/5/23 12:15, Ilpo Järvinen wrote:
> On Wed, 4 Oct 2023, Hans de Goede wrote:
>> On 10/4/23 14:11, Shyam Sundar S K wrote:
>>> Thank you for the detailed feedback. I will make these changes and see
>>> if that helps - will need some time do tests and come back on this.
>>>
>>> Meanwhile, is it OK for you to take changes in v4 1/2 atleast? So that
>>> I don't need to respin it again (assuming there are no remarks for 1/2).
>>
>> Note I have a new pdx86 co-maintainer Ilpo who is merging the patches
>> leading up to the 6.7 merge window (Ilpo and I plan to take turns for this).
>>
>> IMHO it will be easier for Ilpo to merge the whole series in one
>> go when it is ready.
> 
> I can take single patches just as easily as the whole series as my tools 
> anyway explode the whole series into individual patches as an intermediate 
> step.
> 
> I'll look into it tomorrow. There seemed to be one whitespace issue in the 
> debug print but I can deal with that myself while applying but other than 
> that, 1/2 seems fine to me.
> 
> (In general, I personally prefer forward progress over posting the same 
> patches over and over because something in the same serie requires more 
> work).

Ok that works for me too.

>> Note when addressing my remarks please split any fixes for the existing
>> functionality out into separate patches vs the new dump_custom_stb
>> support.
> 
> Also, the kzalloc() move + ->fsize addition could be in own patch so the 
> actual dump_custom_stb patch itself becomes a lot simpler than it 
> currently is.

Yes that really should be a separate patch too.

Regards,

Hans




