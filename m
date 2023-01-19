Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 161D9C004D4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Jan 2023 09:59:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbjASJ7k (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 Jan 2023 04:59:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbjASJ7a (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Jan 2023 04:59:30 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 897E0768A
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jan 2023 01:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674122324;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/momIUR2szqCPj9H+fBG6myi5w9QCPaKV1+9SFndQ8g=;
        b=g4DxCHNOL5wG3reYusFIRGRovJbItuE/fm4whU+KMdhWxNXw5Gtjc7c1xM5gFeDd7Q0D7P
        w+YzNF5AunX+12hjvWs6Uhar5yF3JQ3m4kel9tslDd3rkWUMlK51yCmfLMzHU9ZAIvYGWs
        fBepcMS1eQJ+YoVYi4cU5ba6faey8Rk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-120-i77TgsA-M6mFm_ervLMTBw-1; Thu, 19 Jan 2023 04:58:43 -0500
X-MC-Unique: i77TgsA-M6mFm_ervLMTBw-1
Received: by mail-ej1-f70.google.com with SMTP id wz4-20020a170906fe4400b0084c7e7eb6d0so1217542ejb.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jan 2023 01:58:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/momIUR2szqCPj9H+fBG6myi5w9QCPaKV1+9SFndQ8g=;
        b=67Z+eTYXNxAS4sMPlxZwZxJCIh44MrEyiqEzFPkLdMyuVk9E8yiKmKWNmwGMi//JbY
         MVS5Q0aCeejk7Hhfhpm4UMuBqlgAKE/R0Q64x8JIJqh/VWjiijXvLacnYHjhALo+0jrL
         1vT8RpfIo6R9c3JJWED3+hwobLfElV8oalivT2Q6kzBfigkNky7TlGbmYTBgXHyBtMkj
         VWkysZ0sW4weJUqRXpI4apODt5Ro5ulJ345581W0kxcNP1c9CVRjPOony4W6FGmZmSow
         WgFuV4+BRJsbKIY1a39U/ftpbWNfcmHkEGSBSjOwYT6OMJG7JPadTdvOB2+aVS0Gm0BX
         KX2g==
X-Gm-Message-State: AFqh2koEAogiDz9W7C2J8/I83Y5niv+XXqwZfT6c5yW8y5zbuXzuWxk1
        YZ3tRcW3wZuD1xId7mzCW/K8IrBGeH6/WVa5rBOyPbonJRRaPZvCpTedWz2rPx/DeZGBTOV+byw
        MhtarNcytyrmHd2MAfXIzeda82+BjUusU4g==
X-Received: by 2002:a17:906:af8f:b0:7c1:5098:9074 with SMTP id mj15-20020a170906af8f00b007c150989074mr6754230ejb.0.1674122322244;
        Thu, 19 Jan 2023 01:58:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsVDbY66af6io2q35fqGU70CrzU1S62qvQZqQ28yCSWei2oqAym961mTfxPhQo+zo2aGO463g==
X-Received: by 2002:a17:906:af8f:b0:7c1:5098:9074 with SMTP id mj15-20020a170906af8f00b007c150989074mr6754220ejb.0.1674122322035;
        Thu, 19 Jan 2023 01:58:42 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id e22-20020a170906315600b007ae10525550sm15929016eje.47.2023.01.19.01.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 01:58:41 -0800 (PST)
Message-ID: <02c3fd27-011e-f8ad-d798-a134fa8ac061@redhat.com>
Date:   Thu, 19 Jan 2023 10:58:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 0/2] Expand APU2 driver to 3/4/5/6 models
Content-Language: en-US, nl
To:     Philip Prindeville <philipp@redfish-solutions.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-x86_64@vger.kernel.org,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Ed Wildgoose <lists@wildgooses.com>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>, linux-kernel@vger.kernel.org,
        x86@kernel.org
References: <20230113231139.436943-1-philipp@redfish-solutions.com>
 <44e0ef20-d6d3-4c87-1828-f88dbc08e942@redhat.com>
 <343F820D-69E1-4120-89DA-980FC78E3656@redfish-solutions.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <343F820D-69E1-4120-89DA-980FC78E3656@redfish-solutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/19/23 08:17, Philip Prindeville wrote:
> 
> 
>> On Jan 17, 2023, at 3:25 AM, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Philip,
>>
>> On 1/14/23 00:11, Philip Prindeville wrote:
>>> From: Philip Prindeville <philipp@redfish-solutions.com>
>>>
>>> Extend PCEngines APU2 driver to derivative models APU3, 4, 5
>>> and 6.
>>>
>>> Of the five, the APU5 is the most dissimilar.  The APU2 is not
>>> derivative of the APU1, and we call that out in the leds-apu
>>> driver.  We also clarify the expanded compatibility of the
>>> pcengines-apuv2 driver in the Kconfig menu.
>>>
>>> We correct some line labeling for GPIO lines 4-6, and we add
>>> appropriate definitions to the GPIO lines for the APU5 which
>>> is mapped out differently.
>>>
>>> The majority of the work was done by Ed Wildgoose.  Philip
>>> Prindeville took over the effort to upstream the fixes and
>>> made some minor cleanup.
>>
>> Thank you both for your work on this.
>>
>> In would really like to hear back from Enrico what he thinks
>> about these patches. FWIW I'm fine with merging these as is.
>>
>> Also note that Enrico is listed as maintainer for the 
>> pcengines-apuv2.c file in MAINTAINERS, so you really should
>> have Cc-ed him on this.
>>
>> Enrico, can you take a look at this series please? You can find
>> the 2 actual patches here:
>>
>> https://lore.kernel.org/platform-driver-x86/20230113231139.436956-1-philipp@redfish-solutions.com/
>> https://lore.kernel.org/platform-driver-x86/20230113231140.437040-1-philipp@redfish-solutions.com/
>>
>> Regards,
>>
>> Hans
> 
> 
> I tried to copy Enrico on earlier revisions of this patch but they bounced so I stopped including him.

Weird I don't think I have received any bounces for Enrico.

Regards,

Hans




>>> Philip Prindeville (2):
>>>  x86: Support APU5 & APU6 in PCEngines platform driver
>>>  x86: Further PCEngines APU4/5/6 cleanup
>>>
>>> drivers/leds/leds-apu.c                |   2 +-
>>> drivers/platform/x86/Kconfig           |   4 +-
>>> drivers/platform/x86/pcengines-apuv2.c | 118 ++++++++++++++++++++++---
>>> 3 files changed, 107 insertions(+), 17 deletions(-)
>>>
>>
> 

