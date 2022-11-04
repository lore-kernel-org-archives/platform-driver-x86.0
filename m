Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B07C6C4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Nov 2022 17:23:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231547AbiKDRXU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 4 Nov 2022 13:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbiKDRXD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Nov 2022 13:23:03 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E854386F;
        Fri,  4 Nov 2022 10:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667582556; x=1699118556;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=efPIZNMJfQFj5AFyIXMUtT8fAkFrSQrZCsQAcNWzKCI=;
  b=Pd+JiAoPrudQZKx0vCNv37Xc5aP/USBTJDjpHxRByekMEZN0pYAf8LH7
   xzdByA0wNxQAslSe7cki48ROzpCcgIwjWHcqWr8SxC4gZVJR2GrYlVA+9
   UpP1olSBH6AQSVBfSAj4Mo9/EA9rTiOmpxFpof8RowhAWQhpcq+eaYpEP
   D0wqwcR4Ifadmr/czXk84QIAHZTq311ofmaDsKC/gsaMbzoWSPQRMdSlH
   0FX5bF48o3/T+jKQcubyo/Hk/F1GBEq+pmnghtQZwda+sj8UvHJrNmuDL
   51ONjkPP7JQbdCZtAelrHOZSWw1ks1onVUrgi5vOV+XyFbh5kZNnfP9bE
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="290411543"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; 
   d="scan'208";a="290411543"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2022 10:22:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="704159400"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; 
   d="scan'208";a="704159400"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 04 Nov 2022 10:22:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1or0On-007T0L-0o;
        Fri, 04 Nov 2022 19:22:33 +0200
Date:   Fri, 4 Nov 2022 19:22:32 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH v1 1/1] platform/x86: p2sb: Don't fail if unknown CPU is
 found
Message-ID: <Y2VKWJlFvixnFu/p@smile.fi.intel.com>
References: <20221104154916.35231-1-andriy.shevchenko@linux.intel.com>
 <MN0PR12MB6101C1FEA748E52D42CBC734E23B9@MN0PR12MB6101.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN0PR12MB6101C1FEA748E52D42CBC734E23B9@MN0PR12MB6101.namprd12.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Nov 04, 2022 at 03:58:22PM +0000, Limonciello, Mario wrote:
> > -----Original Message-----
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Friday, November 4, 2022 10:49

...

> > We have accessing P2SB from a very few places for quite known hardware.
> > 
> > When a new SoC appears in intel-family.h it's not obvious that it needs
> > to be added to p2sb.c as well. Instead, provide default BDF and refactor
> > p2sb_get_devfn() to always succeed. If in the future we would need to
> > exclude something, we may add a list of unsupported IDs.
> > 
> > Without this change the iTCO on Intel Commet Lake SoCs became
> 
> Isn't it "Comet Lake"?

Right, thanks!

In any case I would like to have Jarkko's Tested-by before proceeding with
this. Hence v2 is warranted to appear.

> > unavailable:
> > 
> >   i801_smbus 0000:00:1f.4: failed to create iTCO device

-- 
With Best Regards,
Andy Shevchenko


