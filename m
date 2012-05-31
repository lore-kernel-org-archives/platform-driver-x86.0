From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 01/19] sony-laptop: use soft rfkill status stored in hw
Date: Thu, 31 May 2012 19:39:52 +0100
Message-ID: <20120531183952.GC19363@srcf.ucam.org>
References: <1337434562-12283-1-git-send-email-malattia@linux.it>
 <1337434562-12283-2-git-send-email-malattia@linux.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:39123 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752813Ab2EaSjy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 31 May 2012 14:39:54 -0400
Content-Disposition: inline
In-Reply-To: <1337434562-12283-2-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: platform-driver-x86@vger.kernel.org, Marco Chiappero <marco@absence.it>

I've applied the set other than the HDD shock and ALS code. I just want 
to do some more checking of the current state of interfaces there to see 
if there's more commonality - the generic ACPI ALS driver looks like it 
may finally go somewhere, and I want to ensure compatibility.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
