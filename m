From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] dell-wmi: Add quirk for Dell Inspiron 3138
Date: Tue, 3 Dec 2013 07:07:46 +0000
Message-ID: <20131203070746.GA32248@srcf.ucam.org>
References: <1386053407-7972-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:52481 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750914Ab3LCHHt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 3 Dec 2013 02:07:49 -0500
Content-Disposition: inline
In-Reply-To: <1386053407-7972-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Tue, Dec 03, 2013 at 02:50:07PM +0800, AceLan Kao wrote:
> The acpi_video0 interface doesn't not work on Dell Inspiron 3138,
> so using the vendor brightness interface, instead of the acpi one.

No, this needs to be fixed properly by disabling the ACPI interface on 
Windows 8 systems.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
