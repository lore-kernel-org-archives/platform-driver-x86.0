From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] toshiba_acpi: Adapt /proc/acpi/toshiba/keys to TOS1900
 devices
Date: Fri, 17 Jul 2015 14:46:57 -0700
Message-ID: <20150717214657.GA99388@vmdeb7>
References: <1437168086-4197-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:50395 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751964AbbGQVq6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 17 Jul 2015 17:46:58 -0400
Content-Disposition: inline
In-Reply-To: <1437168086-4197-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jul 17, 2015 at 03:21:26PM -0600, Azael Avalos wrote:
> Since the introduction of TOS1900 devices support to the driver, the
> "keys" entry under the proc directory was broken, given that it only
> handled TOS620X devices accordingly.
> 
> This patch adapts the code to show the hotkey values of TOS1900
> devices too, and in case some programs are still using that interface,
> hotkeys reporting should now work on these devices.
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>

Thanks, queued to for-review.
-- 
Darren Hart
Intel Open Source Technology Center
