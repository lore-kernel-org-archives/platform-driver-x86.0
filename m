From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 3/3] platform/wmi: Expose the raw WDG data in sysfs
Date: Tue, 1 Aug 2017 13:03:13 -0700
Message-ID: <20170801200313.GC3110@fury>
References: <cover.1501601667.git.luto@kernel.org>
 <e6df9d038af0a0ce4d4119395aaea58366ade26d.1501601667.git.luto@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:47039 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752248AbdHAUDO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Aug 2017 16:03:14 -0400
Content-Disposition: inline
In-Reply-To: <e6df9d038af0a0ce4d4119395aaea58366ade26d.1501601667.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>

On Tue, Aug 01, 2017 at 08:37:28AM -0700, Andy Lutomirski wrote:
> This adds a sysfs binary attribute 'wdg' on the bus device
> (i.e. /sys/class/wmi_bus/wmi_bus-*/wdg) that contains the raw _WDG
> data from ACPI.  This can be used along with the wmi-bmof driver to
> decode the raw interface data from ACPI.

I don't recall seeing mention of this is the documentation I read as a
requirement to decoding the interface with the bmof. Do Windows systems export
_WDG to userspace?

Why do we need to export _WDG?

-- 
Darren Hart
VMware Open Source Technology Center
