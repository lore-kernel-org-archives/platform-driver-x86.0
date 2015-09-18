From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/2] toshiba_acpi: Unify hotkey enabling functions
Date: Fri, 18 Sep 2015 14:36:02 -0700
Message-ID: <20150918213602.GI66179@vmdeb7>
References: <1441819700-11678-1-git-send-email-coproscefalo@gmail.com>
 <1441819700-11678-2-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:42981 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754369AbbIRVgE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Sep 2015 17:36:04 -0400
Content-Disposition: inline
In-Reply-To: <1441819700-11678-2-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 09, 2015 at 11:28:19AM -0600, Azael Avalos wrote:
> Currently the driver has two functions enabling hotkeys support,
> but these two functions can be merged into one.
> 
> This patch merges these two functions, moving some checks to the
> *enable_hotkeys function, simplifying code in the process.
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>

Queued to testing for 4.4.

Thanks Azael.

-- 
Darren Hart
Intel Open Source Technology Center
