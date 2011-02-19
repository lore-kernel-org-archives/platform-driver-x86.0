From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 3/8] sony-laptop: ignore hard switch rfkill events
	(SPIC)
Date: Sat, 19 Feb 2011 03:06:18 +0000
Message-ID: <20110219030618.GA28870@srcf.ucam.org>
References: <1298083952-22493-1-git-send-email-malattia@linux.it> <1298083952-22493-4-git-send-email-malattia@linux.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:43954 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753606Ab1BSDGY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Feb 2011 22:06:24 -0500
Content-Disposition: inline
In-Reply-To: <1298083952-22493-4-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: platform-driver-x86@vger.kernel.org

Do you possibly want to catch these and make sure the kernel rfkill 
state matches the hardware?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
