From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] toshiba_acpi: Add set_fan_status function
Date: Tue, 28 Jul 2015 20:37:30 -0700
Message-ID: <20150729033730.GB3171@vmdeb7>
References: <1438046548-3081-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:34907 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750839AbbG2EyK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Jul 2015 00:54:10 -0400
Content-Disposition: inline
In-Reply-To: <1438046548-3081-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jul 27, 2015 at 07:22:23PM -0600, Azael Avalos wrote:
> This patch adds a new function named "set_fan_status" to complement
> its get* counterpart, as well as to avoid code duplication between
> "fan_proc_write" and "fan_store".
> 
> Also, both functions (get*, set*) are now checking for TOS_FAILURE,
> TOS_NOT_SUPPORTED and TOS_SUCCESS (to be on par with the rest of the
> HCI/SCI functions), printing an error message, returning -ENODEV and
> zero respectively.
> 
> The proc and sysfs functions were updated to reflect these changes as
> well, returning -EIO for proc, and propagating the error value on the
> sysfs functions.
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>

Queued, thanks Azael!

-- 
Darren Hart
Intel Open Source Technology Center
