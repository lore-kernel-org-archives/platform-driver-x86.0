Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05F9C54FB9
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Nov 2023 08:11:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbjKUIMB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Nov 2023 03:12:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjKUIMA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Nov 2023 03:12:00 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC3E3C3
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Nov 2023 00:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700554316; x=1732090316;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=nvd6L7+O7lvkGzrPp86qluCewu5lPnK7gUoXOgKMaGQ=;
  b=AViF/Rc9O7rmRIKMLRK3ZfsnFNvCtK5SIagOV2Ys8IV/9dI8Ki/Lk9vH
   Dhl515mDmsTvW3pDdCNUu0q5k1gSMDz7r0qw/1CWKsEYqGVATNbmXtgTg
   0jswGdNF5Goo32193QFR+yI5iO26XzLzDnmuKpwXHBcy7YMq/sQfMbN7L
   HTgR8HvkesF+BunzSGgKNbhi8IsbOataGgPr47A+5TO3g8D+Czox+PLw3
   uVEnsLguZmippem626+LUWwi5nxwwe9BrmWi82RJt1x2Saprwd8EeaFs4
   ClyZjEYHJ8EsJlLlxq3o/xxqPorCw0QkviV4qYat3mMXf61ja5jrZ6l8O
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="390645721"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="390645721"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 00:11:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="8005085"
Received: from wpastern-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.57.17])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 00:11:54 -0800
From:   =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org
In-Reply-To: <20231120154548.611041-1-hdegoede@redhat.com>
References: <20231120154548.611041-1-hdegoede@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Drop Mark Gross as maintainer for x86
 platform drivers
Message-Id: <170055430902.2004.6202150745376967655.b4-ty@linux.intel.com>
Date:   Tue, 21 Nov 2023 10:11:49 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 20 Nov 2023 16:45:45 +0100, Hans de Goede wrote:

> Mark has not really been active as maintainer for x86 platform drivers
> lately, drop Mark from the MAINTAINERS entries for drivers/platform/x86,
> drivers/platform/mellanox and drivers/platform/surface.
> 
> 


Thank you for your contribution, it has been applied to my local
fixes branch. Note it will show up in the public
platform-drivers-x86/fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] MAINTAINERS: Drop Mark Gross as maintainer for x86 platform drivers
      commit: 8d9ce3e53bbd2d6241213e9a4deb310499c929ff

--
 i.

