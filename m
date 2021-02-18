Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C7AC433DB
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Feb 2021 17:22:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F0DE64E79
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Feb 2021 17:22:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbhBRRWH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 18 Feb 2021 12:22:07 -0500
Received: from mga11.intel.com ([192.55.52.93]:63737 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233104AbhBRQWF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Feb 2021 11:22:05 -0500
IronPort-SDR: Ew6t2zfeG4OBeIluF3loHDQGe7ZHEgPGNZNvp7RsP6173bcm1cujx1P262XqXngtOBpeAZjCaC
 tNCAXD1lbVLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="180035580"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; 
   d="scan'208";a="180035580"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2021 08:17:55 -0800
IronPort-SDR: 5fGvCDkGx3aLNPDAUygI3UtMeBsyIWdmY5C4M93AHDkhF+aql6Bup7vM8W7DavOMYv+6GeDFPG
 6Y5zw62Q0s8g==
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; 
   d="scan'208";a="590141126"
Received: from smtp.ostc.intel.com ([10.54.29.231])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2021 08:17:55 -0800
Received: from localhost (mtg-dev.jf.intel.com [10.54.74.10])
        by smtp.ostc.intel.com (Postfix) with ESMTP id 0041E6365;
        Thu, 18 Feb 2021 08:17:54 -0800 (PST)
Date:   Thu, 18 Feb 2021 08:17:54 -0800
From:   mark gross <mgross@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: update MELLANOX HARDWARE PLATFORM SUPPORT
 maintainers
Message-ID: <20210218161754.GN154917@linux.intel.com>
Reply-To: mgross@linux.intel.com
References: <20210216152454.11878-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210216152454.11878-1-hdegoede@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Feb 16, 2021 at 04:24:54PM +0100, Hans de Goede wrote:
> The "MELLANOX HARDWARE PLATFORM SUPPORT" is maintained as part of the
> pdx86 tree. But when Mark and I took over as new pdx86 maintainers the
> "MELLANOX HARDWARE PLATFORM SUPPORT" MAINTAINERS entry was not updated.
> 
> Update the entry now.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by : Mark Gross <mgross@linux.intel.com>

> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 452f0f7b7c21..aa800d6829ae 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11367,8 +11367,8 @@ Q:	https://patchwork.kernel.org/project/netdevbpf/list/
>  F:	drivers/net/ethernet/mellanox/mlxfw/
>  
>  MELLANOX HARDWARE PLATFORM SUPPORT
> -M:	Andy Shevchenko <andy@infradead.org>
> -M:	Darren Hart <dvhart@infradead.org>
> +M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Mark Gross <mgross@linux.intel.com>
>  M:	Vadim Pasternak <vadimp@nvidia.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Supported
> -- 
> 2.30.1
> 
