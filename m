Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071E4C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Mar 2022 17:56:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235535AbiCIR5h (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Mar 2022 12:57:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235389AbiCIR5f (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Mar 2022 12:57:35 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 618A724BE0
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Mar 2022 09:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646848596; x=1678384596;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xr5B0Tg+mJueosGVqxli3HzayXk8JQE/HTJB3U2f3Ok=;
  b=e7T3COO80gJBJw6fUHTy0SZmumoznpgakVbsD3L7KjmdXgH8AVSIMQtR
   lL71hepYGKBWB6Ecbwol8NBfiRA2QP4YleSq0rmKJ6/VDEJL/AmpCzdBQ
   sOD9pqmVfznCuS35w1eQbYvkCK4r/QPEmPB55aitlZd5txsj9VbCVoEnD
   HblHcpE3a+0Y/mP8PpLhuD+q4yvABcD1nhVQqmBxLAv7z02IKu2e8OgCC
   jvhEfpqP7lWOGg1X+i2ayJXMnSCn4CubNB2dUb/Mo0ye0Z8AUEDxJrETk
   cnH0MRBLQAfgaOQfoYbK8/hwDQPfISvXbDUDpe2sIne1f5Q8SFJzaj5ds
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="341476214"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; 
   d="scan'208";a="341476214"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2022 09:56:34 -0800
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; 
   d="scan'208";a="644126819"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2022 09:56:32 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1nS0XN-00E8Am-9g;
        Wed, 09 Mar 2022 19:55:49 +0200
Date:   Wed, 9 Mar 2022 19:55:48 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [External] [PATCH 2/2] platform/x86: thinkpad_acpi: Don't use
 test_bit on an integer
Message-ID: <YijqJHqr4pe2/m6V@smile.fi.intel.com>
References: <20220309170532.343384-1-hdegoede@redhat.com>
 <20220309170532.343384-2-hdegoede@redhat.com>
 <248c280b-7469-85e9-e642-41991445a2e2@lenovo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <248c280b-7469-85e9-e642-41991445a2e2@lenovo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Mar 09, 2022 at 12:08:26PM -0500, Mark Pearson wrote:
> Thanks Hans,
> 
> I hadn't realised that was the case - appreciate the fix

There are three hidden issues with bit operations being used over non-unsigned
long types: a) big-endianness (wrong bit order); b) out of boundaries access
due to BE or types when sizeof() < sizeof(unsigned long); c) unaligned access.

All of them are potential security holes and/or crashes.

> On 2022-03-09 12:05, Hans de Goede wrote:
> > test_bit can only be used on longs not on ints, fix this.

> > p.s. Mark, the need for the (void *) case in the code this replaces
> > should have been a hint that something was not right; and I should
> > have spotted that during review...

-- 
With Best Regards,
Andy Shevchenko


