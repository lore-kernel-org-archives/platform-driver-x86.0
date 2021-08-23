Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08ABCC4338F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Aug 2021 07:24:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DEBA761184
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Aug 2021 07:24:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235073AbhHWHY6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 23 Aug 2021 03:24:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46773 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235082AbhHWHY5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Aug 2021 03:24:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629703454;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tE6+q0+qIwxHF5NS3RuymMeRngUeLIrjgfnFQXeRtc4=;
        b=WRWs1N+zoJr4PEleW8hPs4JYZfqP+/pI7Y7JDUqICdbdupL3QMXGDx4h1NYZFMWRDgqw3d
        huPjDNOMwK1QWX2hiAqvD9Wf7KJULJRlOh75X+FutSWXjJpqL2Aghl8vZPcrGtHp84uogc
        pxp5Vv72UPyIlxsjPMeWGY3DjWK8tCs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-kh4VGftMO1-V-im4N0nM-Q-1; Mon, 23 Aug 2021 03:24:13 -0400
X-MC-Unique: kh4VGftMO1-V-im4N0nM-Q-1
Received: by mail-ed1-f72.google.com with SMTP id k13-20020aa7c04d000000b003bf04c03fc4so8325772edo.22
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Aug 2021 00:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tE6+q0+qIwxHF5NS3RuymMeRngUeLIrjgfnFQXeRtc4=;
        b=Vdn4gecztrdRjbCnWEJjR6xkowjb3y5E6QrrXyH/W95M1H39xKpxVGilA63kxa0pX7
         WXdXM9tepcobZfgUYdHE3MQP656eIS7VnokGbdW4/SKisk+87jRN2DWgOMq/GNXw5PVr
         /VQdFVWHJCiS/LWcuqchmCQc6Y6FzUfOEePX1QomVFGzwxjGq12lYEQNooC3CXJDRTav
         JXN1JKWH80f6KvNX5RINN5y+Bqlw5JYk8oBQqa2ztB9Gqu05Yarx20AKcWnYMOhBbp2z
         oHmcoNGubW+lnXsEKb9NeIlPspeFsaepOr1vwRfNfRGfuIcOWSKxqMgbWJqjNXhfr9Ou
         4vcg==
X-Gm-Message-State: AOAM533DzTRDHdeesjKBAzvmMn3nSh2RW5tszpC7PddSehqp+1SU8JLI
        YK5bzCla2Ub0i6jJXm40TGpMTY7E4x8VEXlGhdQDPETYxiWbWQ/MKtiWUy3Ev7E1ftM6BJfkKla
        ZqHNjL25B7JlmbPEiNVodb2tumwmZqw2se5c7b7RavrUQaCdpZk88zEtmxWWEFyyLs2NDN15uFt
        k3zq+3+8XygA==
X-Received: by 2002:a17:906:ac1:: with SMTP id z1mr33817107ejf.261.1629703452038;
        Mon, 23 Aug 2021 00:24:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSOmMuO9ZEtWOEIWSOzNmnswdfcKWK2YY+g6+opnjQRMnR7aUiX8K1a7qKF8rP+zWdxyqJTw==
X-Received: by 2002:a17:906:ac1:: with SMTP id z1mr33817090ejf.261.1629703451876;
        Mon, 23 Aug 2021 00:24:11 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id y20sm263805edc.44.2021.08.23.00.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 00:24:11 -0700 (PDT)
Subject: Re: [PATCH] platform/mellanox: mlxbf-pmc: fix kernel-doc notation
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     kernel test robot <lkp@intel.com>,
        Aditya Srivastava <yashsri421@gmail.com>,
        Mark Gross <mgross@linux.intel.com>,
        Vadim Pasternak <vadimp@nvidia.com>,
        platform-driver-x86@vger.kernel.org
References: <20210822171742.26921-1-rdunlap@infradead.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8e8028fb-0b18-31b4-5fa3-1654acf3a641@redhat.com>
Date:   Mon, 23 Aug 2021 09:24:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210822171742.26921-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/22/21 7:17 PM, Randy Dunlap wrote:
> Fix kernel-doc warnings reported by the kernel test robot:
> 
> drivers/platform/mellanox/mlxbf-pmc.c:82: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * Structure to hold attribute and block info for each sysfs entry
> drivers/platform/mellanox/mlxbf-pmc.c:94: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * Structure to hold info for each HW block
> drivers/platform/mellanox/mlxbf-pmc.c:121: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * Structure to hold PMC context info
> drivers/platform/mellanox/mlxbf-pmc.c:148: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * Structure to hold supported events for each block
> 
> Also fix typos in a few struct member names.

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


> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Aditya Srivastava <yashsri421@gmail.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Mark Gross <mgross@linux.intel.com>
> Cc: Vadim Pasternak <vadimp@nvidia.com>
> Cc: platform-driver-x86@vger.kernel.org
> ---
>  drivers/platform/mellanox/mlxbf-pmc.c |   13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> --- linux-next-20210820.orig/drivers/platform/mellanox/mlxbf-pmc.c
> +++ linux-next-20210820/drivers/platform/mellanox/mlxbf-pmc.c
> @@ -79,7 +79,8 @@
>  #define MLXBF_PMC_L3C_PERF_CNT_HIGH_VAL GENMASK(24, 0)
>  
>  /**
> - * Structure to hold attribute and block info for each sysfs entry
> + * struct mlxbf_pmc_attribute - Structure to hold attribute and block info
> + * for each sysfs entry
>   * @dev_attr: Device attribute struct
>   * @index: index to identify counter number within a block
>   * @nr: block number to which the sysfs belongs
> @@ -91,7 +92,7 @@ struct mlxbf_pmc_attribute {
>  };
>  
>  /**
> - * Structure to hold info for each HW block
> + * struct mlxbf_pmc_block_info - Structure to hold info for each HW block
>   *
>   * @mmio_base: The VA at which the PMC block is mapped
>   * @blk_size: Size of each mapped region
> @@ -102,7 +103,7 @@ struct mlxbf_pmc_attribute {
>   * @attr_event_list: Attributes for "event_list" sysfs files
>   * @attr_enable: Attributes for "enable" sysfs files
>   * @block_attr: All attributes needed for the block
> - * @blcok_attr_grp: Attribute group for the block
> + * @block_attr_grp: Attribute group for the block
>   */
>  struct mlxbf_pmc_block_info {
>  	void __iomem *mmio_base;
> @@ -118,7 +119,7 @@ struct mlxbf_pmc_block_info {
>  };
>  
>  /**
> - * Structure to hold PMC context info
> + * struct mlxbf_pmc_context - Structure to hold PMC context info
>   *
>   * @pdev: The kernel structure representing the device
>   * @total_blocks: Total number of blocks
> @@ -127,7 +128,7 @@ struct mlxbf_pmc_block_info {
>   * @block_name: Block name
>   * @block:  Block info
>   * @groups:  Attribute groups from each block
> - * @sv_sreg_support: Whether SMCs are used to access performance registers
> + * @svc_sreg_support: Whether SMCs are used to access performance registers
>   * @sreg_tbl_perf: Secure register access table number
>   * @event_set: Event set to use
>   */
> @@ -145,7 +146,7 @@ struct mlxbf_pmc_context {
>  };
>  
>  /**
> - * Structure to hold supported events for each block
> + * struct mlxbf_pmc_events - Structure to hold supported events for each block
>   * @evt_num: Event number used to program counters
>   * @evt_name: Name of the event
>   */
> 

