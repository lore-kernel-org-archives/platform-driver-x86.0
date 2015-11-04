From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH RESEND] toshiba_acpi: Initialize hotkey_event_type
 variable
Date: Wed, 4 Nov 2015 08:47:25 -0800
Message-ID: <20151104164725.GA20930@malice.jf.intel.com>
References: <1446654506-3730-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:54465 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932609AbbKDQr0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 4 Nov 2015 11:47:26 -0500
Content-Disposition: inline
In-Reply-To: <1446654506-3730-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org

On Wed, Nov 04, 2015 at 09:28:26AM -0700, Azael Avalos wrote:
> Commit 23f8f4326a15 ("toshiba_acpi: Fix hotkeys registration on some
> toshiba models") fixed an issue on some laptops regarding hotkeys
> registration, however, if failed to address the initialization of the
> hotkey_event_type variable, and thus, it can lead to potential
> unwanted effects as the variable is being checked.
> 
> This patch initializes such variable to avoid such unwanted effects.
> 
> Cc: <stable@vger.kernel.org> # 4.1+
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>

Applied, thanks Azael.
-- 
Darren Hart
Intel Open Source Technology Center
