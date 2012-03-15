From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH v4 0/3] Expanded hotkey support
Date: Thu, 15 Mar 2012 16:10:03 +0000
Message-ID: <20120315161003.GB7502@srcf.ucam.org>
References: <20120305220407.GA16312@ubuntu-macmini>
 <1331004633-11862-1-git-send-email-seth.forshee@canonical.com>
 <20120312140652.GA11375@srcf.ucam.org>
 <20120315155105.GF9673@ubuntu-macmini>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:37442 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1031530Ab2COQKI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 15 Mar 2012 12:10:08 -0400
Content-Disposition: inline
In-Reply-To: <20120315155105.GF9673@ubuntu-macmini>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Azael Avalos <coproscefalo@gmail.com>, Thomas Renninger <trenn@suse.de>, linux-kernel@vger.kernel.org, lenb@kernel.org

On Thu, Mar 15, 2012 at 10:51:05AM -0500, Seth Forshee wrote:
> On Mon, Mar 12, 2012 at 02:06:52PM +0000, Matthew Garrett wrote:
> > I'm not thrilled by this. I think making the change in the ec driver is 
> > the appropriate thing to do rather than duplicating this code elsewhere 
> > - Len, what's the holdup in merging that?
> 
> Still no response. Do we have any other options? I'd like to get these
> changes in 3.4 if at all possible so I'm not working with a forked
> version of the driver.

If I don't hear back from Len soon I'll just take this through the x86 
platform driver tree.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
