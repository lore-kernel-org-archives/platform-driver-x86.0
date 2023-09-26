Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B3AE7E631
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Sep 2023 13:05:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234782AbjIZNFi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Sep 2023 09:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234835AbjIZNFf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Sep 2023 09:05:35 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9610B1BE
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Sep 2023 06:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695733525; x=1727269525;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=6KIs9JcKUL9+PEy/NNit0h8OHRoCstSWhheBPZzW8tw=;
  b=bkzSh3peYlTN/eaK3SzN2a1fw4QgMzWU8govGjHrBHzWeDok48V4Zolr
   Oub5QEdY0Yrfu3K8kV06XYJGwDyIKjxpeQL/ovHZFbwYcM0Uu7J255l+r
   f/VUAqfN7Zgno1YDqVMrtFFHhdQxEVSa0PABm3YU9JsoAjX/NXTmqPIfG
   pBJqAIPsVAD/vpPpBRxsoJAhbhKXNHpHPciqDZn04ctX1SeSd6U1OP4N5
   Hsg0Gtqxnu7QY0935v2ZOvkSYg80SAwfRD3snyrCvV0iw+peibspU2Jso
   qrilYhpg+inJMs2Jmw85SoUZaeP0a6a4IICloqRMWOP8YMaCgJ7Wdd3vQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412474555"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="412474555"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 06:05:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="872490336"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="872490336"
Received: from hongy-mobl.ger.corp.intel.com (HELO localhost) ([10.252.41.3])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 06:05:21 -0700
From:   =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     hdegoede@redhat.com, Suma Hegde <suma.hegde@amd.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
In-Reply-To: <20230919092057.2235437-1-suma.hegde@amd.com>
References: <20230919092057.2235437-1-suma.hegde@amd.com>
Subject: Re: [PATCH v3 1/3] platform/x86/amd/hsmp: create plat specific
 struct
Message-Id: <169573351745.5370.1730064995365398437.b4-ty@linux.intel.com>
Date:   Tue, 26 Sep 2023 16:05:17 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 19 Sep 2023 09:20:55 +0000, Suma Hegde wrote:

> Having a separate platform device structure helps in future, to
> contain platform specific variables and other data.
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
[1/3] platform/x86/amd/hsmp: create plat specific struct
      commit: 6448b90731aabbfb0e351b11be37af94c157dda4
[2/3] platform/x86/amd/hsmp: add support for metrics tbl
      commit: 0f21042c11c7fa9053d5af1797f5a9380579f4dd
[3/3] platform/x86/amd/hsmp: improve the error log
      commit: bd2b5ff0df3da9b75e684d99cd5b1ed4e74e24db

--
 i.

