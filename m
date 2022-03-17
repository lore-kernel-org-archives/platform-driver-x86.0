Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BE6C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Mar 2022 18:17:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237306AbiCQSSj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Mar 2022 14:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237525AbiCQSSJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Mar 2022 14:18:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9F00B221B9C
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Mar 2022 11:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647541006;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3OWhTC0al/IhEBeEYi89DdAc4JRkuQg2MHD6/kf61Yk=;
        b=Q9hHPQ5uA8O0YOBJ2QhVsSDirLyu9ZYMnT2Skd8zTLoGK5QdYSEL3s4tVj+RgGRNqH1urw
        LJTyNR0jPWhww6poRSXo3I+ttwqzdrXKTKAGpqVmV3KSEoT0Ad2X7TmgVOpgVZOGR/cRBY
        M7lIxYQ2TWnNvoGnAkr/RlRPAXtDWmQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-Ze1ojC-pONC7Wa2pYSAJow-1; Thu, 17 Mar 2022 14:16:45 -0400
X-MC-Unique: Ze1ojC-pONC7Wa2pYSAJow-1
Received: by mail-ej1-f69.google.com with SMTP id jy20-20020a170907763400b006db62b6f4e0so3340403ejc.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Mar 2022 11:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3OWhTC0al/IhEBeEYi89DdAc4JRkuQg2MHD6/kf61Yk=;
        b=ikJdsiJN71BIgFklNmqfHanoClhvRfVBFvQBvRhuljGCtPI8iPxxr/uMYtLoPEJo/X
         MGGzY1/M9PbLDOL1cZvJ6Dq3Ajr3cb63ox/+xkLE0OsnR+BxixwOyC5PwtS1NablSFzU
         M/u1xRknAvGmIs8qlZy2FpYqtAtgR3xLEGawU5WZkdT8A1aSrlFBEciXdKVZ8GJ9Cu41
         hzAsau8C1bVjdkRi6Fm3NxzCy8bq3DAjTxp3PDpkZVIyMyrK9QoGi6My9LJrcgGSdrLO
         spyW1zSOdmYjY3GmSOslApufWP7pb39jehmhqhl9sGSDvSorUCo077yxqk9AeqqF/HzT
         4Sew==
X-Gm-Message-State: AOAM5323EkLB5ZtMMy3A5fy1NXZn57QgkzfO7nC6ziAbyGkEqy2fKY5/
        1VcdyTZlyvju8AnLqbVaNTW2/SllXrPF16tnaIGjWXEaXegXzg+EwSxnMh2Dk5Na3Vrxrkt4xu1
        09s0T7OxfAUvhoTHj/AUxYIHwL4Tl1DuIFA==
X-Received: by 2002:a05:6402:1d51:b0:418:bd81:78b3 with SMTP id dz17-20020a0564021d5100b00418bd8178b3mr5819000edb.46.1647541004090;
        Thu, 17 Mar 2022 11:16:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4zLvrvuHqsAV8MKPyLOG/VCFNKtqDiXZZRJ1N2oPCxI0YUXI+5vOpl73H/zzSkujIuT+GcA==
X-Received: by 2002:a05:6402:1d51:b0:418:bd81:78b3 with SMTP id dz17-20020a0564021d5100b00418bd8178b3mr5818970edb.46.1647541003616;
        Thu, 17 Mar 2022 11:16:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id zb5-20020a17090687c500b006ce2a98f715sm2653472ejb.117.2022.03.17.11.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 11:16:43 -0700 (PDT)
Message-ID: <78fd3e69-7c81-fe85-15ee-9e95a0ef2460@redhat.com>
Date:   Thu, 17 Mar 2022 19:16:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [External] Re: [PATCH v2 1/2] Documentation:
 syfs-class-firmware-attributes: Lenovo Certificate support
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20220315195630.3209-1-markpearson@lenovo.com>
 <c3ef4c4e-9862-88f6-ef7f-2fd741ce9ea9@redhat.com>
 <90f1a4ce-a3ba-ed14-f27a-348af368afad@lenovo.com>
 <f9151a77-f7ad-78cc-41e5-e5d13945c3a2@redhat.com>
 <d938f450-2760-e7b3-b0e3-6006550269b5@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <d938f450-2760-e7b3-b0e3-6006550269b5@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/17/22 19:08, Mark Pearson wrote:
