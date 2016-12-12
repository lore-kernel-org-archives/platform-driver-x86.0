From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v5 2/2] thinkpad_acpi: Add support for X1 Yoga (2016)
 Tablet Mode
Date: Mon, 12 Dec 2016 10:17:01 -0800
Message-ID: <20161212181701.GA77230@f23x64.localdomain>
References: <1478895304-31627-1-git-send-email-lyude@redhat.com>
 <1478895304-31627-2-git-send-email-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:56487 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752578AbcLLSQ5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Dec 2016 13:16:57 -0500
Content-Disposition: inline
In-Reply-To: <1478895304-31627-2-git-send-email-lyude@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Lyude <lyude@redhat.com>
Cc: ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Daniel Martin <consume.noise@gmail.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Fri, Nov 11, 2016 at 03:15:03PM -0500, Lyude wrote:
> For whatever reason, the X1 Yoga doesn't support the normal method of
> querying for tablet mode. Instead of providing the MHKG method under the
> hotkey handle, we're instead given the CMMD method under the EC handle.
> Values on this handle are either 0x1, laptop mode, or 0x6, tablet mode.
> 
> Tested-by: Daniel Martin <consume.noise@gmail.com>
> Signed-off-by: Lyude <lyude@redhat.com>

Our apologies for the delay. Thank you for the updates.

Queued to testing.

-- 
Darren Hart
Intel Open Source Technology Center
