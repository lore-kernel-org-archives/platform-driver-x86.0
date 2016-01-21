From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform:x86: Fix warnings in telemetry debugfs
Date: Thu, 21 Jan 2016 13:51:43 -0800
Message-ID: <20160121215143.GE1979@malice.jf.intel.com>
References: <1453272646-15183-1-git-send-email-souvik.k.chakravarty@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:53187 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752621AbcAUVvq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Jan 2016 16:51:46 -0500
Content-Disposition: inline
In-Reply-To: <1453272646-15183-1-git-send-email-souvik.k.chakravarty@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jan 20, 2016 at 12:20:46PM +0530, Souvik Kumar Chakravarty wrote:
> This patch fixes compile time warnings when CONFIG_PM_SLEEP
> is undefined. In this case sleep related counters are unused.
> 
> Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>

Thanks, queued to testing.
-- 
Darren Hart
Intel Open Source Technology Center
