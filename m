Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C911FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 30 Dec 2021 18:38:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240228AbhL3Sio (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 30 Dec 2021 13:38:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40200 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233713AbhL3Sin (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 30 Dec 2021 13:38:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640889523;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rMtfcubxS1jCFV3zQJL+J175Tn1FOB4sXNwCW0+vK8c=;
        b=EEqazvALqH8q+838Ks7bwuFM2VrrCdm8TsidTfSSsukofiGnwPvgE08ZxqXO8M3u/O3vNX
        uc1so6Mpmn1c/oQPdMdEtVp3GycrHSMzeRBmr0KMQEtV0OaChDRa2zP78jrMfdaM82VuG5
        5Eh0nM8UpAWJZrSgikxaCaHlTnuRkNQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-lWPBx_8dM3Kvm9j1lLLT3g-1; Thu, 30 Dec 2021 13:38:41 -0500
X-MC-Unique: lWPBx_8dM3Kvm9j1lLLT3g-1
Received: by mail-ed1-f69.google.com with SMTP id b8-20020a056402350800b003f8f42a883dso10342112edd.16
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Dec 2021 10:38:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rMtfcubxS1jCFV3zQJL+J175Tn1FOB4sXNwCW0+vK8c=;
        b=Cu1kqP88RIMCNpl+6lrRz73C18fXTHy7LxwARsogYHvvCmsS+px4A+I32ptY5Ijfi6
         sD1dPKnAu/ihZhmyzJqgmumjhjopuP3h4u5riD/0PM9Xwc1/PMJXKjQH7kI9wtSB/h86
         yqoGILCp7qTa3lKDi9+N3yWF6++xIJnwoLb3z4JToQnI9ym9HJkp89hjoQwE7R2hUfdh
         NlkkIv7NaTsbIaF6cMAqRvrgKjM6JaTiCaExdoK/oWfQce01QxO711a7/q1AuWhRQyuo
         sJcYN+TNnW+Exi1zFi9uOFyE7OSEo384EJKohXz31iHDSqG1cWIHstbXNNHc+msYiptF
         7lfw==
X-Gm-Message-State: AOAM533s14FFnCLDunwE8qb2UVuHYVdrlTC+Bmui/ZWSIlOG7q0y8ewO
        hmXF+tLbnEz6HNXRJ2xgYdz+nXWWtB5cigg/6m6tvvUnrb5yzV4Wq2ckJiE3af/C+imfNaFa8nL
        3l7WXcZuzDi58FZSfPKBJgL3/u3uK7vysKw==
X-Received: by 2002:a17:906:458:: with SMTP id e24mr26790858eja.108.1640889520549;
        Thu, 30 Dec 2021 10:38:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyw+XZf7hjbrHnfghGHm6EyGHNfdPtr42MkKTcxycQp1abbnqZrxktapKHA+pk8e3XiaUbzUw==
X-Received: by 2002:a17:906:458:: with SMTP id e24mr26790852eja.108.1640889520410;
        Thu, 30 Dec 2021 10:38:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id i8sm7672182edc.91.2021.12.30.10.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Dec 2021 10:38:40 -0800 (PST)
Message-ID: <2b0ccceb-4a6f-387f-42ae-b1043ee751c9@redhat.com>
Date:   Thu, 30 Dec 2021 19:38:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/4] mfd: intel_soc_pmic_crc: Sort cells by IRQ order
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Lee Jones <lee.jones@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20211225115509.94891-1-hdegoede@redhat.com>
 <20211225115509.94891-2-hdegoede@redhat.com>
 <CAHp75VfLcCKPa1J5qG=iLhZRT1JKQFbBiaf7D23zmctS2ojFhQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfLcCKPa1J5qG=iLhZRT1JKQFbBiaf7D23zmctS2ojFhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andy,

On 12/25/21 15:20, Andy Shevchenko wrote:
> On Sat, Dec 25, 2021 at 1:55 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The cells for the Crystal Cove PMIC are already mostly sorted by
>> function / IRQ order. Move the ADC cell so that they are fully sorted.
>>
>> Also move some of the resource definitions so that their order matches
>> the (new) order of the cells.
> 
> 
> ...
> 
>>  #define CRYSTAL_COVE_IRQ_GPIO          5
> 
> 
>>         {
> 
> As Lee commented once in p2sb patch series I think it makes sense here
> as well, i.e.
> 
> [CRYSTAL_COVE_IRQ_GPIO] = {
> 
>>                 .name = "crystal_cove_gpio",
>>                 .num_resources = ARRAY_SIZE(gpio_resources),
> 
> What do you think?

There are also cells without IRQs, e.g. for the ACPI PMIC OpRegion
driver to bind to. So we cannot (consistently) do this.

Regards,

Hans

