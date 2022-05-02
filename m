Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A17C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  2 May 2022 15:37:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239909AbiEBPlF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 2 May 2022 11:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234055AbiEBPlB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 2 May 2022 11:41:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CD93B1013
        for <platform-driver-x86@vger.kernel.org>; Mon,  2 May 2022 08:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651505847;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FtmrmbNbUodN8xBVKQQN7UAM6hiil8M4dt+c4wutNgM=;
        b=X9dko0D8GCFa1UrwpUQugTlKPbF1YP4sCgiAuwtpPKZW4oB+t6RcfzMIqOA5BMIe6nvgN0
        SLwJb8aCRpHub9Znn07CSfFdL0UoqUYsiW/rFlRuYC/CR/VTkr4TB2Jx+21Ol5dOHYIOAM
        vUQph3/Y98z+vtSEBJxXvl4773iUmRU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-4ABcXN_cNYKde4OxAW0zjw-1; Mon, 02 May 2022 11:37:26 -0400
X-MC-Unique: 4ABcXN_cNYKde4OxAW0zjw-1
Received: by mail-ej1-f70.google.com with SMTP id dm7-20020a170907948700b006f3f999ed7dso3270248ejc.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 May 2022 08:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FtmrmbNbUodN8xBVKQQN7UAM6hiil8M4dt+c4wutNgM=;
        b=K9Q2PmM3tvYbLUDfkWP/Zda2lLKEBm8843mdsxL0jto9PPuJOrTv+8A7hmXmwGkMAD
         PJahO1A7InZfx+hpA0MNx8ehWGD0qQ55xVNQRCZpAjiJ87BmL+UEMqoVzRxx4Dh54hbN
         NxG4r89C2F2eZHJUI9oaQaE7aiJ4F4g6XyY3HCftWdJ+7Ul19HktYBdV4QbR0iIM/tCy
         MGLtuoCFdvs+raOcykwSqcWkt9fWRqB+txEqFs45LiQI4Ypp5HN2Y0NuFnCsTht7WKJD
         oQyZFpwREWBtaaRDRoT8gn8pnST1z02S001M+POyrH8wwKxX09irKZHWUTdkkwpz03ih
         s8HQ==
X-Gm-Message-State: AOAM531S3Z3iQLo3p+BTx/p/Dje/T//wlABPqFDnpzVs5rYtHBUelEVa
        RdZ3QslEpo0I8VX71OhxXVj1T7cPqgELmntD+HE3MYvXWBGBKK6lVXFtH5yHfBs63CJQXPBBv3q
        Kc34pr7HvF34Qs8M18JAZgZt9VUCtgzEdmQ==
X-Received: by 2002:a17:907:971f:b0:6f4:31b1:253 with SMTP id jg31-20020a170907971f00b006f431b10253mr7485980ejc.342.1651505845382;
        Mon, 02 May 2022 08:37:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIuTt3ysaaj/BM4Uq1MCtPQbwCm7mu5VlApoLhK181Tb/WKYTk5UAPU0d+JQxVnjsRcqygFQ==
X-Received: by 2002:a17:907:971f:b0:6f4:31b1:253 with SMTP id jg31-20020a170907971f00b006f431b10253mr7485965ejc.342.1651505845139;
        Mon, 02 May 2022 08:37:25 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id og10-20020a1709071dca00b006f3ef214dccsm3658047ejc.50.2022.05.02.08.37.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 08:37:24 -0700 (PDT)
