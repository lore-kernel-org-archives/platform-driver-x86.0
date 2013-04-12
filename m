From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] Introduce Intel RAPL cooling device driver
Date: Fri, 12 Apr 2013 08:39:00 -0700
Message-ID: <20130412153900.GB25603@kroah.com>
References: <1365195724-8945-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1365195724-8945-2-git-send-email-jacob.jun.pan@linux.intel.com>
 <1365197195.2075.23.camel@joe-AO722>
 <20130405213518.GA5615@kroah.com>
 <20130412083203.13cf56b0@chromoly>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:38036 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754048Ab3DLPjE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 12 Apr 2013 11:39:04 -0400
Received: by mail-pa0-f50.google.com with SMTP id bg2so1533885pad.37
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Apr 2013 08:39:03 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20130412083203.13cf56b0@chromoly>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Joe Perches <joe@perches.com>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Matthew Garrett <matthew.garrett@nebula.com>, Zhang Rui <rui.zhang@intel.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, Len Brown <len.brown@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Arjan van de Ven <arjan@linux.intel.com>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>

On Fri, Apr 12, 2013 at 08:32:03AM -0700, Jacob Pan wrote:
> If so, the reason being I don't know if there is a standard way
> to a transaction via sysfs where I can commit multiple inputs
> atomically.

That is by design.
