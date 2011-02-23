From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] ideapad: read brightness setting on brightness key
	notify
Date: Wed, 23 Feb 2011 13:47:48 +0000
Message-ID: <20110223134748.GA6830@srcf.ucam.org>
References: <1298468399-3642-1-git-send-email-ike.pan@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:35473 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752125Ab1BWNrw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 23 Feb 2011 08:47:52 -0500
Content-Disposition: inline
In-Reply-To: <1298468399-3642-1-git-send-email-ike.pan@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Feb 23, 2011 at 09:39:59PM +0800, Ike Panhc wrote:
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=25922
> 
> On ideapad Y530, the brightness key notify will be blocked if the last notify
> is not responsed by getting the brightness value. Read value when we get the
> notify shall fix the problem and will not have any difference on other ideapads.

Which kernel versions does this hit?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
