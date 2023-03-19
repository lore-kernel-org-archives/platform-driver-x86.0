Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A5AC7618A
	for <platform-driver-x86@archiver.kernel.org>; Sun, 19 Mar 2023 09:35:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbjCSJfQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 19 Mar 2023 05:35:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjCSJfP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 19 Mar 2023 05:35:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CB2361B8
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Mar 2023 02:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679218467;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3l3Cohef+/C49BE0XRs/3bpPxKkAQJtTFpabnonJtxI=;
        b=Uou3cSNQicdfJURr2pG3uMPd/zQQFXQag/XgPHWDjH6FcVur7eAr9zCLZ7vird/ZeDHgaD
        t0v1k7m/kAPUlcx9btDHdeqi3W16jcFBDMIfvOQxsc07EValUp3gQLUdvNKgd3EReD35tc
        sV+D4w9QONamVshAepT+oQcqzOcBui8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457--LrCVYBoNwiLYAEYM42DOA-1; Sun, 19 Mar 2023 05:34:25 -0400
X-MC-Unique: -LrCVYBoNwiLYAEYM42DOA-1
Received: by mail-ed1-f69.google.com with SMTP id e18-20020a056402191200b004fa702d64b3so13619435edz.23
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Mar 2023 02:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679218464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3l3Cohef+/C49BE0XRs/3bpPxKkAQJtTFpabnonJtxI=;
        b=O2JxmmHwsuFG7ng03OjR3IvOmQq66vI+fUuoAmTTzEeipkERBNy+lknTBALjmcHaI0
         R17M/QkBcdeHSv1OMoFTqjrHRKZxSdNJR6VLtLPgWi3wVx8+pOYtJgAD4WATLJZ5cJ3w
         QyNAhM9xtTDy4rPip7RRS7S/BRnLah491D/8E44bAMowBNoG9ghjtpG0ci2Lh2ESfHoH
         +QfAozyGTjhbbJFVgnNvMvPiiqEqYegnqn6P/f5EBM5wGq5iCv77+gIrPHgtEyEZonl6
         0M5P1b2ADXJFhhe0FT09wE7bl7DfcnK4O6ktgMnGe+Svpc38klzNpAx48lqC1Uu1tBHM
         nzrg==
X-Gm-Message-State: AO0yUKU2gs0OHxziiFuIZ+YdCMTZH2T8/rnjKDO5txExGnnBIvfYWATI
        zOZxbBGGtu1h4Xz0PUL8MLAPeIf9oqquk3dGqIBn9LCTBSp+OnHRTymvimlWQuLtzuVVPFq1FG7
        U5kMZf25Ej8klTSeuzMcq34SeQBvQ8466MXGq8abGNQ==
X-Received: by 2002:aa7:db52:0:b0:4fc:eee9:417 with SMTP id n18-20020aa7db52000000b004fceee90417mr8681969edt.18.1679218464153;
        Sun, 19 Mar 2023 02:34:24 -0700 (PDT)
X-Google-Smtp-Source: AK7set8UCQRl/0cWcIljSNt0oci81x/7Jtg88/VLGpLqKb8u1AcSJGUOB6Bju+8JOjMn3o4A71Leeg==
X-Received: by 2002:aa7:db52:0:b0:4fc:eee9:417 with SMTP id n18-20020aa7db52000000b004fceee90417mr8681961edt.18.1679218463861;
        Sun, 19 Mar 2023 02:34:23 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u20-20020a50a414000000b004fd1ee3f723sm3252625edb.67.2023.03.19.02.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 02:34:23 -0700 (PDT)
Message-ID: <0b88ffe5-dbc2-6dcf-23c7-0ddcd5f5a23d@redhat.com>
Date:   Sun, 19 Mar 2023 10:34:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 2/3] platform/x86: think-lmi: Add possible_values for
 ThinkStation
