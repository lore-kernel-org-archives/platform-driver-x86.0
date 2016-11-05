From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] thinkpad_acpi: Add support for X1 Yoga (2016) Tablet
 Mode
Date: Sat, 5 Nov 2016 11:55:30 -0700
Message-ID: <20161105185530.GE100528@f23x64.localdomain>
References: <20161027175404.GA25503@khazad-dum.debian.net>
 <1477597604-7095-1-git-send-email-lyude@redhat.com>
 <20161105184522.GD100528@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:47417 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755721AbcKESx5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Nov 2016 14:53:57 -0400
Content-Disposition: inline
In-Reply-To: <20161105184522.GD100528@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Lyude <lyude@redhat.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Nov 05, 2016 at 11:45:22AM -0700, Darren Hart wrote:
> On Thu, Oct 27, 2016 at 03:46:44PM -0400, Lyude wrote:
> > For whatever reason, the X1 Yoga doesn't support the normal method of
> > querying for tablet mode. Instead of providing the MHKG method under the
> > hotkey handle, we're instead given the CMMD method under the EC handle.
> > Values on this handle are either 0x1, laptop mode, or 0x6, tablet mode.
> > 
> > Changes since v1:
> > - Clarify kernel output when finding the tablet mode switch
> 
> These two lines go below the --- below (they aren't meant to be part of the
> permanent commit message). Please see Documentation/SubmittingPatches.
> 
> I've queued this to testing as it addresses Henrique's change request. Henrique,
> I'll add your Reviewed-by if you send it along, or drop it if you have more
> reservations.

Scratch that, I see there is a new series with this patch in it. Will respond
there.

-- 
Darren Hart
Intel Open Source Technology Center
