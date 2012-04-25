From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: Dell Vostro V131: special hotkey not working
Date: Wed, 25 Apr 2012 14:53:28 +0100
Message-ID: <20120425135328.GA13385@srcf.ucam.org>
References: <4F97FA4C.9040201@gmx-topmail.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:53982 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759209Ab2DYNxa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 Apr 2012 09:53:30 -0400
Content-Disposition: inline
In-Reply-To: <4F97FA4C.9040201@gmx-topmail.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Peter Meiser <meiser@gmx-topmail.de>
Cc: platform-driver-x86@vger.kernel.org

On Wed, Apr 25, 2012 at 03:21:16PM +0200, Peter Meiser wrote:
> Hello,
> 
> I've bought a Dell Vostro V131. This model has 3 special hotkeys (quick launch keys).
> The keys are:
> 1. "Windows mobility center" -> This hotkey generates Mod+X
> 2. "Dell support center" -> This hotkey generates keycode 0xEE
> 3. "Dell instant launch manager" -> This hotkey doesn't generate anything, neither through dell-wmi nor i8042

If you run 

watch -n 0.1 cat /proc/interrupts

does one of them increase reliably when you hit the key?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
