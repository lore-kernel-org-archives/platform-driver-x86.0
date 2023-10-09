Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AAAAE95A97
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 13:10:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376895AbjJINK4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 09:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376897AbjJINKg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 09:10:36 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCCEDFB
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 06:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696857018; x=1728393018;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=FGXRW2AFGU58UhI+H5ORU9NO9SUvYroLiO53PH/vko4=;
  b=X4YonNL3rmZIWNvO5xixnxoc9EgBI1bh7gXtmNjkaifo7t7Q09iyHGD5
   RrzjKii/nWVbEWNkD9K1d9gZRQq848HToLo7/URqmbVY0ViWjejDhJvyM
   KlWB/TWTOvEu60ETU7XWRcGrQ24TfK21NwbZgKZe1yI6avRRVJA0iP5DX
   TAn2w5b9gESVCuoQfo9v3k/SnozLqP4VIfqvy7tj7wDZFZyeuhZkAn7JQ
   V28XCqthv53cCFJcWJN0eClWFjE+64ILH0CMmqu1DnlY2OnFzbUkhGseK
   Y4srPTz6tJMp0AUHMPK8IcKJESmn5TvxteNCpLbR/RNFy4YjuWO9oEtai
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="363489663"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="363489663"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 06:10:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="869248536"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="869248536"
Received: from lshebash-mobl3.ccr.corp.intel.com ([10.252.57.254])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 06:10:16 -0700
Date:   Mon, 9 Oct 2023 16:10:14 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Nikita Kravets <teackot@gmail.com>
cc:     platform-driver-x86@vger.kernel.org,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: Re: [PATCH v2 3/3] platform/x86: msi-ec: Add more EC configs
In-Reply-To: <51dfe28c-fc47-9f52-6952-3ab2f9a1e668@redhat.com>
Message-ID: <4e5f3519-52a5-179b-1593-80821c2960d0@linux.intel.com>
References: <20231006175352.1753017-3-teackot@gmail.com> <20231006175352.1753017-9-teackot@gmail.com> <4e788e51-ec7b-4dc2-ed66-419e94514aa9@linux.intel.com> <d15fcb9b-0d4f-b874-7066-03aae78e160c@redhat.com> <5635e2f-e169-9858-1034-5607d9cfde@linux.intel.com>
 <51dfe28c-fc47-9f52-6952-3ab2f9a1e668@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-32556282-1696857017=:1721"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-32556282-1696857017=:1721
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 9 Oct 2023, Hans de Goede wrote:
> On 10/9/23 14:34, Ilpo Järvinen wrote:
> > On Mon, 9 Oct 2023, Hans de Goede wrote:
> >> On 10/9/23 13:40, Ilpo Järvinen wrote:
> >>> On Fri, 6 Oct 2023, Nikita Kravets wrote:
> >>>
> >>>> This patch adds configurations for new EC firmware from the downstream
> >>>> version of the driver.
> >>>>
> >>>> Cc: Aakash Singh <mail@singhaakash.dev>
> >>>> Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
> >>>> Signed-off-by: Nikita Kravets <teackot@gmail.com>

> >>>> +		.bl_state_address = MSI_EC_ADDR_UNSUPP, // not functional
> >>>
> >>> I only too patch 2/3 becase there seems to be some configuration option 
> >>> which causes // comments to trigger warning (that can be made errors 
> >>> with another config option) so please use only /* */ comments.
> >>
> >> Hmm, that is very weird all the:
> >>
> >> // SPDX-License-Identifier ...
> >>
> >> comments at the top of many of our .c files are c++ style comments.
> > 
> > I know there are those already which is why I didn't think there would 
> > have been any problem with them until I got burned.
> > 
> > If // comments are okay, what's the explanation for this then:
> > 
> >   https://lore.kernel.org/oe-kbuild-all/202309270535.g9nOUvFb-lkp@intel.com/
> > 
> > It's from randconfig build so it's a bit hard to know from the report 
> > itself which CONFIG combination exactly triggers the issue.
> > 
> > I can think of two potential ones:
> >   a) Only problems for changed lines are reported by LKP
> >   b) Header files have different rules than .c files (uapi ones in 
> >      particular, I'd guess, if that's the case)
> 
> Yes I think that the error you point at is caused by the file in question
> being a uapi header. It makes some sense to avoid C++ style comments there
> to e.g. avoid problems when userspace code is build with -ansi .
> 
> So I think that uapi headers are the exception to the rule that
> c++ style comments are ok.

Okay, if that's the case, I took this patch into review-ilpo now.

Thank you Nikita for the patch (2 and 3 are now in the review-ilpo 
branch).

-- 
 i.

--8323329-32556282-1696857017=:1721--
