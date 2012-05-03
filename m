From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] toshiba_acpi: Only register backlight device when
 interface is read/write
Date: Thu, 3 May 2012 21:32:57 +0100
Message-ID: <20120503203257.GE29437@srcf.ucam.org>
References: <1334852630-8829-1-git-send-email-seth.forshee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:35549 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758669Ab2ECUdA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 3 May 2012 16:33:00 -0400
Content-Disposition: inline
In-Reply-To: <1334852630-8829-1-git-send-email-seth.forshee@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, Akio Idehara <zbe64533@gmail.com>

Merged for -next, thanks. I fixed up the conflicts with the the 
transflective display patch, but someone should probably verify them.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
