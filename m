From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] dell-laptop: Add 6 machines to touchpad led quirk
Date: Sat, 28 Jul 2012 05:16:56 +0100
Message-ID: <20120728041656.GC31064@srcf.ucam.org>
References: <1342168797-26080-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:37848 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751138Ab2G1EQ5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 28 Jul 2012 00:16:57 -0400
Content-Disposition: inline
In-Reply-To: <1342168797-26080-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

I can keep adding these, but are you really certain that there's no way 
at all to probe this via either the PS/2 interface or the Dell DMI 
structures?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
