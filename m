From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [RESEND PATCH] Fujitsu tablet pc extras driver
Date: Tue, 29 Mar 2011 13:13:01 +0100
Message-ID: <20110329121301.GA11850@srcf.ucam.org>
References: <20110329100322.GA7099@fais.local>
 <20110329103321.GA8969@srcf.ucam.org>
 <20110329121103.GA5922@knothebonkz.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:55227 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752084Ab1C2MNJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Mar 2011 08:13:09 -0400
Content-Disposition: inline
In-Reply-To: <20110329121103.GA5922@knothebonkz.local>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Robert Gerlach <khnz@gmx.de>
Cc: "Ryan H. Lewis" <me@ryanlewis.net>, platform-driver-x86@vger.kernel.org

On Tue, Mar 29, 2011 at 02:11:03PM +0200, Robert Gerlach wrote:
> On Tue, Mar 29, 2011 at 11:33:22AM +0100, Matthew Garrett wrote:
> > You're binding to an ACPI device here - does it have a _CRS method? If 
> > so, you should retrieve the resource information from acpipnp rather 
> > than hardcoding it. That'll involve reworking it as an acpi driver 
> > rather than a platform one, but that should be easy enough.
> 
> Yes, it have a _CRS, but I removed the code because it is always the same
> IRQ and IO range. I'll reimplement with the first device it make it
> necessary.

Chances are that it'll always be that, but it's better to use the 
firmware data rather than hardcoding.

Thanks!
-- 
Matthew Garrett | mjg59@srcf.ucam.org
