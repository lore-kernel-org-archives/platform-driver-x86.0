Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F383C4332D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 05:53:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A9FD2223D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 05:53:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728070AbhAZFxS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Jan 2021 00:53:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46802 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728154AbhAYMmT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Jan 2021 07:42:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611578401;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1Ym5PHTKPWPOLf8d0WlAx/Fb0LftgVbNw31j7r0xpfc=;
        b=dY4kqTbCosGFTVlDGagsXKb1uaA/bpVhiNVWlngM/w9yxgUr0nXLC2M0M3LaKGjbr58l5l
        zY8iKkTrjnQpfVw7yaU6rWDMWIQzM9CfkUnKtt84B4e4gLnpeKbFfwO2u6E9L/5wF+EvXA
        a3Ev7lCHMBuCxoWHP+fPqqJu2ntC8YM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-U_TVjInnOfSMP9mRQE-RFQ-1; Mon, 25 Jan 2021 06:26:50 -0500
X-MC-Unique: U_TVjInnOfSMP9mRQE-RFQ-1
Received: by mail-ed1-f70.google.com with SMTP id a24so7171711eda.14
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Jan 2021 03:26:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1Ym5PHTKPWPOLf8d0WlAx/Fb0LftgVbNw31j7r0xpfc=;
        b=D5Tupk6hMkbGLRwf+Q7LIIX8Ojd0Haj9f9j91EsAg2TkvUzqzK5Gm66lsYHIasX15Z
         s93OmpijZIHaMP+/4F6PgLWIuhytCPUN9v3DcUDoNUAIMCeWu5S30xikmSZJJb/5tlT2
         t7z+dbxVDFjJpreeVDNjXLphEnoKUALovI/AfitPtpYnLEayxebkZf8g57xXsQC3JntZ
         7xWmJHXPWj1GS7qY4FoLhzJ074ClLtLTyp0nkyyVS8J8Vofy6L9ho9qiSsW8vIo7nN4M
         eI2/4AJMJOhMYE8GqM3rz5SYn5se14qvMO8D+TJdf3tJB8nzxV7QIdwJdNeRLhztoZRK
         VnLA==
X-Gm-Message-State: AOAM532HoXITX1az5yi3hoBymfzDs0HoXMJZrEFz+nRobozZXDBSo7MU
        lYmrZpqGwVlvOF9NOq42YRAeH9PpKGQT12tHG5KZbwwFc8AxJq3RBbSSgf/cxIz6I3c6+Npyp3v
        /YpZQKf04S7q7yh3Z2L4OOVp29WyCpWWkjA==
X-Received: by 2002:a17:906:248e:: with SMTP id e14mr41071ejb.495.1611574009184;
        Mon, 25 Jan 2021 03:26:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhzPrjFD6h0h+0aqusTXLnxD0aow8cTexptgbaIwSWFF6/tTIpbrdpFR7CCXoweAdwIh+d2Q==
X-Received: by 2002:a17:906:248e:: with SMTP id e14mr41063ejb.495.1611574009044;
        Mon, 25 Jan 2021 03:26:49 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id n5sm8699456edw.7.2021.01.25.03.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 03:26:48 -0800 (PST)
Subject: Re: [PATCH v2 09/24] platform/x86: ideapad-laptop: always propagate
 error codes from device attributes' show() callback
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Ike Panhc <ike.pan@canonical.com>
Cc:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>
References: <20210113182016.166049-1-pobrn@protonmail.com>
 <20210113182016.166049-10-pobrn@protonmail.com>
 <CAHp75VfJBvG6ma0UxOjb4Wudeqpf9qrE3AtQ+nwwtsGhZ6fRpQ@mail.gmail.com>
 <b99c4482-faea-ff72-4367-8aeca7250040@canonical.com>
 <CAHp75Ve0hpfX6GPEH+ehCb-FsKomMwKRzkkD7Oup4utXSAidAA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8f9c5892-afad-7066-3a12-1c96c16dba8d@redhat.com>
Date:   Mon, 25 Jan 2021 12:26:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Ve0hpfX6GPEH+ehCb-FsKomMwKRzkkD7Oup4utXSAidAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/25/21 11:57 AM, Andy Shevchenko wrote:
> On Mon, Jan 25, 2021 at 9:37 AM Ike Panhc <ike.pan@canonical.com> wrote:
>>
>> On 1/17/21 3:49 AM, Andy Shevchenko wrote:
>>> On Wed, Jan 13, 2021 at 8:23 PM Barnabás Pőcze <pobrn@protonmail.com> wrote:
>>>>
>>>> Consumers can differentiate an error from a successful read much more
>>>> easily if the read() call fails with the appropriate errno instead of
>>>> returning a magic string like "-1".
>>>
>>> Is user space ready for this (for the record, it seems an ABI breakage)?
>>>
>>
>> read() and getting errno looks sysfs/driver broken to me. I think
>> if button/method is not available, it's better to be something like
>> sysfs_emit(buf, "%d\n", -ENODEV)
> 
> Either way it will be an ABI breakage.

True any change here will be an ABI breakage, but I really do not expect
anything to be dependent on this weird behavior of returning errors by
writing some magic value to the buffer, rather then just error-ing out
of the read() call.

The kernel-convention here clearly is to make the read() syscall fail with
-ESOMETHING on errors. So I see this as making the driver conform to the
expected sysfs API behavior. Since this change is nicely split out into a
separate patch, we can always revert it if it turns out there actually
is something depending on this. But again I see that as highly
unlikely.

Regards,

Hans

