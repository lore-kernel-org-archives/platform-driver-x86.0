Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BC1C433E9
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 05:53:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01E842223D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 05:53:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727852AbhAZFxG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Jan 2021 00:53:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47768 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727899AbhAYMWn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Jan 2021 07:22:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611577261;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ItXIDDlxWzqbNe0PGEJa03zvd4jddkXrWlxbl3k5mXc=;
        b=DHRMI2reWugmCVG0Y3sY8CU+31FuZ2Or8sP6HFsAxavN08ohq3MH8ZLuDY4Yyvkb6L7CzH
        0xUVYoaNa+dbNq4fj3QxERfab3SPHid8xSJxFpRlld3IJHiAoF21yH+UNSXt9mCTkaULzO
        grwZ6ikcG4gtbVhYMKdaNJegtTi87Y0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-WVwF_XCxOIuBDjXLJlOCag-1; Mon, 25 Jan 2021 06:40:03 -0500
X-MC-Unique: WVwF_XCxOIuBDjXLJlOCag-1
Received: by mail-ed1-f70.google.com with SMTP id f21so7237040edx.23
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Jan 2021 03:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ItXIDDlxWzqbNe0PGEJa03zvd4jddkXrWlxbl3k5mXc=;
        b=pSi3P/Kbodqq02juAEOl5YGAAQJllB3QyoePKKxC/d5DuwCky3tXVAtxc/eQMed2Gb
         4/HC9y4E05QZwm4k9zfnVyje7bPYmFcIBvvQaMK4RVTEO1mCsgO5l1Wnx9iH0bnXilsY
         YtSGm6YA6UJhSy7GFr44EFyiieuqki4d3VokpSk0twOW9uC+lxxl8IrQ7o0nb7+E0my+
         hpEhG9gYJ+aVXpoZ8+XuW+1NVPEfXl+Kx+OzJ8MC6kGqXdx+Sv5WKrEazcqfpKm9XxuK
         i/Pcfux5zRT2/p62TAS7N3woVUxtizE/wvOgUBsX3CzJJniHX3e3Mz1KMRfvVG8hOm6E
         csdw==
X-Gm-Message-State: AOAM530n7/SaWex7OWOkbr7S0Nf8G3S8q+Asv2k5yeSQyZ/lRjgNxnO3
        9kL90HtrRDYORT7nNxYcp2zxaU+qM+XXTpcPCoBX14Aa1nD7/AhdlS3WGtpslJviM7JoVefJnAZ
        TLj6UquBg8QwSIpCVuYXnjpG40KYnnqT97w==
X-Received: by 2002:a17:906:2583:: with SMTP id m3mr67889ejb.499.1611574802415;
        Mon, 25 Jan 2021 03:40:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZmWWHMEARd48NZuMpjE/3GO4RZOZgCTk7d7/gWqtW6K27dTuAHkUvkQySDgRWmH5/c3FEJg==
X-Received: by 2002:a17:906:2583:: with SMTP id m3mr67884ejb.499.1611574802248;
        Mon, 25 Jan 2021 03:40:02 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id j5sm10596573edl.42.2021.01.25.03.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 03:40:01 -0800 (PST)
Subject: Re: [PATCH v2 09/24] platform/x86: ideapad-laptop: always propagate
 error codes from device attributes' show() callback
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Ike Panhc <ike.pan@canonical.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>
References: <20210113182016.166049-1-pobrn@protonmail.com>
 <20210113182016.166049-10-pobrn@protonmail.com>
 <CAHp75VfJBvG6ma0UxOjb4Wudeqpf9qrE3AtQ+nwwtsGhZ6fRpQ@mail.gmail.com>
 <b99c4482-faea-ff72-4367-8aeca7250040@canonical.com>
 <CAHp75Ve0hpfX6GPEH+ehCb-FsKomMwKRzkkD7Oup4utXSAidAA@mail.gmail.com>
 <8f9c5892-afad-7066-3a12-1c96c16dba8d@redhat.com>
 <CAHp75VdmwxZeqY3qdO6AuK3QTF=p+Wn9qByMsLEzaV4VV78QHQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <cbee040a-53c8-b58f-3231-58d774bbda0a@redhat.com>
Date:   Mon, 25 Jan 2021 12:40:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdmwxZeqY3qdO6AuK3QTF=p+Wn9qByMsLEzaV4VV78QHQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/25/21 12:35 PM, Andy Shevchenko wrote:
> On Mon, Jan 25, 2021 at 1:26 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 1/25/21 11:57 AM, Andy Shevchenko wrote:
>>> On Mon, Jan 25, 2021 at 9:37 AM Ike Panhc <ike.pan@canonical.com> wrote:
>>>>
>>>> On 1/17/21 3:49 AM, Andy Shevchenko wrote:
>>>>> On Wed, Jan 13, 2021 at 8:23 PM Barnabás Pőcze <pobrn@protonmail.com> wrote:
>>>>>>
>>>>>> Consumers can differentiate an error from a successful read much more
>>>>>> easily if the read() call fails with the appropriate errno instead of
>>>>>> returning a magic string like "-1".
>>>>>
>>>>> Is user space ready for this (for the record, it seems an ABI breakage)?
>>>>>
>>>>
>>>> read() and getting errno looks sysfs/driver broken to me. I think
>>>> if button/method is not available, it's better to be something like
>>>> sysfs_emit(buf, "%d\n", -ENODEV)
>>>
>>> Either way it will be an ABI breakage.
>>
>> True any change here will be an ABI breakage, but I really do not expect
>> anything to be dependent on this weird behavior of returning errors by
>> writing some magic value to the buffer, rather then just error-ing out
>> of the read() call.
>>
>> The kernel-convention here clearly is to make the read() syscall fail with
>> -ESOMETHING on errors. So I see this as making the driver conform to the
>> expected sysfs API behavior. Since this change is nicely split out into a
>> separate patch, we can always revert it if it turns out there actually
>> is something depending on this. But again I see that as highly
>> unlikely.
> 
> Me too. My point is that every stakeholder here understands that.
> Perhaps elaborated in the commit message.

Ack, adding a note about this to the commit message would be good.

Barnabás, can you add a note about this to the commit message?

Also I think we are about ready for you to post a v3 of this
series (when you have time to do so).

Regards,

Hans

