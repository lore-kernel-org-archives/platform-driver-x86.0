From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: [PATCH 0/2] platform / x86: Convert remaining drivers to dev_pm_ops-based PM
Date: Sat, 30 Jun 2012 23:56:10 +0200
Message-ID: <201206302356.11014.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([193.178.161.156]:47519 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752089Ab2F3VwX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 30 Jun 2012 17:52:23 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, LKML <linux-kernel@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, Frank Seidel <frank@f-seidel.de>, "Lee, Chun-Yi" <jlee@novell.com>

Hi all,

After the changes I've sent recently there are two more drivers still using
legacy power management callbacks, so convert them too:

[1/2] hdaps: Use struct dev_pm_ops for power management
[2/2] msi-laptop: Use struct dev_pm_ops for power management

Thanks,
Rafael
