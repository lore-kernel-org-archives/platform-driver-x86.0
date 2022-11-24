Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E66C4321E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Nov 2022 20:27:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbiKXU1m (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Nov 2022 15:27:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiKXU1l (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Nov 2022 15:27:41 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 472D7B70EC
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Nov 2022 12:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669321606;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g836Pwh04KdPl1iusSx+/s+xIxjZe5aKBl7TxwY+QmI=;
        b=VQ4eBzSSkS8USeOD+CraKdWb+ZdlbTMIGGwacU182FV0AIUG7GOk3HDISXng0Riexq6k+6
        Uh6c/qHTob24+strrjbiuPDrPC+dgs/IonyuLeNol0Ns0REsxCcoeCHQ2jyz4FmNg1cBLx
        PUpT40l/cREf0Tor+Sz7LiKkQ6273SI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-368-AV1eauh9M22z3zdqVtGfsQ-1; Thu, 24 Nov 2022 15:26:45 -0500
X-MC-Unique: AV1eauh9M22z3zdqVtGfsQ-1
Received: by mail-ed1-f70.google.com with SMTP id b14-20020a056402278e00b00469cb71480fso1390365ede.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Nov 2022 12:26:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g836Pwh04KdPl1iusSx+/s+xIxjZe5aKBl7TxwY+QmI=;
        b=CB+4UieNLxCECEByU9IUHmNRxOaojMXqF70IQf6g+ytl26fAsxG7Jvm5sO0y2PfOEN
         5cH4GoIG30b7PJtZ1R6vyuoU1PLChaxixKqxqyFJrgtwRlWg0Jb5aIEuN4O55mxgaCId
         S1tIBSg6FAu9dbY7vdLGtr6Sx8IKQJ3ENaFi8WKnr/xqzVMbDAVwVunNqx4nTFGoYJjb
         OeNItsubpkl1fLXhSeAA5fHoqzI469VnQkABnCNqjQA8d76Rn9sT2elmZyFF9gnsp7z4
         cEmCYODbyqKDph1Semc+FnLX44Gc/1vtP1tyusAB+XkzzV/AapuNL1toC/Jodwt2lzEx
         qapQ==
X-Gm-Message-State: ANoB5pkL5LEtgT3dakMKfPg3NTIXf4UpZHrc1LgUTusMNxq6b/cwUK/k
        lFlB/ThubWodYMWEL+yAdSRvoQTIankmcYGb9bfOi+aFlU40fd7BB8R2Cxo5mdDicItoSQ+kOK9
        xlt1U1dcTC1VZ4/rLlVK957/OCt25pLUuxQ==
X-Received: by 2002:a17:906:660e:b0:78d:b43c:81be with SMTP id b14-20020a170906660e00b0078db43c81bemr19593501ejp.600.1669321603916;
        Thu, 24 Nov 2022 12:26:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf52tYSctc81EuskerMxiOFFkAKKiNynC2MCz2INKH0VwxX+naz+qLW1TmtjAoiWwrBNJ9g73Q==
X-Received: by 2002:a17:906:660e:b0:78d:b43c:81be with SMTP id b14-20020a170906660e00b0078db43c81bemr19593485ejp.600.1669321603696;
        Thu, 24 Nov 2022 12:26:43 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id sg43-20020a170907a42b00b0073d81b0882asm801202ejc.7.2022.11.24.12.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 12:26:43 -0800 (PST)
Message-ID: <8da77836-c53b-8468-13ee-dc02eabfc8a5@redhat.com>
Date:   Thu, 24 Nov 2022 21:26:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/3] platform/x86: int3472/discrete: Get the polarity from
 the _DSM entry
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221124200007.390901-1-hdegoede@redhat.com>
 <20221124200007.390901-3-hdegoede@redhat.com>
 <CAHp75VcgRN=3O7cYsxVxcJ6PuSpDuZAs3ex0rhedaE94DBwBzg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VcgRN=3O7cYsxVxcJ6PuSpDuZAs3ex0rhedaE94DBwBzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/24/22 21:13, Andy Shevchenko wrote:
> On Thu, Nov 24, 2022 at 10:00 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The out of tree IPU6 driver has moved to also using the in kernel INT3472
>> code for doing power-ctrl rather then doing their own thing (good!).
>>
>> On IPU6 the polarity is encoded in the _DSM entry rather then being
>> hardcoded to GPIO_ACTIVE_LOW.
>>
>> Using the _DSM entry for this on IPU3 leads to regressions, so only
>> use the _DSM entry for this on non IPU3 devices.
>>
>> Note there is a whole bunch of PCI-ids for the IPU6 which is why
>> the check is for the IPU3-CIO2, because the CIO2 there has a unique
>> PCI-id which can be used for this.
> 
> ...
> 
>> +/* IPU3 vs IPU6 needs to be handled differently */
>> +#define IPU3_CIO2_PCI_ID                               0x9d32
> 
> If it makes more than a single driver, perhaps pci_ids.h is a good
> place to keep it there?

Yes, I've added a note to my TODO to clean this up in a follow-up
patch (the pci-ids.h maintainers want to see multiple users of
an id before accepting new ids in there).

> 
> ...
> 
>> +       dev_dbg(int3472->dev, "%s %s pin %d active-%s\n", func,
>> +               agpio->resource_source.string_ptr, agpio->pin_table[0],
> 
>> +               (polarity == GPIO_ACTIVE_HIGH) ? "high" : "low");
> 
> Parentheses are not needed, right?

Right, but I prefer to use them in conditional statements like these,
because I personally find that they make things easier to read.

Regards,

Hans


