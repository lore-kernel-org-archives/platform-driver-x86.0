Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40A4E92708
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Oct 2023 14:31:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234704AbjJEObs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Oct 2023 10:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234049AbjJEO3q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2023 10:29:46 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97F631FD4
        for <platform-driver-x86@vger.kernel.org>; Thu,  5 Oct 2023 06:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696513803; x=1728049803;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=7m8xigl3pQ3HwPCq6e+KHKmw0CgfU0q0399/m1eEl9w=;
  b=YXCwNX87fO5tyKwklFE4WveHdrZPKpXj7TA40rS+kfKW14gjr4rwj6Z8
   VxVWxEICrNzII6B8FPl9zIAdrYPWCCI1Sf6Xxtzc94xWADbzVN+geE6wS
   xORTtkXDlxYOryzS2KHUyxGIEppO97abqUYl7b3kohtJwhfqegpEwH9Ek
   GOmGdhyaL/jIOVn0Zh/zVPnfl6ZRo7w0PwOGS9FnBbAc4vMfGQReMmowI
   IBOI4MuUjLKUdzqog6/+Cb4WVYOu/Cr+bRtoH06ut/+8ol6X8u0JXDE8G
   QY3HYlM/4Z7wgvVx4lGQn48GvBBihHMTG9t6n4vP9AInJtGHLnqCxx1mC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="383361736"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="383361736"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 03:16:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="781194818"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="781194818"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ijarvine-mobl2.mshome.net) ([10.237.66.45])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 03:16:01 -0700
Date:   Thu, 5 Oct 2023 13:15:55 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     markgross@kernel.org, Sanket.Goswami@amd.com,
        mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org,
        Harsh Jain <Harsh.Jain@amd.com>
Subject: Re: [PATCH v4 2/2] platform/x86/amd/pmc: Add dump_custom_stb module
 parameter
In-Reply-To: <47babe3e-052f-d816-9789-5c8ae4728e78@redhat.com>
Message-ID: <6d9a33d-3c92-3e24-3843-1084af1f516b@linux.intel.com>
References: <20230910142034.2967110-1-Shyam-sundar.S-k@amd.com> <20230910142034.2967110-2-Shyam-sundar.S-k@amd.com> <b3e4acdc-c031-cf00-b972-bc11e3933799@redhat.com> <ac5a328e-48ab-4e21-ad8a-72518d0952cb@amd.com> <5c6625ba-c2f0-6510-c1ea-3005a9c16e14@redhat.com>
 <844d0ef1-a09c-4c8a-aa14-d3487e3289f9@amd.com> <47babe3e-052f-d816-9789-5c8ae4728e78@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 4 Oct 2023, Hans de Goede wrote:
> On 10/4/23 14:11, Shyam Sundar S K wrote:
> > Thank you for the detailed feedback. I will make these changes and see
> > if that helps - will need some time do tests and come back on this.
> > 
> > Meanwhile, is it OK for you to take changes in v4 1/2 atleast? So that
> > I don't need to respin it again (assuming there are no remarks for 1/2).
> 
> Note I have a new pdx86 co-maintainer Ilpo who is merging the patches
> leading up to the 6.7 merge window (Ilpo and I plan to take turns for this).
> 
> IMHO it will be easier for Ilpo to merge the whole series in one
> go when it is ready.

I can take single patches just as easily as the whole series as my tools 
anyway explode the whole series into individual patches as an intermediate 
step.

I'll look into it tomorrow. There seemed to be one whitespace issue in the 
debug print but I can deal with that myself while applying but other than 
that, 1/2 seems fine to me.

(In general, I personally prefer forward progress over posting the same 
patches over and over because something in the same serie requires more 
work).

> Note when addressing my remarks please split any fixes for the existing
> functionality out into separate patches vs the new dump_custom_stb
> support.

Also, the kzalloc() move + ->fsize addition could be in own patch so the 
actual dump_custom_stb patch itself becomes a lot simpler than it 
currently is.


-- 
 i.

