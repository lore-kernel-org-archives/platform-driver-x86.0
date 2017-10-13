From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v7 10/15] platform/x86: dell-smbios: add filtering
 capability for requests
Date: Fri, 13 Oct 2017 12:40:09 +0200
Message-ID: <20171013104009.zlxwhugbbzglwpza@pali>
References: <cover.1507733291.git.mario.limonciello@dell.com>
 <83dc225624f1cde5ee1797aebc945732444ded91.1507733291.git.mario.limonciello@dell.com>
 <20171012110903.3ab4ed5e@alans-desktop>
 <20171013004645.GB1470@fury>
 <20171013094314.GB29864@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:37091 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751564AbdJMKkN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Oct 2017 06:40:13 -0400
Content-Disposition: inline
In-Reply-To: <20171013094314.GB29864@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Darren Hart <dvhart@infradead.org>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Mario Limonciello <mario.limonciello@dell.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

On Friday 13 October 2017 11:43:14 Greg KH wrote:
> I understand the goal here of getting this to all work properly, but
> note that this is a different type of an operating system, and for some
> things, maybe we just do not allow direct userspace access for the
> obvious reasons (security, maintance, auditability, long-term-support,
> etc.)  A whitelist of known-good commands sounds like a good place to
> start, why not start with that and go from there?

So, I understood that Greg want to rather see explicit whitelist in
allowed functionality from userspace. And for such thing generic WMI API
is not a best option.

Creating generic API for kernel drivers for filtering WMI requests based
on some white list is hard.

If we want to choose this option, then it would be easier to create Dell
specific API for setting SMBIOS tokens and in kernel just add list of
whitelisted tokens, which userspace can set/unset.

Parsing SMBIOS requests in WMI buffer is harder, it leads to more
complicated code and basically serves same as "function specific API"
which is easier to implement and audit.

WMI is just "RPC" for function calls and inspecting it for security and
access is harder as designing new simple API which would mimic what is
"hidden" in that "RPC".

-- 
Pali Rohár
pali.rohar@gmail.com
