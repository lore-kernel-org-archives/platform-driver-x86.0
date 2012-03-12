From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] toshiba_acpi: Add support for transflective LCD
Date: Mon, 12 Mar 2012 14:11:18 +0000
Message-ID: <20120312141118.GB11375@srcf.ucam.org>
References: <4F3ECEED.9000206@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:46533 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752210Ab2CLOLW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 12 Mar 2012 10:11:22 -0400
Content-Disposition: inline
In-Reply-To: <4F3ECEED.9000206@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Akio Idehara <zbe64533@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Charles@schwieters.org

Is there any userspace that currently manipulates the bl_power field? 
I'm wondering whether this should actually just be implemented by adding 
an extra level to the backlight and having 0 change to transflective 
mode.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
