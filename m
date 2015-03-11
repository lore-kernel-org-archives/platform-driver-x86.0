From: Bastien Nocera <hadess@hadess.net>
Subject: Re: [patch 1/2] thinkpad_acpi: signedness bugs getting current_mode
Date: Wed, 11 Mar 2015 11:07:51 +0100
Message-ID: <1426068471.17946.8.camel@hadess.net>
References: <20150311093450.GA3564@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:41541 "EHLO
	relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752087AbbCKKIN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 Mar 2015 06:08:13 -0400
In-Reply-To: <20150311093450.GA3564@mwanda>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2015-03-11 at 12:34 +0300, Dan Carpenter wrote:
> This needs to be signed for the error handling to work.  Valid modes 
> are small positive integers.
> 
> Fixes: b790ceeb0fd9 ('thinkpad_acpi: Add adaptive_kbd_mode sysfs 
> attr') Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-By: Bastien Nocera <hadess@hadess.net>