> 
> 
> 
> On 2022-03-17 13:23, Hans de Goede wrote:
>> Hi,
>>
>> On 3/17/22 18:08, Mark Pearson wrote:
>>>
>>> Hi Hans,
>>>
>>> Thanks for the review
>>>
>>> On 2022-03-17 06:58, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 3/15/22 20:56, Mark Pearson wrote:
>>>>> Certificate based authentication is available as an alternative to
>>>>> password based authentication.
>>>>>
>>>>> The WMI commands are cryptographically signed using a separate
>>>>> signing server and will be verified by the BIOS before being
>>>>> accepted.
>>>>>
>>>>> This commit details the fields that are needed to support that
>>>>> implementation. At present the changes are intended for Lenovo
>>>>> platforms, but have been designed to keep them as flexible as possible
>>>>> for future implementations from other vendors.
>>>>>
>>>>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>>>>
>>>> This looks good, but looking at this a second time I still
>>>> have one open question:
>>>>
>>>> What is the difference between removing a certificate and
>>>> switching back to password auth?
>>> The main difference is clear goes to no-authentication, and switching
>>> obviously switches to password
>>>
>>>>
>>>> Looking at the WMI calls there are 4 different calls:
>>>>
>>>> LENOVO_SET_BIOS_CERT_GUID
>>>> LENOVO_UPDATE_BIOS_CERT_GUID
>>>> LENOVO_CLEAR_BIOS_CERT_GUI
>>>> LENOVO_CERT_TO_PASSWORD_GUID
>>>>
>>>> Going by these names I guess there can be only 1 certificate
>>>> otherwise I would expect:
>>>>
>>>> 1. add/remove naming
>>>> 2. update to take an id of which certificate to replace
>>>>
>>> Correct - there is only one certificate
>>>
>>>> So I guess that LENOVO_CLEAR_BIOS_CERT_GUI disables all
>>>> authentication. IOW, installing a cert replaces/clears
>>>> the supervisor password and the difference between
>>>> clearing the certificate and cert-to-password is that
>>>> after clearing it we end up with no supervisor password
>>>> set, where as cert-to-password sets the passed in password
>>>> as the new supervisor password?
>>> Correct
>>>
>>>>
>>>> Or does clearing the certificate fall back to the old
>>>> supervisor password if one was set?  (that might lead to
>>>> some interesting issues if users clear the certificate
>>>> many years after the password was last used ...)
>>> clearing reverts to no password
>>>
>>>>
>>>> Given where we are in the cycle I was planning on adding
>>>> this to my review-hans branch so that it could maybe still
>>>> get into 5.18, but given the above questions as well
>>>> the remark about the test X1 BIOS you are using I've
>>>> a feeling it would be better to give this some more time
>>>> to bake and target 5.19 instead. Do you agree ?
>>>
>>> I'd love to have it in 5.18 as I expect his feature to be available in
>>> our 2022 platforms and they're all going to start landing in the next
>>> couple of months. If that's unrealistic I can live with it so I'll defer
>>> to your preference
>>
>> The 5.18 merge window starts coming Monday, if you can get me
>> a v3 with the last few minor items addressed sometime tomorrow,
>> then I can throw it into my for-next branch and if it does not
>> cause any issues there then it can make 5.18.
>>
>> But if anything non trivial pops up while this is baking in -next
>> I'll probably drop it from -next and then this becomes 5.19 material.
>>
>> Regards,
>>
>> Hans
> 
> OK - sounds good :)
> As a note - the feature is in the release BIOS, I just checked on my X1
> Yoga 7 updated to the latest.

Ah, good to know that the BIOS side of this is released now,
that removes one worry about this.

> I'll test the next round of patches on
> that system for extra sanity.

Sounds good.

Regards,

Hans

