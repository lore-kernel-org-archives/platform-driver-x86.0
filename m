Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE24C38142
	for <platform-driver-x86@archiver.kernel.org>; Sat, 28 Jan 2023 09:42:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbjA1JmD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 28 Jan 2023 04:42:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbjA1JmC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 28 Jan 2023 04:42:02 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADAA52D63
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Jan 2023 01:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674898879;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k/+dGwbz0zDWDEkIhYFWgOukr6XgocaommysHbGNBvs=;
        b=FNNu0H7nIxeb/ZDoL76lgYmPyrW1R9/98RCkSvTBArNwU8+WwgSbjwH4urVn5ypNYvqhSz
        K6OVxPXzEROQCsGCLFmeyJZ3qcdXidxyG+Ig3l+i1er1poWrCcg3omj19cX4Ez6u3CD1NS
        U++oCrWXm89bY/s3oM9yP/Q0k0Uw/Jo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-9-qXwTpJwzNtOmt5Uxx6yUgg-1; Sat, 28 Jan 2023 04:41:18 -0500
X-MC-Unique: qXwTpJwzNtOmt5Uxx6yUgg-1
Received: by mail-ej1-f70.google.com with SMTP id nc27-20020a1709071c1b00b0086dae705676so4793013ejc.12
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Jan 2023 01:41:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k/+dGwbz0zDWDEkIhYFWgOukr6XgocaommysHbGNBvs=;
        b=VNLHPAMlzClPWLR0ohD8Wt2WPrLNzhoJGsjXJRm/jEydnf/rC4VlxYqihtbOsBAAED
         G8X9wzNm6uJKHe+5dk/Zs1tlHxB2PoFeiwaaysv/BR0x9okpZqCj/jGq/503eZLB0P0x
         PwSvilP/FYoLe+txpc7d68Vp7Q+J3oahWbyvw4I8RYaiO5BAyqB2cb6160O4vYQ6jxMB
         q140FpJdANKryrhMSa9X7avEifDG9F97IcX8Xb1oJyb9dlO0Wb3JclJTrvI0WwHeyHtp
         ih1cGH9rdHbCI2eW9WtHgzYFz1dhbZDbPgcN972bsrkVP7g1XmDb7fzPOi+0x2sMPsrc
         Nygw==
X-Gm-Message-State: AFqh2krllOP2wh9FAvnmllXpm/F9C1n1YIXd9YUPMfpZbr2ZTNYDTJIR
        i8FMuhpsU1vMBMtRK0kvegSAu7tLIhgaYRx2xATHECTfoLb3FyqlZFOxg+jYBHyolFXEFssuDg0
        HvYch1OFra6yjX/G6vJpGqZtSTpnVCsD+IQ==
X-Received: by 2002:a05:6402:189:b0:499:376e:6b27 with SMTP id r9-20020a056402018900b00499376e6b27mr44119992edv.5.1674898877067;
        Sat, 28 Jan 2023 01:41:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvkr8z/9KKq2AYlcjqdBULj9zqbIQz12ZEaKsbRqhQk9ARLEd7wxrB+TnsmtMDNVq2t+/Hisg==
X-Received: by 2002:a05:6402:189:b0:499:376e:6b27 with SMTP id r9-20020a056402018900b00499376e6b27mr44119972edv.5.1674898876844;
        Sat, 28 Jan 2023 01:41:16 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l11-20020aa7d94b000000b004954c90c94bsm3709340eds.6.2023.01.28.01.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jan 2023 01:41:16 -0800 (PST)
Message-ID: <17f5f57e-0003-2b6b-bfaa-18b03a6d1874@redhat.com>
Date:   Sat, 28 Jan 2023 10:41:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 1/5] media: v4l2-core: Make the v4l2-core code
 enable/disable the privacy LED if present
To:     kernel test robot <lkp@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>
References: <20230127203729.10205-2-hdegoede@redhat.com>
 <202301281534.9Z8xRsrX-lkp@intel.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202301281534.9Z8xRsrX-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/28/23 08:35, kernel test robot wrote:
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
> patch link:    https://lore.kernel.org/r/20230127203729.10205-2-hdegoede%40redhat.com
> patch subject: [PATCH v6 1/5] media: v4l2-core: Make the v4l2-core code enable/disable the privacy LED if present
> config: riscv-randconfig-r026-20230123 (https://download.01.org/0day-ci/archive/20230128/202301281534.9Z8xRsrX-lkp@intel.com/config)
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://github.com/intel-lab-lkp/linux/commit/000ccec1824b3256e3fc1a94079bb953f19faab5
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Hans-de-Goede/media-v4l2-core-Make-the-v4l2-core-code-enable-disable-the-privacy-LED-if-present/20230128-131233
>         git checkout 000ccec1824b3256e3fc1a94079bb953f19faab5
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/media/v4l2-core/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/media/v4l2-core/v4l2-subdev.c:1124:20: error: call to undeclared function 'led_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>            sd->privacy_led = led_get(sd->dev, "privacy-led");
>                              ^
>>> drivers/media/v4l2-core/v4l2-subdev.c:1124:18: error: incompatible integer to pointer conversion assigning to 'struct led_classdev *' from 'int' [-Wint-conversion]
>            sd->privacy_led = led_get(sd->dev, "privacy-led");
>                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    2 errors generated.

As mentioned in the cover-letter this series depends on this immutable-branch:

https://lore.kernel.org/platform-driver-x86/Y9QGcA+9nlmOOy2d@google.com/

That branch not being present in the base used by LKP is what is causing this
error.

Regards,

Hans

