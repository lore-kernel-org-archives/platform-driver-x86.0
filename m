From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH v2] thinkpad_acpi: Add support for X1 Yoga (2016) Tablet
 Mode
Date: Sat, 5 Nov 2016 16:49:27 -0200
Message-ID: <20161105184927.GE17290@khazad-dum.debian.net>
References: <20161027175404.GA25503@khazad-dum.debian.net>
 <1477597604-7095-1-git-send-email-lyude@redhat.com>
 <20161105184522.GD100528@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:40819 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754724AbcKEStb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Nov 2016 14:49:31 -0400
Content-Disposition: inline
In-Reply-To: <20161105184522.GD100528@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Lyude <lyude@redhat.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 05 Nov 2016, Darren Hart wrote:
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

No reservations, since it was tested to not regress previous thinkpads.

-- 
  Henrique Holschuh
