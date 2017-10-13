From: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH v7 10/15] platform/x86: dell-smbios: add filtering
 capability for requests
Date: Fri, 13 Oct 2017 15:18:32 +0100
Message-ID: <20171013151832.3ab0891d@alans-desktop>
References: <cover.1507733291.git.mario.limonciello@dell.com>
        <83dc225624f1cde5ee1797aebc945732444ded91.1507733291.git.mario.limonciello@dell.com>
        <20171012110903.3ab4ed5e@alans-desktop>
        <1200feb837864baa8a3be9740413f2e9@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from www.llwyncelyn.cymru ([82.70.14.225]:52192 "EHLO fuzix.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753415AbdJMOTR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Oct 2017 10:19:17 -0400
In-Reply-To: <1200feb837864baa8a3be9740413f2e9@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, greg@kroah.com

> Within Linux the security model is that items accessible through this interface
> are only accessible by root.

"root" has not been a security concept in the Linux kernel since about
2.0. If you are relying on file permissions then at best you are using
CAP_SYS_DAC which is too weak for this.

If you are allowing near unchecked communication with a third party
entity that the user doesn't trust too much you should be requiring
CAP_SYS_RAWIO.

In fact it's a fair argument hat if you require CAP_SYS_RAWIO and have a
module option you have to set to allow it that with the module loaded
with say

	insmod dell_smbios factory=1

does even blacklisted stuff then you are ok, because a process with
CAP_SYS_RAWIO has enough power to totally own the machine anyway
including taking over and doing the WMI call itself by hand in user space
or loading its own module.

Alan
