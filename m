Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 728EAC6FD1D
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Mar 2023 14:44:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231801AbjCTOo0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Mar 2023 10:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbjCTOoZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Mar 2023 10:44:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43FB21987
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 07:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679323421;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0qx5NcAUEINSBVNNk4KJj01aByZGag4lb+hp7kh66pg=;
        b=e1ImaQ0uPtIDUXn1aR0YD757Mz47Vc0kiPgLyjIVZmZwRZbFs4yQihPKDg5s2pEOpW8FwO
        chZTVD9ir7LPjTUOV7tFV9LSxuWEhVpqi7qAW3nWSY9qTqagJvB/1e79mxy0o1UKreliFq
        bjfTVON5BilKkv/wIc4WjIeNFrIYKtM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-mrfzfB8-O_qxSXYoiFuC4Q-1; Mon, 20 Mar 2023 10:43:40 -0400
X-MC-Unique: mrfzfB8-O_qxSXYoiFuC4Q-1
Received: by mail-ed1-f72.google.com with SMTP id i22-20020a05640242d600b004f5962985f4so18042320edc.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 07:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679323419;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0qx5NcAUEINSBVNNk4KJj01aByZGag4lb+hp7kh66pg=;
        b=CVv/x6X+TjfTIR98b7mNO0sH9fYvGDTVNvzMcVPC8Yi5k5wV1rzHBkDVm/c5bXGF0i
         4BFSAUVbC3/bqpRZRpWLu1tItoFaq3BX0sK2Gyd7+zoaQuKGlDgB6/LMH89W1a9MdmlU
         NLihKi5P9V6v+HlNj4sajNWo4oWxihpoSmZHzAUv3uyMnoIFKn3/HzDueKnUb+CSQZxs
         KUCo3PrWd5h30RfkNUyVgbRH/kEzXQBfQX9tDqruxu16+PUycQi7EcWnAw/Ngw5hGTt+
         dOGKumbz+dYNkAoxFI2eROoB1s3H1sm7p1miYn31921Kz/tIfyTSTjeZY6Gy6yHW86sC
         RFnQ==
X-Gm-Message-State: AO0yUKWscbSgvLEuyEN6humRDknQBmyFqtuyLAACmWGHSK1WnBV5ravh
        4rtYml7QjxlITIkRfl0SuZexJdyOiWiDqAOHS4AgLtjcXs7XLbZNudEMomfTcMfCbQMyVE7AUE7
        4i4tIsb47h1ZxqJSJ1sjDav2EjDAdejxfMA==
X-Received: by 2002:aa7:c611:0:b0:501:d532:d84e with SMTP id h17-20020aa7c611000000b00501d532d84emr522755edq.39.1679323419093;
        Mon, 20 Mar 2023 07:43:39 -0700 (PDT)
X-Google-Smtp-Source: AK7set+Bu9Iu7/5kIOOYvzdxXb9JEf5Cyj3BSKm/krBVcIZkEbDWPfuR9pC7GQvPv5gRwnumsMafJA==
X-Received: by 2002:aa7:c611:0:b0:501:d532:d84e with SMTP id h17-20020aa7c611000000b00501d532d84emr522746edq.39.1679323418852;
        Mon, 20 Mar 2023 07:43:38 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a37-20020a509ea8000000b0050050f6f432sm3536070edf.9.2023.03.20.07.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 07:43:38 -0700 (PDT)
Message-ID: <d8f60b98-6504-fd7d-4660-3196fab7466e@redhat.com>
Date:   Mon, 20 Mar 2023 15:43:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] platform/x86: Add driver for Yoga Tablet Mode switch
Content-Language: en-US
To:     Andrew Kallmeyer <kallmeyeras@gmail.com>,
        Armin Wolf <W_Armin@gmx.de>
Cc:     platform-driver-x86@vger.kernel.org, soyer@irl.hu
References: <20221004214332.35934-1-soyer@irl.hu>
 <20230310041726.217447-1-kallmeyeras@gmail.com>
 <20230310041726.217447-3-kallmeyeras@gmail.com>
 <91a25bfc-080d-b0e4-46cd-159bbf1346e8@gmx.de>
 <CAG4kvq8GMcw_ytss+e3y9nsaOAk9+m+TSnSBwcqdhqEOUJg_dQ@mail.gmail.com>
 <6592fd8f-f5fa-6144-e8eb-a9e701246ad7@gmx.de>
 <d00fbe99-6c82-ddfc-4e12-3dcb01eda0a6@redhat.com>
 <9b51d06c-d7b4-3886-4476-1c37f9400c62@gmx.de>
 <CAG4kvq-P=t08+=sjTNcLLgFrvhiyrdjpNyxEhMcV5rDOt3EtZw@mail.gmail.com>
 <CAG4kvq9h6tYg+Rarx+Y230ALiF5ZpCaaiLVnMrZKy+-hUhesBg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAG4kvq9h6tYg+Rarx+Y230ALiF5ZpCaaiLVnMrZKy+-hUhesBg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/18/23 18:55, Andrew Kallmeyer wrote:
> On Sat, Mar 18, 2023 at 10:50 AM Andrew Kallmeyer <kallmeyeras@gmail.com> wrote:
>>
>> Hi Armin, would it work to add the second GUID to the existing
>> wmi_driver wmi_device_id array? Then I could save the wmi_device in
>> the driver data on probe. Later when I get the notification on the
>> other GUID I would just call wmidev_evaluate_method on the saved
>> pointer out of the private data.
> 
> Now that I have understood the multiple probe calls and went back to
> read this, I realized that I would not be able to access the private
> data of the notify device when handling the probe call for the query
> device. Maybe you will have a good idea to solve this problem.

Right in this model you would need a global shared notifier_head
variable on which the event GUID driver would do a notify and
on which the other GUId driver would then register a notifier
to get called when the event GUID driver does the notify.

So as said this is somewhat involved and I'm fine with the simpler
current solution.

Regards,

Hans

