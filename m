Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A57E92FFB
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Oct 2023 10:27:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbjJFK1q (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 Oct 2023 06:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbjJFK1p (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Oct 2023 06:27:45 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C8AAAD
        for <platform-driver-x86@vger.kernel.org>; Fri,  6 Oct 2023 03:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696588064; x=1728124064;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=04XW7JWheUvudMR678ZV8mG8jVA9F+cgL/TjrhnGnX8=;
  b=IgFcizaaByu0evRzdhI/w0HX+2esn5tErUkRt2LwROBpzQtbgc8kLWtz
   pyeqEL6e4j5+s1xSuQm/Z4HY8iSSto0JLI4P85DHpu9Q9i9mDAOAn1ecK
   rQcC3ngUsowKQVk4IOEvxgPRKP01djmodVItPOf1S6SD4ICES3rvaD9dN
   7TCSKv8ZuAckdKbxz13oTR/cG6VYvqVxwBN6b09X8aP+biHYLcr5bxFwi
   /fOGGcQEn9BCWptMBtVx2kl8IMnzHtlhNxcDDJqwe+rMtDj7SbEf6Vw94
   ESJvdhe3s+L7U5BIT92YeJFw7i0KSyb77cUWE8DPw6XJ1sk/mYCzImnAj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="447911382"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="447911382"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 03:27:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="781612358"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="781612358"
Received: from srab-mobl1.ger.corp.intel.com ([10.252.43.69])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 03:27:41 -0700
Date:   Fri, 6 Oct 2023 13:27:35 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     markgross@kernel.org, Sanket.Goswami@amd.com,
        mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org,
        Harsh Jain <Harsh.Jain@amd.com>
Subject: Re: [PATCH v4 2/2] platform/x86/amd/pmc: Add dump_custom_stb module
 parameter
In-Reply-To: <5f8ce053-cc9e-e6b2-c2ba-f62df30cb3ab@redhat.com>
Message-ID: <8215df42-6d3e-bd3f-d85-b17e462b2add@linux.intel.com>
References: <20230910142034.2967110-1-Shyam-sundar.S-k@amd.com> <20230910142034.2967110-2-Shyam-sundar.S-k@amd.com> <b3e4acdc-c031-cf00-b972-bc11e3933799@redhat.com> <ac5a328e-48ab-4e21-ad8a-72518d0952cb@amd.com> <5c6625ba-c2f0-6510-c1ea-3005a9c16e14@redhat.com>
 <844d0ef1-a09c-4c8a-aa14-d3487e3289f9@amd.com> <47babe3e-052f-d816-9789-5c8ae4728e78@redhat.com> <6d9a33d-3c92-3e24-3843-1084af1f516b@linux.intel.com> <5f8ce053-cc9e-e6b2-c2ba-f62df30cb3ab@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1087252431-1696588063=:3530"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1087252431-1696588063=:3530
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 5 Oct 2023, Hans de Goede wrote:
> On 10/5/23 12:15, Ilpo Järvinen wrote:
> > On Wed, 4 Oct 2023, Hans de Goede wrote:
> >> On 10/4/23 14:11, Shyam Sundar S K wrote:
> >>> Thank you for the detailed feedback. I will make these changes and see
> >>> if that helps - will need some time do tests and come back on this.
> >>>
> >>> Meanwhile, is it OK for you to take changes in v4 1/2 atleast? So that
> >>> I don't need to respin it again (assuming there are no remarks for 1/2).
> >>
> >> Note I have a new pdx86 co-maintainer Ilpo who is merging the patches
> >> leading up to the 6.7 merge window (Ilpo and I plan to take turns for this).
> >>
> >> IMHO it will be easier for Ilpo to merge the whole series in one
> >> go when it is ready.
> > 
> > I can take single patches just as easily as the whole series as my tools 
> > anyway explode the whole series into individual patches as an intermediate 
> > step.
> > 
> > I'll look into it tomorrow. There seemed to be one whitespace issue in the 
> > debug print but I can deal with that myself while applying but other than 
> > that, 1/2 seems fine to me.

I've now applied 1/2 into my local review-ilpo branch.

-- 
 i.
--8323329-1087252431-1696588063=:3530--
