From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/2] platform/x86: add const to
 thermal_cooling_device_ops structures
Date: Wed, 21 Jun 2017 14:14:45 -0700
Message-ID: <20170621211445.GD25900@fury>
References: <1498028657-12059-1-git-send-email-bhumirks@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:48954 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751083AbdFUVOz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jun 2017 17:14:55 -0400
Content-Disposition: inline
In-Reply-To: <1498028657-12059-1-git-send-email-bhumirks@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bhumika Goyal <bhumirks@gmail.com>
Cc: julia.lawall@lip6.fr, peter@piie.net, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, sujith.thomas@intel.com

On Wed, Jun 21, 2017 at 12:34:15PM +0530, Bhumika Goyal wrote:
> Declare thermal_cooling_device_ops structures as const.
> 

Thanks, applied to testing.

> Bhumika Goyal (2):
>   acerhdf: add const to thermal_cooling_device_ops structure
>   intel_menlow: add const to thermal_cooling_device_ops structure
> 
>  drivers/platform/x86/acerhdf.c      | 2 +-
>  drivers/platform/x86/intel_menlow.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> -- 
> 2.7.4
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center
