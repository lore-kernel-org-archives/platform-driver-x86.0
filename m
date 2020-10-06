Return-Path: <SRS0=8/nu=DN=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF24C41604
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Oct 2020 10:15:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF954206B5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Oct 2020 10:15:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725942AbgJFKPJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 6 Oct 2020 06:15:09 -0400
Received: from mga17.intel.com ([192.55.52.151]:6991 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725939AbgJFKPJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Oct 2020 06:15:09 -0400
IronPort-SDR: FqNpHRLYD9OZPef4VvKTK3Wo+AH+M2iGZEu6xAHN4F6rldhvBS2a4LQm2/whGKH2ay14s+yTHr
 i8UjE8FuSV+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="144342450"
X-IronPort-AV: E=Sophos;i="5.77,342,1596524400"; 
   d="scan'208";a="144342450"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2020 03:15:08 -0700
IronPort-SDR: J+HRS8jJ/c6Xmc7CQmdQpfpPyD+Hy1ZagQtOQOw31pOMhG2Y4m0JEjvsySxQ7IgWD2oPUj/4Hn
 XlVDsQWikdTw==
X-IronPort-AV: E=Sophos;i="5.77,342,1596524400"; 
   d="scan'208";a="315560543"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2020 03:15:06 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kPk0w-0004Ud-5R; Tue, 06 Oct 2020 13:16:10 +0300
Date:   Tue, 6 Oct 2020 13:16:10 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     =?utf-8?B?0JjQs9C+0YDRjA==?= <igooor7@gmail.com>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org
Subject: Re: intel_vbtn dead keyboard bug on Acer Aspire E5-511G
Message-ID: <20201006101610.GF4077@smile.fi.intel.com>
References: <CALBXvcZR8mR83Zxy-vu2MBt2uhT+chFyrXPZ1t0xNDPBmD4A1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALBXvcZR8mR83Zxy-vu2MBt2uhT+chFyrXPZ1t0xNDPBmD4A1A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

+Cc: mailing list and maintainers

On Mon, Oct 05, 2020 at 05:59:40PM +0300, Игорь wrote:
> Good time of day!
> Sorry for bothering you, I found a strange bug in "intel_vbtn" kernel
> module which makes the keyboard non-responding.
> Reproducible 100% starting from kernel 5.4.0-45 and till 5.8.0-20.
> Everything works fine on 5.4.0-42 or on Windows 10
> 
> As a workaround I blacklisted the intel_vbtn module and everything works
> fine. Seems like it somehow relative to tablet mode detection patch.
> 
> I did research and found out that this bug is affecting Acer Aspire E5-511G
> laptops and some HP model(s).
> Here it is: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1894017
> 
> Looking forward to hearing something from you.
> Thanks for your attention!
> 
> Best regards
> Igor

-- 
With Best Regards,
Andy Shevchenko


