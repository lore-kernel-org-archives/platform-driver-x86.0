Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13171C43334
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Jun 2022 10:55:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350809AbiFVKzK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Jun 2022 06:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353440AbiFVKzF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jun 2022 06:55:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9CC0A3BBF0
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 03:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655895300;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k6t4/ddevN9LBpeC5sqo4i5wJfVj6AfkWCzclXYGPpc=;
        b=eN8wBovgrTDEn6IiKEaBBFsgrQ8M/NBprqlyhuPS8xPZHIhy9kI6TRWz8BBHgEQMCU09Vk
        cCBcaCXwGX81Xk4Elszc4G6RhrUdGmP+ZksZqW/43Ao6GmjoLp5qmEj0QrHQDEqJujrelf
        cKxykuWVL/y/UvAvQk1pILsuCyBjlzY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-IJD-HJNHOhWPZ4HTgm5nOQ-1; Wed, 22 Jun 2022 06:54:58 -0400
X-MC-Unique: IJD-HJNHOhWPZ4HTgm5nOQ-1
Received: by mail-ed1-f70.google.com with SMTP id z13-20020a056402274d00b004357fcdd51fso6841368edd.17
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 03:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=k6t4/ddevN9LBpeC5sqo4i5wJfVj6AfkWCzclXYGPpc=;
        b=gIKCmM8idFmpGRthIQ28LmYiTorkBEwcMzwB2vfQhRaqrBzI48S8E2dfEZ+tKCnji1
         gcd4QWvk5Er4mWn/fobHH05dW9leLVjYM2iERQ9ch2EQflJXNuDODDWypNgmlm55UjLB
         hhc4H3PxpBNGyPtOuFGo6/VkBew5j3r8pIqYQf//X1/RIwSnLbt86X5Hc13nafxxT0wY
         ZSF/WcLYRqZBcXJlelQlBwpdsKerSIetGvQdnA7X+YZMjAWhXlv9QlI39JKSwRaHGbF+
         Xi0tNPe2I1JVO2wzU264lvIJD9flOQki8fmXXscpl1f89kBBoBfQpx5XGVA31LcS2IZt
         e10w==
X-Gm-Message-State: AJIora/YRTSJK1/hJuURgbaMVBGQRsZAyD78CD3Tnoy0X89TpAuzdpnm
        9Ijl4zxdjlIbrHtnBNVA0ibB2MA1I4z34XnXf29JhjITuL3JBi+hOZonNM6BxvqCU3Yhvbwpv9k
        m6S0s9jXUlTZ4mT7lw2Otil42jeMvEUaEvA==
X-Received: by 2002:a17:907:968f:b0:722:f8ef:ab42 with SMTP id hd15-20020a170907968f00b00722f8efab42mr826252ejc.258.1655895297673;
        Wed, 22 Jun 2022 03:54:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s1MQIektYXKUdcabnhmHLY23vRnaybqz/iQ3lbzwzlSBKjrZOFPAkq+r4yMjkOqHtM7AbWlQ==
X-Received: by 2002:a17:907:968f:b0:722:f8ef:ab42 with SMTP id hd15-20020a170907968f00b00722f8efab42mr826243ejc.258.1655895297504;
        Wed, 22 Jun 2022 03:54:57 -0700 (PDT)
Received: from [192.168.43.127] ([109.37.135.195])
        by smtp.gmail.com with ESMTPSA id e15-20020a056402190f00b0043580ac5888sm7109030edz.82.2022.06.22.03.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 03:54:56 -0700 (PDT)
Message-ID: <185decd4-0267-fa0e-9f8c-566dae5466a0@redhat.com>
Date:   Wed, 22 Jun 2022 12:54:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix a memory leak of EFCH
 MMIO resource
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Cc:     Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <markgross@kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>
References: <20220621155511.5b266395@endymion.delvare>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220621155511.5b266395@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/21/22 15:55, Jean Delvare wrote:
> Unlike release_mem_region(), a call to release_resource() does not
> free the resource, so it has to be freed explicitly to avoid a memory
> leak.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Fixes: 455cd867b85b ("platform/x86: thinkpad_acpi: Add a s2idle resume quirk for a number of laptops")
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Mark Gross <markgross@kernel.org>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
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
>  drivers/platform/x86/thinkpad_acpi.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-5.18.orig/drivers/platform/x86/thinkpad_acpi.c	2022-05-22 21:52:31.000000000 +0200
> +++ linux-5.18/drivers/platform/x86/thinkpad_acpi.c	2022-06-21 15:49:31.705166709 +0200
> @@ -4529,6 +4529,7 @@ static void thinkpad_acpi_amd_s2idle_res
>  	iounmap(addr);
>  cleanup_resource:
>  	release_resource(res);
> +	kfree(res);
>  }
>  
>  static struct acpi_s2idle_dev_ops thinkpad_acpi_s2idle_dev_ops = {
> 
> 

