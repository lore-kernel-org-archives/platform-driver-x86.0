From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH 3/3] X86 platfrom wmi: Add debug facility to dump WMI data in a readable way
Date: Wed, 5 May 2010 12:53:37 +0200
Message-ID: <201005051253.39005.trenn@suse.de>
References: <1272893417-3481-1-git-send-email-trenn@suse.de> <1272893417-3481-3-git-send-email-trenn@suse.de> <201005041840.09161.carlos@strangeworlds.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:43905 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934691Ab0EEKx3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 5 May 2010 06:53:29 -0400
In-Reply-To: <201005041840.09161.carlos@strangeworlds.co.uk>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org, corentin.chary@gmail.com

On Tuesday 04 May 2010 07:40:09 pm Carlos Corbacho wrote:
> On Monday 03 May 2010 14:30:17 Thomas Renninger wrote:
> > Signed-off-by: Thomas Renninger <trenn@suse.de>
> > CC: platform-driver-x86@vger.kernel.org
> > CC: mjg59@srcf.ucam.org
> > CC: corentin.chary@gmail.com
>
> I don't really see the point of this one - this information is all
> obtainable from the DSDT.
Yes, but you depend on the wmidump userspace stuff and manually
copying parts of the DSDT, etc.

> If you really want it, then I don't mind, it just seems redundant...
All the code of wmidump is included wmi.c now.
Only dumping this info is missing, which is really useful if
you are not aware of the wmidump tool (and even then it's still
convenient to have) and overhead is negligible.
Yep, I really like to see this.

Thanks,

    Thomas

