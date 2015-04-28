From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] thinkpad_acpi: Fix warning
Date: Mon, 27 Apr 2015 21:53:42 -0700
Message-ID: <20150428045342.GA115917@vmdeb7>
References: <20150427094506.0aacec22@endymion.delvare>
 <1430135750.3894493.259065913.17A66CB2@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:33865 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751030AbbD1Exs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Apr 2015 00:53:48 -0400
Content-Disposition: inline
In-Reply-To: <1430135750.3894493.259065913.17A66CB2@webmail.messagingengine.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Jean Delvare <jdelvare@suse.de>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Mon, Apr 27, 2015 at 08:55:50AM -0300, Henrique de Moraes Holschuh wrote:
> On Mon, Apr 27, 2015, at 04:45, Jean Delvare wrote:
> > Fix the following warning:
> > 
> > warning: "static" is not at beginning of declaration
> >  void static hotkey_mask_warn_incomplete_mask(void)
> >  ^
> > 
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
> > Cc: Darren Hart <dvhart@infradead.org>
> 
> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Queued, thank you.

-- 
Darren Hart
Intel Open Source Technology Center
