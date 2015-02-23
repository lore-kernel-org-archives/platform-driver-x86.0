From: Bastien Nocera <hadess@hadess.net>
Subject: Re: [PATCH 7/7] thinkpad_acpi: use DEVICE_ATTR_* macros
Date: Mon, 23 Feb 2015 11:27:34 +0100
Message-ID: <1424687254.28361.11.camel@hadess.net>
References: <1424443481.22910.19.camel@hadess.net>
	 <1424687122.3034736.231116061.6D0FF46D@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:56602 "EHLO
	relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752477AbbBWK3J (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 Feb 2015 05:29:09 -0500
In-Reply-To: <1424687122.3034736.231116061.6D0FF46D@webmail.messagingengine.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Jiri Kosina <jkosina@suse.cz>

On Mon, 2015-02-23 at 07:25 -0300, Henrique de Moraes Holschuh wrote:
> On Fri, Feb 20, 2015, at 11:44, Bastien Nocera wrote:
> > Use the DEVICE_ATTR_RW macro to reduce boiler plate
> 
> So far, so good, but you also used the DEVICE_ATTR_RO macro...
> 
> > and move the attribute declaration to get rid of function signatures.
> 
> I didn't see any "move the attribute declaration" done in this patch.

Too much cut'n'paste from another similar patch. I'll resend with a
better commit message.

> Other than that, looks good.

Great, thanks.
