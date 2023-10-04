Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9682EE8FDD5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Oct 2023 07:27:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232801AbjJDH1S (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 Oct 2023 03:27:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232754AbjJDH1R (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Oct 2023 03:27:17 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A134D98;
        Wed,  4 Oct 2023 00:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696404434; x=1727940434;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=V5M0fMU7wG1YRJZZkM4lact4hO+apBUwNfEeYUbRINo=;
  b=NX9rqMgAp4pC2ndkyU7cCBn7VOutb5X5qWTM/xp0yN3db1+RvAUwJ5OA
   5S/e4tLV5iqNdehjogxHEiBHp+YP4G+2YuzoykZO49aiHqW1vbd0dtY3k
   aLakba6RoyvIvyRyt5uY7M9BGN/6jGvKZ0qv4Q3iSECmYdYgkBqgO4KaL
   VZGGer7FsB1trTlZ30g2Mg93xK83ytSUQ1QDCCLISSVg8GD873rt93tdS
   Gbrse5IiwpXMJgTQfXQUY+PcgngJZduW7OZgT6DMMqYYjlNuNy4Epgx5u
   o4uI4IvjD6QXQXbjWdTHsSJCHwubCS33nssp82BsLcKhSmOKBAT4EtUbj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="380365655"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="380365655"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 00:27:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="751179848"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="751179848"
Received: from cyrillet-mobl.ger.corp.intel.com ([10.252.55.203])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 00:27:12 -0700
Date:   Wed, 4 Oct 2023 10:27:09 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     "David E. Box" <david.e.box@linux.intel.com>
cc:     LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org, rajvi.jingar@linux.intel.com
Subject: Re: [PATCH V2 02/13] platform/x86/intel/vsec: remove platform_info
 from vsec device structure
In-Reply-To: <20231004020222.193445-3-david.e.box@linux.intel.com>
Message-ID: <90104c5-a561-b1ab-d50-937793696fbf@linux.intel.com>
References: <20231004020222.193445-1-david.e.box@linux.intel.com> <20231004020222.193445-3-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1293017714-1696404433=:1931"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1293017714-1696404433=:1931
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Tue, 3 Oct 2023, David E. Box wrote:

> In preparation for exporting an API to register Intel Vendor Specific
> Extended Capabilities (VSEC) from other drivers, remove the pointer to
> platform_info from intel_vsec_device. This prevents a potential page fault
> when auxiliary drivers probe and attempt to dereference this pointer to
> access the needed quirks field. Instead, just add the quirks to
> intel_vsec_device.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
> V2 - New patch splitting previous PATCH 1

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.
--8323329-1293017714-1696404433=:1931--
