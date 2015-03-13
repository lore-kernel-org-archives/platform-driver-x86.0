From: Aaron Lu <aaron.lu@intel.com>
Subject: HP Compaq 6510b FN keys for brightness not working after boot
Date: Fri, 13 Mar 2015 13:33:25 +0800
Message-ID: <20150313053325.GA22984@aaronlu.sh.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:62480 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750767AbbCMFes (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 13 Mar 2015 01:34:48 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kyle Evans <kvans32@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Bertrand Vieille <vieille.bertrand@free.Fr>, linux-kernel-org@datahugger.de

Hi Kyle,

It seems that your commit:

commit f82bdd0d77b6bf0dea08a1d957ab45d503f328b1
Author: Kyle Evans <kvans32@gmail.com>
Date:   Mon Jun 9 12:26:06 2014 -0500

    hp-wmi: Enable hotkeys on some systems

has caused some trouble for some HP 6510b users as shown in this bug:
https://bugzilla.kernel.org/show_bug.cgi?id=82451

Can you please take a look at that? Thanks.
