Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE49E810D0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Sep 2023 11:18:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbjI0LSW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Sep 2023 07:18:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231318AbjI0LSW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2023 07:18:22 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 582ABF3
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Sep 2023 04:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695813501; x=1727349501;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=5OplL1mGsn9IR0TN6PjaGlyXGrDdnv0g+pSzRetv/RM=;
  b=VDsgGDuUFU2E1RkCDciSGvBGD72BEmeS/KzA2RqVcoUdlGiij4GwhW5C
   ILrpBUuvUyvce04LMflhLc9yFpvW+oJKrw8sQvTL5yOjZTnMq3JLxlpwo
   OSZoZRtUrL+LEnY26UYHzc8t3qe0ioPhtjqJ5qlx8+F5gJOv/cCmPhu8y
   J1ewk+FLaw2zXdNuZPqPrqLQGV+XkG7HfzPr0y2XxRIzQ5+e6GgBjWIg3
   RfyhNovEK43tFo4BlKnA4C0IgDYktft9/A/xiGUqFl0/fVHlWwIRFnPyJ
   PPIGiTdXx4yo218mqHQz45X9zoKdbvFUOtrWA8pO86bjuevni9Ddn2xPT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="385655335"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="385655335"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 04:18:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="864791645"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="864791645"
Received: from clkuhl-mobl.amr.corp.intel.com (HELO idecesar-mobl.ger.corp.intel.com) ([10.252.53.225])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 04:18:18 -0700
Date:   Wed, 27 Sep 2023 14:18:16 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Suma Hegde <suma.hegde@amd.com>
cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v3 1/3] platform/x86/amd/hsmp: create plat specific
 struct
In-Reply-To: <169573351745.5370.1730064995365398437.b4-ty@linux.intel.com>
Message-ID: <339fc252-4f46-171a-1b20-088c0651015@linux.intel.com>
References: <20230919092057.2235437-1-suma.hegde@amd.com> <169573351745.5370.1730064995365398437.b4-ty@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1966354900-1695813500=:1756"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1966354900-1695813500=:1756
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Tue, 26 Sep 2023, Ilpo Järvinen wrote:

> On Tue, 19 Sep 2023 09:20:55 +0000, Suma Hegde wrote:
> 
> > Having a separate platform device structure helps in future, to
> > contain platform specific variables and other data.
> > 
> > 
> 
> 
> Thank you for your contribution, it has been applied to my local
> review-ilpo branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo branch only once I've pushed my
> local branch there, which might take a while.
> 
> Once I've run some tests on the review-ilpo branch the patches
> there will be added to the platform-drivers-x86/for-next branch
> and eventually will be included in the pdx86 pull-request to
> Linus for the next merge-window.
> 
> The list of commits applied:
> [1/3] platform/x86/amd/hsmp: create plat specific struct
>       commit: 6448b90731aabbfb0e351b11be37af94c157dda4
> [2/3] platform/x86/amd/hsmp: add support for metrics tbl
>       commit: 0f21042c11c7fa9053d5af1797f5a9380579f4dd

This ended up breaking the build and for some reason lkp had not caught it
(probably didn't build the series at all since the build fails already 
with allyesconfig).

I'll fix this in review-ilpo branch for you but please try to build test 
in the future to add a little bit of redundancy into build testing.

> [3/3] platform/x86/amd/hsmp: improve the error log
>       commit: bd2b5ff0df3da9b75e684d99cd5b1ed4e74e24db

-- 
 i.

--8323329-1966354900-1695813500=:1756--
