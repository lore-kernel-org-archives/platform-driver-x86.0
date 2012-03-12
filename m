From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH v4 0/3] Expanded hotkey support
Date: Mon, 12 Mar 2012 14:06:52 +0000
Message-ID: <20120312140652.GA11375@srcf.ucam.org>
References: <20120305220407.GA16312@ubuntu-macmini>
 <1331004633-11862-1-git-send-email-seth.forshee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:40797 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752414Ab2CLOG4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 12 Mar 2012 10:06:56 -0400
Content-Disposition: inline
In-Reply-To: <1331004633-11862-1-git-send-email-seth.forshee@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, Azael Avalos <coproscefalo@gmail.com>, Thomas Renninger <trenn@suse.de>, linux-kernel@vger.kernel.org, lenb@kernel.org

On Mon, Mar 05, 2012 at 09:30:30PM -0600, Seth Forshee wrote:
> New version of the patches which remove the need to modify the EC
> driver.
> 
> Changes since v3:
> 
>  * Drop patch to add ec_get_handle()
>  * Use acpi_get_devices() to get EC handle

I'm not thrilled by this. I think making the change in the ec driver is 
the appropriate thing to do rather than duplicating this code elsewhere 
- Len, what's the holdup in merging that?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
