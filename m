Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 886BEC77B7A
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Jun 2023 10:35:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240712AbjFMKfY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 13 Jun 2023 06:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242060AbjFMKfA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jun 2023 06:35:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10AB81FE7
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jun 2023 03:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686652392;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kS2oRVW85uWqSl3G5Jhu5nolu0nW/wNttlcaYjBQJDk=;
        b=MLQDkKEptPDONXhmuUXUU80BhNn2t0QYIskQvovjQlb4QioyPfFsq5e1jfEIwzXCkrgDkL
        VyocknwUhU/pIOH2AXkw9/R2fDsPnNWwp+5XYZxk0pfP7nkbtXx/T6f30uu58HJIJgfI1+
        txYtm8Zft6GnT4tGHGutMJPc+Z2ehB4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-dYqwQdzuPlCDXlVy0ksvYw-1; Tue, 13 Jun 2023 06:33:10 -0400
X-MC-Unique: dYqwQdzuPlCDXlVy0ksvYw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94a34d3e5ebso478034466b.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jun 2023 03:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686652389; x=1689244389;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kS2oRVW85uWqSl3G5Jhu5nolu0nW/wNttlcaYjBQJDk=;
        b=YSekwnTQJ4RSBE356IA4LLI1oa3v77FH+rXuxowlyCypF0JYM8r2m8YgLOVR5moQLu
         Nn6M/elPkcb1zFU2TyVB0f6sDP4MsFIXFRu/N6LrQ4RwkpZZ2RzVufWAqKBpQCnXXi1c
         gOxDy03InA39EHiodDLePUnNmHR44IalQHBixDI3E6B4pexZIhDJBbzoiN1COAjz4Fmf
         0Z3VWTFJYGmLvNfT9hc1U0Ie2VRpni7UzN8PkHkmf9/dbUMKH4HgN5/NLwnaR7SWAodA
         npnQymRbKeyMtCzjdLFDfXOh0CjjZFwpk62nc+cvTsEqB0VXq/D7MJLYAzMZfFkpKBBH
         AxuQ==
X-Gm-Message-State: AC+VfDzXm8NL5dCl/xCuN1YDbK8MMDj7cbZZzlpgXa3Gj/Lq3V5RKoBF
        vnZ6+5SlZ0Si7bqyHXH3xQ1ERSP3xNujvsbQqx2gR/qUjPehuDKSdMJuDTz7ux6zWhKHEMqF1XY
        TSqD8WfUTFi+ywvI3I3NDWlQVGD++GOKx/g==
X-Received: by 2002:a17:907:7e97:b0:978:67a4:64d3 with SMTP id qb23-20020a1709077e9700b0097867a464d3mr12077499ejc.63.1686652389597;
        Tue, 13 Jun 2023 03:33:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ58l9DQfP/wJ/BB7kmDR3Oa3uI37zCuhu26VuEPJFLTJNiX6nXiAA2DxSUZgZaR06opVYxiog==
X-Received: by 2002:a17:907:7e97:b0:978:67a4:64d3 with SMTP id qb23-20020a1709077e9700b0097867a464d3mr12077487ejc.63.1686652389281;
        Tue, 13 Jun 2023 03:33:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i24-20020a17090671d800b00967004187b8sm6421347ejk.36.2023.06.13.03.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 03:33:08 -0700 (PDT)
Message-ID: <ac2ee666-e5df-4493-191f-7d1d5b2981ea@redhat.com>
Date:   Tue, 13 Jun 2023 12:33:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/3] platform: Switch back to use struct i2c_driver's
 .probe()
Content-Language: en-US, nl
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Mark Gross <markgross@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Corentin Chary <corentin.chary@gmail.com>,
        Daniel Scally <djrscally@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de,
        acpi4asus-user@lists.sourceforge.net
References: <20230612073902.840435-1-u.kleine-koenig@pengutronix.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230612073902.840435-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/12/23 09:38, Uwe Kleine-König wrote:
> Hello,
> 
> these three patches convert three i2c drivers back to use .probe() after
> its prototype was changed.
> 
> I was unsure if I should put the surface change together with the two
> other x86 changes but as surfaces are x86, too, I thought this might be
> right. If not: The patches are orthogonal to each other, so they can be
> applied to different trees without interdependencies.
> 
> Best regards
> Uwe

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> Uwe Kleine-König (3):
>   surface: surface3_power: Switch back to use struct i2c_driver's
>     .probe()
>   platform/x86: asus-tf103c-dock: Switch back to use struct i2c_driver's
>     .probe()
>   platform/x86: int3472: Switch back to use struct i2c_driver's .probe()
> 
>  drivers/platform/surface/surface3_power.c     | 2 +-
>  drivers/platform/x86/asus-tf103c-dock.c       | 2 +-
>  drivers/platform/x86/intel/int3472/tps68470.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> base-commit: ac9a78681b921877518763ba0e89202254349d1b

