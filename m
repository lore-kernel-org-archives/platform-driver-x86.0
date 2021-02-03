Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788D7C433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 13:00:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3514564E4F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 13:00:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbhBCNAM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 08:00:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45288 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230316AbhBCM6m (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 07:58:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612357035;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PbDzg5mna/n7BOv+yqBmvSZFWGU9W3eHEMJCt8Uapvk=;
        b=CJJ+kHD34gWL8i964A/jJAIWdEsejlhiE8PtedSeRpO/H9gL/SgZiFPlJNUT+g2Zs9QvcU
        PYA1ImBYx2Q3plLVibDqEtgC5oD1KbRm1ykxMFMexIpLwGvB7scj90ah3rK8pymuwcXcKd
        2g4vBiUwAx3Qo79NqXkWPOdwfxEpOgc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-EVttOeDaN2iRwXX3htH5UQ-1; Wed, 03 Feb 2021 07:57:13 -0500
X-MC-Unique: EVttOeDaN2iRwXX3htH5UQ-1
Received: by mail-ed1-f69.google.com with SMTP id t9so11448633edd.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 03 Feb 2021 04:57:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PbDzg5mna/n7BOv+yqBmvSZFWGU9W3eHEMJCt8Uapvk=;
        b=EzmjWV24w6PiS0eJyOhGtcdix24JI8E+emOtEnwrMwEaGck4p46k0Kian2To1U8Gj0
         sOBVwFWhJeI+fKlgXPNc9EO0TPda9ECtp3FC+1R8UGDVWTbFmG2JuSQGROOhTmL8bKLn
         eYGLXmeGr+uVO29MQbjqeHgg5R6CQHyu9N8PYFEz44tMjh6L33LwvN1uzLzKleY8zx37
         JAlBRKgqXeAK+zT5rIxrBFrtkh8hBhNrstCQhKhXAJCsLqv8T10F/e6xO7DKDtNzoza6
         CqRleN+TcxRIwXrUT4mkC97o8upvALgaSzytAAUtZ0xyYDY8flga0rWNS57fmGvOuEeA
         1Z9Q==
X-Gm-Message-State: AOAM532oNQUYGs/x0GOfe++Unwxikdx9qocvTmoouw72CV4bO6F+CWec
        r2yO/EFSY4ca1Zqywjtj7mY/Av03DqTFqRmjievPlrqrj5i57xPxG2skE7LFsxou+G+pNjaOnl2
        z6OwmijwpDaDGQRBfmROTupNAlM16DVVL7JiI7CodUMl1YaFGIuSrxYqkO1NWFSGa1b2Yd+Ye39
        m57RgZ81CR3A==
X-Received: by 2002:a17:906:4694:: with SMTP id a20mr2896267ejr.201.1612357032030;
        Wed, 03 Feb 2021 04:57:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcX/my9JfXRcZuKhkDjZm/bMS68ttgwf/dBXrJEpb9O6A8k7uBg3Fbdnjo4WwmD6USj+rwNQ==
X-Received: by 2002:a17:906:4694:: with SMTP id a20mr2896252ejr.201.1612357031790;
        Wed, 03 Feb 2021 04:57:11 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id b1sm982995eju.15.2021.02.03.04.57.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Feb 2021 04:57:10 -0800 (PST)
Subject: Re: [PATCH v1] platform/x86: Kconfig: Surround WMI drivers by 'if
 ACPI_WMI'
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20210126140052.3451769-1-andriy.shevchenko@linux.intel.com>
 <3578abae-bf14-c3fe-7726-25358e8993ea@redhat.com>
 <6b88be94-cc9c-e86c-82bc-f0d72e0c1c4f@redhat.com>
 <YBqJ7VmchoG6Kt8t@smile.fi.intel.com>
 <c3fc4dfd-13b5-73c0-7d97-cdab0b61f170@redhat.com>
 <CAHp75Vc1EMUKLoBAaUSqD-TeBuSQbe1gHPGjisp_-W7uWyc1ug@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1508278f-eac4-2df3-ca94-d99f4fd2a3a2@redhat.com>
Date:   Wed, 3 Feb 2021 13:57:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAHp75Vc1EMUKLoBAaUSqD-TeBuSQbe1gHPGjisp_-W7uWyc1ug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/3/21 1:16 PM, Andy Shevchenko wrote:
> On Wed, Feb 3, 2021 at 2:13 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 2/3/21 12:33 PM, Andy Shevchenko wrote:
>>> On Wed, Feb 03, 2021 at 11:55:40AM +0100, Hans de Goede wrote:
>>>> On 2/3/21 11:48 AM, Hans de Goede wrote:
> 
> ...
> 
>>>> So I still think just sorting the entire bups alphabetically
>>>> is better. We can then also add a comment at the top to please
>>>> keep things sorted alphabetically.
>>>
>>> In long term I prefer split the entire folder to subfolders where you create
>>> a new Kconfig with a rules like alphabetical order or so.
>>>
>>> Shuffling now Kconfig and Makefile w/o above doesn't bring a value in my
>>> opinion.
>>
>> Ok, lets keep things as is for now then and hopefully in the future
>> someone will have some time to clean this up a bit.
> 
> Or ask contributors from corresponding companies (Dell, Lenovo, etc)
> to sort this out at least for their devices. Good we have no surface
> issue with this, since it's in a separate (sibling) folder.

The biggest group of drivers seem to be Intel drivers, so perhaps
Intel can set a good example here by moving their drivers to one
or more sub-folders ?

Regards,

Hans

