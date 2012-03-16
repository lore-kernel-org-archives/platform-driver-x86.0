From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH v3 2/2] platform/x86: Add driver for Apple gmux device
Date: Fri, 16 Mar 2012 15:41:52 +0000
Message-ID: <20120316154151.GB2399@srcf.ucam.org>
References: <1331847128-16339-1-git-send-email-seth.forshee@canonical.com>
 <1331847128-16339-3-git-send-email-seth.forshee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:37311 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1031171Ab2CPPly (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 16 Mar 2012 11:41:54 -0400
Content-Disposition: inline
In-Reply-To: <1331847128-16339-3-git-send-email-seth.forshee@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org

On Thu, Mar 15, 2012 at 04:32:08PM -0500, Seth Forshee wrote:

> +	select BACKLIGHT_APPLE

If you add the aforementioned stubs then you can drop this. Otherwise, 
looks good.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
