From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/2] ACER: Add support for ambient light sensor
Date: Wed, 6 Jun 2012 00:55:59 +0200
Message-ID: <201206060055.59421.marex@denx.de>
References: <1338570683-16491-1-git-send-email-marex@denx.de> <201206041914.00536.marex@denx.de> <CAHR064jYAFd06VYZvi90xZCyJCKEmEdKkmrim9mEn584CqRmzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:41871 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752136Ab2FEW4D (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 Jun 2012 18:56:03 -0400
In-Reply-To: <CAHR064jYAFd06VYZvi90xZCyJCKEmEdKkmrim9mEn584CqRmzw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, joeyli <jlee@suse.com>, "Zhang, Rui" <rui.zhang@intel.com>, Len Brown <len.brown@intel.com>, pavel@denx.de

Dear Corentin Chary,

[...]

> >> This is a generic device, and should be handled by ACPI core
> >> (Samsung laptop have this too). See "ACPI ALS" on linux-acpi.
> > 
> > Saying this would be enough. Lee explained to me what this ACPI0008
> > means, I'm quite new to the ACPI land so pardon my ignorance here. But
> > it then boils down to Lee's question, why wasn't the patch for ACPI ALS
> > that was already proposed accepted? And what can be done to get it in?
> 
> Yep, I've seen Lee's message latter. Regarding ACPI ALS status, it was
> forgotten for a long time, and recently Zhang Rui told that he will
> take another look at it, but nothing sure. If you want to know more
> about the status, you can do a quick search on gmane using "ACPI ALS"
> query on linux.acpi

Actually, going through the ACPI0008 patch, I see it introduced new sysfs class. 
Maybe we should rather integrate it with Linux-IIO these days?

Best regards,
Marek Vasut
