From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH 2/5] thinkpad_acpi: Use struct dev_pm_ops instead of
 legacy PM routines
Date: Sat, 23 Jun 2012 21:34:16 -0300
Message-ID: <20120624003416.GB20885@khazad-dum.debian.net>
References: <201206172226.42729.rjw@sisk.pl>
 <201206172227.57189.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:45286 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754547Ab2FXAeX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 23 Jun 2012 20:34:23 -0400
Content-Disposition: inline
In-Reply-To: <201206172227.57189.rjw@sisk.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: platform-driver-x86@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, LKML <linux-kernel@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Joey Lee <jlee@novell.com>

On Sun, 17 Jun 2012, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rjw@sisk.pl>
> 
> Make the thinkpad_acpi driver define its PM callbacks through
> a struct dev_pm_ops object rather than by using legacy PM hooks
> in struct platform_driver.
> 
> Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
