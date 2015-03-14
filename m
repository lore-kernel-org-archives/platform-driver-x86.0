From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch 1/2] thinkpad_acpi: signedness bugs getting current_mode
Date: Sat, 14 Mar 2015 12:03:06 -0700
Message-ID: <20150314190306.GE16816@fury.dvhart.com>
References: <20150311093450.GA3564@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:58819 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752084AbbCNTDU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 14 Mar 2015 15:03:20 -0400
Content-Disposition: inline
In-Reply-To: <20150311093450.GA3564@mwanda>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Bastien Nocera <hadess@hadess.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Mar 11, 2015 at 12:34:50PM +0300, Dan Carpenter wrote:
> This needs to be signed for the error handling to work.  Valid modes are
> small positive integers.
> 
> Fixes: b790ceeb0fd9 ('thinkpad_acpi: Add adaptive_kbd_mode sysfs attr')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

Queued, thanks Dan!

-- 
Darren Hart
Intel Open Source Technology Center
