Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4497FC32774
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 Aug 2022 15:05:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242221AbiHYPFN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 Aug 2022 11:05:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240688AbiHYPFG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Aug 2022 11:05:06 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E12EB0B2F
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Aug 2022 08:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661439905; x=1692975905;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BUuDNLh4rhzcLxyBImB1VIRBnnbK2cayUIhGj5Dsdcg=;
  b=L6ez5uotc5wOLgBLVE7iVG3p3437/U/upD+jGtle0MlhhSIFK3xYoym9
   TRKofjwc6nc/jdJL/ojBGnxpKyG3TgKdWWbbh5twjmW0xQbxktJrhxEPr
   2ZqTmoFHgqIZv0kZPqKg2CRuRVd8U5lwRgla5aplZwPTdkBjgApzTPwvA
   50IJB3wN8iQ27BhzfkvhklwmeYc3QbvMm5Wc59GIOX7BqFtT8IJS52iq3
   wLL+DdJpIoS8m/vTl5KH1mU/4oqIyb4IcNpOR7ZGCVGEmSDm4RznyvvA1
   ugNqqwfTS5QJg7B+1McKCpP7XlT+tyKZoHSf1BMiebd9E1w3YUPKnam0l
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="281229320"
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; 
   d="scan'208";a="281229320"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 08:05:04 -0700
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; 
   d="scan'208";a="586906789"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 08:05:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1oREPk-003RRB-2L;
        Thu, 25 Aug 2022 18:05:00 +0300
Date:   Thu, 25 Aug 2022 18:05:00 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/3] platform/x86: msi-laptop: Simplify ec_delay handling
Message-ID: <YwePnFm3YpjcjthT@smile.fi.intel.com>
References: <20220825141336.208597-1-hdegoede@redhat.com>
 <20220825141336.208597-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825141336.208597-2-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Aug 25, 2022 at 04:13:35PM +0200, Hans de Goede wrote:
> There is no reason to have both non-delayed and delayed work structs
> for the rfkill and touchpad work.
> 
> Instead simply call schedule_delayed_work() with a delay of 0 for
> the quirks->ec_delay == fase case.

fase ?!

-- 
With Best Regards,
Andy Shevchenko


