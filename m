Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6BAC43460
	for <platform-driver-x86@archiver.kernel.org>; Mon,  5 Apr 2021 11:42:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B91EF61399
	for <platform-driver-x86@archiver.kernel.org>; Mon,  5 Apr 2021 11:42:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235037AbhDELmP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 5 Apr 2021 07:42:15 -0400
Received: from mga03.intel.com ([134.134.136.65]:33902 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235036AbhDELmP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 5 Apr 2021 07:42:15 -0400
IronPort-SDR: B3oIK02PYwlp3ynQ3rYaV+tqBWJQyuUOExKPpAhhIi8cq7ekC+8bVeEquQHShkG6x713YvOpTp
 6/Heigkv34Jg==
X-IronPort-AV: E=McAfee;i="6000,8403,9944"; a="192872205"
X-IronPort-AV: E=Sophos;i="5.81,306,1610438400"; 
   d="scan'208";a="192872205"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2021 04:42:09 -0700
IronPort-SDR: lWQkre9Rpr6czVAgduRSeQlG35hvb5JqUmcDvFKAbnuLlPLh/xV4PvOXxUBxXPD/GUQNtJrw9h
 +ZDn2nOv73GA==
X-IronPort-AV: E=Sophos;i="5.81,306,1610438400"; 
   d="scan'208";a="457389827"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2021 04:42:07 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lTNcL-001PcW-2g; Mon, 05 Apr 2021 14:42:05 +0300
Date:   Mon, 5 Apr 2021 14:42:05 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Christian Wehrfritz <cfritz@gmail.com>
Cc:     matan@svgalib.org, Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Subject: Re: lg-laptop and WM_BATT_LIMIT
Message-ID: <YGr3jcUozaOr0DZj@smile.fi.intel.com>
References: <CANEs7EkTrP2MygqhPAe=n5K=6inygWFkEpp3Y1_TTgDjSYT16w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANEs7EkTrP2MygqhPAe=n5K=6inygWFkEpp3Y1_TTgDjSYT16w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

+Cc: mailing list and PDx86 maintainers

On Sun, Apr 04, 2021 at 10:34:09PM +0200, Christian Wehrfritz wrote:
> Hi Matan and Andy,
> 
> I have a recent LG Gram 17 and the lg-laptop module works fine, except for
> the battery limit, that I'd like to set to 80.
> 
> I've been using Linux for a long time (0.97) and I have some experience in
> C, but not in kernel hacking.
> 
> In the module source, I noticed that you also had a different address for
> the battery limit (WMBB_BATT_LIMIT). I tried that, but setting this doesn't
> limit the charging and reading it results in an IO error - apparently the
> returned value is not an integer.
> 
> Is there anything else that I could try? I still have the windows
> partition, so I could set it in the LG software. And then possibly find out
> which address has changed? How do you approach such a problem?

I'm wondering if it uses WMI for that.

In any case, I have Cc'ed this to mailing list, hope there are people who may
advise something useful.

-- 
With Best Regards,
Andy Shevchenko


