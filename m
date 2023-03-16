Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743FDC6FD19
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Mar 2023 09:44:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbjCPJoS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Mar 2023 05:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbjCPJoQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2023 05:44:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64582173E
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 02:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678959804;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=P76DINGwLN3jYPnTLgFDgnOUdVkQEqE2bdfQVbKORjo=;
        b=fuxA0Q6D1uckPKs+TEp0wQ5phVD7pCTCteTkzggYEDiPyteYvHci7jeC4SrqHrYoeC76kD
        +jkflJPd7qvlDAr5sa1I4ZOirx2CkYrm9VVPMp9RycYStJZQu3N3/jS5lPO6wl8vpTehM5
        /sQ5rhskB1xkoYY66QXlu7Y/H6S7rg0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-XPA-dQC_OyGDuZwLlTyvIw-1; Thu, 16 Mar 2023 05:43:20 -0400
X-MC-Unique: XPA-dQC_OyGDuZwLlTyvIw-1
Received: by mail-ed1-f71.google.com with SMTP id c1-20020a0564021f8100b004acbe232c03so2185372edc.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 02:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678959799;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P76DINGwLN3jYPnTLgFDgnOUdVkQEqE2bdfQVbKORjo=;
        b=zoREyzn6qAmSvFgCYVP/tD1Jo/yMmUYRBCtfgfYGk3F6NgJkUjdY71wOx0jkVSVAxy
         M9iIt2pu33b60ZeA4RgH19RZqQ6mQsDt3SobwihObMhg7UNMRB4anqYR+rqgTjF2pFz+
         JDXFECfrR8BwAYeEwWZghpUK7y1ecJEt5cpjc5fkClRtqQtwkUZITByxvcTOBmgyWMoa
         RI/Xt+3bmPnPd4G6HvB3z+JRO+J2f7np4qzGAL8ntujEg5UVyA4ig658oMu49npzOhWK
         bG8l8+Lj7+3nG5E59Cq8GVL+ZIFIYKMyJUgSetthjPMb845oPk7ChLN7fmU5BVmp3nNi
         h6cA==
X-Gm-Message-State: AO0yUKVc3RltajxspnY6iT5kZmZsi1U1wcRYdWJESAsKiBXFjyO21EcJ
        ZSvC/Pp02gJhE+03I99c2omQirykMapCbJeoWBijvP+lxk+XgzYwcBpnvQuRXL5QHSTYSV9QLky
        8UBFpQ9cNRT69iKMNtxbLkno4n6chyQvsZw==
X-Received: by 2002:a17:907:c508:b0:92c:6fbf:28 with SMTP id tq8-20020a170907c50800b0092c6fbf0028mr11131719ejc.64.1678959799130;
        Thu, 16 Mar 2023 02:43:19 -0700 (PDT)
X-Google-Smtp-Source: AK7set9ABacgIfpMNu8b5pxHf2TkCJA8LMCLwd2GIJtR06o8lF73WzUup/jJcRknqUbwOk8DJbXvqw==
X-Received: by 2002:a17:907:c508:b0:92c:6fbf:28 with SMTP id tq8-20020a170907c50800b0092c6fbf0028mr11131697ejc.64.1678959798893;
        Thu, 16 Mar 2023 02:43:18 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id e23-20020a170906375700b008cff300cf47sm3603646ejc.72.2023.03.16.02.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 02:43:18 -0700 (PDT)
Message-ID: <fc45ace6-546c-59cd-016d-906b6bcb1831@redhat.com>
Date:   Thu, 16 Mar 2023 10:43:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/8] platform/x86/intel/ifs: Reorganize driver data
Content-Language: en-US, nl
To:     "Joseph, Jithu" <jithu.joseph@intel.com>, markgross@kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        gregkh@linuxfoundation.org, rostedt@goodmis.org,
        ashok.raj@intel.com, tony.luck@intel.com,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        patches@lists.linux.dev, ravi.v.shankar@intel.com,
        thiago.macieira@intel.com, athenas.jimenez.gonzalez@intel.com,
        sohil.mehta@intel.com
References: <20230214234426.344960-1-jithu.joseph@intel.com>
 <20230301015942.462799-1-jithu.joseph@intel.com>
 <20230301015942.462799-2-jithu.joseph@intel.com>
 <a6ae936e-effd-3794-e6fb-11b33a4d6eb1@redhat.com>
 <2ae25756-7403-ad5f-548a-50e633040bf9@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2ae25756-7403-ad5f-548a-50e633040bf9@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/13/23 22:34, Joseph, Jithu wrote:
> 
> 
> On 3/13/2023 7:46 AM, Hans de Goede wrote:
>> Hi Jithu,
>>
>> On 3/1/23 02:59, Jithu Joseph wrote:
> 
>>>  
>>> +struct ifs_const_data {
>>> +	int	integrity_cap_bit;
>>> +	int	test_num;
>>> +};
>>> +
>>
>> This is a description of the specific capabilties / bits of
>> the IFS on e.g. Saphire Rapids, so please name this appropriately
>> for example:
>>
>> struct ifs_hw_caps  {
>> 	int	integrity_cap_bit;
>> 	int	test_num;
>> };
> 
> This can be renamed to ifs_test_caps as it holds test specific fields.

Ack.

>>
>> You got this exactly the wrong way around, there should be a single
>>
>> static const struct ifs_hw_caps saphire_rapids_caps = {
>> 	.integrity_cap_bit = MSR_INTEGRITY_CAPS_PERIODIC_BIST_BIT,
>> 	.test_num = 0,
>> };
>>
>> And then struct ifs_device { } should have a "const struct ifs_hw_caps *hw_caps"
>> which gets initialized to point to &saphire_rapids_caps. So that your const
>> data is actually const.
>>
>> Where as since the r/w data's lifetime is couple to the misc-device lifetime
>> there is no need to dynamically allocate it just keep that embedded, so that
>> together you get:
> 
> Noted 
> 
>>
>> struct ifs_device {
>> 	const struct ifs_hw_caps *hw_caps;
>> 	struct ifs_data data;
>> 	struct miscdevice misc;
>> };
>>
> 
> The initialization portion, taking into account your suggestion above, translates to:

Yes, assuming we go with 1 ifs_device per test type.

Regards,

Hans


> static const struct ifs_test_caps scan_test = {
> 	.integrity_cap_bit = MSR_INTEGRITY_CAPS_PERIODIC_BIST_BIT,
> 	.test_num = IFS_TYPE_SAF,
> };
> 
> static const struct ifs_test_caps array_test = {
> 	.integrity_cap_bit = MSR_INTEGRITY_CAPS_ARRAY_BIST_BIT,
> 	.test_num = IFS_TYPE_ARRAY_BIST,
> };
> 
> static struct ifs_device ifs_devices[] = {
> 	[IFS_TYPE_SAF] = {
> 		.test_caps = &scan_test,
> 		.misc = {
> 			.name = "intel_ifs_0",
> 			.minor = MISC_DYNAMIC_MINOR,
> 			.groups = plat_ifs_groups,
> 		},
> 	},
> 	[IFS_TYPE_ARRAY_BIST] = {
> 		.test_caps = &array_test,
> 		.misc = {
> 			.name = "intel_ifs_1",
> 			.minor = MISC_DYNAMIC_MINOR,
> 			.groups = plat_ifs_array_groups,
> 		},
> 	},
> };
> 
> Jithu
> 

