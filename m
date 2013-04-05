From: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH v2] Introduce Intel RAPL cooling device driver
Date: Fri, 5 Apr 2013 14:57:20 -0700
Message-ID: <20130405145720.74ec046f@chromoly>
References: <1365195724-8945-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1365195724-8945-2-git-send-email-jacob.jun.pan@linux.intel.com>
	<1365197195.2075.23.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:53449 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1162601Ab3DEV5U (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 5 Apr 2013 17:57:20 -0400
In-Reply-To: <1365197195.2075.23.camel@joe-AO722>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Matthew Garrett <matthew.garrett@nebula.com>, Zhang Rui <rui.zhang@intel.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, Len Brown <len.brown@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Arjan van de Ven <arjan@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>

On Fri, 05 Apr 2013 14:26:35 -0700
Joe Perches <joe@perches.com> wrote:

> > +/* in the order of enum rapl_primitives */
> > +static struct rapl_primitive_info rpi[] = {  
> 
> const?
I do need to override one entry for a special case. The hardware uses a
different bit location for the same lock functionality.

The other comments are well taken,

-- 
Thanks,

Jacob
