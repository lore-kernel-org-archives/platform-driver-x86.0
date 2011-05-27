From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 0/2] acer-wmi: remove threeg and interface sysfs files
Date: Fri, 27 May 2011 17:30:06 +0100
Message-ID: <20110527163006.GC16769@srcf.ucam.org>
References: <1306317507-11743-1-git-send-email-jlee@novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:43209 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750774Ab1E0QaN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 27 May 2011 12:30:13 -0400
Content-Disposition: inline
In-Reply-To: <1306317507-11743-1-git-send-email-jlee@novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>

I think that we should probably put these through a proper deprecation 
cycle. Can you document them in the deprecation listing and add some 
printks to tell people that they're going away, and then we'll drop them 
in a couple of releases?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
