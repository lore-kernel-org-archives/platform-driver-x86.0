Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F0AC04A68
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 17:42:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232251AbiG1RmG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 13:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbiG1RmF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 13:42:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C2D9F74793
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 10:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659030123;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9a6NZdMEdZG5y53q1uQm90K94xiWKcbcChVBIA+iZFQ=;
        b=ADJhzpuTNgUTV1DSNtOlI3+o00dnQ8czGglGLjK3szsVeSF3YJBEg2ITDmUwJorkECHbCG
        6bFb7+bUtCznbAVT2irJmkSpoBdbKCkGuYXn9wv8K5ZMz4PIx7I2JdxG9+AJepeaaZ2vGC
        2VpWRr8bKY0S++NfhltB7TxaPAVbkXY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-vk93p7S8MgWtG-KiIyqRxA-1; Thu, 28 Jul 2022 13:42:02 -0400
X-MC-Unique: vk93p7S8MgWtG-KiIyqRxA-1
Received: by mail-ed1-f71.google.com with SMTP id g15-20020a056402424f00b0043bff7a68dbso1518771edb.10
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 10:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9a6NZdMEdZG5y53q1uQm90K94xiWKcbcChVBIA+iZFQ=;
        b=Kt0QSnb6SKcVULFQt4PkdGWOv+JZzOtvr/Fa8BDgpNWU51vAPMyPGlVpXoBXyGvJXw
         Hwzyck8Vhi67Xer6jL/xK3IUG9YkbrzymchiTKsnev7H8XJhgQAtc9haH920/OfIWOJb
         G5ipvUyPUniIuW6m8m2Iv550qfLPc5Hn7Zl7vBGTSroMYEYMLA4/NqLK8eYUZdatj/Fu
         7LUk5K75RqE+vr5TkGVsLPK4jo8rldTpQK/GyWY660H68zdiT2wP/pr6MLxK3KAOQmvU
         6gQ3xoJrcZPb+gZu3FGqO3pZcfUt938ft6dtwDpYhTerUml7qzIhvCPQvH/weiCPLEmL
         a6kA==
X-Gm-Message-State: AJIora+MYX1LyuY4r6V+iRrYMMB9ADzR/T6dtB5pjqhuw+2SqwFTG2UY
        vuHDpz41zI+xyJYPGt9EtR7YOKFGG/Vxa218PLZcsZWanXxXBsC41a/k2SnhQu6AzAPebkJvVQ+
        alD7DpnFPMOOdlESWvxb7mBT0JalfQjKKhw==
X-Received: by 2002:a05:6402:27c6:b0:43c:45e6:4c0a with SMTP id c6-20020a05640227c600b0043c45e64c0amr66818ede.342.1659030121199;
        Thu, 28 Jul 2022 10:42:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tVJz3TvC+dD25tmjb1a0J069KY26YBH+Pi5z+5OAnEGzeL3gSGmyZKeN8qthNWH7GtdL9ERQ==
X-Received: by 2002:a05:6402:27c6:b0:43c:45e6:4c0a with SMTP id c6-20020a05640227c600b0043c45e64c0amr66795ede.342.1659030120852;
        Thu, 28 Jul 2022 10:42:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id sy13-20020a1709076f0d00b00722d5b26ecesm627263ejc.205.2022.07.28.10.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 10:42:00 -0700 (PDT)
Message-ID: <846d5138-f846-1f5b-39bd-2bd20595a9a2@redhat.com>
Date:   Thu, 28 Jul 2022 19:41:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] platform/x86: remove useless comparisons in
 sony_pic_read_possible_resource()
Content-Language: en-US
To:     Andrey Strachuk <strochuk@ispras.ru>,
        Mattia Dongili <malattia@linux.it>
Cc:     Mark Gross <markgross@kernel.org>, Len Brown <len.brown@intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
References: <20220719110341.7239-1-strochuk@ispras.ru>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220719110341.7239-1-strochuk@ispras.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/19/22 13:03, Andrey Strachuk wrote:
> Local variable 'p' is initialized by an address
> of field of acpi_resource structure, so it does
> not make sense to compare 'p' with NULL.
> 
> Local variable 'io' is initialized by an address
> of field of acpi_resource structure, so it does
> not make sense to compare 'io' with NULL.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Andrey Strachuk <strochuk@ispras.ru>
> Fixes: 41b16dce3905 ("create drivers/platform/x86/ from drivers/misc/")

Thank you for your patch, I've applied this patch (minus the
invalid fixes tag) to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  drivers/platform/x86/sony-laptop.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index d8d0c0bed5e9..07ef05f727a2 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -4341,7 +4341,7 @@ sony_pic_read_possible_resource(struct acpi_resource *resource, void *context)
>  		{
>  			struct acpi_resource_irq *p = &resource->data.irq;
>  			struct sony_pic_irq *interrupt = NULL;
> -			if (!p || !p->interrupt_count) {
> +			if (!p->interrupt_count) {
>  				/*
>  				 * IRQ descriptors may have no IRQ# bits set,
>  				 * particularly those those w/ _STA disabled
> @@ -4374,11 +4374,6 @@ sony_pic_read_possible_resource(struct acpi_resource *resource, void *context)
>  			struct acpi_resource_io *io = &resource->data.io;
>  			struct sony_pic_ioport *ioport =
>  				list_first_entry(&dev->ioports, struct sony_pic_ioport, list);
> -			if (!io) {
> -				dprintk("Blank IO resource\n");
> -				return AE_OK;
> -			}
> -
>  			if (!ioport->io1.minimum) {
>  				memcpy(&ioport->io1, io, sizeof(*io));
>  				dprintk("IO1 at 0x%.4x (0x%.2x)\n", ioport->io1.minimum,

