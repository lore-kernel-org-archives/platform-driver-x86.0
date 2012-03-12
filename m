From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH v2] platform/x86: Add driver for Apple gmux device
Date: Mon, 12 Mar 2012 15:22:24 +0000
Message-ID: <20120312152224.GA13916@srcf.ucam.org>
References: <1329424465-1211-1-git-send-email-seth.forshee@canonical.com>
 <1329921457-26887-1-git-send-email-seth.forshee@canonical.com>
 <20120312142126.GA11969@srcf.ucam.org>
 <20120312145701.GA12322@ubuntu-macmini>
 <20120312150717.GA13211@srcf.ucam.org>
 <20120312151852.GB12322@ubuntu-macmini>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:56209 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752673Ab2CLPW1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 12 Mar 2012 11:22:27 -0400
Content-Disposition: inline
In-Reply-To: <20120312151852.GB12322@ubuntu-macmini>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Mar 12, 2012 at 10:18:52AM -0500, Seth Forshee wrote:

> Why do you presume it works under Windows? Boot camp installs a pile of
> drivers for Windows, one of those could be a driver for the backlight. I
> don't know either way. But it's pretty clear that MacOS is using the
> gmux for the backlight when it is present from the reverse engineering
> work done by others.

The only reason to provide it at all is for Windows - it's never going 
to be used under OS X.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
