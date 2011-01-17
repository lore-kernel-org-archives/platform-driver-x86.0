From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] toshiba_acpi: Additional TOS1900 devices support
Date: Mon, 17 Jan 2011 17:55:55 +0000
Message-ID: <20110117175555.GA30554@srcf.ucam.org>
References: <AANLkTi=fjL0yxXWrDddafdBs7biJ326sXjaagTseVEVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:47313 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751417Ab1AQR4A (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 17 Jan 2011 12:56:00 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTi=fjL0yxXWrDddafdBs7biJ326sXjaagTseVEVg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

I think this needs to be tidied up some more to interact nicely with the 
ec driver, and I'm still a bit concerned that there may be devices of 
the TOS1900 type that implement the old-syle interface but not this one 
(I'll check the files I have here). I'll try to break this up into 
something more generic.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
