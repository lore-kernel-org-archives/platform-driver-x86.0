From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] dell-wmi: Change debug statements from pr_info to
 pr_debug
Date: Mon, 21 Nov 2011 22:32:09 +0000
Message-ID: <20111121223209.GA16955@srcf.ucam.org>
References: <1321908536-5163-1-git-send-email-seth.forshee@canonical.com>
 <20111121205230.GA14467@srcf.ucam.org>
 <20111121211438.GH6736@thinkpad-t410>
 <20111121211809.GA14950@srcf.ucam.org>
 <20111121222945.GA14306@thinkpad-t410>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:40518 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751472Ab1KUWcM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Nov 2011 17:32:12 -0500
Content-Disposition: inline
In-Reply-To: <20111121222945.GA14306@thinkpad-t410>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Great, thanks. If we don't work out what they are then we can certainly 
drop the error - I agree that telling the user about something that just 
confuses us isn't helpful.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
