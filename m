Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A2FC4743C
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Jun 2021 19:29:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 097786115B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Jun 2021 19:29:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbhFUTbl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Jun 2021 15:31:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56341 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230076AbhFUTbl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Jun 2021 15:31:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624303766;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+5DBBcXu844/3Vt4YtC/+AZxkkEhra8APi/dRr0AXCw=;
        b=YcP3sGnQGBpIMrg1YDKraQtUVKtf2ub3abRoBQgOgULuM/7ub3/Hgz4BRn+B3DaAwYtBov
        3OKLeNnwmTCU7U1Km3s3bgvIVQP4zvMUsC1GloHKnU0YFEtcC7q/9bSqU2uoGJgM5kCQqv
        jfUtOxV+68X5gq6jmR5SuXYOIXQPztM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-DwFfQMBsPVmcuAEAUW8Giw-1; Mon, 21 Jun 2021 15:29:25 -0400
X-MC-Unique: DwFfQMBsPVmcuAEAUW8Giw-1
Received: by mail-ed1-f72.google.com with SMTP id c9-20020a05640227c9b0290394ac48c2e4so2708893ede.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Jun 2021 12:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+5DBBcXu844/3Vt4YtC/+AZxkkEhra8APi/dRr0AXCw=;
        b=drCkURK2zpl3fd7o68C1mMT+u/20bi92ZlqZautU74zrVmgYeQA28E/HADzvcbvmmS
         0PVOv3vZLJkgcqJzuhMx3RIOhqzeNGiMCOkDLcfJgOhGopgKpqweXLmAxg2ksrPDbdWs
         QK4dOEby9GVqHvdpaF0qpkYejRLOtBcSDsdbccZjK/0plgR/EeigQYXLbq4Zbxl7eQY0
         kEUP5jVStYuBjfmA4lXRxTdH29gxNZ+q5gyBplNQSE60m3mhshdS1v+lcwGqXyupmPHB
         uTdiHRwXPoB7/Y68wKijE+iTKS7xXd1KBCFd6HPe2nHDtvXVvw6ANCIdGKCZDCu6ieI9
         f/wg==
X-Gm-Message-State: AOAM531gyzizMHXRBbn1w5J9LxPwMX9WNDVzqnBbzBEitpZHsRoEyzm4
        wImdfmAMf28YWvtXI+xPJGHF+9KvdBi2idpIh61G8tDdoihH+ycpXVTwEBBfFfXBvb/F3W7N/5j
        Cih4nbqXC1AoOHxM27gOl4qC+WQ9QyuL0A7i1O+VOXMCp6JGamRawXgk52AokSaz9+gJP6HNkMo
        c8r5Qkj/oz0g==
X-Received: by 2002:a05:6402:845:: with SMTP id b5mr23474498edz.266.1624303763810;
        Mon, 21 Jun 2021 12:29:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzItT5o78dY1S0aZjgVUgq4ft+yUX6c8gP3fOTb28GYnHsGfFmks9JFl+2Q82GZKH2HIFzDAg==
X-Received: by 2002:a05:6402:845:: with SMTP id b5mr23474486edz.266.1624303763632;
        Mon, 21 Jun 2021 12:29:23 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id jx17sm2018142ejc.60.2021.06.21.12.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 12:29:23 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: think-lmi: Return EINVAL when kbdlang gets
 set to a 0 length string
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20210621132354.57127-1-hdegoede@redhat.com>
 <CAHp75Veh-t0KO4To8gbZej1bifJbrc3ppxnLzun0BcbsOBqZnA@mail.gmail.com>
 <ca520d5f-0288-30ef-0191-96f890a2ba4c@redhat.com>
 <CAHp75Vcu+3-7dQwJDTLfQVwvSsOB9uOby7rq4w4cxLKMn1q+oA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <46f21a08-7e99-012e-bf87-b2319b8c1db7@redhat.com>
Date:   Mon, 21 Jun 2021 21:29:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAHp75Vcu+3-7dQwJDTLfQVwvSsOB9uOby7rq4w4cxLKMn1q+oA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/21/21 6:16 PM, Andy Shevchenko wrote:
> On Mon, Jun 21, 2021 at 5:13 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 6/21/21 3:58 PM, Andy Shevchenko wrote:
>>> On Mon, Jun 21, 2021 at 4:24 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Commit 0ddcf3a6b442 ("platform/x86: think-lmi: Avoid potential read before
>>>> start of the buffer") moved the lengt == 0 up to before stripping the '\n'
>>>
>>> length
>>
>> Ack, will fix.
>>
>>>> which typically gets added when users echo a value to a sysfs-attribute
>>>> from the shell.
>>>>
>>>> This avoids a potential buffer-underrun, but it also causes a behavioral
>>>> change, prior to this change "echo > kbdlang", iow writing just a single
>>>> '\n' would result in an EINVAL error, but after the change this gets
>>>> accepted setting kbdlang to an empty string.
>>>
>>> And why is it a problem?
>>
>> Because there are only a couple of valid string like "de", "fr", "es"
>> and "us". We don't know the exact set of valid strings for a certain
>> BIOS, but we do not for sure that an empty string is not valid.
> 
> Since we call strlen() on the buf it means we are expecting
> NUL-terminated string no matter what.
> In this case the
> 
>   p = skip_spaces(buf);
>   length = strchrnul(buf, '\n') - p;
>   if (!length || length >= ...)
>     return ...
> 
> seems the best, no?

I don't see the need to skip any leading whitespace, we don't do that
for any of the other attributes either, so that would be inconsistent,
other then that I think using strchrnul to calc the length +
skip the '\n' in one go is a good idea. let me send out a v2.

Regards,

Hans

