From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Subject: Re: [PATCH 1/2] x86: Add Isolated Memory Regions for Quark X1000
Date: Thu, 08 Jan 2015 15:11:35 +0000
Message-ID: <54AE9E27.2050307@nexus-software.ie>
References: <1419873783-5161-1-git-send-email-pure.logic@nexus-software.ie> <1419873783-5161-2-git-send-email-pure.logic@nexus-software.ie> <AF233D1473C1364ABD51D28909A1B1B7326E0CC8@PGSMSX105.gar.corp.intel.com> <54AE8136.2060400@nexus-software.ie> <AF233D1473C1364ABD51D28909A1B1B7326E297E@PGSMSX105.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from outbound-smtp05.blacknight.com ([81.17.249.38]:57043 "EHLO
	outbound-smtp05.blacknight.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753114AbbAHPLi (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 8 Jan 2015 10:11:38 -0500
Received: from mail.blacknight.com (pemlinmail04.blacknight.ie [81.17.254.17])
	by outbound-smtp05.blacknight.com (Postfix) with ESMTPS id C3B1198D5C
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Jan 2015 15:11:36 +0000 (UTC)
In-Reply-To: <AF233D1473C1364ABD51D28909A1B1B7326E297E@PGSMSX105.gar.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Ong, Boon Leong" <boon.leong.ong@intel.com>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>


> Suggest to split the imr_del() into 2 functions:-
> (1) by address + size
> (2) by IMR index
> At current implementation, it does not support (2) only because it fails at
> imr_check_range().

Hi Boon Leong.

I'll have a think about that :)

Just on imr_del() though, it does support removal by way of index.

+static void __init intel_galileo_imr_init(void)
+{
+	unsigned long base  = virt_to_phys(&_text);
+	unsigned long size = virt_to_phys(&_sinittext) - base - IMR_ALIGN;
+	int i, ret;
+
+	/* Tear down all existing unlocked IMRs */
+	for (i = 0; i <= QUARK_X1000_IMR_NUM; i++)
+		imr_del(i, 0, 0);

That's what the platform code has to do for every unlocked IMR, to make 
sure there are no stale IMRs left that could conflict with the EFI 
memory map !

--
BOD
