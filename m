From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: Add rfkill dependency to ACPI_TOSHIBA entry
Date: Mon, 14 Dec 2015 15:46:18 -0800
Message-ID: <20151214234618.GM11972@malice.jf.intel.com>
References: <1450123259-2638-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:37151 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752105AbbLNXqT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 14 Dec 2015 18:46:19 -0500
Content-Disposition: inline
In-Reply-To: <1450123259-2638-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Dec 14, 2015 at 01:00:59PM -0700, Azael Avalos wrote:
> Commit 2fdde83443aa ("toshiba_acpi: Add WWAN RFKill support") added
> WWAN rfkill support to the driver, but the KConfig entry was not
> updated to add the RFKill dependency, causing a broken build if
> RFKill is not selected.
> 
> This patch adds the RFKILL dependency to the KConfig entry, fixing
> the build issue.
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>

Queued, thanks!

-- 
Darren Hart
Intel Open Source Technology Center
