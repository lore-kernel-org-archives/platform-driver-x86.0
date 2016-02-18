From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] intel_telemetry_pltdrv: Change verbosity control bits
Date: Wed, 17 Feb 2016 21:14:08 -0800
Message-ID: <20160218051408.GB18421@dvhart-mobl5.amr.corp.intel.com>
References: <1455690922-22936-1-git-send-email-souvik.k.chakravarty@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:59487 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1424477AbcBRFOK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 18 Feb 2016 00:14:10 -0500
Content-Disposition: inline
In-Reply-To: <1455690922-22936-1-git-send-email-souvik.k.chakravarty@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Feb 17, 2016 at 12:05:22PM +0530, Souvik Kumar Chakravarty wrote:
> Due to a recent fix in the firmware, the Punit verbosity control bits
> now adhere to the correct pattern. Hence remove the workaround and
> do a read-mofiy-write of the register.
> 
> Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>

Queued to testing, thank you Souvik.

-- 
Darren Hart
Intel Open Source Technology Center
