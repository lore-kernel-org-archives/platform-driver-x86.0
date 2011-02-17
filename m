From: Matthew Garrett <mjg@redhat.com>
Subject: Re: [PATCH] Enable Dell All-In-One volume up/down keys
Date: Thu, 17 Feb 2011 16:33:51 +0000
Message-ID: <20110217163351.GB20662@srcf.ucam.org>
References: <1297688524-26123-1-git-send-email-colin.king@canonical.com> <20110217075256.GB19814@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:51219 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755373Ab1BQQeC (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 17 Feb 2011 11:34:02 -0500
Content-Disposition: inline
In-Reply-To: <20110217075256.GB19814@core.coreip.homeip.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Colin King <colin.king@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Feb 16, 2011 at 11:52:56PM -0800, Dmitry Torokhov wrote:

> Looks generally good, one question though - should't it be part of
> dell-wmi driver?

It uses a different WMI GUID and has a different behaviour model to dell 
laptops that dell-wmi drives, so I think it's fair for it to be a 
separate driver.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
