Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8999BC27C76
	for <platform-driver-x86@archiver.kernel.org>; Sat, 28 Jan 2023 09:42:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233632AbjA1Jmf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 28 Jan 2023 04:42:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbjA1Jmf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 28 Jan 2023 04:42:35 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67AF33B3CA
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Jan 2023 01:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674898908;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=twR14cjllGUXLpKlnOdL7uubVR+CcOSrwvbCUlEF4yg=;
        b=ByAqBjFPIVe6TNUUXR91kJbxLz4wT1nkQOryGO2OQNUvSd7c1qumVYqwkjhTQB6cYPlcQa
        nn2zX4IsL8OYphcMEjO9Yvsb4yNvPhe6NiGcdqnelwDIV11nbNfs6CjTZ/pNX6Geestq9R
        5zkr38cs5Ixur9ORmgVBlcwoYFeDY+8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-130-H95VeFw5NjaaF8oJyUbbLg-1; Sat, 28 Jan 2023 04:41:45 -0500
X-MC-Unique: H95VeFw5NjaaF8oJyUbbLg-1
Received: by mail-ed1-f69.google.com with SMTP id s3-20020a50ab03000000b0049ec3a108beso5103389edc.7
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Jan 2023 01:41:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=twR14cjllGUXLpKlnOdL7uubVR+CcOSrwvbCUlEF4yg=;
        b=6npADyENaWP6obhhCNlGhPkDIzdpjI/t+9UBltpiv43o4zfxNeE/0E9WLLzsFm6T8F
         oag/syBTIQ06FFsDwQCZ+jsmtomh1dLAkDDfGsB9S5Hc4coD1/j5XiiWdNAHojRZM48b
         2fCIBEaZcvb+uF7iLMDtNyiflBVv+MeRuBbvEJUp/W5VMihfMhLNFb7Pe1zqvPQrWAZC
         oKslV6bDeMAyt92Vw82fonmyVR7XaKSdd//8aR7OwKFkPYWyMvTlISa/sf14MTkC/gaP
         nHuEaCAn6/KsF3O7NL2PtYgoFEkrwL+DpU+ZvWSlfsy/d6OhbH5/dbQcevbIPj8nvYPT
         Kq2g==
X-Gm-Message-State: AFqh2kobPrTArus7sHdozU7iFf7OH1COegJV6iHaKGihFFiLZeYSQuIz
        R1xYGDkyiYMCm1nLo72QMSIZcQRmNgYh/cyHQ66jrvxsLjL3x01PsZui+EasGt0Dw64rd2TbLk+
        Ifb8g+ElOZZHqM8nHYHYCPiiKlvRWYvQpHA==
X-Received: by 2002:a17:907:8b08:b0:860:c12c:14fd with SMTP id sz8-20020a1709078b0800b00860c12c14fdmr47726551ejc.76.1674898904775;
        Sat, 28 Jan 2023 01:41:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsLWHdwigC9AWjgO/I5vHPQwk+KI0Cp2B38kYPAXsibJhvaTjuoQ0sruljT5mNLvxnF6Tby9g==
X-Received: by 2002:a17:907:8b08:b0:860:c12c:14fd with SMTP id sz8-20020a1709078b0800b00860c12c14fdmr47726543ejc.76.1674898904558;
        Sat, 28 Jan 2023 01:41:44 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id mb18-20020a170906eb1200b0084f7d38713esm3622593ejb.108.2023.01.28.01.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jan 2023 01:41:44 -0800 (PST)
Message-ID: <579d96f3-83d3-8b0a-6760-ce1903936c1a@redhat.com>
Date:   Sat, 28 Jan 2023 10:41:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 3/5] platform/x86: int3472/discrete: Create a LED class
 device for the privacy LED
Content-Language: en-US, nl
To:     kernel test robot <lkp@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>
References: <20230127203729.10205-4-hdegoede@redhat.com>
 <202301281537.fKVHsgf4-lkp@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202301281537.fKVHsgf4-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/28/23 08:24, kernel test robot wrote:
> Hi Hans,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.2-rc5]
> [cannot apply to media-tree/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/media-v4l2-core-Make-the-v4l2-core-code-enable-disable-the-privacy-LED-if-present/20230128-131233
> patch link:    https://lore.kernel.org/r/20230127203729.10205-4-hdegoede%40redhat.com
> patch subject: [PATCH v6 3/5] platform/x86: int3472/discrete: Create a LED class device for the privacy LED
> config: i386-randconfig-r004-20230123 (https://download.01.org/0day-ci/archive/20230128/202301281537.fKVHsgf4-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=1 build):
>         # https://github.com/intel-lab-lkp/linux/commit/d71a1bce9c9ea0bd5b98920b2d72a5b0a36ca19d
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Hans-de-Goede/media-v4l2-core-Make-the-v4l2-core-code-enable-disable-the-privacy-LED-if-present/20230128-131233
>         git checkout d71a1bce9c9ea0bd5b98920b2d72a5b0a36ca19d
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=i386 olddefconfig
>         make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from drivers/platform/x86/intel/int3472/discrete.c:17:
>>> drivers/platform/x86/intel/int3472/common.h:107:40: error: field 'lookup' has incomplete type
>      107 |                 struct led_lookup_data lookup;
>          |                                        ^~~~~~
> --
>    In file included from drivers/platform/x86/intel/int3472/led.c:7:
>>> drivers/platform/x86/intel/int3472/common.h:107:40: error: field 'lookup' has incomplete type
>      107 |                 struct led_lookup_data lookup;
>          |                                        ^~~~~~
>    drivers/platform/x86/intel/int3472/led.c: In function 'skl_int3472_register_pled':
>>> drivers/platform/x86/intel/int3472/led.c:57:9: error: implicit declaration of function 'led_add_lookup'; did you mean 'd_can_lookup'? [-Werror=implicit-function-declaration]
>       57 |         led_add_lookup(&int3472->pled.lookup);
>          |         ^~~~~~~~~~~~~~
>          |         d_can_lookup
>    drivers/platform/x86/intel/int3472/led.c: In function 'skl_int3472_unregister_pled':
>>> drivers/platform/x86/intel/int3472/led.c:71:9: error: implicit declaration of function 'led_remove_lookup' [-Werror=implicit-function-declaration]
>       71 |         led_remove_lookup(&int3472->pled.lookup);
>          |         ^~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors

As mentioned in the cover-letter this series depends on this immutable-branch:

https://lore.kernel.org/platform-driver-x86/Y9QGcA+9nlmOOy2d@google.com/

That branch not being present in the base used by LKP is what is causing this
error.

Regards,

Hans

