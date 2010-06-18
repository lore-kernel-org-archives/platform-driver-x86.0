From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] rar: Move the RAR driver into the right place as its
 now clean
Date: Fri, 18 Jun 2010 08:11:26 -0700
Message-ID: <20100618151126.GA16843@kroah.com>
References: <20100618130536.7800.28973.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:54353 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932219Ab0FRPQE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Jun 2010 11:16:04 -0400
Content-Disposition: inline
In-Reply-To: <20100618130536.7800.28973.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <alan@linux.intel.com>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org

On Fri, Jun 18, 2010 at 02:05:52PM +0100, Alan Cox wrote:
> We exit staging rar! rar! rar!...
> 
> Signed-off-by: Alan Cox <alan@linux.intel.com>

Nice, no objection from me.

Matthew, do you want to take this in the platform driver tree, or do you
want me to take this through the staging tree?

If you want to take it, that's fine with me, feel free to add an:
	Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
to the patch.

If not, just let me know and I can easily take it.

thanks,

greg k-h
