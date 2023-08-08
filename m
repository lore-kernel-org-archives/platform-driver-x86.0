Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FFEC001B0
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Aug 2023 21:52:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbjHHVww (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Aug 2023 17:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjHHVww (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Aug 2023 17:52:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BBB712D
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Aug 2023 14:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691531525;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=irFVMLOEn+k+XTN2GD/NILLHK1tPorHJ0UIXqR+CLE8=;
        b=ESbRH24gMfXnlzxTZn79yeRe2l9akHTeBv7ZZO1UY1ndV4nlaiG1rvUk8rPfOnRJzL9CTG
        miCSkUCrSX5nWz0zcWZdWVGFjq2iqzUwvuBtw/XemEGJemC5KyufsHChKJSQ818YqP4u97
        4CO83q7fCSZ/z3dnjRBc6KGw9lJThWA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-ZRe0eXpRNBC4h9PUMBXERg-1; Tue, 08 Aug 2023 17:52:02 -0400
X-MC-Unique: ZRe0eXpRNBC4h9PUMBXERg-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-51866148986so4070226a12.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Aug 2023 14:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691531521; x=1692136321;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=irFVMLOEn+k+XTN2GD/NILLHK1tPorHJ0UIXqR+CLE8=;
        b=EJCmqUaAMrHlw8NEFmXYsDZP09Fby5/NfYBJkk3AWP4LqgNvAVHH5YePuogs3T9OqB
         oZ2BmVpusLMXinHDfkaHYQKxQUmcJl8E7aEPTn0s/Y7HX9X4lCJlewN+LtXUwnI7Qwoi
         FZo1Zp4ZRqaimA6RduOTarbiUW/EvqNINkpmkn13gPIGjNFsZnkkKpFegAUIjnyV1JpE
         5LxKwzOlderS/XWdSNijbmXudraTBGAwErt+H36xfgc0lG84c7PZEq2YknXQRO4qgihP
         3Vz+fCVk4cDzkfHvM/P8bsv5IpAnwKfp9Q/lhaLwKfVk/nbXR5tooLvgzu0FgWuOmO8U
         6GAA==
X-Gm-Message-State: AOJu0YzW2x9Q/9i627ewEx57a2iIU0fEux6bIg/6DRRXazj33reOhdLJ
        ox9jwm+L8Eme+YLN6gX+YOc+k24osy/IBWvysAMSvk2Dl/UBVoltvLhXBpTEfU9eTD4KLcLJEj2
        QcGaKC34403yr9gDYfcaaXgZ7+YG3LygZ8w==
X-Received: by 2002:a05:6402:10cd:b0:521:8777:b00d with SMTP id p13-20020a05640210cd00b005218777b00dmr735710edu.15.1691531521385;
        Tue, 08 Aug 2023 14:52:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFp6xNb3mk5D2sUVhHwLaXBN7n7DkWJKbPENHa7ETzVmYnMJpETNbtu2qnaUFQ5qMoVwUymgA==
X-Received: by 2002:a05:6402:10cd:b0:521:8777:b00d with SMTP id p13-20020a05640210cd00b005218777b00dmr735704edu.15.1691531521107;
        Tue, 08 Aug 2023 14:52:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id r14-20020aa7da0e000000b0052286e8dee1sm7176742eds.76.2023.08.08.14.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 14:52:00 -0700 (PDT)
Message-ID: <1ea7e949-e05b-985c-bb0c-6d0b00bb8b5f@redhat.com>
Date:   Tue, 8 Aug 2023 23:51:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] hp-bioscfg: Update string length calculation
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        thomas@t-8ch.de, ilpo.jarvinen@linux.intel.com,
        dan.carpenter@linaro.org
References: <20230801191629.45942-1-jorge.lopez2@hp.com>
 <4ab55129-d35c-fea5-0c59-5183928d55d1@redhat.com>
 <CAOOmCE_DGqUh3+8LmrX2_7eTeDG_7p7-JKN7Q2syvDQu60UWmQ@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAOOmCE_DGqUh3+8LmrX2_7eTeDG_7p7-JKN7Q2syvDQu60UWmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/8/23 22:25, Jorge Lopez wrote:
> Hi Hans,
> 
> On Mon, Aug 7, 2023 at 6:28 AM Hans de Goede <hdegoede@redhat.com> wrote:

<snip>

>> 3. ordered_list_data->elements_size is set but never validated. You should compare elem after the loop with ordered_list_data->elements_size and make sure they match. IOW verify that 0-(ordered_list_data->elements_size-1) entries of the ordered_list_data->elements[] array have been filled.
> 
> ordered_list_data->elements_size is checked against MAX_ELEMENTS_SIZE
> and not against the number of elements in the array.  Initially, size
> value was reported (sysfs) but after a couple reviews, size was
> removed from being reported (sysfs).  size value will be determined by
> the application when it enumerates the values reported in elements.

Right, but after splitting the string on commas there should be ordered_list_data->elements_size entries, right ? So we should verify that. Also what if the string after splitting has more entries then MAX_ELEMENTS_SIZE, then currently the code will overflow the array, so the loop splitting the string on commas should ensure that MAX_ELEMENTS_SIZE is not exceeded.

>>
>> 4. For specific values of eloc the code expects the current order_obj[elem] to be either an integer or a string, but this is not validated. Please validate that order_obj[elem].type matches with what is expected (string or int) for the current value of eloc.
> 
> The purpose for 'eloc' is  to help skip reading values such
> ORD_LIST_ELEMENTS and PREREQUISITES when ORD_LIST_ELEMENTS and/or
> PREREQUISITES_SIZE values are zero.
> Normally, 'eloc' and 'elem' are the same.

Never mind what I meant to say is that you should to a check like this:

                /* Check that both expected and read object type match */
                if (expected_order_types[eloc] != order_obj[elem].type) {
                        pr_err("Error expected type %d for elem %d, but got type %d instead\n"
                               expected_order_types[eloc], elem, order_obj[elem].type);
                        return -EIO;
                }

But I see now that that check is already there.

Regards,

Hans


