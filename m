Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01CAFC433E0
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 15:34:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7881221F9
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 15:34:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbhADPe0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Jan 2021 10:34:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59756 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725889AbhADPe0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Jan 2021 10:34:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609774379;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SLb4fZfLiqO5vRQPaQ9+Ac7a0d4yDsd8OpbE704zoyI=;
        b=hfy3w+1JsMp6RfTMI+WfIOIXMyhu4bnvcorpZde+WuBQ2CxilUctKgFJsc6JhIJ4fNXc/Z
        N5uStb+tHbDGVwMpdrDlDzvaUROpyVxbKMAFQ705eYl8RSS6rfsP0AoebQu31w7iaU5gAp
        F9hyKAKaPLQb0MFk78XMhGIFE8nBhc0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-3bK-oq1IOhGouj0RTToQSg-1; Mon, 04 Jan 2021 10:32:55 -0500
X-MC-Unique: 3bK-oq1IOhGouj0RTToQSg-1
Received: by mail-ej1-f70.google.com with SMTP id dv25so7094775ejb.15
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Jan 2021 07:32:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SLb4fZfLiqO5vRQPaQ9+Ac7a0d4yDsd8OpbE704zoyI=;
        b=fANSpuVWj1gR4YePAklht9EeZZj4yRrzLp+zDpFM6ph8EgHqrPL6gm5UMOTDNZWgvX
         rXkHswSWcZvRlp7PVN5n7HFwsCDyGJZlrE8wp47BojOwx17Z3c8T9fFS96qxKvxjg9ZA
         8p09AYPAH10JT6ZwEAmAQ7RJxYoveN6YN2GIHh1xurkorIzOKmcJqchjORZNOMtOCamV
         yFkUZa1a965+uHxowst+fVafZx0V85pzcs9xYFIZed9xvGpTCgC/qWbl8NMS072avw4C
         2+FXcSlD/9AbihD2FzNIq27DI42RRZEkLJL0X0mJ35vru8vsvzPphQTO/dgueG51aSlN
         0X5g==
X-Gm-Message-State: AOAM532AoTxg1Na7/LeJqEP4Wumfqu3Af+IP/ebO39cdP0HJ6dtDxK1K
        6pzbawfks7Qa0D+kJ+EqxFNszGX5u479EawPmRUSQYnccUDB9wInUfAP72FP45mNRdQj9DcolPC
        5zI/+BBduC0yBK7gMoQ+32tTEnH3pnFzkQNPq07Ogwr8xUvGyXdrNuv10RPxmmuGwn27IMUNGzS
        1RsCeUyTVe+Q==
X-Received: by 2002:a17:906:a3c7:: with SMTP id ca7mr69081433ejb.523.1609774373834;
        Mon, 04 Jan 2021 07:32:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlykuxOXv8CmaxaCzv7WyuzFo/a+81GMLeam2ZJ2ABr/YWyj/xKn+0BHa5sqyk6I9UfGhR0Q==
X-Received: by 2002:a17:906:a3c7:: with SMTP id ca7mr69081417ejb.523.1609774373616;
        Mon, 04 Jan 2021 07:32:53 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id r24sm44054312edc.21.2021.01.04.07.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jan 2021 07:32:53 -0800 (PST)
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: correct palmsensor error
 checking
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20201230024726.7861-1-markpearson@lenovo.com>
 <CAHp75VfS3hAJ+vP54V+80zzWVW-+vYK-gGocRMrQhHkWnPXzXg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c99cbd33-4969-568a-205d-52c53509e586@redhat.com>
Date:   Mon, 4 Jan 2021 16:32:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfS3hAJ+vP54V+80zzWVW-+vYK-gGocRMrQhHkWnPXzXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/4/21 4:17 PM, Andy Shevchenko wrote:
> On Wed, Dec 30, 2020 at 4:54 AM Mark Pearson <markpearson@lenovo.com> wrote:
>>
>> The previous commit adding functionality for the palm sensor had a
>> mistake which meant the error conditions on initialisation was not checked
>> correctly. On some older platforms this meant that if the sensor wasn't
>> available an error would be returned and the driver would fail to load.
> 
>> This commit corrects the error condition. Many thanks to Mario Oenning
>> for reporting and determining the issue
> 
> Hint to the future (maybe Hans will fix this while it's in his review queue):
> we have a Reported-by tag. Of course if a person would like to avoid
> it, then it's fine.

I did notice this too, but I did not fix it. For future patches the right
thing to do is to ask the reporter if he is ok with a Reported-by tag being
added (which will expose their email to the world) and then proceed depending
on their answer, at least that is what I usually do. Although sometimes I do
just add the Reported-by tag, esp. if the email has been send to a (couple of)
lists, so the email already has been exposed to a large audience.

Regards,

Hans

