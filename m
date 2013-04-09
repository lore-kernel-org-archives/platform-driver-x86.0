From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v3 1/1] Introduce Intel RAPL cooling device driver
Date: Tue, 09 Apr 2013 09:29:48 -0700
Message-ID: <1365524988.6865.55.camel@joe-AO722>
References: <1365511578-30453-1-git-send-email-jacob.jun.pan@linux.intel.com>
	 <1365511578-30453-2-git-send-email-jacob.jun.pan@linux.intel.com>
	 <20130409152638.GA3033@kroah.com> <1365522817.6865.33.camel@joe-AO722>
	 <20130409160741.GA8080@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from perches-mx.perches.com ([206.117.179.246]:49009 "EHLO
	labridge.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1764934Ab3DIQ3t (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 9 Apr 2013 12:29:49 -0400
In-Reply-To: <20130409160741.GA8080@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Matthew Garrett <matthew.garrett@nebula.com>, Zhang Rui <rui.zhang@intel.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, Len Brown <len.brown@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Arjan van de Ven <arjan@linux.intel.com>

On Tue, 2013-04-09 at 09:07 -0700, Greg Kroah-Hartman wrote:
> On Tue, Apr 09, 2013 at 08:53:37AM -0700, Joe Perches wrote:
> > On Tue, 2013-04-09 at 08:26 -0700, Greg Kroah-Hartman wrote:
> > > On Tue, Apr 09, 2013 at 05:46:18AM -0700, Jacob Pan wrote:
> > > > +#define DEBUG
> > > Why?  I think you need to remove this line :)
> > 
> > Some people like their dev_dbg statements to
> > be emitted all the time.
> 
> Those people should not be submitting new drivers for inclusion in the
> kernel tree.

I think age of code (with some obvious exceptions) isn't
too much of a reliable indicator and adding new
CONFIG_<foo>_DEBUG controls isn't all that great a way
to enable debugging.