Message-ID: <65d6f4e5-9c28-f57b-0d34-f827604e0709@redhat.com>
Date:   Mon, 2 May 2022 17:37:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/x86/intel: Fix 'rmmod pmt_telemetry' panic
Content-Language: en-US
To:     Prarit Bhargava <prarit@redhat.com>, linux-kernel@vger.kernel.org
Cc:     "David E. Box" <david.e.box@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        David Arcari <darcari@redhat.com>
References: <20220429122322.2550003-1-prarit@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220429122322.2550003-1-prarit@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/29/22 14:23, Prarit Bhargava wrote:
> 'rmmod pmt_telemetry' panics with:
> 
>  BUG: kernel NULL pointer dereference, address: 0000000000000040
>  #PF: supervisor read access in kernel mode
>  #PF: error_code(0x0000) - not-present page
>  PGD 0 P4D 0
>  Oops: 0000 [#1] PREEMPT SMP NOPTI
>  CPU: 4 PID: 1697 Comm: rmmod Tainted: G S      W        --------  ---  5.18.0-rc4 #3
>  Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-P DDR5 RVP, BIOS ADLPFWI1.R00.3056.B00.2201310233 01/31/2022
>  RIP: 0010:device_del+0x1b/0x3d0
>  Code: e8 1a d9 e9 ff e9 58 ff ff ff 48 8b 08 eb dc 0f 1f 44 00 00 41 56 41 55 41 54 55 48 8d af 80 00 00 00 53 48 89 fb 48 83 ec 18 <4c> 8b 67 40 48 89 ef 65 48 8b 04 25 28 00 00 00 48 89 44 24 10 31
>  RSP: 0018:ffffb520415cfd60 EFLAGS: 00010286
>  RAX: 0000000000000070 RBX: 0000000000000000 RCX: 0000000000000000
>  RDX: 0000000000000001 RSI: 0000000000000000 RDI: 0000000000000000
>  RBP: 0000000000000080 R08: ffffffffffffffff R09: ffffb520415cfd78
>  R10: 0000000000000002 R11: ffffb520415cfd78 R12: 0000000000000000
>  R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>  FS:  00007f7e198e5740(0000) GS:ffff905c9f700000(0000) knlGS:0000000000000000
>  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>  CR2: 0000000000000040 CR3: 000000010782a005 CR4: 0000000000770ee0
>  PKRU: 55555554
>  Call Trace:
>   <TASK>
>   ? __xa_erase+0x53/0xb0
>   device_unregister+0x13/0x50
>   intel_pmt_dev_destroy+0x34/0x60 [pmt_class]
>   pmt_telem_remove+0x40/0x50 [pmt_telemetry]
>   auxiliary_bus_remove+0x18/0x30
>   device_release_driver_internal+0xc1/0x150
>   driver_detach+0x44/0x90
>   bus_remove_driver+0x74/0xd0
>   auxiliary_driver_unregister+0x12/0x20
>   pmt_telem_exit+0xc/0xe4a [pmt_telemetry]
>   __x64_sys_delete_module+0x13a/0x250
>   ? syscall_trace_enter.isra.19+0x11e/0x1a0
>   do_syscall_64+0x58/0x80
>   ? syscall_exit_to_user_mode+0x12/0x30
>   ? do_syscall_64+0x67/0x80
>   ? syscall_exit_to_user_mode+0x12/0x30
>   ? do_syscall_64+0x67/0x80
>   ? syscall_exit_to_user_mode+0x12/0x30
>   ? do_syscall_64+0x67/0x80
>   ? exc_page_fault+0x64/0x140
>   entry_SYSCALL_64_after_hwframe+0x44/0xae
>  RIP: 0033:0x7f7e1803a05b
>  Code: 73 01 c3 48 8b 0d 2d 4e 38 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa b8 b0 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d fd 4d 38 00 f7 d8 64 89 01 48
> 
> The probe function, pmt_telem_probe(), adds an entry for devices even if
> they have not been initialized.  This results in the array of initialized
> devices containing both initialized and uninitialized entries.  This
> causes a panic in the remove function, pmt_telem_remove() which expects
> the array to only contain initialized entries.
> 
> Only use an entry when a device is initialized.
> 
> Cc: "David E. Box" <david.e.box@linux.intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Mark Gross <markgross@kernel.org>
> Cc: platform-driver-x86@vger.kernel.org
> Signed-off-by: David Arcari <darcari@redhat.com>
> Signed-off-by: Prarit Bhargava <prarit@redhat.com>

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
>  drivers/platform/x86/intel/pmt/telemetry.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
> index 6b6f3e2a617a..f73ecfd4a309 100644
> --- a/drivers/platform/x86/intel/pmt/telemetry.c
> +++ b/drivers/platform/x86/intel/pmt/telemetry.c
> @@ -103,7 +103,7 @@ static int pmt_telem_probe(struct auxiliary_device *auxdev, const struct auxilia
>  	auxiliary_set_drvdata(auxdev, priv);
>  
>  	for (i = 0; i < intel_vsec_dev->num_resources; i++) {
> -		struct intel_pmt_entry *entry = &priv->entry[i];
> +		struct intel_pmt_entry *entry = &priv->entry[priv->num_entries];
>  
>  		ret = intel_pmt_dev_create(entry, &pmt_telem_ns, intel_vsec_dev, i);
>  		if (ret < 0)

