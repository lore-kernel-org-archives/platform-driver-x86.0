From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] [thinkpad-acpi] Add T410s and T420s LED support
Date: Fri, 23 Mar 2012 19:43:55 +0000
Message-ID: <20120323194355.GA27877@srcf.ucam.org>
References: <20120322234934.GA8338@endeavour.taprogge.org>
 <20120323193951.GA24054@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:46685 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751045Ab2CWToA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 23 Mar 2012 15:44:00 -0400
Content-Disposition: inline
In-Reply-To: <20120323193951.GA24054@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Jens Taprogge <jens.taprogge@taprogge.org>, platform-driver-x86@vger.kernel.org

I'm a little unenthusiastic about just pulling this in without working 
out how userspace is going to consume it. It's a problem we may hit on 
other devices as well, so we potentially need some sort of consistent 
naming to indicate that it's a built-in mute LED.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
