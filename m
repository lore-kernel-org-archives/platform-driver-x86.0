From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] toshiba_acpi: Update events in toshiba_acpi_notify
Date: Sat, 14 Mar 2015 11:47:19 -0700
Message-ID: <20150314184719.GC16816@fury.dvhart.com>
References: <1425690882-2772-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57433 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751281AbbCNSrT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 14 Mar 2015 14:47:19 -0400
Content-Disposition: inline
In-Reply-To: <1425690882-2772-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Mar 06, 2015 at 06:14:41PM -0700, Azael Avalos wrote:
> This patch adds a few more events sent to TOSXXXX devices, some of
> them are already identified, while some others simply print a message
> informing the type of event received.
> 
> Also, a netlink event is generated so that userspace apps, daemons,
> etc. act accordingly to these events.
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>

Queued, thanks Azael.

-- 
Darren Hart
Intel Open Source Technology Center
