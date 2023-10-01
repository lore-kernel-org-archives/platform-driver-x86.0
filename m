Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F2AE748ED
	for <platform-driver-x86@archiver.kernel.org>; Sun,  1 Oct 2023 08:56:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234627AbjJAI4k (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 1 Oct 2023 04:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234625AbjJAI4j (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 1 Oct 2023 04:56:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C72BD
        for <platform-driver-x86@vger.kernel.org>; Sun,  1 Oct 2023 01:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696150554;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mPE10IJGRNlrwSUAgF3AKhKtgeEbRkyMBAYmLJmNRH8=;
        b=hDalG/Ha8+0neA3eOITaZzSnxYWTAGf3Ak0YEaYB3ukNlJy/Sfnpkxd1bm+31VKxisoF59
        xFJXxWmAkCjq8VMGaKtdgsRFcWG852yXAlFwBjMplC2lMJKsfTZekYAy2wxbYg9aRUKhjH
        /w1Qq7FVOHHqipnRzM3qiL991ttRHGE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-nK3Th7MaOv60e8d53_FY8w-1; Sun, 01 Oct 2023 04:55:42 -0400
X-MC-Unique: nK3Th7MaOv60e8d53_FY8w-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-32339eee4c4so5729724f8f.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Oct 2023 01:55:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696150541; x=1696755341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mPE10IJGRNlrwSUAgF3AKhKtgeEbRkyMBAYmLJmNRH8=;
        b=oI+SNe/9Iyx2e2oJE4OkUPIFosmyPHD0B9clIV2b2Es3BW3R61PAwjCyhvzuZrFAST
         D9bCVZHh6W1BBgnTjmlzLNrOzYMXpQV0RRb3HJ249QNCc9AU5STWPUbqpC8+Dcw+kp0u
         RHkGKq0mQBSrH/XlsVFOT6UbURe/0apVoOFJuFMvtsBQQEVHbpIrRbYvshuWa7vsfl6j
         V4xy2bVTZdcl0j28SpbO1eR36uoajCJJKSJOXdtNg9R+8IJSiFGuaNDPlV0gKX4C/R9Q
         thL/zoT8hDjF81yUzQ9akiV36ukQJu6J+5jwXtgoFIRpgAYWo0A6hfSCijOrMtWCc0CQ
         Ru+A==
X-Gm-Message-State: AOJu0YyczWk2MDxbwK2gCAWFcC2pHYdKpSpMZkYVnOxo0HSwNmaOgp68
        TnfrQuDb1AwOCV3JSfRDUKz4zdhYJ+j8DOUFybBUmWRuuc4CT0CEOvvq4Vu67RuKZoCVwju88LW
        E5qroghT2ynwhNy9A641gtT+XTSWEoEQZIQ==
X-Received: by 2002:a5d:610a:0:b0:314:1f1e:3a85 with SMTP id v10-20020a5d610a000000b003141f1e3a85mr6980698wrt.61.1696150541548;
        Sun, 01 Oct 2023 01:55:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSbH8Wg2khX9CeFAnrk0hxbXqrpe4hXgd+vt+57kWKXw4u/QLJ4vSOzdVhttX79b9XtDi9qw==
X-Received: by 2002:a5d:610a:0:b0:314:1f1e:3a85 with SMTP id v10-20020a5d610a000000b003141f1e3a85mr6980679wrt.61.1696150541268;
        Sun, 01 Oct 2023 01:55:41 -0700 (PDT)
Received: from [10.10.158.202] ([213.144.205.82])
        by smtp.gmail.com with ESMTPSA id t10-20020adff60a000000b0031c5e9c2ed7sm25367214wrp.92.2023.10.01.01.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Oct 2023 01:55:40 -0700 (PDT)
Message-ID: <b72b3fbf-36d1-2551-ac4a-f98808e1e4dd@redhat.com>
Date:   Sun, 1 Oct 2023 10:55:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/5] platform/x86: int3472: Add new
 skl_int3472_gpiod_get_from_temp_lookup() helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230926145943.42814-1-brgl@bgdev.pl>
 <e6817d30-b443-1a73-efae-84415604b19f@redhat.com>
 <b8b1a3f0-3aca-341c-07ee-389b077a01f7@redhat.com>
 <ZRkw5FfhSq3J+Wb8@smile.fi.intel.com>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZRkw5FfhSq3J+Wb8@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/1/23 10:42, Andy Shevchenko wrote:
> On Thu, Sep 28, 2023 at 02:42:50PM +0200, Hans de Goede wrote:
>> Add a new skl_int3472_gpiod_get_from_temp_lookup() helper.
>>
>> This is a preparation patch for removing usage of the deprecated
>> gpiod_toggle_active_low() and acpi_get_and_request_gpiod() functions.
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> [hdegoede@redhat.com] use the new skl_int3472_fill_gpiod_lookup() helper
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Something wrong between authorship and committer and SoB chain.
> I believe you need to preserve the authorship and add yourself as
> Co-developed-by: ?

Yes you are correct, I'll prepare a new version of the series
with this fixed.

Regards,

hans


