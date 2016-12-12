From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] thinkpad_acpi: adding new hotkey ID for Lenovo thinkpad
Date: Mon, 12 Dec 2016 10:23:05 -0800
Message-ID: <20161212182305.GB77230@f23x64.localdomain>
References: <1478592803-17522-1-git-send-email-hui.wang@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:59724 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750696AbcLLSW5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Dec 2016 13:22:57 -0500
Content-Disposition: inline
In-Reply-To: <1478592803-17522-1-git-send-email-hui.wang@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hui Wang <hui.wang@canonical.com>
Cc: dvhart@linux.intel.com, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net

On Tue, Nov 08, 2016 at 04:13:23PM +0800, Hui Wang wrote:
> Recently we met an issue on lots of Lenovo thinkpad laptops (those
> laptops are not released to market yet), the issue is that the
> thinkpad_acpi.ko can't be automatically loaded as before.
> 
> Through debugging, we found the HKEY_HID is LEN0268 instead of
> LEN0068 on those machines, and the MHKV is 0x200 instead of
> 0x100. So adding the new ID into the driver.
> 
> Signed-off-by: Hui Wang <hui.wang@canonical.com>

With Henrique's ack, I've queued this to testing.

However, in the commit message you mention two deltas:

1) HKEY_HID is LEN0268
2) MHKV is 0x200

This patch appears to address only #1. Is another patch needed for #2?

(I'm digging myself out of a deep backlog, so if it's here already, I'll find
it, but it might expedite things to point it out to me).

Thanks for the patch.

-- 
Darren Hart
Intel Open Source Technology Center
