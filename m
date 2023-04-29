Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D2EC77B7C
	for <platform-driver-x86@archiver.kernel.org>; Sat, 29 Apr 2023 12:06:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbjD2MGK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 29 Apr 2023 08:06:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjD2MGJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 29 Apr 2023 08:06:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 419D6172A
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Apr 2023 05:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682769920;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hp2unPt3GOaJouFTxp4j0o6Bv5wpKKAQ+BqnHix68i0=;
        b=X70XrGFrP5qcF4xPx/Hcm5/Qyse96W74JS6qxKX+sLMF1R31q7TiMl40uXLQF8PmjBbHFL
        dq0EfnLuEWy4FmHVrxba+pFqsCxXquT/WdykNDqyf6vKTp+VH6t9TLTbUeBIbpkrJaQRuM
        uox9v+1xDRGSWjJjONTDP13H7gskvN4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-et6FluH1NYCI1UPVxNUCIQ-1; Sat, 29 Apr 2023 08:05:17 -0400
X-MC-Unique: et6FluH1NYCI1UPVxNUCIQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-94a34d3e5ebso73853966b.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Apr 2023 05:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682769916; x=1685361916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hp2unPt3GOaJouFTxp4j0o6Bv5wpKKAQ+BqnHix68i0=;
        b=Xib3R9/wHmNPamNd+spxM1zHGpzPfxZyEO8FBu1kzyBvkHg8ge/LIegXIa3ZY8iF1L
         h2WwWWiiKqtdgJtJXeFKuFtO7SPZkhOWimQywjscfAgLtyHwSDQAc/Gl+U/5iJ88EX0+
         BROcNw0iIAayPoIv1wF252PDKakBYGPg5p3/RIE33Qd9USFOedL7z09sSE7e43KZcq3M
         S5bovCaz+d+tVjuE6HRjlwJd3kG8Y7qkhJy2knf/MWc5CFiNr+IcHJXLu0k/99wTjdA4
         29hftOoZQOcbATvGCEY4y5zrg6+tTZpyg7mDiD7QmPWr5KdjLbnCoHDk9Q5tAiwT+ti1
         gv+w==
X-Gm-Message-State: AC+VfDwehzWaevW1DEMw4IVX0cHohKeHAoHyN7i+9/jATnYOx+ZZFZJx
        apAvl6d3QQZ8S9DLBrAEZdir61n9uNRsxFrBSRXweB2BYMRVUXoigrAOzEg7TBzzzZZ94kPgD6N
        SzxV66mSxKlKy4huQ41aXKH4P8zd/n39Cpg==
X-Received: by 2002:a17:907:6e90:b0:94f:5079:ade2 with SMTP id sh16-20020a1709076e9000b0094f5079ade2mr9643950ejc.62.1682769916809;
        Sat, 29 Apr 2023 05:05:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ52bjkVEYPkFsrXjfmjqFHfzutENMF5RXYzmx/IbT/EEm+SsfbegCV8QCZSO+8pjZD8uUa9uw==
X-Received: by 2002:a17:907:6e90:b0:94f:5079:ade2 with SMTP id sh16-20020a1709076e9000b0094f5079ade2mr9643934ejc.62.1682769916589;
        Sat, 29 Apr 2023 05:05:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id w1-20020a170906480100b0094f0f0de1bcsm12508646ejq.200.2023.04.29.05.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Apr 2023 05:05:16 -0700 (PDT)
Message-ID: <28b3a1eb-f649-32eb-ecbb-8517275f074b@redhat.com>
Date:   Sat, 29 Apr 2023 14:05:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/3] platform/x86: x86-android-tablets: Add Nextbook Ares
 8A data
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20230429105057.7697-1-hdegoede@redhat.com>
 <20230429105057.7697-3-hdegoede@redhat.com>
 <CAHp75VfaN4Az9OHVG2OfmgsqD8DmoY2VsmQ_5mvYF414_xDX1A@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfaN4Az9OHVG2OfmgsqD8DmoY2VsmQ_5mvYF414_xDX1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/29/23 13:59, Andy Shevchenko wrote:
> On Sat, Apr 29, 2023 at 1:51 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The Nextbook Ares 8A is a x86 ACPI tablet which ships with Android x86
>> as factory OS. Its DSDT contains a bunch of I2C devices which are not
>> actually there, causing various resource conflicts. Enumeration of these
>> is skipped through the acpi_quirk_skip_i2c_client_enumeration().
>>
>> Add support for manually instantiating the I2C devices which are
>> actually present on this tablet by adding the necessary device info to
>> the x86-android-tablets module.
>>
>> Note the Ares 8A is the Cherry Trail (CHT) model, the regular Ares 8
>> is Bay Trail (BYT) based and was already supported. This also updates
>> the comments for the BYT model to point out this is the BYT model.
> 
> ...
> 
>> -               /* Nextbook Ares 8 */
>> +               /* Nextbook Ares 8 (BYT version)*/
> 
> Missing space.

Thanks, I'll fix this up while merging these.

Regards,

Hans

