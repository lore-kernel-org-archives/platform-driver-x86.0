From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 10/14] platform/x86: dell-smbios-smm: test for WSMT
Date: Wed, 4 Oct 2017 18:59:44 -0700
Message-ID: <20171005015944.GE25018@fury>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <1e16313531397b43c16e147a3a5ad9e74ca3428a.1507156392.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:35010 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751208AbdJEB7q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Oct 2017 21:59:46 -0400
Content-Disposition: inline
In-Reply-To: <1e16313531397b43c16e147a3a5ad9e74ca3428a.1507156392.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>

On Wed, Oct 04, 2017 at 05:48:36PM -0500, Mario Limonciello wrote:
> WSMT is as an attestation to the OS that the platform won't
> modify memory outside of pre-defined areas.
> 
> If a platform has WSMT enabled in BIOS setup, SMM calls through
> dcdbas will fail.  The only way to access platform data in these
> instances is through the WMI SMBIOS calling interface.

Nit: This should probably come after 11/14 where the WMI SMBIOS calling
interface is introduced.

-- 
Darren Hart
VMware Open Source Technology Center
