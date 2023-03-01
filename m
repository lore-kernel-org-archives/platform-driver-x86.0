Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A128C64ED6
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 14:49:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbjCAOtZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 09:49:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjCAOtY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 09:49:24 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1DFC3A92
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 06:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677682125;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nibQL9J+s7T5DlxV2x+HGNXQnlc+nTXrLjoLaVjKiHg=;
        b=EpWzIDjs93lSLUykB7KSJob/0EaAw42G1LnqWGIbWDBqknf1zSzidz/i5J8zb2wi7q7TC9
        xDkSqDhYYiZYR9e+rHktd2pWraHEVHcwKcMB9oT0fnQTiGxIfqf6kHjnzPywOPs6k8A67d
        FA5T8z7SXfHA8cMpuXsQ9I4BTvik8ic=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-374-Me92mL4KNvyFx8muOw3bzA-1; Wed, 01 Mar 2023 09:48:43 -0500
X-MC-Unique: Me92mL4KNvyFx8muOw3bzA-1
Received: by mail-ed1-f70.google.com with SMTP id h13-20020a0564020e8d00b004a26ef05c34so19560640eda.16
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 06:48:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nibQL9J+s7T5DlxV2x+HGNXQnlc+nTXrLjoLaVjKiHg=;
        b=CxIhLeEhvLCTJ+k8LyywVCgW7Uxj1RkhWfvhlZ+3UHfDwJn4ImdehzakZtcKOC1V6P
         bzYWdFpK4nwndSJJDPJ7kl1e+5ajWrr/A2y03xmqr4wcHi4YLwBxRj7cUGTadJbzCiA2
         eYJ9GZa61Mb7jdb++bWjyOSsTr3R46N/5phOm8KvLxeR0JnTRBRluMvV0GAj7OXaelAQ
         VX1AK5fJLn9WPxOQVWAJwGkFpfQlUVi5A5Q9JM6B4+0SjDini2Bw2ly1/HDUsIdJlOKB
         298TOIVfbSzbdzWT18T4droYBb2X8l3JTKL2x7VBQJRxmyE+BAuFJksFP1AITET97KS8
         4UcQ==
X-Gm-Message-State: AO0yUKWcM0wVot3CZQQ2YhVZQ84lpZGxS2oABrT7CQxZJqnfc3CLVduI
        uPlA+sv5niaQ9jBdl8+lRgp2KgDeD6mIObvIIiQlGHxLs9uRNrTKJnmVrueasgInrshesXsP6Ci
        e3nRsrTeAW3J9eXrdvdV4BMTpw4MBlPpMIg==
X-Received: by 2002:a17:907:961f:b0:8b2:3eb6:8658 with SMTP id gb31-20020a170907961f00b008b23eb68658mr9464797ejc.0.1677682122631;
        Wed, 01 Mar 2023 06:48:42 -0800 (PST)
X-Google-Smtp-Source: AK7set92dBt8bcH0u8SZUcg7fEaeb3iC2XcaTDRsF3gZiSF9OJlHicCTVfXkqbC2EWAO2040o+eR1g==
X-Received: by 2002:a17:907:961f:b0:8b2:3eb6:8658 with SMTP id gb31-20020a170907961f00b008b23eb68658mr9464766ejc.0.1677682122307;
        Wed, 01 Mar 2023 06:48:42 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t6-20020a17090616c600b008d356cafaedsm5740721ejd.40.2023.03.01.06.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 06:48:41 -0800 (PST)
Message-ID: <2fb62d68-7414-64e2-a425-8cfaab23bcc5@redhat.com>
Date:   Wed, 1 Mar 2023 15:48:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 01/12] platform/x86: ISST: Fix kernel documentation
 warnings
Content-Language: en-US, nl
To:     srinivas pandruvada <srinivas.pandruvada@linux.intel.com>,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230211063257.311746-1-srinivas.pandruvada@linux.intel.com>
 <20230211063257.311746-2-srinivas.pandruvada@linux.intel.com>
 <39b98cb1-1ef5-dabf-5f01-2f673b2b59b1@redhat.com>
 <bc3ad416cf45aa1e8fe1f466a09a9388b0aaf7ab.camel@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <bc3ad416cf45aa1e8fe1f466a09a9388b0aaf7ab.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/1/23 15:48, srinivas pandruvada wrote:
> Hi Hans,
> 
> Since some patches you are adding to your review branch,
> shall I exclude those from new series by rebasing on 
> your review-hans branch?
> ?

Yes please rebase on my review-hans branch.

Regards,

Hans



> On Wed, 2023-03-01 at 15:23 +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 2/11/23 07:32, Srinivas Pandruvada wrote:
>>> Fix warning displayed for "make W=1" for kernel documentation.
>>>
>>> Signed-off-by: Srinivas Pandruvada
>>> <srinivas.pandruvada@linux.intel.com>
>>
>> Thanks, I've applied this patch to my review-hans branch:
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>>
>> I'll rebase that branch once 6.3-rc1 is out and then push the rebased
>> patch to the fixes branch and include it in my next 6.3 fixes pull-
>> req
>> to Linus.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>
>>> ---
>>>  drivers/platform/x86/intel/speed_select_if/isst_if_common.c | 3
>>> ++-
>>>  drivers/platform/x86/intel/speed_select_if/isst_if_common.h | 1 +
>>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git
>>> a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
>>> b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
>>> index a7e02b24a87a..63d49fe17a16 100644
>>> --- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
>>> +++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
>>> @@ -112,6 +112,7 @@ static void isst_delete_hash(void)
>>>   * isst_store_cmd() - Store command to a hash table
>>>   * @cmd: Mailbox command.
>>>   * @sub_cmd: Mailbox sub-command or MSR id.
>>> + * @cpu: Target CPU for the command
>>>   * @mbox_cmd_type: Mailbox or MSR command.
>>>   * @param: Mailbox parameter.
>>>   * @data: Mailbox request data or MSR data.
>>> @@ -363,7 +364,7 @@ static struct pci_dev *_isst_if_get_pci_dev(int
>>> cpu, int bus_no, int dev, int fn
>>>  /**
>>>   * isst_if_get_pci_dev() - Get the PCI device instance for a CPU
>>>   * @cpu: Logical CPU number.
>>> - * @bus_number: The bus number assigned by the hardware.
>>> + * @bus_no: The bus number assigned by the hardware.
>>>   * @dev: The device number assigned by the hardware.
>>>   * @fn: The function number assigned by the hardware.
>>>   *
>>> diff --git
>>> a/drivers/platform/x86/intel/speed_select_if/isst_if_common.h
>>> b/drivers/platform/x86/intel/speed_select_if/isst_if_common.h
>>> index fdecdae248d7..35ff506b402e 100644
>>> --- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.h
>>> +++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.h
>>> @@ -40,6 +40,7 @@
>>>   * @offset:    Offset to the first valid member in command
>>> structure.
>>>   *             This will be the offset of the start of the command
>>>   *             after command count field
>>> + * @owner:     Registered module owner
>>>   * @cmd_callback: Callback function to handle IOCTL. The callback
>>> has the
>>>   *             command pointer with data for command. There is a
>>> pointer
>>>   *             called write_only, which when set, will not copy
>>> the
>>
> 

