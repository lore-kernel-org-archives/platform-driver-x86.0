Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BBEE92FFD
	for <platform-driver-x86@archiver.kernel.org>; Sat,  7 Oct 2023 07:27:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343632AbjJGH1L (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 7 Oct 2023 03:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343598AbjJGH1K (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 7 Oct 2023 03:27:10 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90048BD;
        Sat,  7 Oct 2023 00:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696663629; x=1728199629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZaYhee1Cg8qBtUmG9HLaU5vq5COyd3sChmfNRFzsMOs=;
  b=Pwr8fhLCBZf8ZtgidHWfYy1gcpfiIbxlXq+HJGtqqB0M6PG9EnlyahKT
   h5vWyGO6jlKj7gEGAHXb+H91hjWxq84gDhzRkJCJ+s/TiX7gJBnZHOTbC
   8GWdAHfMbuYKcF0MMDCgWw/vRLIM/hRzZnidWTIhVr7WSIv1hra53k8/K
   az8EgLTe1QRUMPWoAc2eTWX71PgRvV+gqKAYFpwoNn6CcqvEw3/QErwEG
   HSf9ee/YtZzJ78CFpDoipsipNCiRaN6jmYNZ4FCKd+1M377b4zm+/9aos
   CVn365nbSmrCik5rTODD59cJ1rUqLoLVbjDTiwsuOAMkse/Q4bTJ6e2Jr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="374238177"
X-IronPort-AV: E=Sophos;i="6.03,205,1694761200"; 
   d="scan'208";a="374238177"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2023 00:27:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="756126238"
X-IronPort-AV: E=Sophos;i="6.03,205,1694761200"; 
   d="scan'208";a="756126238"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2023 00:27:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qp1iK-00000003Xhj-1aJA;
        Sat, 07 Oct 2023 10:27:04 +0300
Date:   Sat, 7 Oct 2023 10:27:04 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH v2 1/1] platform/x86: xo15-ebook: Replace open coded
 acpi_match_device()
Message-ID: <ZSEISNzKdNIs7WHy@smile.fi.intel.com>
References: <20231006153152.3502912-1-andriy.shevchenko@linux.intel.com>
 <ff4e541d-590b-7eef-aeee-dc15ca869691@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff4e541d-590b-7eef-aeee-dc15ca869691@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Oct 06, 2023 at 05:34:19PM +0200, Hans de Goede wrote:
> On 10/6/23 17:31, Andy Shevchenko wrote:

...
`
> Thanks, patch looks good to me:
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Same issue as with other patch...

...

> > +	id = acpi_match_device(ebook_device_ids, device);

Should be acpi_match_acpi_device().

> > +	if (!id) {
> > +		dev_err(&device->dev, "Unsupported hid\n");
> >  		error = -ENODEV;
> >  		goto err_free_input;
> >  	}

-- 
With Best Regards,
Andy Shevchenko


