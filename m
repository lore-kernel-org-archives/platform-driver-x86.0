From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] panasonic-laptop: fix acpi_pcc_write_sset return value
Date: Tue, 6 Jul 2010 09:28:43 -0700
Message-ID: <20100706162842.GB9408@core.coreip.homeip.net>
References: <1278398818.12801.20.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:56732 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754331Ab0GFQ2w (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 6 Jul 2010 12:28:52 -0400
Content-Disposition: inline
In-Reply-To: <1278398818.12801.20.camel@mola>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Harald Welte <laforge@gnumonks.org>, Matthew Garrett <mjg@redhat.com>, Richard Purdie <rpurdie@linux.intel.com>, =?iso-8859-1?Q?M=E1rton_N=E9meth?= <nm127@freemail.hu>, Jiri Kosina <jkosina@suse.cz>, platform-driver-x86@vger.kernel.org

Hi Axel,

On Tue, Jul 06, 2010 at 02:46:58PM +0800, Axel Lin wrote:
> In current implementation, acpi_pcc_write_sset return 1
> if write is successful, 0 if write is failed.
> But all the callers consider acpi_pcc_write_sset return 0
> if write is successful and return negative if write is failed.
>

Yes, I think most of the times we see AE_* outside of
drivers/acpi/acpica it is an error; we should be using standard eoro
codes instead.

> This patch changes the implementation of acpi_pcc_write_sset to
> return 0 if write is successful, -1 if write is failed.

Why not use something better than -1, maybe -EIO, and the propagate that
return code up the stack?

Thanks.

-- 
Dmitry
