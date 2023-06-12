Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4212CC88CB2
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Jun 2023 15:26:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237781AbjFLP0M (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Jun 2023 11:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236807AbjFLP0C (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Jun 2023 11:26:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED1010F5
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jun 2023 08:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686583521;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i65rFJvHOOM8EKdbnoEWD9HJVU1NrRZ1Rpd5+Qn8ETo=;
        b=eRxXr6UFcwPWwmZXUSQQdS1oXHN4CP+TqRpaOOcaYdx0ZElgLHXDwUpPEFEMMNnJruap9R
        B0y1pX+B3LLv01F+VYd6ibP5jdCE3vZ1FRtMC39hsZkVU17kQA1UtFggz4QgQJ5gx6gnXT
        Ef+v/7kC/ki9+4qwtPTbEEX1niDZW4s=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-5dJ2zNnZOXyyrne-MR6FJw-1; Mon, 12 Jun 2023 11:25:19 -0400
X-MC-Unique: 5dJ2zNnZOXyyrne-MR6FJw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-97888a89775so414046066b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jun 2023 08:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686583519; x=1689175519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i65rFJvHOOM8EKdbnoEWD9HJVU1NrRZ1Rpd5+Qn8ETo=;
        b=JboRFEcnbCJ6yZQaWnXSGORokJ49Q8oD7wKWbktKgD0Bo/zD38sRNe+s/u2g0lLJLt
         LI2W6Tk8EQk0KFfZST/rLT6l25n8hpxhfamlfyCV9TvmyE2Q6XR9WWXmV4ICI5pVD21B
         m/77TOptRA3BrC9fMNHkim2oP72WGn5QK0y7ZFTcqsnIoMISEdp/qVQgJIuJI9Kd6i+x
         WVUVseYUJBdgu8Dg1MwRVQ7RkaKl9JuP5TKlgtg8r7JrfRaokj5SWiBcchqVRKuCptlW
         40nw9CRgiv8mzHqUBTwvJPiGND9Fv49RCeG1M2eciUElF6Xb1YoX8NaHK1FUylpgkIKu
         geYw==
X-Gm-Message-State: AC+VfDy9FynzkyYopFXTmb0V+mL1fi+tw7ke2ReaMuOF079PuBXKr9dC
        zEIK+FbE12mH0j7mAGw3mRU13Zy+K/h64JmX1bTL4d9vUs8IkaRd5jTi+fEa4fMHRr8MWAGdKgA
        9FtUPfvUfidkZ2TN9scxLIYbvk7vDstxl0w==
X-Received: by 2002:a17:907:9414:b0:979:65f0:cd07 with SMTP id dk20-20020a170907941400b0097965f0cd07mr8858674ejc.38.1686583518884;
        Mon, 12 Jun 2023 08:25:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Nc4IMoSj2ZsgsuRG+IJw0zAFVwvw9Uq2Ko1tpq5HVYaOQjhA9iU+dEIl9SarUmIgtYKzavQ==
X-Received: by 2002:a17:907:9414:b0:979:65f0:cd07 with SMTP id dk20-20020a170907941400b0097965f0cd07mr8858656ejc.38.1686583518494;
        Mon, 12 Jun 2023 08:25:18 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gj15-20020a170906e10f00b0096f4c9ce526sm5369256ejb.225.2023.06.12.08.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 08:25:17 -0700 (PDT)
Message-ID: <86828409-d95f-43a6-215b-b0bfbaf9f69e@redhat.com>
Date:   Mon, 12 Jun 2023 17:25:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] platform/x86: int3472: discrete: Fix getting
 active_value
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dan Scally <dan.scally@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20230612141632.5232-1-hdegoede@redhat.com>
 <CAHp75Ve3+XvsyrPauSzto0jU8Q1czM4Bj-qMquAc_WYK+ZHhxg@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Ve3+XvsyrPauSzto0jU8Q1czM4Bj-qMquAc_WYK+ZHhxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/12/23 16:18, Andy Shevchenko wrote:
> On Mon, Jun 12, 2023 at 5:16 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> acpi_object.integer.value is 64 bit, so to get bits 31-24
>> the value not only needs to be shifted but also masked.
> 
> Why? The type of active_value is u8. How does this make any difference?

Ah right I forgot about that, I'll drop this patch and drop the & 0xff for the second patch.

Regards,

Hans

