Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C9EC433ED
	for <platform-driver-x86@archiver.kernel.org>; Thu, 13 May 2021 21:48:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CBB7613F7
	for <platform-driver-x86@archiver.kernel.org>; Thu, 13 May 2021 21:48:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233591AbhEMVtZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 13 May 2021 17:49:25 -0400
Received: from mga03.intel.com ([134.134.136.65]:50811 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233525AbhEMVtZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 13 May 2021 17:49:25 -0400
IronPort-SDR: e7LbDr/GRZkEgamhInwOt0wl7AAL33GH2NsVKVUEijxXSxvnzbmjLHKfdtRnkBym0ymp6Wq9h9
 i2eUEKHOmZ8w==
X-IronPort-AV: E=McAfee;i="6200,9189,9983"; a="200117148"
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; 
   d="scan'208";a="200117148"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2021 14:48:13 -0700
IronPort-SDR: 5FxNovmzdV+qmm6loFbvOZGy7ZkW9roRJbWSmn7rY475QLURlogM+Rlm3TOBajswcL0TySWgoq
 gJwARSH3ZCbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; 
   d="scan'208";a="610527723"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga005.jf.intel.com with ESMTP; 13 May 2021 14:48:12 -0700
Received: from debox1-desk1.jf.intel.com (debox1-desk1.jf.intel.com [10.54.75.174])
        by linux.intel.com (Postfix) with ESMTP id B52165807DB;
        Thu, 13 May 2021 14:48:12 -0700 (PDT)
Message-ID: <9cc6405610d82214fba76b332525110b63629da7.camel@linux.intel.com>
Subject: Re: [PATCH] MAINTAINERS: Update info for telemetry
From:   "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To:     Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        rajneesh.bhardwaj@amd.com, platform-driver-x86@vger.kernel.org
Cc:     dave.hansen@intel.com
Date:   Thu, 13 May 2021 14:48:12 -0700
In-Reply-To: <20210513153825.77214-1-irenic.rajneesh@gmail.com>
References: <20210513153825.77214-1-irenic.rajneesh@gmail.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Ack

On Thu, 2021-05-13 at 11:38 -0400, Rajneesh Bhardwaj wrote:
>  - My linux.intel.com email is no longer valid, update it to my gmail
> id.
> 
> Signed-off-by: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7fdc513392f4..dd21a6e56e17 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9209,7 +9209,7 @@
> F:        include/linux/firmware/intel/stratix10-smc.h
>  F:     include/linux/firmware/intel/stratix10-svc-client.h
>  
>  INTEL TELEMETRY DRIVER
> -M:     Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
> +M:     Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
>  M:     "David E. Box" <david.e.box@linux.intel.com>
>  L:     platform-driver-x86@vger.kernel.org
>  S:     Maintained


