From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 19/25] sony-laptop: add touchpad enable/disable control
 file
Date: Sat, 4 Jun 2011 13:46:14 +0100
Message-ID: <20110604124614.GC14809@srcf.ucam.org>
References: <4DE8FC4A.9010401@absence.it>
 <201106031400.36141.dmitry.torokhov@gmail.com>
 <4DE9563F.9010503@absence.it>
 <201106031512.38349.dmitry.torokhov@gmail.com>
 <4DE9904E.7050805@absence.it>
 <20110604070921.GA5132@kamineko.org>
 <4DEA13D4.1000100@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:44332 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755047Ab1FDMqV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 4 Jun 2011 08:46:21 -0400
Content-Disposition: inline
In-Reply-To: <4DEA13D4.1000100@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Mattia Dongili <malattia@linux.it>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, platform-driver-x86@vger.kernel.org

On Sat, Jun 04, 2011 at 01:15:32PM +0200, Marco Chiappero wrote:

> I cannot see how such small code and file will harm, people that
> don't care can ignore it.

This feature is present in enough machines that we really need some 
standardised way to present it, rather than it just being yet another 
random sysfs file. The problem is working out a good way to standardise 
it.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
