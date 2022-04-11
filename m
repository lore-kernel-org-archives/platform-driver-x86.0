Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 021CFC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Apr 2022 14:38:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347125AbiDKOky (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Apr 2022 10:40:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240420AbiDKOky (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Apr 2022 10:40:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8453B288
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 07:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649687917;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JK8TKPeiyxEXuySdlAaQF1ZMqCXVr2+cAzKpkD5p+PE=;
        b=g9vN6dxNn27kIkWwY4tKgXp9Q1w+afn1iVWdv04ZL/MxoahS53cxAOSA1g9q5J/V38HzYA
        TWZOukC7li7Wkzxc5nVmXWBKElyI74iIHRKGAILFxVXyxu5ZKgzabkTc9gShaBFojxOsKr
        VY7efOHuqnhZvgaflfyyWu0tH2AyR3c=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-zCwimD1JMQi79VZeMnIl8Q-1; Mon, 11 Apr 2022 10:38:36 -0400
X-MC-Unique: zCwimD1JMQi79VZeMnIl8Q-1
Received: by mail-ej1-f71.google.com with SMTP id nd34-20020a17090762a200b006e0ef16745cso7104418ejc.20
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 07:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JK8TKPeiyxEXuySdlAaQF1ZMqCXVr2+cAzKpkD5p+PE=;
        b=6habZTAS3f8IJi5V5sq7QSfJKGLZ5GMXSueiFrAzjW6+gfMQ7kC8mIxZbrNoRdw5RC
         Aa/km5552VfTvrW9QG8VPVo2zG6tnOTVThvMKU1hXFjRwjH4ptKJeAr0QUUIYvywLb6/
         PONekX3WKxvLTECX8kURTb5eqeialrWX1Jzeul/C9akHQIf0CFXLWQEi1iGCs5JDaXI2
         tmD63qNQsuYXdX+vIN4ixx8LXE5X1iHnrI/Y/6xyLrvpI6ymQNczGrgDOK74YcwX0KXz
         OHABwIfKeGDsNK5dTJEAviNhSdRcDzSPMdDGAmeLrzHyfKicw07uhrFQx4JKYREp5pGc
         Ka2w==
X-Gm-Message-State: AOAM531LnGEx/aZ0Y//3fOLFPLmXMZAMRJJJx09okZ9UVrZ1kpAItTeo
        TY3Ik39Bz51GV1VGnKsSiRe6/8uQ3wtDJ6fWOpR8K9thD9Jms/T5HicnWNuq10gh7AZbh15koz+
        nxltgbBUB1uiSRzGLIKD445eQS9c6r0d1Bg==
X-Received: by 2002:a17:906:1c0d:b0:6e8:94a5:c5d6 with SMTP id k13-20020a1709061c0d00b006e894a5c5d6mr3955160ejg.134.1649687915167;
        Mon, 11 Apr 2022 07:38:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLuvc5BS9rb+kgcbCN++QKhhBHdOIePF/MfbCeD2ZyVqKeiu79VBWOfFyf8VZTBybMX2u2Og==
X-Received: by 2002:a17:906:1c0d:b0:6e8:94a5:c5d6 with SMTP id k13-20020a1709061c0d00b006e894a5c5d6mr3955140ejg.134.1649687914988;
        Mon, 11 Apr 2022 07:38:34 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id gv9-20020a170906f10900b006d7128b2e6fsm12056991ejb.162.2022.04.11.07.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 07:38:34 -0700 (PDT)
Message-ID: <47d06f45-c1b5-2c8f-d937-3abacbf10321@redhat.com>
Date:   Mon, 11 Apr 2022 16:38:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 5/6] platform/x86: intel_tdx_attest: Add TDX Guest
 attestation interface driver
Content-Language: en-US
To:     Sathyanarayanan Kuppuswamy 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Mark Gross <mgross@linux.intel.com>
Cc:     "H . Peter Anvin" <hpa@zytor.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <cover.1648664666.git.sathyanarayanan.kuppuswamy@intel.com>
 <054b22e81e88379a5a8459c19e89a335531c1bdd.1648664666.git.sathyanarayanan.kuppuswamy@intel.com>
 <8308a830-3096-3f94-4f12-5fd2c290524e@redhat.com>
 <aece84e1-2c90-2c18-993a-96f8fed7bb46@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <aece84e1-2c90-2c18-993a-96f8fed7bb46@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/4/22 21:56, Sathyanarayanan Kuppuswamy wrote:
> Hi Hans,
> 
> On 4/4/22 3:07 AM, Hans de Goede wrote:
>>> +static int __init tdx_attest_init(void)
>>> +{
>>> +    dma_addr_t handle;
>>> +    long ret = 0;
>>> +
>>> +    mutex_lock(&attestation_lock);
>>> +
>>> +    ret = misc_register(&tdx_attest_device);
>>> +    if (ret) {
>>> +        pr_err("misc device registration failed\n");
>>> +        mutex_unlock(&attestation_lock);
>>> +        return ret;
>>> +    }
>> Why not do this as the last thing of the probe?
> 
> We need misc device reference in dma_alloc_coherent() and
> dma_set_coherent_mask() calls. This is the reason for keeping
> misc_register() at the beginining of the init function.

Erm, you are supposed to pass an actual device-device as
parameter to dma_alloc_coherent(), so that it can see
what bus/dma-domain the device is connected to and if
an ioMMU might be involved...

>> That will avoid the need to unregister this again in all
>> the error-exit paths and also fixes a possible deadlock.
>>
> 
> Agree. But, unless we create another device locally, I don't
> think we can avoid this. Do you prefer this approach?

Yes, passing the "struct device" which is embedded inside
a miscdevice as device to dma_alloc_coherent() is just
wrong. Please make your module_init function register
a platform_device using platform_device_register_simple()
(on systems with TDX support) and then turn your code/driver
into a standard platform_driver using the platform_device
which the driver binds to as parameter to dma_alloc_coherent().

See: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?id=c4d2ff35d350428eca2ae1a1e2119e4c6297811d

for a simple (completely unrelated) driver which uses this
method to have a device to bind to for talking to a secondary
function of the embedded-controller on some platforms.

Regards,

Hans

