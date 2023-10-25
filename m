Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E8FBC25B47
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Oct 2023 09:49:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232808AbjJYJtR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Oct 2023 05:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233303AbjJYJtR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Oct 2023 05:49:17 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7882BB4;
        Wed, 25 Oct 2023 02:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698227355; x=1729763355;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=lFW2CFCkJg8forNXaqpYiDKTAPrwAZGSou70SazvNUA=;
  b=eLEf5fEyxbpxqdfzcCpZbbOyXv1u9rGaT5hluGCvK7cEcIN3QXeFp5QN
   0EZTJmSU2jQNI+vBFxkS29Bby7sDpzLtz80YRZ07v5dVkiP8Ab6l1UpK3
   7d7uTfBJlLwZuRS+yNf7sYogI5+w1XxiFMe5gdqlVGuF5ZkS3NmSG/IS/
   lNvhEAnSYipHEHvFt+CHc5ANVscCzbOC8JtJwWQyNGWtS3DRbX0eEYyuD
   giNxG6nHFGV6OLj04fZjhDMBhSRsnB8QOyfuXqno42cjmqPIYbsjG1Dtq
   2xk/5vwRkBhiBIun4bmp7P90MtH3prCyjG6UqC7VXgGJnAH0ryyJZ8Erf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="473511470"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="473511470"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 02:49:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="36806"
Received: from mariamih-mobl.ger.corp.intel.com (HELO localhost) ([10.251.212.124])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 02:48:39 -0700
From:   =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     naveenkrishna.chatradhi@amd.com, carlos.bilbao@amd.com,
        Armin Wolf <W_Armin@gmx.de>
Cc:     hdegoede@redhat.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231019135122.21774-1-W_Armin@gmx.de>
References: <20231019135122.21774-1-W_Armin@gmx.de>
Subject: Re: [PATCH] platform/x86/amd/hsmp: Fix iomem handling
Message-Id: <169822734479.3766.2878095091936097795.b4-ty@linux.intel.com>
Date:   Wed, 25 Oct 2023 12:49:04 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 19 Oct 2023 15:51:22 +0200, Armin Wolf wrote:

> Since the metrics table is marked as io memory,
> use memcpy_fromio() when copying its contents.
> 
> Compile-tested only.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

Once I've run some tests on the review-ilpo branch the patches
there will be added to the platform-drivers-x86/for-next branch
and eventually will be included in the pdx86 pull-request to
Linus for the next merge-window.

The list of commits applied:
[1/1] platform/x86/amd/hsmp: Fix iomem handling
      commit: 02a258ac3ebf8a530d340ec24a694c13ac9d25c0

--
 i.

