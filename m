From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH] wmi: fix a memory leak in wmi_notify_debug
Date: Mon, 28 Jun 2010 14:55:28 +0200
Message-ID: <201006281455.28599.trenn@suse.de>
References: <1277688645.22992.2.camel@mola>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-6"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:38428 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754185Ab0F1Mzb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Jun 2010 08:55:31 -0400
In-Reply-To: <1277688645.22992.2.camel@mola>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Matthew Garrett <mjg@redhat.com>, Len Brown <len.brown@intel.com>, Andrew Morton <akpm@linux-foundation.org>, platform-driver-x86@vger.kernel.org

On Monday 28 June 2010 03:30:45 Axel Lin wrote:
> When acpi_evaluate_object() is passed ACPI_ALLOCATE_BUFFER,
> the caller must kfree the returned buffer if AE_OK is returned.
Oops, I forgot to free the buffer...
Thanks!

Matthew, can you queue this up, please.
It's a safe memleak fix (if wmi driver is loaded with debug_event=1).

Signed-off-by: Thomas Renninger <trenn@suse.de>

      Thomas
