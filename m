Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45958C761A6
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Mar 2023 21:31:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbjCTVbE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Mar 2023 17:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbjCTVbD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Mar 2023 17:31:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E8A140DE
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 14:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679347696;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rSwzNHrH7zM5+huK/gC6WhPzesYw8I+UecWeaPfUJbA=;
        b=Rga9ooSaNolJByKW9wEQFoO0VWZrpPdlsAEhDUYWVJNm4SL4Gq2At7R3mO2QZ1gOQ65J4H
        hKz4ILhJgZyj0Dm0GbDsK/0MggPrAYIzro9A0mJr/9VSVWMLabgNlw1yyks4YKgvI7Ox2V
        hLE5EnvOMSXEjQ99aiE0Old4aEHKc60=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-xvU8skrUOjCbvZSlE2nKXA-1; Mon, 20 Mar 2023 17:28:14 -0400
X-MC-Unique: xvU8skrUOjCbvZSlE2nKXA-1
Received: by mail-ed1-f69.google.com with SMTP id t14-20020a056402240e00b004fb36e6d670so19111458eda.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 14:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679347693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rSwzNHrH7zM5+huK/gC6WhPzesYw8I+UecWeaPfUJbA=;
        b=nYojBzZUOGA04zV8GJCko+N6h9aR5g28N3qGbYy5UCmikp4gWPoIC7/Xz+H0Xp0be2
         kCokAdZOSnEpKswwNE0t/oiM8QCXuxtsJKUU2Jz9RU2ShKfDR6AWrSpC6tjDiTT2oL+k
         ZhWuCWQ1zaX1TJu5bT0Gyt1+9ft98qkV+onncftJIlE6Jwv8l/zfzm3yQ5QriNW2Wkpl
         EE6AHlhgB4ubwKBqzABcJ4Emd3hSih95G9FiG43FAA7Len2Ri47iRmr0Zbl7odg17hYT
         NsbW58obCt2Ygiy+EUfnwYmNAkiwCDw9TG98Bwab2VpFgWvY5zV/acp0fXmefBDOcrIZ
         WnJw==
X-Gm-Message-State: AO0yUKUWDQZN94DVr1vcgnirjm2KbwDH7V3IpPR9dKTpk3G5P5r2WfTt
        CF69Q7LUrSAFw8xS214WiDERb9I/VsMI+2FbD/Rn8hk1NkCyrD+UwmHCVWu8q5D43izuVhRn6J3
        XIdb7UnMdsG0DniXOoZQ5I0YjyUyp0JswnHgsMTD8fA==
X-Received: by 2002:a17:906:40c3:b0:92f:3e2b:fbb7 with SMTP id a3-20020a17090640c300b0092f3e2bfbb7mr522349ejk.14.1679347693293;
        Mon, 20 Mar 2023 14:28:13 -0700 (PDT)
X-Google-Smtp-Source: AK7set+pvcQh4m8dJtWKG3+6MXAdsbFa7euh5g8Dr9WZYSnnruigrvhRezs/8om+RbZ2+BerR/AR5A==
X-Received: by 2002:a17:906:40c3:b0:92f:3e2b:fbb7 with SMTP id a3-20020a17090640c300b0092f3e2bfbb7mr522336ejk.14.1679347693003;
        Mon, 20 Mar 2023 14:28:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u17-20020a170906409100b009338ad391b9sm2431653ejj.213.2023.03.20.14.28.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 14:28:12 -0700 (PDT)
Message-ID: <3f86f8a3-6767-5c72-6963-9d9d223c5e94@redhat.com>
Date:   Mon, 20 Mar 2023 22:28:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] platform/x86: Add new msi-ec driver
To:     Nikita Kravets <teackot@gmail.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Jose Angel Pastrana <japp0005@red.ujaen.es>,
        Aakash Singh <mail@singhaakash.dev>
References: <20230311144054.8754-1-teackot@gmail.com>
 <iPt1Reo37oGFvlRdQOY-3kZypWeV0pRah5oZ17K4xUOkeMqE7E43XQVyUX0A4a6oeEc1hPPzbjKcU3NznXUA3fnmp-foM3vuFSnA4YcFTDQ=@protonmail.com>
 <CAPXvF05AurS89f6bNg_5-VCS=vX=qMXbKgSdv5-wwBb8J3Xdcw@mail.gmail.com>
 <badebe08-7c9b-6f34-b938-b14c06a57985@redhat.com>
 <CAPXvF05Sp6jVGaMMPaSfFtaz=Ogt46E2fibu2Q_zBh=HnQzhGA@mail.gmail.com>
 <c8f12f66-829d-0222-9dde-80211d256e0b@redhat.com>
 <CAPXvF04RO=nfq6sSwPy2deYF+RVBWfRP+pOpG0a9k_-rVR77gg@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAPXvF04RO=nfq6sSwPy2deYF+RVBWfRP+pOpG0a9k_-rVR77gg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/20/23 22:26, Nikita Kravets wrote:
> Hi,
> 
> v3 is ready, but now that you've tested the driver on your devices,
> should I add modaliases before sending it?

Yes please.

Regards,

Hans

