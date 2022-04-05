Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB38DC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Apr 2022 02:48:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbiDECtz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Apr 2022 22:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbiDECtn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Apr 2022 22:49:43 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F9B0435371
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Apr 2022 18:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649123780; x=1680659780;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lXwlo5llKx1M4ft5++59ERj9vMO/akB0+4OqqozEBng=;
  b=c+Y+La7x1OTmn5MCrv58Fcp33tUE+BIgglNOsp8wInd4qAGU7TtI96Rq
   q2x+sHD+hajX9vZBlUZKZTnvT21YFwnWs31RE+ktWEvpjX8VTUGGmKzgN
   9o5wZ7DYSAs8jzy2zPuQeftMESrf2msbe2rGWh668QM8Atraq129cmcFI
   tQ0yEPU891mT4dJ2JABkWy8h86kqXlpg19BZQ19t1t8poQt0hw+RcWyvm
   ivnmCOFLmCdkhSFzw/SgdABzpGyqojkgyWYwviC9IGdlhkSVlRYLXyNsF
   WB+J05dTC4CDwQ3Ouiv0FrguJ9m5yDrrx3WN6ttWVKSQJY8C0rm1BPVHY
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="260819056"
X-IronPort-AV: E=Sophos;i="5.90,235,1643702400"; 
   d="scan'208";a="260819056"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2022 18:08:22 -0700
X-IronPort-AV: E=Sophos;i="5.90,235,1643702400"; 
   d="scan'208";a="548866574"
Received: from spandruv-desk.jf.intel.com ([10.54.75.8])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2022 18:08:21 -0700
Message-ID: <082d09960f881ab8fd5cd5cc80431b34dd6cc036.camel@linux.intel.com>
Subject: Re: [PATCH] tools/power/x86/intel-speed-select: fix build failure
 when using -Wl,--as-needed
From:   srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To:     "Herton R. Krzesinski" <herton@redhat.com>,
        platform-driver-x86@vger.kernel.org, hdegoede@redhat.com
Cc:     prarit@redhat.com, jforbes@redhat.com, darcari@redhat.com,
        dzickus@redhat.com
Date:   Mon, 04 Apr 2022 18:08:20 -0700
In-Reply-To: <20220404210525.725611-1-herton@redhat.com>
References: <20220404210525.725611-1-herton@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 2022-04-04 at 18:05 -0300, Herton R. Krzesinski wrote:
> Build of intel-speed-select will fail if you run:
> 
> $ LDFLAGS="-Wl,--as-needed" /usr/bin/make V=1

We realized this for some OS recently have an internal patch.
So agree with the change.

> ...
> gcc -O2 -Wall -g -D_GNU_SOURCE -Iinclude -I/usr/include/libnl3 -Wl,--
> as-needed -lnl-genl-3 -lnl-3 intel-speed-select-in.o -o intel-speed-
> select
> /usr/bin/ld: intel-speed-select-in.o: in function `handle_event':
> (...)/linux/tools/power/x86/intel-speed-select/hfi-events.c:189:
> undefined reference to `nlmsg_hdr'
> ...
> 
> In this case the problem is that order when linking matters when using
> the flag -Wl,--as-needed, symbols not used at that point are discarded.
> So since intel-speed-select-in.o comes after, at that point the
> libraries/symbols are already discarded and then missing/undefined
> references are reported.
> 
> To fix this, make sure we specify LDFLAGS after the object file.
> 
> Signed-off-by: Herton R. Krzesinski <herton@redhat.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> ---
>  tools/power/x86/intel-speed-select/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/power/x86/intel-speed-select/Makefile
> b/tools/power/x86/intel-speed-select/Makefile
> index 846f785e278d..7221f2f55e8b 100644
> --- a/tools/power/x86/intel-speed-select/Makefile
> +++ b/tools/power/x86/intel-speed-select/Makefile
> @@ -42,7 +42,7 @@ ISST_IN := $(OUTPUT)intel-speed-select-in.o
>  $(ISST_IN): prepare FORCE
>         $(Q)$(MAKE) $(build)=intel-speed-select
>  $(OUTPUT)intel-speed-select: $(ISST_IN)
> -       $(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
> +       $(QUIET_LINK)$(CC) $(CFLAGS) $< $(LDFLAGS) -o $@
>  
>  clean:
>         rm -f $(ALL_PROGRAMS)


