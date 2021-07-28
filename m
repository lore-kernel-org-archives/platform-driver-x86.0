Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE90C4320E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 17:56:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26CFD6101E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 17:56:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbhG1R4B (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Jul 2021 13:56:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42885 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229810AbhG1R4A (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Jul 2021 13:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627494958;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GxisACX8174uMvFvlppclC4EQL5bs36jiETLuSiddmQ=;
        b=OXlS0yfgTSxc5e+GWf0PPg/hovinvhi59WfNbjD34t6cNcP/SoHGwbSLM1HAcnnkMfCw5R
        VHGCOdN85jb8mZf6t15N8s0WkMuh3hJNknulijoFb+O8kWYp5W0w2RIJEyxEUqrsGyE21T
        2zIoWmnQzJ+p6C6JSEIGyoraz0I43o8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-BA6JCVvCNnCEaWjXFbiV7g-1; Wed, 28 Jul 2021 13:55:57 -0400
X-MC-Unique: BA6JCVvCNnCEaWjXFbiV7g-1
Received: by mail-ed1-f69.google.com with SMTP id p2-20020a50c9420000b02903a12bbba1ebso1628712edh.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jul 2021 10:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GxisACX8174uMvFvlppclC4EQL5bs36jiETLuSiddmQ=;
        b=llEHAaeRHMXngFaIt+H3BWOA1gD0PqqyH+aiaSgfwtaUz3ipJWsxcyYtQkHhmk/mg1
         mTJAILEOGM183KWkDdDukj9aRgHITifI99R2EL/EVW0HditaajgUQ8H6iynplZfDHXdw
         sjUkbyzpGpFfsEkxOfj2KyPq02fATvACDpbT0c0jO2wU5icd9J6msL+Ekt0LsIK2Xfd2
         icAGsIOXjs+qdC0WhxDH/+C1nLvz0PAwPD+958y51RNFtG7NP5SI3Tg0tID6DdhOFSrJ
         XkEbGDXNOETczvR2w69a/qm0MUt6IJgGqllZG/52tisd8g5YLqpaEEmQJmzUgiqdVGue
         NXzA==
X-Gm-Message-State: AOAM533/FeRED0ZPWL6GAhy6EJ5JdY9iMBYzgHjxto7wASTjR9h9Qdkg
        DyTefaSp7PwXdbz67dbOlRqEe6JQeSjmrsA/sDqRlH9Ld4riuWn2I1CjCMQ7EqTYqicC++rJQ8E
        VoEWkIrCEWYKHc0XLJIPVEMuYBCn2+8KE87syvqFk0YEsHAP1Wbx5GeIJyJ+rVr5pU4rDJ+Eexs
        zpNVQVL6EKqA==
X-Received: by 2002:a05:6402:6cb:: with SMTP id n11mr1262896edy.112.1627494955658;
        Wed, 28 Jul 2021 10:55:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNWLqvC1eNWQ14TfqA0JTSWLbjWeSN7zy4ZcbOLmr0SzaT8OOnqJeoK5N3U+5DYVcl7pmWfQ==
X-Received: by 2002:a05:6402:6cb:: with SMTP id n11mr1262876edy.112.1627494955459;
        Wed, 28 Jul 2021 10:55:55 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id jg9sm150431ejc.6.2021.07.28.10.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 10:55:55 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
To:     "Kammela, Gayatri" <gayatri.kammela@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     "Gross, Mark" <mark.gross@intel.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20210728164847.46855-1-broonie@kernel.org>
 <CAHp75VcP2V2j_ZHtc9y9Jw527E8PZaoFngsXD3oA0Yvmm=L4SA@mail.gmail.com>
 <MW3PR11MB45238F497A4960B3D8FE60A7F2EA9@MW3PR11MB4523.namprd11.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <cd335478-7882-ade8-58e5-c5ab42902b8c@redhat.com>
Date:   Wed, 28 Jul 2021 19:55:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <MW3PR11MB45238F497A4960B3D8FE60A7F2EA9@MW3PR11MB4523.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/28/21 7:27 PM, Kammela, Gayatri wrote:
>> -----Original Message-----
>> From: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Sent: Wednesday, July 28, 2021 10:02 AM
>> To: Mark Brown <broonie@kernel.org>
>> Cc: Hans de Goede <hdegoede@redhat.com>; Gross, Mark
>> <mark.gross@intel.com>; Kammela, Gayatri <gayatri.kammela@intel.com>;
>> Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>; Linux Kernel Mailing List
>> <linux-kernel@vger.kernel.org>; Linux Next Mailing List <linux-
>> next@vger.kernel.org>; Platform Driver <platform-driver-
>> x86@vger.kernel.org>
>> Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
>>
>> On Wed, Jul 28, 2021 at 7:49 PM Mark Brown <broonie@kernel.org> wrote:
>>>
>>> Hi all,
>>>
>>> After merging the drivers-x86 tree, today's linux-next build
>>> (x86 allmodconfig) failed like this:
>>>
>>> error: the following would cause module name conflict:
>>>   drivers/misc/c2port/core.ko
>>>   drivers/platform/x86/intel/pmc/core.ko
>>>
>>> Caused by commit
>>>
>>>   29036fcc92b22d ("platform/x86/intel: intel_pmc_core: Move
>>> intel_pmc_core* files to pmc subfolder")
>>>
>>> Since there was nothing in the branch yesterday I've just dropped the
>>> tree entirely.
>>
>> Yeah, PMC Makefile should keep the object name the same, something like
>>
>> obj-$(..._PMC_...) += intel_pmc_....o
>> intel-pmc_...-y := core.o ...

Right, I will drop the patches from pdx86/for-next and do a forced push.

> Hi Andy and Mark,
> We've found the issue on our side as well and planning to push the fix soon. Would you prefer to have the whole patch series redone or just the fix ?

I've just dropped the current version of the patches,
please send the whole patch series redone.

Thanks & Regards,

Hans

