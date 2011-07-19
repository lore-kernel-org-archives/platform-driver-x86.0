From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 8/25] sony-laptop: sony_nc_notify rewritten and improved
Date: Wed, 20 Jul 2011 06:30:28 +0900
Message-ID: <20110719213027.GB16532@kamineko.org>
References: <4DE8FC4A.9010401@absence.it>
 <4DE8FFE0.5070506@absence.it>
 <20110604084338.GD7194@kamineko.org>
 <4DEA1664.4090409@absence.it>
 <20110605223815.GC26835@kamineko.org>
 <4DFF5270.7050404@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:41073 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750980Ab1GSV37 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 Jul 2011 17:29:59 -0400
Received: by pzk3 with SMTP id 3so5467352pzk.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Jul 2011 14:29:59 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4DFF5270.7050404@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

On Mon, Jun 20, 2011 at 04:00:16PM +0200, Marco Chiappero wrote:
> Il 06/06/2011 00:38, Mattia Dongili ha scritto:
> >On Sat, Jun 04, 2011 at 01:26:28PM +0200, Marco Chiappero wrote:
> >>Il 04/06/2011 10:43, Mattia Dongili ha scritto:
> >>>when sony_call_snc_handle(handle, 0x200,&result) fails above you will
> >>>be reporting -1 via the acpi bus. The old code restored the event and
> >>>reported the raw number instead.
> >>
> >>You are right, does the following sony_nc_notify modification look
> >>fine to you?
> >>
> >>/* hotkey event, a key has been pressed, retrieve it */
> >>value = sony_nc_hotkeys_decode(handle);
> >>if (value>  0) /* known event */
> >>	sony_laptop_report_input_event(value);
> >>else /* restore the original event */
> >>	value = event;
> >
> >it's a bit out of context but I guess it should work.
> 
> Two things I'd like to ask:
> 1) can I remove any acpi bus notification from this patch?

no. Just leave the current ones and don't add any new one.

> 2) if so, do you prefer sony_nc_hotkeys_decode to forward decoded
> keys to the input core directly instead of returning the decoded
> value back to sony_nc_notify?

feel free to propose your solution.

-- 
mattia
:wq!
