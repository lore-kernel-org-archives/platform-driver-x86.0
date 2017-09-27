From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Don't oops when FUJ02E3 is
 not presnt
Date: Tue, 26 Sep 2017 23:56:55 -0700
Message-ID: <20170927065655.GA30358@fury>
References: <20170918200059.16279-1-ville.syrjala@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:44477 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751362AbdI0G5B (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2017 02:57:01 -0400
Content-Disposition: inline
In-Reply-To: <20170918200059.16279-1-ville.syrjala@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy@infradead.org>

On Mon, Sep 18, 2017 at 11:00:59PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> My Fujitsu-Siemens Lifebook S6120 doesn't have the FUJ02E3 device,
> but it does have FUJ02B1. That means we do register the backlight
> device (and it even seems to work), but the code will oops as soon
> as we try to set the backlight brightness because it's trying to
> call call_fext_func() with a NULL device. Let's just skip those
> function calls when the FUJ02E3 device is not present.
> 
> Cc: Jonathan Woithe <jwoithe@just42.net>
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: Andy Shevchenko <andy@infradead.org>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Thanks for all the discussion on this patch. While there are a couple approaches
we can take, it is clear further clean up and refactoring is in order. To fix
the Ooops now, I will apply this patch to fixes and Cc Stable.

Thanks,

-- 
Darren Hart
VMware Open Source Technology Center
