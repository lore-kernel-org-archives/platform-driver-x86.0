Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79418C6FD1D
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Mar 2023 14:21:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbjCTOVX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Mar 2023 10:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbjCTOVW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Mar 2023 10:21:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C446B1F5F0
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 07:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679322036;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZpIu4sepM07Kopfud0ivEOBiwO1magXEs5WlH8ZDDFY=;
        b=ZgpBoEUP6qkoYMpNvHqYa0Sq2jZLQslL8g2Hp9TNRwVUtiqgEkf3143Bf0LpovUA1Qlzdt
        pMRxQeOxabizj3eg8OWHKlBmtMyqnd8nlK4WnfK6Oyn8k3peOecw1dTL5a5oiL50SYTBHE
        2CB8CbzsmwDVTIpC1uaCnPmdXeZOEHk=
Received: from mail-ed1-f71.google.com (209.85.208.71 [209.85.208.71]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-441-fHMBzZLvPFWtKgIxbiI-yg-1; Mon,
 20 Mar 2023 10:19:08 -0400
X-MC-Unique: fHMBzZLvPFWtKgIxbiI-yg-1
Received: by mail-ed1-f71.google.com with SMTP id r19-20020a50aad3000000b005002e950cd3so17929505edc.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 07:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679321941;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpIu4sepM07Kopfud0ivEOBiwO1magXEs5WlH8ZDDFY=;
        b=xggcWsRDzYUJ3MhrN1Tk/Mg8IFjSxmUAhPf58S2+PW4Q0eXJH8XOUfya2ermHUZWax
         BPJRZafVBN0TlPemSj1DJWSeIdHx35Wcq4/fccHyYZONoE5EUNOYClAqSPzXYqwEvZUK
         HQ3kQrE4tG8YC0oPyGXpzpaAguB5xy4D/iDM8LIqFHAkdCozbC6Y/HVMdZNk8sqr0Hn4
         ZyOkE6Au/2tJ+r73Q5IWpLl0sieEXtAy3GH7QTF+IvHRGML2kG6vz6KyB7SrTEk8ENZr
         AcvekSdyS7JxR/L/5J4NUVyGUqzvyyaa8/oopkfwDsZYH5YHnhrebk5kj3xq99pbwqFL
         oT2g==
X-Gm-Message-State: AO0yUKVl7Pr50+Z+EyiNCWJ2cK2n9fwjf7xmDOzIB3Dg314NmDRSMuOb
        21KR50nAjbI+AQ4HSh5zbfunhX7R4pQV0qYlFFHjlJtoCxxE2aFe98B5UL0fyEAUzDDOshKsLl3
        XYTqDHRQr3PfuSekepJEg1VhfXc63/eR1Pg==
X-Received: by 2002:a17:906:c2c9:b0:930:2530:5f47 with SMTP id ch9-20020a170906c2c900b0093025305f47mr8894885ejb.11.1679321941608;
        Mon, 20 Mar 2023 07:19:01 -0700 (PDT)
X-Google-Smtp-Source: AK7set+DtqHnkRjz5U7GES9J3C1zgX5/8MRmt8UD1epGGfgQUfJLVo55jkDa8GbJC17jZO46NUTqaw==
X-Received: by 2002:a17:906:c2c9:b0:930:2530:5f47 with SMTP id ch9-20020a170906c2c900b0093025305f47mr8894870ejb.11.1679321941375;
        Mon, 20 Mar 2023 07:19:01 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id f22-20020a170906825600b00925ce7c7705sm4457497ejx.162.2023.03.20.07.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 07:18:59 -0700 (PDT)
Message-ID: <87382b5e-f3f8-601c-77ff-ecd44d911042@redhat.com>
Date:   Mon, 20 Mar 2023 15:18:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] platform/x86/intel/pmt/telemetry: Add driver version
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "David E. Box" <david.e.box@linux.intel.com>
Cc:     irenic.rajneesh@gmail.com, david.e.box@intel.com,
        markgross@kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20230316225736.2856521-1-david.e.box@linux.intel.com>
 <20230316225736.2856521-2-david.e.box@linux.intel.com>
 <CAHp75VcP5jf4Tt-U7cs77gnTcUpQbQ+exXjOOc5epPRDfT0h0Q@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VcP5jf4Tt-U7cs77gnTcUpQbQ+exXjOOc5epPRDfT0h0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/17/23 14:35, Andy Shevchenko wrote:
> On Fri, Mar 17, 2023 at 12:57 AM David E. Box
> <david.e.box@linux.intel.com> wrote:
>>
>> Add a driver version number to make it easier to track changes in
>> backported kernels.
> 
> Sorry, but NAK. As Greg KH said, we do not use this anymore (in Git
> era) ­— the SHA from the Git _is_ the version of the driver.

I agree with Andy per driver version numbers are really not useful.

Generally speaking the version number will get updated say once
per upstream kernel-release in a separate commit, but there is
no guarantee that commit will get cherry-picked together with
other cherry-picked fixes.

So for downstream kernels these version numbers really don't
have any meaning and as such are useless.

Regards,

Hans

