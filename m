From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] intel_scu_ipc_utils: Support for reflashing Medfield
	firmware
Date: Mon, 25 Oct 2010 16:41:13 +0100
Message-ID: <20101025154113.GA19289@srcf.ucam.org>
References: <20101025143939.27262.50685.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:38484 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751267Ab0JYPlR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 Oct 2010 11:41:17 -0400
Content-Disposition: inline
In-Reply-To: <20101025143939.27262.50685.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: platform-driver-x86@vger.kernel.org

Just so I'm clear on this - will the driver be able to detect whether 
it's running on appropriate hardware so that it knows whether or not the 
flashing protocol it's using will work? If not, what's the failure mode 
for using the wrong protocol?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