To:     Mark Pearson <mpearson-lenovo@squebb.ca>,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>
Cc:     "markgross@kernel.org" <markgross@kernel.org>,
        Mark Pearson <markpearson@lenovo.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <mpearson-lenovo@squebb.ca>
 <20230317154635.39692-1-mpearson-lenovo@squebb.ca>
 <20230317154635.39692-2-mpearson-lenovo@squebb.ca>
 <c6175d59-2000-4145-95a6-b022631bf3a3@t-8ch.de>
 <da0c88a5-d03f-4dc2-939d-f1e60bc7d3cc@app.fastmail.com>
 <e56512fa-b738-44f5-9dc4-57d46c994afd@t-8ch.de>
 <aa2f353f-6da5-4ec2-8a83-bffe310bd7b0@app.fastmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <aa2f353f-6da5-4ec2-8a83-bffe310bd7b0@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/19/23 01:08, Mark Pearson wrote:
> On Sat, Mar 18, 2023, at 7:52 PM, Thomas Weißschuh wrote:
>> On Sat, Mar 18, 2023 at 01:53:33PM -0400, Mark Pearson wrote:
>>> Thanks Thomas
>>>
>>> On Sat, Mar 18, 2023, at 12:35 PM, Thomas Weißschuh wrote:
>>>> Hi Mark,
>>>>
>>>> please also CC linux-kernel@vger.kernel.org and previous reviewers.
>>>>
>>>> On Fri, Mar 17, 2023 at 11:46:34AM -0400, Mark Pearson wrote:
>>>>> -static struct kobj_attribute attr_current_val = __ATTR_RW_MODE(current_value, 0600);
>>>>> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
>>>>> +		char *buf)
>>>>> +{
>>>>> +	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
>>>>> +
>>>>> +	if (setting->possible_values) {
>>>>> +		/* Figure out what setting type is as BIOS does not return this */
>>>>> +		if (strchr(setting->possible_values, ','))
>>>>> +			return sysfs_emit(buf, "enumeration\n");
>>>>> +	}
>>>>> +	/* Anything else is going to be a string */
>>>>> +	return sysfs_emit(buf, "string\n");
>>>>> +}
>>>>
>>>> This patch seems to introduce a lot of churn, is it intentional?
>>> Yes(ish). It got cleaned up as the functions were in a weird order when I introduced the is_visible. The actual changes are very small - but it did make it look messier than it really is.
>>> Is this a big concern? I know it makes the review a bit more painful and my apologies for that.
>>
>> Not a big concern. The shuffling around could be done in a dedicated
>> patch that explicitly only moves code around.
>>
>>>>> @@ -1440,6 +1451,25 @@ static int tlmi_analyze(void)
>>>>>  			if (ret || !setting->possible_values)
>>>>>  				pr_info("Error retrieving possible values for %d : %s\n",
>>>>>  						i, setting->display_name);
>>>>> +		} else {
>>>>> +			/*
>>>>> +			 * Older Thinkstations don't support the bios_selections API.
>>>>> +			 * Instead they store this as a [Optional:Option1,Option2] section of the
>>>>> +			 * name string.
>>>>> +			 * Try and pull that out if it's available.
>>>>> +			 */
>>>>> +			char *item, *optstart, *optend;
>>>>> +
>>>>> +			if (!tlmi_setting(setting->index, &item, LENOVO_BIOS_SETTING_GUID)) {
>>>>> +				optstart = strstr(item, "[Optional:");
>>>>> +				if (optstart) {
>>>>> +					optstart += strlen("[Optional:");
>>>>> +					optend = strstr(optstart, "]");
>>>>> +					if (optend)
>>>>> +						setting->possible_values =
>>>>> +							kstrndup(optstart, optend - optstart, GFP_KERNEL);
>>>>> +				}
>>>>> +			}
>>>>
>>>> The patch now does two things:
>>>> 1) Hide the sysfs attributes if the value is not available
>>>> 2) Extract the value from the description
>>>>
>>>> Maybe it could be split in two?
>>> Sure. I did contemplate that and then ultimately decided it was all from the same intent so left it. But I can split.
>>
>> Would look nicer to me, but it's only one opinion.
> 
> I have worked through this and it is nicer. Next version will be split (and I unwound some of the code re-org too).
> I'm going to hold off a couple of days before pushing the changes for review in case there are other pieces of feedback.

Thomas, many thanks for all the reviews!

Mark, since Thomas is doing such a great job of reviewing this patch-set, don't expect any remarks from me before you post the next version. IOW if the next version is ready, don't wait for my feedback before submitting it :)

Regards,

Hans


> 
> Mark
> 


