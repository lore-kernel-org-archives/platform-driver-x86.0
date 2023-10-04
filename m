Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C33E7B61D
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Oct 2023 13:48:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242594AbjJDNsc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 Oct 2023 09:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242671AbjJDNsc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Oct 2023 09:48:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F13EA9
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 Oct 2023 06:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696427262;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qrAPhlxhfRzByH1MSOVxC5BFup0yv+Gh+vPitP8DbHc=;
        b=G5P02qNX2dNl6QyBkYi6ctOGUrwNJ2rrOBwhXebBHT77S1uOW/uPHfw84zvQ5HV4RZinl/
        /zpcFo+XXADqIeUiv5+/RhQTl9wUQDebgkWa254hS9PHYUgVBOXS0CJNdKXkn5olHHKlpM
        p7NIRjVlgmEBa2vXeaj2oXxPJJX+dm8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-QVLfvItMP0a1SQIr7iYo9w-1; Wed, 04 Oct 2023 09:47:26 -0400
X-MC-Unique: QVLfvItMP0a1SQIr7iYo9w-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9ae57d8b502so193529766b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Oct 2023 06:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696427245; x=1697032045;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qrAPhlxhfRzByH1MSOVxC5BFup0yv+Gh+vPitP8DbHc=;
        b=vwNeb+zFbCnNyJM55jVqx7m2wQ5xrxEGyJwvcbyYaBYCrw7NYXPBIaKV1se//p+Ab6
         sYIK6fQ6rQvKX1/WsNuFIYeLSzvhgBPxXAIUkUc9ZqzBnxBVcmzxK50D5djD9kZM5jyx
         KNEGhygkVPgpLvQJMxeTVGorKK7PoyPNVut7/72ev7FM7mUdQhlvYzrNZWWDgf5hUhA8
         5Ou4bk3+uX/YGMbe/cY+9Pfe+wRx/WiS1HUGwVi/r5tbe4VUlFjFDFOXXHaHTZdhInF5
         KYbF9zZLjvZ9BooS1e1CG03jGDQcyvqyuKLZ7UJLvLz06wuMiQEZuhY3xEuQVnNwUNPD
         caHw==
X-Gm-Message-State: AOJu0YzQItU8Myhlbdb2pF4oCieGL7drbMU5LAFWLP3zMulJEKEGchnQ
        r+OYGI9rySS27Xs40j6NkwHGd/KO3D691qtN1baOF+8AYvPN/Da2vGonWwZ+YdZaXA6kNdQ+Jdd
        rO6iUIajXBRm7zPJlfvv4l8QgYk8fL/zulRWiDpWLAw==
X-Received: by 2002:a17:907:7631:b0:9a2:256a:65cd with SMTP id jy17-20020a170907763100b009a2256a65cdmr1760168ejc.4.1696427244851;
        Wed, 04 Oct 2023 06:47:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSd/sMwTZcUYza8PydPYy1GMui2kzoSaWLjhIVcW10JT9gfi6/MHnIk5+TzfR6H2BjLp9utw==
X-Received: by 2002:a17:907:7631:b0:9a2:256a:65cd with SMTP id jy17-20020a170907763100b009a2256a65cdmr1760153ejc.4.1696427244547;
        Wed, 04 Oct 2023 06:47:24 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l18-20020a1709061c5200b009ad81554c1bsm2816950ejg.55.2023.10.04.06.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 06:47:24 -0700 (PDT)
Message-ID: <575ef025-8d1a-98f8-dfba-e8f3cde019c0@redhat.com>
Date:   Wed, 4 Oct 2023 15:47:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] platform/x86: msi-ec: Fix the 3rd config
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Nikita Kravets <teackot@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
References: <20230929113149.587436-1-teackot@gmail.com>
 <20230929113149.587436-3-teackot@gmail.com>
 <b7bfc6a9-1dcc-89a8-c8a8-515d56faf35@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <b7bfc6a9-1dcc-89a8-c8a8-515d56faf35@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Nikita, Ilpo,

Nikita, great to see that you are back to contributing to
the driver upstream.

On 9/29/23 18:07, Ilpo Järvinen wrote:
> 
> On Fri, 29 Sep 2023, Nikita Kravets wrote:
> 
>> Fix the charge control address of CONF3 and remove an incorrect firmware
>> version which turned out to be a BIOS firmware and not an EC firmware.
> 
> Should there be a Fixes tag?
> 
>> This patch also renames fn_super_swap to fn_win_swap for consistency
>> with the downstream version of the driver.
> 
> Please don't mix changes like this.
> 
> Hans, what do you think about the rename in this patch?

I agree with you that the config fixes and the rename should be 2 separate patches.

> (To me "super" 
> sounds the normal terminology in Linux world so it feels a step 
> backwards.)

win/super is used interchangeable in many places and only old Unix/X11
folks really know/expect the super name.

So I'm fine with the rename.

Also as Nikita mentions this keeps the code in sync with the out of
tree driver, which currently has many more features then the mainline
driver.

The plan is to upstream those features one by one (or a few at a time).

Given the situation with an out of tree driver + a mainline one
for now keeping the per laptop model config in sync (which is the
trickiest part to test) is a good idea IMHO.

So ack from me for doing the rename.

Regards,

Hans




