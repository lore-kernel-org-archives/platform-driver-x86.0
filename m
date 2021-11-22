Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B7FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Nov 2021 12:58:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235683AbhKVNB0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 22 Nov 2021 08:01:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21599 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239265AbhKVNBX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Nov 2021 08:01:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637585897;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PU5CWwHS5KgGZe7mNJd85fPMRm0r7g3noZfAlet6Fr0=;
        b=FjBrXCCMCUM2CbOoJLk2s6x6fRNz7hfDDisWprpw386QbBj6e5SMqoxjg8tutzWWeQFweN
        yaJnnUAyUca0ZsxDHfzGKT1yikMmum9nATGoA5n8NyvFSBB1qSiN5HjbaFhkUKrqRtp0eL
        ZJY/2W9mQxh4Hm0z25EPDrAiOIGuu98=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-dafTp3WrPAGDYyPMC-1Ujg-1; Mon, 22 Nov 2021 07:58:15 -0500
X-MC-Unique: dafTp3WrPAGDYyPMC-1Ujg-1
Received: by mail-ed1-f72.google.com with SMTP id bx28-20020a0564020b5c00b003e7c42443dbso14686530edb.15
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Nov 2021 04:58:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PU5CWwHS5KgGZe7mNJd85fPMRm0r7g3noZfAlet6Fr0=;
        b=EbE67HUnSosHDVRsUsX/ui3RnE5Pa0r6xyujHJLCEeoZ7fksZbtDmPTPDKVcX9Wlu+
         3F+/+rqWXvGwOLw58UfdLpI4+jyYSvc2MPQnjw4dB5GTkEAcGmt6344Mt0OKuC95C1ZR
         QXD9aIBc5Y5JREH4x1jEKPFbJ7oR2SRIJizM683CNKLAvtdW1Omrwpjrp9xyQALcQcuO
         MFBrZ3gbIrzvHUCFqt0ML2Fkpvx/zVD2OdyY+SRTav146bWOQnZMAsD4dXafV8X9ud5s
         j+STegkNwGTs4V8fNI25QU8Ku1hckJ6JBfudn9DeNHgjcOmaaTlLCy6oiuazmDbtmcTc
         BBew==
X-Gm-Message-State: AOAM5328wr0HoDYBEjLUzmVOTdAHjt0L5Nhsx2cUYfQE4sQAO0N6KZi7
        Jt0yVjm3bbj/z/pJbRpJ9bdHJCxgqzjER03R6hStarBwNeRWldhKVBYUj7GkOaRKdUH3aARVtyt
        SQ/V6uDfwnGyemUgzjXyiFV7oQliW6HWQfg==
X-Received: by 2002:a05:6402:2c4:: with SMTP id b4mr66000009edx.265.1637585894594;
        Mon, 22 Nov 2021 04:58:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCUbsNIeCmID4AtmYOVx3pUebB+jn7ippd1yqcNC+X2Pl3kbrSRAGdJCxFzbJjZY0rPLTDFg==
X-Received: by 2002:a05:6402:2c4:: with SMTP id b4mr65999980edx.265.1637585894464;
        Mon, 22 Nov 2021 04:58:14 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f22sm4150771edf.93.2021.11.22.04.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Nov 2021 04:58:14 -0800 (PST)
Message-ID: <f37c5f9c-b59d-5b54-ceb2-f040dc0cc643@redhat.com>
Date:   Mon, 22 Nov 2021 13:58:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/7] thinkpad_acpi: 1 bugfix + a bunch of cleanups
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20211121191129.256713-1-hdegoede@redhat.com>
 <CAHp75VdetJYu3noEis1f3Ad6bpSjVmBWqpNwQdW5LTRH4pu0KQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdetJYu3noEis1f3Ad6bpSjVmBWqpNwQdW5LTRH4pu0KQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/22/21 11:14, Andy Shevchenko wrote:
> On Sun, Nov 21, 2021 at 9:11 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> Here is a patch-series for the thinkpad_acpi driver starting with one
>> important bugfix which fixes a bug introduced by commit 79f960e29cfc
>> ("platform/x86: thinkpad_acpi: Convert platform driver to use dev_groups")
>> in platform-drivers-x86/for-next which is causing the driver to not load
>> at all on many devices.
>>
>> Followed by a bunch of cleanup patches.
> 
> It's right thing to do
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thank you, I've pushed the entire series to my review-hans
branch now.

Regards,

Hans


>> Hans de Goede (7):
>>   platform/x86: thinkpad_acpi: Accept ibm_init_struct.init() returning
>>     -ENODEV
>>   platform/x86: thinkpad_acpi: Make *_init() functions return -ENODEV
>>     instead of 1
>>   platform/x86: thinkpad_acpi: Simplify dytc_version handling
>>   platform/x86: thinkpad_acpi: Cleanup dytc_profile_available
>>   platform/x86: thinkpad_acpi: Properly indent code in
>>     tpacpi_dytc_profile_init()
>>   platform/x86: thinkpad_acpi: Remove "goto err_exit" from hotkey_init()
>>   platform/x86: thinkpad_acpi: Fix thermal_temp_input_attr sorting
>>
>>  drivers/platform/x86/thinkpad_acpi.c | 221 ++++++++++-----------------
>>  1 file changed, 78 insertions(+), 143 deletions(-)
>>
>> --
>> 2.31.1
>>
> 
> 

