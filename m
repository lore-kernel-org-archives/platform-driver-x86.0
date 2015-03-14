From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch 2/2] thinkpad_acpi: off by one in
 adaptive_keyboard_hotkey_notify_hotkey()
Date: Sat, 14 Mar 2015 12:03:28 -0700
Message-ID: <20150314190328.GF16816@fury.dvhart.com>
References: <20150311093607.GB3564@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:58832 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751926AbbCNTDg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 14 Mar 2015 15:03:36 -0400
Content-Disposition: inline
In-Reply-To: <20150311093607.GB3564@mwanda>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Bastien Nocera <hadess@hadess.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Mar 11, 2015 at 12:36:07PM +0300, Dan Carpenter wrote:
> This should be >= instead of > because otherwise we read one element
> past the end of the hotkey_keycode_map[] array.
> 
> The hotkey_keycode_map[] array has TPACPI_HOTKEY_MAP_LEN elements.
> 
> Fixes: 6a68d8557084 ('thinkpad_acpi: Add support for more adaptive kbd buttons')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Queued, thanks.

-- 
Darren Hart
Intel Open Source Technology Center
