Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0C7C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Nov 2022 03:13:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbiKCDNn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 2 Nov 2022 23:13:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbiKCDNd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Nov 2022 23:13:33 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8724E1131;
        Wed,  2 Nov 2022 20:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667445212; x=1698981212;
  h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BWPSNFEZJ2AWajsTGVeZtJzwkg8qYnxtFuFHcQf3OPM=;
  b=KSmM4uppxX1SSm0WrxaCE3ijstzQzVhGdeA6qUToaFEc0UR1OjDIQCwG
   cJWB6tBxhF3GouvfwQPNDT4QfzgJYhmsMA9lUmkW9a8PzUnpvGGsfyDeF
   /jRE9xdq0PiZdS8OAVMm8jrGAn1mBRMOqrGqRyC0a4zY1FvFJRbViLi3s
   O7iFNCjiV9E2/XVP3AQv9tidoO2yWkyKd/3voNXB0Cf/jVR3wGSeNP59C
   rtqX5Wbyu63otBdmsn4xfK3WKk9tm7B+NmxACORAmlEsqDkbbe91cNnLR
   XBCXoXnAbLd86rMxV5m1wt6rAja+sx5zvcE7OCk5pXcqnm3IRRJQvmeuE
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="373801601"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="373801601"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 20:13:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="629186077"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="629186077"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga007.jf.intel.com with ESMTP; 02 Nov 2022 20:13:32 -0700
Received: from dshivaku-MOBL.amr.corp.intel.com (unknown [10.212.195.54])
        by linux.intel.com (Postfix) with ESMTP id D2721580B9E;
        Wed,  2 Nov 2022 20:13:31 -0700 (PDT)
Message-ID: <6aab14ee6b4118059be284695ea6bc646d5a2e1c.camel@linux.intel.com>
Subject: Re: [PATCH 4/9] platform/x86/intel/sdsi: Add meter certificate
 support
From:   "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     hdegoede@redhat.com, markgross@kernel.org,
        srinivas.pandruvada@intel.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 02 Nov 2022 20:13:31 -0700
In-Reply-To: <Y2JKm/TPgVAku93M@smile.fi.intel.com>
References: <20221101191023.4150315-1-david.e.box@linux.intel.com>
         <20221101191023.4150315-5-david.e.box@linux.intel.com>
         <Y2JKm/TPgVAku93M@smile.fi.intel.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 2022-11-02 at 12:46 +0200, Andy Shevchenko wrote:
> On Tue, Nov 01, 2022 at 12:10:18PM -0700, David E. Box wrote:
> > Add support for reading the meter certificate from Intel On Demand
> > hardware.  The meter certificate [1] is used to access the utilization
> > metrics of enabled features in support of the Intel On Demand consumption
> > model. Similar to the state certificate, the meter certificate is read by
> > mailbox command.
> > 
> > [1] 
> > https://github.com/intel-sandbox/debox1.intel_sdsi/blob/gnr-review/meter-certificate.rst
> 
> Link: tag?
> 
> ...
> 
> >  static BIN_ATTR(state_certificate, 0400, state_certificate_read, NULL,
> > SDSI_SIZE_READ_MSG);
> 
> BIN_ATTR_ADMiN_RO() ?
> 
> ...
> 
> > +static BIN_ATTR(meter_certificate, 0400, meter_certificate_read, NULL,
> > SDSI_SIZE_READ_MSG);
> 
> Ditto.
> 

Ack on all. Thanks Andy.

