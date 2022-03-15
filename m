Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6091C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Mar 2022 09:18:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237815AbiCOJTe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Mar 2022 05:19:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346504AbiCOJTd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Mar 2022 05:19:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1AEC61275A
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Mar 2022 02:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647335898;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MHO3i7cDL4QgzAYf1pciKR2WcoM9oO/OIWe2fzf8iIU=;
        b=JjiAlJVaptdVWdRGh1AfGbJ5jA2OiVqcXKJWGzmsGPbnrSbAJWOc6nreeZ40ffHmLBiRl2
        E5/inYACulYDP1ffn8QnZRS9G7laOHmHZs0yVgrJQQsQeTevOu/Aqv9IKhIFOo0dxR9qQC
        RIPbrbITngIFWRrRIxkqeYR6kuXksFk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-f1h3Tfx4N8m8bDnvkaB_Uw-1; Tue, 15 Mar 2022 05:18:17 -0400
X-MC-Unique: f1h3Tfx4N8m8bDnvkaB_Uw-1
Received: by mail-ej1-f69.google.com with SMTP id r18-20020a17090609d200b006a6e943d09eso9303894eje.20
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Mar 2022 02:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MHO3i7cDL4QgzAYf1pciKR2WcoM9oO/OIWe2fzf8iIU=;
        b=K7JwNPBtYjI/JH1JsmsuQ/v5EqI5KeF/jzh88EolCnng/z3Is0GoqRcH32AGKNIwQH
         WYIDZeaB9JbmgRRy8HSsbQ5aFc3QS5QJvjQ8u8gO3u/kXX3WZVFHD6/zOX1n4YTTYVE2
         eVi3cXJEs/tRwzVxmj9H1UjQib7Lv/0uD/BMlsREQRyRX0NwNh6lRLsTLxxVrElhljiL
         ez/Qk2E7tFvTXdm90ZUSjmFdIyAmY8+AtFhQTFvV1vNoPw34fjFaNgtElEsmZ9oTemLY
         sRhy6VKWCanpgM7d5R2hfGTeahZOQyYVL43uQTOGOm1yM9Smk0zSIJY4nCjbWvis5bjE
         4F1w==
X-Gm-Message-State: AOAM5337ZYoW3yTlDktEI6c2J24A4lgTJcKguluMEOubyXGos0nQYHe6
        uRCYM4gZqbBSYRAZDkTZm7Wt0hlSNEJRhM2mEDhPb5eYHq49nzjOz/n7LeKH6OOK6ra4oONzqPK
        13ND+qIRr2Z0jqeO1otUxq5UKQJzsvXTTLg==
X-Received: by 2002:a17:907:961b:b0:6d9:acb0:5403 with SMTP id gb27-20020a170907961b00b006d9acb05403mr21664817ejc.568.1647335896157;
        Tue, 15 Mar 2022 02:18:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4v41/A9xo5XXNPP80pes2Ha5409yxGlxlGhhRyWxa+fvDuDAIERk1zhjYVJLIhEsfb4YdzA==
X-Received: by 2002:a17:907:961b:b0:6d9:acb0:5403 with SMTP id gb27-20020a170907961b00b006d9acb05403mr21664803ejc.568.1647335895929;
        Tue, 15 Mar 2022 02:18:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id uz4-20020a170907118400b006dab1ea6e3asm7828556ejb.51.2022.03.15.02.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Mar 2022 02:18:15 -0700 (PDT)
Message-ID: <aab9d25e-f6f9-b831-769b-ab95cd1bea74@redhat.com>
Date:   Tue, 15 Mar 2022 10:18:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [GIT PULL] Immutable branch with 5.17-rc1 + "pinctrl: baytrail:
 Add pinconf,group + function for the pmu_clk"
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy@infradead.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <7640f9ac-88af-ace7-0bd4-990d852567dd@redhat.com>
 <CACRpkdbDWrrDPK9=5NErtM81109qtTHyFcTON=zXtB2B86wAdA@mail.gmail.com>
 <CAHp75Ve9s+hEjhWwdjbRJhEU-Efno_TyAUH+D7iRrE8enivvtg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Ve9s+hEjhWwdjbRJhEU-Efno_TyAUH+D7iRrE8enivvtg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/15/22 07:19, Andy Shevchenko wrote:
> On Tue, Mar 15, 2022 at 3:01 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Thu, Feb 24, 2022 at 5:48 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>>> Hello Intel pinctrl maintainers,
>>>
>>> As discussed here is a pull-req for an immutable branch with 5.17-rc1 +
>>> "pinctrl: baytrail: Add pinconf,group + function for the pmu_clk".
>>
>> I suppose this is for Andy possibly I already pulled the pulled tree.
> 
> Nope, but it appears not necessary. We have nothing to update in my
> tree which is dependent on this PR.

Ok, note this is already in the platform-drivers-x86 tree, since this
was a dep for another patch there. So I guess the single patch in the PR
will find its way upstream through the pdx86 tree then (which is fine).

Regards,

Hans

