From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: intel_telemetry: add back linux/io.h
 inclusion
Date: Thu, 2 Nov 2017 18:01:58 -0700
Message-ID: <20171103010158.GC7971@fury>
References: <20171102164933.110292-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:50944 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932398AbdKCBCB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2017 21:02:01 -0400
Content-Disposition: inline
In-Reply-To: <20171102164933.110292-1-arnd@arndb.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, Andy Shevchenko <andy@infradead.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Shanth Murthy <shanth.murthy@intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Nov 02, 2017 at 05:49:27PM +0100, Arnd Bergmann wrote:
> This one wasn't redundant after all, as shown by this randconfig
> build error:
> 
> drivers/platform/x86/intel_telemetry_pltdrv.c: In function 'telem_evtlog_read':
> drivers/platform/x86/intel_telemetry_pltdrv.c:900:20: error: implicit declaration of function 'readq' [-Werror=implicit-function-declaration]
> 
> We should generally include exactly the set of headers that declare
> the interfaces we use, so this adds back the missing include to
> get it to compile again.

Thanks Arnd, Andy already caught this and has it queued.

-- 
Darren Hart
VMware Open Source Technology Center
